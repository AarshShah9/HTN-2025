const DEFAULT_MODEL_ID = "pytorch-gcp__spatial-photo-gen-meshing";
const DEFAULT_ENDPOINT = "process_spectacles_media";

const remoteMediaModule =
  require("LensStudio:RemoteMediaModule") as RemoteMediaModule;

export enum SpatializeResult {
  Awaiting,
  Attempting,
  Completed,
  Retry,
  Rejected,
}

/**
 * SpatialImageQueueItem.ts
 * @version 1.0.0
 * Packages a request to spatialize into something that can be executed later as
 * part of a queue.
 */
export class SpatialImageQueueItem {
  private _active: boolean = false;
  private remoteServiceModule: RemoteServiceModule;
  private spatialImageMaterial: Material;
  private callback: (
    requestId: number,
    sceneObject: SceneObject,
    status: number
  ) => void;
  private requestId: number;
  private statusCode: number;

  public imageTexture: Texture;
  public retryCount: number;
  public objectParent: SceneObject;
  public loadedObject?: SceneObject;
  public spatializeResult: SpatializeResult = SpatializeResult.Awaiting;

  constructor(
    imageTexture: Texture,
    remoteServiceModule: RemoteServiceModule,
    spatialImageMaterial: Material,
    objectParent: SceneObject,
    callback: (
      requestId: number,
      sceneObject: SceneObject,
      status: number
    ) => void,
    requestId: number
  ) {
    this.imageTexture = imageTexture;
    this.remoteServiceModule = remoteServiceModule;
    this.spatialImageMaterial = spatialImageMaterial;
    this.objectParent = objectParent;
    this.callback = callback;
    this.requestId = requestId;

    this.retryCount = 0;
  }

  get active(): boolean {
    return this._active;
  }

  /**
   * Attempts to encode and spatialize the texture inside.
   * @returns - 0 if complete, or a number of it's current retry count.
   */
  public async spatializeImage(): Promise<SpatializeResult> {
    this.spatializeResult = SpatializeResult.Attempting;

    if (!isNull(this.loadedObject)) {
      return SpatializeResult.Completed;
    }

    this._active = true;
    const request = await this.encodeAndCreateRequest(this.imageTexture);
    let urlResult: string | undefined;

    await this.requestURL(request)
      .then((result) => {
        urlResult = result;
      })
      .catch((reject) => {
        print("Spatialization failed: " + reject);
        this.retryCount++;
      });

    if (!isNull(urlResult)) {
      await this.download(urlResult);
    }

    this._active = false;
    return this.spatializeResult;
  }

  /**
   * Cancels the attempt at spatialisation.
   */
  public abort(): void {
    this._active = false;
    this.spatializeResult = SpatializeResult.Rejected;
    this.callback(this.requestId, null, this.statusCode);
  }

  /**
   * If a request is being made for an object already downloaded, this function
   * can be used to skip spatialisation and to inject a finished version.
   * @param loadedObject - What would be the end result of this items
   * spatialisation.
   */
  public skip(loadedObject: SceneObject): void {
    loadedObject.enabled = true;
    this.spatializeResult = SpatializeResult.Completed;
    this.callback(this.requestId, loadedObject, 1);
  }

  private async download(url: string) {
    const loadedAsset = await this.loadAsset(url);
    this.loadedObject = loadedAsset;
    this.callback(this.requestId, loadedAsset, 1);
  }

  /**
   * Encodes the image provided to base64 and creates a RemoteApiRequest
   * @param image - the image texture to encode
   * @returns a RemoteApiRequest containing the encoded image
   */
  private async encodeAndCreateRequest(
    image: Texture
  ): Promise<RemoteApiRequest> {
    const encodedImage = await this.encodeTexture(image);
    let request = RemoteApiRequest.create();
    const params = {
      model_id: DEFAULT_MODEL_ID,
      base64_media_data: encodedImage,
    };
    request.endpoint = DEFAULT_ENDPOINT;
    request.parameters = params;
    return request;
  }

  /**
   * Performs a remote API request to get the spatialized image's content URL from the remote service module
   * @param request - the RemoteAPIRequest containing the encoded image texture
   * @returns a Promise with the contentUrl of the resource if successful, or the error code otherwise
   */
  private requestURL(request: RemoteApiRequest): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      this.remoteServiceModule.performApiRequest(request, (response) => {
        this.statusCode = response.statusCode;

        if (this.statusCode === 4) {
          this.spatializeResult = SpatializeResult.Retry;
        } else if (this.statusCode !== 1) {
          this.spatializeResult = SpatializeResult.Rejected;
          reject(`API Call Error: ${this.getErrorCodeMessage(response)}`);
        } else {
          this.spatializeResult = SpatializeResult.Completed;
          try {
            const parsedResponse = JSON.parse(response.body);
            resolve(parsedResponse.contentUrl);
          } catch (e) {
            reject("Failed to parse remote API response");
          }
        }
      });
    });
  }

  /**
   * Creates a DynamicResource from the asset URL and loads it as a GLTF asset
   * Then, instantiates the asset on this component's SceneObject
   * @param assetUrl - the URL of the asset to load
   */
  private loadAsset(assetUrl: string): Promise<SceneObject> {
    return new Promise<SceneObject>((resolve, reject) =>
      remoteMediaModule.loadResourceAsGltfAsset(
        // Use makeResourceFromUrl to ensure the userdata restrictions can be enforced for 3P lenses
        this.remoteServiceModule.makeResourceFromUrl(assetUrl),
        (asset) => {
          try {
            const instantiatedImage = asset.tryInstantiate(
              this.objectParent,
              this.spatialImageMaterial
            );
            // instantiatedImage.getTransform().setWorldScale(vec3.one())

            resolve(instantiatedImage);
          } catch (e) {
            reject("Failed to instantiate asset");
          }
        },
        (error) => {
          reject(`Failed to make DynamicResource from URL - ${error}`);
        }
      )
    );
  }

  /**
   * Encodes a texture to base64 so it can be used in an API request
   * @param texture - the texture to encode
   * @returns the base64 encoded texture as a string
   */
  private encodeTexture(texture: Texture): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      try {
        Base64.encodeTextureAsync(
          texture,
          (string) => {
            resolve(string);
          },
          () => {
            reject("Failed to encode texture");
          },
          CompressionQuality.IntermediateQuality,
          EncodingType.Jpg
        );
      } catch (e) {
        reject("Failed to encode texture");
      }
    });
  }

  // https://docs.snap.com/api/lens-studio/Classes/ScriptObjects/#RemoteApiResponse--statusCode
  private getErrorCodeMessage(response: RemoteApiResponse) {
    switch (response.statusCode) {
      case 0:
        return "Unknown Status Code";
      case 1:
        return "Success";
      case 2:
        return "Redirected";
      case 3:
        return "Bad Request";
      case 4:
        return "Access Denied";
      case 5:
        return "Api Call Not Found";
      case 6:
        return "Timeout";
      case 7:
        return "Request Too Large";
      case 8:
        return "Server Processing Error";
      case 9:
        return "Request cancelled by caller";
      case 10:
        return "Internal: Framework Error";
      default:
        return "Unknown Error: " + response.statusCode;
    }
  }
}
