//@component
export class KeywordAsrExample extends BaseScriptComponent {
  private asrModule = require('LensStudio:AsrModule');
  private internetModule = require('LensStudio:InternetModule');

  private keywordPattern = /^bro, wheres my (.+)\??$/i;

  private async onTranscriptionUpdate(eventArgs: AsrModule.TranscriptionUpdateEvent) {
    const text = eventArgs.text.trim();

    // Only act when we have a finalized transcription
    if (eventArgs.isFinal) {
      print(`Final transcript: ${text}`);

      const match = this.keywordPattern.exec(text);
      if (match) {
        const item = match[1]; // the [x] part
        print(`Detected keyword with item: ${item}`);
        await this.sendPost(item);
      }
    }
  }

  private onTranscriptionError(errorCode: AsrModule.AsrStatusCode) {
    print(`ASR Error: ${errorCode}`);
  }

  private async sendPost(item: string) {
    try {
      const body = JSON.stringify({ item });

      const req = new Request('http://10.37.127.253:8000/find', {
        method: 'POST',
        headers: { "Content-Type": "application/json" },
        body
      });

      const res = await this.internetModule.fetch(req);
      print(`POST success: ${await res.text()}`);
    } catch (err) {
      print(`POST failed: ${err}`);
    }
  }

  onAwake(): void {
    const options = AsrModule.AsrTranscriptionOptions.create();
    options.silenceUntilTerminationMs = 1000;
    options.mode = AsrModule.AsrMode.HighAccuracy;

    options.onTranscriptionUpdateEvent.add((eventArgs) =>
      this.onTranscriptionUpdate(eventArgs)
    );
    options.onTranscriptionErrorEvent.add((eventArgs) =>
      this.onTranscriptionError(eventArgs)
    );

    this.asrModule.startTranscribing(options);
  }

  private stopSession(): void {
    this.asrModule.stopTranscribing();
  }
}
