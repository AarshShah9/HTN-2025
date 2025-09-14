#version 430
//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler baseTexSmpSC 0:23
//sampler sampler intensityTextureSmpSC 0:24
//sampler sampler sc_OITCommonSampler 0:27
//sampler sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC 0:28
//sampler sampler sc_RayTracingRayDirectionSmpSC 0:29
//sampler sampler sc_ScreenTextureSmpSC 0:31
//sampler sampler shapeTextureSmpSC 0:34
//sampler sampler strokeTextureSmpSC 0:35
//texture texture2D baseTex 0:3:0:23
//texture texture2D intensityTexture 0:4:0:24
//texture texture2D sc_OITAlpha0 0:7:0:27
//texture texture2D sc_OITAlpha1 0:8:0:27
//texture texture2D sc_OITDepthHigh0 0:9:0:27
//texture texture2D sc_OITDepthHigh1 0:10:0:27
//texture texture2D sc_OITDepthLow0 0:11:0:27
//texture texture2D sc_OITDepthLow1 0:12:0:27
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:13:0:27
//texture texture2D sc_OITFrontDepthTexture 0:14:0:27
//texture utexture2D sc_RayTracingHitCasterIdAndBarycentric 0:15:0:28
//texture texture2D sc_RayTracingRayDirection 0:16:0:29
//texture texture2D sc_ScreenTexture 0:18:0:31
//texture texture2D shapeTexture 0:21:0:34
//texture texture2D strokeTexture 0:22:0:35
//texture texture2DArray baseTexArrSC 0:36:0:23
//texture texture2DArray intensityTextureArrSC 0:37:0:24
//texture texture2DArray sc_ScreenTextureArrSC 0:41:0:31
//texture texture2DArray shapeTextureArrSC 0:42:0:34
//texture texture2DArray strokeTextureArrSC 0:43:0:35
//ssbo int sc_RayTracingCasterIndexBuffer 0:0:4 {
//uint sc_RayTracingCasterTriangles 0:[1]:4
//}
//ssbo float sc_RayTracingCasterNonAnimatedVertexBuffer 0:2:4 {
//float sc_RayTracingCasterNonAnimatedVertices 0:[1]:4
//}
//ssbo float sc_RayTracingCasterVertexBuffer 0:1:4 {
//float sc_RayTracingCasterVertices 0:[1]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR 2 0
//spec_const bool BLEND_MODE_COLOR_BURN 3 0
//spec_const bool BLEND_MODE_COLOR_DODGE 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_shapeTexture 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_strokeTexture 34 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 35 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 36 0
//spec_const bool SC_USE_UV_MIN_MAX_shapeTexture 37 0
//spec_const bool SC_USE_UV_MIN_MAX_strokeTexture 38 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 39 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 40 0
//spec_const bool SC_USE_UV_TRANSFORM_shapeTexture 41 0
//spec_const bool SC_USE_UV_TRANSFORM_strokeTexture 42 0
//spec_const bool Tweak_N124 43 0
//spec_const bool Tweak_N139 44 0
//spec_const bool UseViewSpaceDepthVariant 45 1
//spec_const bool baseTexHasSwappedViews 46 0
//spec_const bool innerCutout 47 0
//spec_const bool intensityTextureHasSwappedViews 48 0
//spec_const bool sc_BlendMode_Add 49 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 50 0
//spec_const bool sc_BlendMode_AlphaTest 51 0
//spec_const bool sc_BlendMode_AlphaToCoverage 52 0
//spec_const bool sc_BlendMode_ColoredGlass 53 0
//spec_const bool sc_BlendMode_Custom 54 0
//spec_const bool sc_BlendMode_Max 55 0
//spec_const bool sc_BlendMode_Min 56 0
//spec_const bool sc_BlendMode_Multiply 57 0
//spec_const bool sc_BlendMode_MultiplyOriginal 58 0
//spec_const bool sc_BlendMode_Normal 59 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 60 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 61 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 62 0
//spec_const bool sc_BlendMode_Screen 63 0
//spec_const bool sc_DepthOnly 64 0
//spec_const bool sc_FramebufferFetch 65 0
//spec_const bool sc_MotionVectorsPass 66 0
//spec_const bool sc_OITCompositingPass 67 0
//spec_const bool sc_OITDepthBoundsPass 68 0
//spec_const bool sc_OITDepthGatherPass 69 0
//spec_const bool sc_OITDepthPrepass 70 0
//spec_const bool sc_OITFrontLayerPass 71 0
//spec_const bool sc_OITMaxLayers4Plus1 72 0
//spec_const bool sc_OITMaxLayers8 73 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 74 0
//spec_const bool sc_OutputBounds 75 0
//spec_const bool sc_ProjectiveShadowsCaster 76 0
//spec_const bool sc_ProjectiveShadowsReceiver 77 0
//spec_const bool sc_RayTracingCasterForceOpaque 78 0
//spec_const bool sc_RenderAlphaToColor 79 0
//spec_const bool sc_ScreenTextureHasSwappedViews 80 0
//spec_const bool sc_TAAEnabled 81 0
//spec_const bool sc_VertexBlending 82 0
//spec_const bool sc_VertexBlendingUseNormals 83 0
//spec_const bool sc_Voxelization 84 0
//spec_const bool shapeAspectFix 85 0
//spec_const bool shapeColorInvert 86 0
//spec_const bool shapeTextureHasSwappedViews 87 0
//spec_const bool strokeTextureHasSwappedViews 88 0
//spec_const bool toQuadShapeGrad 89 0
//spec_const bool toQuadStrokeGrad 90 0
//spec_const int NODE_161_DROPLIST_ITEM 91 0
//spec_const int NODE_164_DROPLIST_ITEM 92 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 93 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 94 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_shapeTexture 95 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_strokeTexture 96 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 97 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 98 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_shapeTexture 99 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_strokeTexture 100 -1
//spec_const int baseTexLayout 101 0
//spec_const int intensityTextureLayout 102 0
//spec_const int sc_DepthBufferMode 103 0
//spec_const int sc_RenderingSpace 104 -1
//spec_const int sc_ScreenTextureLayout 105 0
//spec_const int sc_ShaderCacheConstant 106 0
//spec_const int sc_SkinBonesCount 107 0
//spec_const int sc_StereoRenderingMode 108 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 109 0
//spec_const int sc_StereoViewID 110 0
//spec_const int shapeTextureLayout 111 0
//spec_const int strokeTextureLayout 112 0
//SG_REFLECTION_END
#ifdef Active
#undef Active
#endif
#ifdef Hover
#undef Hover
#endif
#ifdef xRightPin
#undef xRightPin
#endif
#ifdef xLeftPin
#undef xLeftPin
#endif
#ifdef yUpPin
#undef yUpPin
#endif
#ifdef yDownPin
#undef yDownPin
#endif
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef VERTEX_SHADER
#define scOutPos(clipPosition) gl_Position=clipPosition
#define MAIN main
#endif
#ifdef SC_ENABLE_INSTANCED_RENDERING
#ifndef sc_EnableInstancing
#define sc_EnableInstancing 1
#endif
#endif
#define mod(x,y) (x-y*floor((x+1e-6)/y))
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableStereoClipDistance
#if defined(GL_APPLE_clip_distance)
#extension GL_APPLE_clip_distance : require
#elif defined(GL_EXT_clip_cull_distance)
#extension GL_EXT_clip_cull_distance : require
#else
#error Clip distance is requested but not supported by this device.
#endif
#endif
#ifdef sc_EnableMultiviewStereoRendering
#define sc_StereoRenderingMode sc_StereoRendering_Multiview
#define sc_NumStereoViews 2
#extension GL_OVR_multiview2 : require
#ifdef VERTEX_SHADER
#ifdef sc_EnableInstancingFallback
#define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
#else
#define sc_GlobalInstanceID gl_InstanceID
#endif
#define sc_LocalInstanceID sc_GlobalInstanceID
#define sc_StereoViewID int(gl_ViewID_OVR)
#endif
#elif defined(sc_EnableInstancedClippedStereoRendering)
#ifndef sc_EnableInstancing
#error Instanced-clipped stereo rendering requires enabled instancing.
#endif
#ifndef sc_EnableStereoClipDistance
#define sc_StereoRendering_IsClipDistanceEnabled 0
#else
#define sc_StereoRendering_IsClipDistanceEnabled 1
#endif
#define sc_StereoRenderingMode sc_StereoRendering_InstancedClipped
#define sc_NumStereoClipPlanes 1
#define sc_NumStereoViews 2
#ifdef VERTEX_SHADER
#ifdef sc_EnableInstancingFallback
#define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
#else
#define sc_GlobalInstanceID gl_InstanceID
#endif
#define sc_LocalInstanceID (sc_GlobalInstanceID/2)
#define sc_StereoViewID (sc_GlobalInstanceID%2)
#endif
#else
#define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#if defined(sc_EnableInstancing)&&defined(VERTEX_SHADER)
#ifdef GL_ARB_draw_instanced
#extension GL_ARB_draw_instanced : require
#define gl_InstanceID gl_InstanceIDARB
#endif
#ifdef GL_EXT_draw_instanced
#extension GL_EXT_draw_instanced : require
#define gl_InstanceID gl_InstanceIDEXT
#endif
#ifndef sc_InstanceID
#define sc_InstanceID gl_InstanceID
#endif
#ifndef sc_GlobalInstanceID
#ifdef sc_EnableInstancingFallback
#define sc_GlobalInstanceID (sc_FallbackInstanceID)
#define sc_LocalInstanceID (sc_FallbackInstanceID)
#else
#define sc_GlobalInstanceID gl_InstanceID
#define sc_LocalInstanceID gl_InstanceID
#endif
#endif
#endif
#ifndef GL_ES
#extension GL_EXT_gpu_shader4 : enable
#extension GL_ARB_shader_texture_lod : enable
#define precision
#define lowp
#define mediump
#define highp
#define sc_FragmentPrecision
#endif
#ifdef GL_ES
#ifdef sc_FramebufferFetch
#if defined(GL_EXT_shader_framebuffer_fetch)
#extension GL_EXT_shader_framebuffer_fetch : require
#elif defined(GL_ARM_shader_framebuffer_fetch)
#extension GL_ARM_shader_framebuffer_fetch : require
#else
#error Framebuffer fetch is requested but not supported by this device.
#endif
#endif
#ifdef GL_FRAGMENT_PRECISION_HIGH
#define sc_FragmentPrecision highp
#else
#define sc_FragmentPrecision mediump
#endif
#ifdef FRAGMENT_SHADER
precision highp int;
precision highp float;
#endif
#endif
#ifdef VERTEX_SHADER
#ifdef sc_EnableMultiviewStereoRendering
layout(num_views=sc_NumStereoViews) in;
#endif
#endif
#define SC_INT_FALLBACK_FLOAT int
#define SC_INTERPOLATION_FLAT flat
#define SC_INTERPOLATION_CENTROID centroid
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
#if defined VERTEX_SHADER
struct sc_Vertex_t
{
vec4 position;
vec3 normal;
vec3 tangent;
vec2 texture0;
vec2 texture1;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
#endif
#ifndef sc_RenderingSpace
#define sc_RenderingSpace -1
#endif
#ifndef sc_TAAEnabled
#define sc_TAAEnabled 0
#elif sc_TAAEnabled==1
#undef sc_TAAEnabled
#define sc_TAAEnabled 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef sc_VertexBlending
#define sc_VertexBlending 0
#elif sc_VertexBlending==1
#undef sc_VertexBlending
#define sc_VertexBlending 1
#endif
#ifndef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 0
#elif sc_VertexBlendingUseNormals==1
#undef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef sc_DepthBufferMode
#define sc_DepthBufferMode 0
#endif
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_Voxelization
#define sc_Voxelization 0
#elif sc_Voxelization==1
#undef sc_Voxelization
#define sc_Voxelization 1
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OutputBounds
#define sc_OutputBounds 0
#elif sc_OutputBounds==1
#undef sc_OutputBounds
#define sc_OutputBounds 1
#endif
layout(binding=0,std430) readonly buffer sc_RayTracingCasterIndexBuffer
{
uint sc_RayTracingCasterTriangles[1];
} sc_RayTracingCasterIndexBuffer_obj;
layout(binding=1,std430) readonly buffer sc_RayTracingCasterVertexBuffer
{
float sc_RayTracingCasterVertices[1];
} sc_RayTracingCasterVertexBuffer_obj;
layout(binding=2,std430) readonly buffer sc_RayTracingCasterNonAnimatedVertexBuffer
{
float sc_RayTracingCasterNonAnimatedVertices[1];
} sc_RayTracingCasterNonAnimatedVertexBuffer_obj;
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ProjectorMatrix;
uniform vec2 sc_TAAJitterOffset;
uniform int sc_FallbackInstanceID;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_UniformConstants;
uniform vec4 sc_BoneMatrices[(sc_SkinBonesCount*3)+1];
uniform mat3 sc_SkinBonesNormalMatrices[sc_SkinBonesCount+1];
uniform vec4 weights0;
uniform vec4 weights1;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform mat3 sc_NormalMatrix;
uniform vec4 voxelization_params_0;
uniform vec4 voxelization_params_frustum_lrbt;
uniform vec4 voxelization_params_frustum_nf;
uniform vec3 voxelization_params_camera_pos;
uniform mat4 sc_ModelMatrixVoxelization;
uniform int PreviewEnabled;
uniform uvec4 sc_RayTracingCasterConfiguration;
uniform float depthRef;
out float varClipDistance;
flat out int varStereoViewID;
in vec4 boneData;
in vec3 blendShape0Pos;
in vec3 blendShape0Normal;
in vec3 blendShape1Pos;
in vec3 blendShape1Normal;
in vec3 blendShape2Pos;
in vec3 blendShape2Normal;
in vec3 blendShape3Pos;
in vec3 blendShape4Pos;
in vec3 blendShape5Pos;
in vec4 position;
in vec3 normal;
in vec4 tangent;
in vec2 texture0;
in vec2 texture1;
out vec3 varPos;
out vec3 varNormal;
out vec4 varTangent;
out vec4 varPackedTex;
out vec4 varScreenPos;
out vec2 varScreenTexturePos;
out vec2 varShadowTex;
out float varViewSpaceDepth;
out vec4 varColor;
in vec4 color;
out vec4 PreviewVertexColor;
out float PreviewVertexSaved;
in vec3 positionNext;
in vec3 positionPrevious;
in vec4 strandProperties;
void sc_SetClipDistancePlatform(float dstClipDistance)
{
#if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&sc_StereoRendering_IsClipDistanceEnabled
gl_ClipDistance[0]=dstClipDistance;
#endif
}
void sc_SetClipDistance(float dstClipDistance)
{
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(dstClipDistance);
}
#else
{
varClipDistance=dstClipDistance;
}
#endif
}
void sc_SetClipDistance(vec4 clipPosition)
{
#if (sc_StereoRenderingMode==1)
{
sc_SetClipDistance(dot(clipPosition,sc_StereoClipPlanes[sc_StereoViewID]));
}
#endif
}
void sc_SetClipPosition(vec4 clipPosition)
{
#if (sc_ShaderCacheConstant!=0)
{
clipPosition.x+=(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=sc_StereoViewID;
}
#endif
sc_SetClipDistance(clipPosition);
gl_Position=clipPosition;
}
int sc_GetLocalInstanceIDInternal(int id)
{
#ifdef sc_LocalInstanceID
return sc_LocalInstanceID;
#else
return 0;
#endif
}
void blendTargetShapeWithNormal(inout sc_Vertex_t v,vec3 position_1,vec3 normal_1,float weight)
{
vec3 l9_0=v.position.xyz+(position_1*weight);
v=sc_Vertex_t(vec4(l9_0.x,l9_0.y,l9_0.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
v.normal+=(normal_1*weight);
}
void sc_BlendVertex(inout sc_Vertex_t v)
{
#if (sc_VertexBlending)
{
#if (sc_VertexBlendingUseNormals)
{
blendTargetShapeWithNormal(v,blendShape0Pos,blendShape0Normal,weights0.x);
blendTargetShapeWithNormal(v,blendShape1Pos,blendShape1Normal,weights0.y);
blendTargetShapeWithNormal(v,blendShape2Pos,blendShape2Normal,weights0.z);
}
#else
{
vec3 l9_0=v.position.xyz+(blendShape0Pos*weights0.x);
v=sc_Vertex_t(vec4(l9_0.x,l9_0.y,l9_0.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_1=v.position.xyz+(blendShape1Pos*weights0.y);
v=sc_Vertex_t(vec4(l9_1.x,l9_1.y,l9_1.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_2=v.position.xyz+(blendShape2Pos*weights0.z);
v=sc_Vertex_t(vec4(l9_2.x,l9_2.y,l9_2.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_3=v.position.xyz+(blendShape3Pos*weights0.w);
v=sc_Vertex_t(vec4(l9_3.x,l9_3.y,l9_3.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_4=v.position.xyz+(blendShape4Pos*weights1.x);
v=sc_Vertex_t(vec4(l9_4.x,l9_4.y,l9_4.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_5=v.position.xyz+(blendShape5Pos*weights1.y);
v=sc_Vertex_t(vec4(l9_5.x,l9_5.y,l9_5.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
}
#endif
}
#endif
}
vec4 sc_GetBoneWeights()
{
vec4 l9_0;
#if (sc_SkinBonesCount>0)
{
vec4 l9_1=vec4(1.0,fract(boneData.yzw));
vec4 l9_2=l9_1;
l9_2.x=1.0-dot(l9_1.yzw,vec3(1.0));
l9_0=l9_2;
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
void sc_GetBoneMatrix(int index,out vec4 m0,out vec4 m1,out vec4 m2)
{
int l9_0=3*index;
m0=sc_BoneMatrices[l9_0];
m1=sc_BoneMatrices[l9_0+1];
m2=sc_BoneMatrices[l9_0+2];
}
vec3 skinVertexPosition(int i,vec4 v)
{
vec3 l9_0;
#if (sc_SkinBonesCount>0)
{
vec4 param_1;
vec4 param_2;
vec4 param_3;
sc_GetBoneMatrix(i,param_1,param_2,param_3);
l9_0=vec3(dot(v,param_1),dot(v,param_2),dot(v,param_3));
}
#else
{
l9_0=v.xyz;
}
#endif
return l9_0;
}
void sc_SkinVertex(inout sc_Vertex_t v)
{
#if (sc_SkinBonesCount>0)
{
vec4 l9_0=sc_GetBoneWeights();
int l9_1=int(boneData.x);
int l9_2=int(boneData.y);
int l9_3=int(boneData.z);
int l9_4=int(boneData.w);
float l9_5=l9_0.x;
float l9_6=l9_0.y;
float l9_7=l9_0.z;
float l9_8=l9_0.w;
vec3 l9_9=(((skinVertexPosition(l9_1,v.position)*l9_5)+(skinVertexPosition(l9_2,v.position)*l9_6))+(skinVertexPosition(l9_3,v.position)*l9_7))+(skinVertexPosition(l9_4,v.position)*l9_8);
v.position=vec4(l9_9.x,l9_9.y,l9_9.z,v.position.w);
v.normal=((((sc_SkinBonesNormalMatrices[l9_1]*v.normal)*l9_5)+((sc_SkinBonesNormalMatrices[l9_2]*v.normal)*l9_6))+((sc_SkinBonesNormalMatrices[l9_3]*v.normal)*l9_7))+((sc_SkinBonesNormalMatrices[l9_4]*v.normal)*l9_8);
v.tangent=((((sc_SkinBonesNormalMatrices[l9_1]*v.tangent)*l9_5)+((sc_SkinBonesNormalMatrices[l9_2]*v.tangent)*l9_6))+((sc_SkinBonesNormalMatrices[l9_3]*v.tangent)*l9_7))+((sc_SkinBonesNormalMatrices[l9_4]*v.tangent)*l9_8);
}
#endif
}
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=sc_StereoViewID;
}
#endif
return l9_0;
}
mat4 createVoxelOrthoMatrix(float left,float right,float bottom,float top,float near,float far)
{
return mat4(vec4(2.0/(right-left),0.0,0.0,(-(right+left))/(right-left)),vec4(0.0,2.0/(top-bottom),0.0,(-(top+bottom))/(top-bottom)),vec4(0.0,0.0,(-2.0)/(far-near),(-(far+near))/(far-near)),vec4(0.0,0.0,0.0,1.0));
}
void main()
{
if (sc_RayTracingCasterConfiguration.x!=0u)
{
sc_SetClipPosition(vec4(position.xy,depthRef+(1e-10*position.z),1.0+(1e-10*position.w)));
return;
}
PreviewVertexColor=vec4(0.5);
PreviewVertexSaved=0.0;
sc_Vertex_t l9_0=sc_Vertex_t(position,normal,tangent.xyz,texture0,texture1);
sc_BlendVertex(l9_0);
sc_SkinVertex(l9_0);
#if (sc_RenderingSpace==3)
{
varPos=vec3(0.0);
varNormal=l9_0.normal;
varTangent=vec4(l9_0.tangent.x,l9_0.tangent.y,l9_0.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==4)
{
varPos=vec3(0.0);
varNormal=l9_0.normal;
varTangent=vec4(l9_0.tangent.x,l9_0.tangent.y,l9_0.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==2)
{
varPos=l9_0.position.xyz;
varNormal=l9_0.normal;
varTangent=vec4(l9_0.tangent.x,l9_0.tangent.y,l9_0.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==1)
{
varPos=(sc_ModelMatrix*l9_0.position).xyz;
varNormal=sc_NormalMatrix*l9_0.normal;
vec3 l9_1=sc_NormalMatrix*l9_0.tangent;
varTangent=vec4(l9_1.x,l9_1.y,l9_1.z,varTangent.w);
}
#endif
}
#endif
}
#endif
}
#endif
bool l9_2=PreviewEnabled==1;
vec2 l9_3;
if (l9_2)
{
vec2 l9_4=l9_0.texture0;
l9_4.x=1.0-l9_0.texture0.x;
l9_3=l9_4;
}
else
{
l9_3=l9_0.texture0;
}
varColor=color;
vec3 l9_5=varPos;
vec3 l9_6=varNormal;
vec3 l9_7;
vec3 l9_8;
vec3 l9_9;
if (l9_2)
{
l9_9=varTangent.xyz;
l9_8=varNormal;
l9_7=varPos;
}
else
{
l9_9=varTangent.xyz;
l9_8=l9_6;
l9_7=l9_5;
}
varPos=l9_7;
varNormal=normalize(l9_8);
vec3 l9_10=normalize(l9_9);
varTangent=vec4(l9_10.x,l9_10.y,l9_10.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_11;
#if (sc_RenderingSpace==3)
{
l9_11=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
vec4 l9_12;
#if (sc_RenderingSpace==2)
{
l9_12=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
vec4 l9_13;
#if (sc_RenderingSpace==1)
{
l9_13=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
l9_13=l9_0.position;
}
#endif
l9_12=l9_13;
}
#endif
l9_11=l9_12;
}
#endif
varViewSpaceDepth=-l9_11.z;
}
#endif
vec4 l9_14;
#if (sc_RenderingSpace==3)
{
l9_14=l9_0.position;
}
#else
{
vec4 l9_15;
#if (sc_RenderingSpace==4)
{
l9_15=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_16;
#if (sc_RenderingSpace==2)
{
l9_16=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_17;
#if (sc_RenderingSpace==1)
{
l9_17=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_17=vec4(0.0);
}
#endif
l9_16=l9_17;
}
#endif
l9_15=l9_16;
}
#endif
l9_14=l9_15;
}
#endif
varPackedTex=vec4(l9_3,l9_0.texture1);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_18;
#if (sc_RenderingSpace==1)
{
l9_18=sc_ModelMatrix*l9_0.position;
}
#else
{
l9_18=l9_0.position;
}
#endif
vec4 l9_19=sc_ProjectorMatrix*l9_18;
varShadowTex=((l9_19.xy/vec2(l9_19.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_20;
#if (sc_DepthBufferMode==1)
{
vec4 l9_21;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_22=l9_14;
l9_22.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_14.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_14.w;
l9_21=l9_22;
}
else
{
l9_21=l9_14;
}
l9_20=l9_21;
}
#else
{
l9_20=l9_14;
}
#endif
vec4 l9_23;
#if (sc_TAAEnabled)
{
vec2 l9_24=l9_20.xy+(sc_TAAJitterOffset*l9_20.w);
l9_23=vec4(l9_24.x,l9_24.y,l9_20.z,l9_20.w);
}
#else
{
l9_23=l9_20;
}
#endif
sc_SetClipPosition(l9_23);
#if (sc_Voxelization)
{
sc_Vertex_t l9_25=sc_Vertex_t(l9_0.position,l9_0.normal,l9_0.tangent,l9_3,l9_0.texture1);
sc_BlendVertex(l9_25);
sc_SkinVertex(l9_25);
int l9_26=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID);
int l9_27=int(voxelization_params_0.w);
vec4 l9_28=createVoxelOrthoMatrix(voxelization_params_frustum_lrbt.x,voxelization_params_frustum_lrbt.y,voxelization_params_frustum_lrbt.z,voxelization_params_frustum_lrbt.w,voxelization_params_frustum_nf.x,voxelization_params_frustum_nf.y)*vec4(((sc_ModelMatrixVoxelization*l9_25.position).xyz+vec3(float(l9_26%l9_27)*voxelization_params_0.y,float(l9_26/l9_27)*voxelization_params_0.y,(float(l9_26)*(voxelization_params_0.y/voxelization_params_0.z))+voxelization_params_frustum_nf.x))-voxelization_params_camera_pos,1.0);
l9_28.w=1.0;
varScreenPos=l9_28;
sc_SetClipPosition(l9_28*1.0);
}
#else
{
#if (sc_OutputBounds)
{
sc_Vertex_t l9_29=sc_Vertex_t(l9_0.position,l9_0.normal,l9_0.tangent,l9_3,l9_0.texture1);
sc_BlendVertex(l9_29);
sc_SkinVertex(l9_29);
vec2 l9_30=((l9_29.position.xy/vec2(l9_29.position.w))*0.5)+vec2(0.5);
varPackedTex=vec4(l9_30.x,l9_30.y,varPackedTex.z,varPackedTex.w);
vec4 l9_31=sc_ModelMatrixVoxelization*l9_29.position;
vec3 l9_32=l9_31.xyz-voxelization_params_camera_pos;
varPos=l9_32.xyz;
varNormal=normalize(l9_29.normal);
vec4 l9_33=createVoxelOrthoMatrix(voxelization_params_frustum_lrbt.x,voxelization_params_frustum_lrbt.y,voxelization_params_frustum_lrbt.z,voxelization_params_frustum_lrbt.w,voxelization_params_frustum_nf.x,voxelization_params_frustum_nf.y)*vec4(l9_32.x,l9_32.y,l9_32.z,l9_31.w);
vec4 l9_34=vec4(l9_33.x,l9_33.y,l9_33.z,vec4(0.0).w);
l9_34.w=1.0;
varScreenPos=l9_34;
sc_SetClipPosition(l9_34*1.0);
}
#endif
}
#endif
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#if defined(GL_ES)||__VERSION__>=420
#if sc_FragDataCount>=1
#define sc_DeclareFragData0(StorageQualifier) layout(location=0) StorageQualifier sc_FragmentPrecision vec4 sc_FragData0
#endif
#if sc_FragDataCount>=2
#define sc_DeclareFragData1(StorageQualifier) layout(location=1) StorageQualifier sc_FragmentPrecision vec4 sc_FragData1
#endif
#if sc_FragDataCount>=3
#define sc_DeclareFragData2(StorageQualifier) layout(location=2) StorageQualifier sc_FragmentPrecision vec4 sc_FragData2
#endif
#if sc_FragDataCount>=4
#define sc_DeclareFragData3(StorageQualifier) layout(location=3) StorageQualifier sc_FragmentPrecision vec4 sc_FragData3
#endif
#ifndef sc_DeclareFragData0
#define sc_DeclareFragData0(_) const vec4 sc_FragData0=vec4(0.0)
#endif
#ifndef sc_DeclareFragData1
#define sc_DeclareFragData1(_) const vec4 sc_FragData1=vec4(0.0)
#endif
#ifndef sc_DeclareFragData2
#define sc_DeclareFragData2(_) const vec4 sc_FragData2=vec4(0.0)
#endif
#ifndef sc_DeclareFragData3
#define sc_DeclareFragData3(_) const vec4 sc_FragData3=vec4(0.0)
#endif
#if sc_FramebufferFetch
#ifdef GL_EXT_shader_framebuffer_fetch
sc_DeclareFragData0(inout);
sc_DeclareFragData1(inout);
sc_DeclareFragData2(inout);
sc_DeclareFragData3(inout);
mediump mat4 getFragData() { return mat4(sc_FragData0,sc_FragData1,sc_FragData2,sc_FragData3); }
#define gl_LastFragData (getFragData())
#elif defined(GL_ARM_shader_framebuffer_fetch)
sc_DeclareFragData0(out);
sc_DeclareFragData1(out);
sc_DeclareFragData2(out);
sc_DeclareFragData3(out);
mediump mat4 getFragData() { return mat4(gl_LastFragColorARM,vec4(0.0),vec4(0.0),vec4(0.0)); }
#define gl_LastFragData (getFragData())
#endif
#else
sc_DeclareFragData0(out);
sc_DeclareFragData1(out);
sc_DeclareFragData2(out);
sc_DeclareFragData3(out);
mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
#define gl_LastFragData (getFragData())
#endif
#else
#ifdef FRAGMENT_SHADER
#define sc_FragData0 gl_FragData[0]
#define sc_FragData1 gl_FragData[1]
#define sc_FragData2 gl_FragData[2]
#define sc_FragData3 gl_FragData[3]
#endif
mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
#define gl_LastFragData (getFragData())
#if sc_FramebufferFetch
#error Framebuffer fetch is requested but not supported by this device.
#endif
#endif
struct sc_RayTracingHitPayload
{
vec3 viewDirWS;
vec3 positionWS;
vec3 normalWS;
vec4 tangentWS;
vec4 color;
vec2 uv0;
vec2 uv1;
vec2 uv2;
vec2 uv3;
uvec2 id;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec2 Surface_UVCoord0;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 0
#elif sc_ScreenTextureHasSwappedViews==1
#undef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 1
#endif
#ifndef sc_ScreenTextureLayout
#define sc_ScreenTextureLayout 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_BlendMode_Normal
#define sc_BlendMode_Normal 0
#elif sc_BlendMode_Normal==1
#undef sc_BlendMode_Normal
#define sc_BlendMode_Normal 1
#endif
#ifndef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 0
#elif sc_BlendMode_AlphaToCoverage==1
#undef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 0
#elif sc_BlendMode_PremultipliedAlphaHardware==1
#undef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 0
#elif sc_BlendMode_PremultipliedAlphaAuto==1
#undef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 1
#endif
#ifndef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 0
#elif sc_BlendMode_PremultipliedAlpha==1
#undef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 1
#endif
#ifndef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 0
#elif sc_BlendMode_AddWithAlphaFactor==1
#undef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 1
#endif
#ifndef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 0
#elif sc_BlendMode_AlphaTest==1
#undef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 1
#endif
#ifndef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 0
#elif sc_BlendMode_Multiply==1
#undef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 1
#endif
#ifndef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 0
#elif sc_BlendMode_MultiplyOriginal==1
#undef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 1
#endif
#ifndef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 0
#elif sc_BlendMode_ColoredGlass==1
#undef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 1
#endif
#ifndef sc_BlendMode_Add
#define sc_BlendMode_Add 0
#elif sc_BlendMode_Add==1
#undef sc_BlendMode_Add
#define sc_BlendMode_Add 1
#endif
#ifndef sc_BlendMode_Screen
#define sc_BlendMode_Screen 0
#elif sc_BlendMode_Screen==1
#undef sc_BlendMode_Screen
#define sc_BlendMode_Screen 1
#endif
#ifndef sc_BlendMode_Min
#define sc_BlendMode_Min 0
#elif sc_BlendMode_Min==1
#undef sc_BlendMode_Min
#define sc_BlendMode_Min 1
#endif
#ifndef sc_BlendMode_Max
#define sc_BlendMode_Max 0
#elif sc_BlendMode_Max==1
#undef sc_BlendMode_Max
#define sc_BlendMode_Max 1
#endif
#ifndef sc_MotionVectorsPass
#define sc_MotionVectorsPass 0
#elif sc_MotionVectorsPass==1
#undef sc_MotionVectorsPass
#define sc_MotionVectorsPass 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#ifndef sc_RayTracingCasterForceOpaque
#define sc_RayTracingCasterForceOpaque 0
#elif sc_RayTracingCasterForceOpaque==1
#undef sc_RayTracingCasterForceOpaque
#define sc_RayTracingCasterForceOpaque 1
#endif
#ifndef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 0
#elif intensityTextureHasSwappedViews==1
#undef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 1
#endif
#ifndef intensityTextureLayout
#define intensityTextureLayout 0
#endif
#ifndef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 0
#elif BLEND_MODE_REALISTIC==1
#undef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 1
#endif
#ifndef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 0
#elif BLEND_MODE_FORGRAY==1
#undef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 1
#endif
#ifndef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 0
#elif BLEND_MODE_NOTBRIGHT==1
#undef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 1
#endif
#ifndef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 0
#elif BLEND_MODE_DIVISION==1
#undef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 1
#endif
#ifndef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 0
#elif BLEND_MODE_BRIGHT==1
#undef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 1
#endif
#ifndef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 0
#elif BLEND_MODE_INTENSE==1
#undef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 0
#elif SC_USE_UV_TRANSFORM_intensityTexture==1
#undef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_U_intensityTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_V_intensityTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 0
#elif SC_USE_UV_MIN_MAX_intensityTexture==1
#undef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 0
#elif SC_USE_CLAMP_TO_BORDER_intensityTexture==1
#undef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 1
#endif
#ifndef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 0
#elif BLEND_MODE_LIGHTEN==1
#undef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 1
#endif
#ifndef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 0
#elif BLEND_MODE_DARKEN==1
#undef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 1
#endif
#ifndef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 0
#elif BLEND_MODE_DIVIDE==1
#undef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 1
#endif
#ifndef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 0
#elif BLEND_MODE_AVERAGE==1
#undef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 1
#endif
#ifndef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 0
#elif BLEND_MODE_SUBTRACT==1
#undef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 1
#endif
#ifndef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 0
#elif BLEND_MODE_DIFFERENCE==1
#undef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 1
#endif
#ifndef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 0
#elif BLEND_MODE_NEGATION==1
#undef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 1
#endif
#ifndef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 0
#elif BLEND_MODE_EXCLUSION==1
#undef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 1
#endif
#ifndef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 0
#elif BLEND_MODE_OVERLAY==1
#undef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 1
#endif
#ifndef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 0
#elif BLEND_MODE_SOFT_LIGHT==1
#undef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 0
#elif BLEND_MODE_HARD_LIGHT==1
#undef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 1
#endif
#ifndef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 0
#elif BLEND_MODE_COLOR_DODGE==1
#undef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 1
#endif
#ifndef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 0
#elif BLEND_MODE_COLOR_BURN==1
#undef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 1
#endif
#ifndef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 0
#elif BLEND_MODE_LINEAR_LIGHT==1
#undef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 1
#endif
#ifndef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 0
#elif BLEND_MODE_VIVID_LIGHT==1
#undef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 1
#endif
#ifndef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 0
#elif BLEND_MODE_PIN_LIGHT==1
#undef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 0
#elif BLEND_MODE_HARD_MIX==1
#undef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 1
#endif
#ifndef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 0
#elif BLEND_MODE_HARD_REFLECT==1
#undef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 1
#endif
#ifndef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 0
#elif BLEND_MODE_HARD_GLOW==1
#undef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 1
#endif
#ifndef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 0
#elif BLEND_MODE_HARD_PHOENIX==1
#undef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 1
#endif
#ifndef BLEND_MODE_HUE
#define BLEND_MODE_HUE 0
#elif BLEND_MODE_HUE==1
#undef BLEND_MODE_HUE
#define BLEND_MODE_HUE 1
#endif
#ifndef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 0
#elif BLEND_MODE_SATURATION==1
#undef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 1
#endif
#ifndef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 0
#elif BLEND_MODE_COLOR==1
#undef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 1
#endif
#ifndef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 0
#elif BLEND_MODE_LUMINOSITY==1
#undef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 1
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 0
#elif sc_OITMaxLayers4Plus1==1
#undef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 1
#endif
#ifndef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 0
#elif sc_OITMaxLayersVisualizeLayerCount==1
#undef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 1
#endif
#ifndef sc_OITMaxLayers8
#define sc_OITMaxLayers8 0
#elif sc_OITMaxLayers8==1
#undef sc_OITMaxLayers8
#define sc_OITMaxLayers8 1
#endif
#ifndef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 0
#elif sc_OITFrontLayerPass==1
#undef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 1
#endif
#ifndef sc_OITDepthPrepass
#define sc_OITDepthPrepass 0
#elif sc_OITDepthPrepass==1
#undef sc_OITDepthPrepass
#define sc_OITDepthPrepass 1
#endif
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
#endif
#ifndef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 0
#elif sc_RenderAlphaToColor==1
#undef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 1
#endif
#ifndef sc_BlendMode_Custom
#define sc_BlendMode_Custom 0
#elif sc_BlendMode_Custom==1
#undef sc_BlendMode_Custom
#define sc_BlendMode_Custom 1
#endif
#ifndef sc_Voxelization
#define sc_Voxelization 0
#elif sc_Voxelization==1
#undef sc_Voxelization
#define sc_Voxelization 1
#endif
#ifndef sc_OutputBounds
#define sc_OutputBounds 0
#elif sc_OutputBounds==1
#undef sc_OutputBounds
#define sc_OutputBounds 1
#endif
#ifndef shapeTextureHasSwappedViews
#define shapeTextureHasSwappedViews 0
#elif shapeTextureHasSwappedViews==1
#undef shapeTextureHasSwappedViews
#define shapeTextureHasSwappedViews 1
#endif
#ifndef shapeTextureLayout
#define shapeTextureLayout 0
#endif
#ifndef strokeTextureHasSwappedViews
#define strokeTextureHasSwappedViews 0
#elif strokeTextureHasSwappedViews==1
#undef strokeTextureHasSwappedViews
#define strokeTextureHasSwappedViews 1
#endif
#ifndef strokeTextureLayout
#define strokeTextureLayout 0
#endif
#ifndef baseTexHasSwappedViews
#define baseTexHasSwappedViews 0
#elif baseTexHasSwappedViews==1
#undef baseTexHasSwappedViews
#define baseTexHasSwappedViews 1
#endif
#ifndef baseTexLayout
#define baseTexLayout 0
#endif
#ifndef Tweak_N124
#define Tweak_N124 0
#elif Tweak_N124==1
#undef Tweak_N124
#define Tweak_N124 1
#endif
#ifndef shapeAspectFix
#define shapeAspectFix 0
#elif shapeAspectFix==1
#undef shapeAspectFix
#define shapeAspectFix 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef Tweak_N139
#define Tweak_N139 0
#elif Tweak_N139==1
#undef Tweak_N139
#define Tweak_N139 1
#endif
#ifndef innerCutout
#define innerCutout 0
#elif innerCutout==1
#undef innerCutout
#define innerCutout 1
#endif
#ifndef toQuadShapeGrad
#define toQuadShapeGrad 0
#elif toQuadShapeGrad==1
#undef toQuadShapeGrad
#define toQuadShapeGrad 1
#endif
#ifndef NODE_161_DROPLIST_ITEM
#define NODE_161_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_shapeTexture
#define SC_USE_UV_TRANSFORM_shapeTexture 0
#elif SC_USE_UV_TRANSFORM_shapeTexture==1
#undef SC_USE_UV_TRANSFORM_shapeTexture
#define SC_USE_UV_TRANSFORM_shapeTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_shapeTexture
#define SC_SOFTWARE_WRAP_MODE_U_shapeTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_shapeTexture
#define SC_SOFTWARE_WRAP_MODE_V_shapeTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_shapeTexture
#define SC_USE_UV_MIN_MAX_shapeTexture 0
#elif SC_USE_UV_MIN_MAX_shapeTexture==1
#undef SC_USE_UV_MIN_MAX_shapeTexture
#define SC_USE_UV_MIN_MAX_shapeTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_shapeTexture
#define SC_USE_CLAMP_TO_BORDER_shapeTexture 0
#elif SC_USE_CLAMP_TO_BORDER_shapeTexture==1
#undef SC_USE_CLAMP_TO_BORDER_shapeTexture
#define SC_USE_CLAMP_TO_BORDER_shapeTexture 1
#endif
#ifndef shapeColorInvert
#define shapeColorInvert 0
#elif shapeColorInvert==1
#undef shapeColorInvert
#define shapeColorInvert 1
#endif
#ifndef toQuadStrokeGrad
#define toQuadStrokeGrad 0
#elif toQuadStrokeGrad==1
#undef toQuadStrokeGrad
#define toQuadStrokeGrad 1
#endif
#ifndef NODE_164_DROPLIST_ITEM
#define NODE_164_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_strokeTexture
#define SC_USE_UV_TRANSFORM_strokeTexture 0
#elif SC_USE_UV_TRANSFORM_strokeTexture==1
#undef SC_USE_UV_TRANSFORM_strokeTexture
#define SC_USE_UV_TRANSFORM_strokeTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_strokeTexture
#define SC_SOFTWARE_WRAP_MODE_U_strokeTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_strokeTexture
#define SC_SOFTWARE_WRAP_MODE_V_strokeTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_strokeTexture
#define SC_USE_UV_MIN_MAX_strokeTexture 0
#elif SC_USE_UV_MIN_MAX_strokeTexture==1
#undef SC_USE_UV_MIN_MAX_strokeTexture
#define SC_USE_UV_MIN_MAX_strokeTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_strokeTexture
#define SC_USE_CLAMP_TO_BORDER_strokeTexture 0
#elif SC_USE_CLAMP_TO_BORDER_strokeTexture==1
#undef SC_USE_CLAMP_TO_BORDER_strokeTexture
#define SC_USE_CLAMP_TO_BORDER_strokeTexture 1
#endif
#ifndef SC_USE_UV_TRANSFORM_baseTex
#define SC_USE_UV_TRANSFORM_baseTex 0
#elif SC_USE_UV_TRANSFORM_baseTex==1
#undef SC_USE_UV_TRANSFORM_baseTex
#define SC_USE_UV_TRANSFORM_baseTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_baseTex
#define SC_SOFTWARE_WRAP_MODE_U_baseTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_baseTex
#define SC_SOFTWARE_WRAP_MODE_V_baseTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_baseTex
#define SC_USE_UV_MIN_MAX_baseTex 0
#elif SC_USE_UV_MIN_MAX_baseTex==1
#undef SC_USE_UV_MIN_MAX_baseTex
#define SC_USE_UV_MIN_MAX_baseTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_baseTex
#define SC_USE_CLAMP_TO_BORDER_baseTex 0
#elif SC_USE_CLAMP_TO_BORDER_baseTex==1
#undef SC_USE_CLAMP_TO_BORDER_baseTex
#define SC_USE_CLAMP_TO_BORDER_baseTex 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
layout(binding=1,std430) readonly buffer sc_RayTracingCasterVertexBuffer
{
float sc_RayTracingCasterVertices[1];
} sc_RayTracingCasterVertexBuffer_obj;
layout(binding=2,std430) readonly buffer sc_RayTracingCasterNonAnimatedVertexBuffer
{
float sc_RayTracingCasterNonAnimatedVertices[1];
} sc_RayTracingCasterNonAnimatedVertexBuffer_obj;
layout(binding=0,std430) readonly buffer sc_RayTracingCasterIndexBuffer
{
uint sc_RayTracingCasterTriangles[1];
} sc_RayTracingCasterIndexBuffer_obj;
uniform vec4 sc_CurrentRenderTargetDims;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameModelMatrix;
uniform mat4 sc_ModelMatrixInverse;
uniform vec4 sc_UniformConstants;
uniform uvec4 sc_RayTracingCasterConfiguration;
uniform uvec4 sc_RayTracingCasterOffsetPNTC;
uniform uvec4 sc_RayTracingCasterFormatPNTC;
uniform uvec4 sc_RayTracingCasterOffsetTexture;
uniform uvec4 sc_RayTracingCasterFormatTexture;
uniform mat4 sc_ModelMatrix;
uniform mat3 sc_NormalMatrix;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float alphaTestThreshold;
uniform bool Active;
uniform bool Hover;
uniform vec4 shadowColor;
uniform float Port_RangeMinA_N136;
uniform float Port_RangeMaxA_N136;
uniform float Port_RangeMaxB_N136;
uniform float Port_RangeMinB_N136;
uniform float shapeAlpha;
uniform sc_Camera_t sc_Camera;
uniform float Port_Value1_N157;
uniform float shapeWidthX;
uniform bool xRightPin;
uniform float strokeThickness;
uniform float Port_Value_N288;
uniform float Port_RangeMinA_N276;
uniform float Port_RangeMaxA_N276;
uniform float Port_RangeMinB_N276;
uniform float Port_RangeMaxB_N276;
uniform float Port_Default_N294;
uniform bool xLeftPin;
uniform float Port_RangeMinA_N295;
uniform float Port_RangeMaxA_N295;
uniform float Port_RangeMinB_N295;
uniform float Port_RangeMaxB_N295;
uniform float Port_Default_N296;
uniform float xOffset;
uniform float Port_RangeMinA_N303;
uniform float Port_RangeMaxA_N303;
uniform float Port_RangeMinB_N303;
uniform float Port_RangeMaxB_N303;
uniform float Port_Value0_N304;
uniform float Port_Default_N304;
uniform float shapeHeightY;
uniform bool yUpPin;
uniform float Port_RangeMinA_N299;
uniform float Port_RangeMaxA_N299;
uniform float Port_RangeMinB_N299;
uniform float Port_RangeMaxB_N299;
uniform float Port_Default_N297;
uniform bool yDownPin;
uniform float Port_RangeMinA_N300;
uniform float Port_RangeMaxA_N300;
uniform float Port_RangeMinB_N300;
uniform float Port_RangeMaxB_N300;
uniform float Port_Default_N298;
uniform float yOffset;
uniform float Port_RangeMinA_N305;
uniform float Port_RangeMaxA_N305;
uniform float Port_RangeMinB_N305;
uniform float Port_RangeMaxB_N305;
uniform float Port_Value0_N306;
uniform float Port_Default_N306;
uniform float shadowRotation;
uniform float Port_Input1_N141;
uniform float shadowDistance;
uniform float shapeRotation;
uniform float shadowBlur;
uniform float shapeRoundness;
uniform float strokeAlpha;
uniform float shadowAlpha;
uniform vec4 shapeColor;
uniform vec2 shapeScale;
uniform vec2 shapeOffset;
uniform vec4 shapeGradColorA;
uniform vec4 shapeGradColorB;
uniform vec2 shapeScaleGrad;
uniform vec2 shapeGradPointA;
uniform vec2 shapeGradPointB;
uniform vec2 shapeQuadOffset;
uniform vec4 shapeGradColorC;
uniform vec4 shapeGradColorD;
uniform float Port_RangeMinA_N175;
uniform float Port_RangeMaxA_N175;
uniform float Port_RangeMaxB_N175;
uniform float Port_RangeMinB_N175;
uniform vec2 Port_Center_N177;
uniform float Port_Input1_N185;
uniform float Port_Input2_N185;
uniform float Port_Input0_N186;
uniform float Port_Input1_N186;
uniform float Port_RangeMinA_N198;
uniform float Port_RangeMaxA_N198;
uniform float Port_RangeMaxB_N198;
uniform float Port_RangeMinB_N198;
uniform mat3 shapeTextureTransform;
uniform vec4 shapeTextureUvMinMax;
uniform vec4 shapeTextureBorderColor;
uniform vec4 Port_Default_N209;
uniform vec4 strokeColor;
uniform vec2 strokeScale;
uniform vec2 strokeOffset;
uniform vec4 shapeGradColorA2;
uniform vec4 shapeGradColorB2;
uniform vec2 shapeScaleGrad2;
uniform vec2 shapeGradPointA2;
uniform vec2 shapeGradPointB2;
uniform vec2 shapeQuadOffset2;
uniform vec4 shapeGradColorC2;
uniform vec4 shapeGradColorD2;
uniform float Port_RangeMinA_N231;
uniform float Port_RangeMaxA_N231;
uniform float Port_RangeMaxB_N231;
uniform float Port_RangeMinB_N231;
uniform vec2 Port_Center_N233;
uniform float Port_Input1_N241;
uniform float Port_Input2_N241;
uniform float Port_Input0_N242;
uniform float Port_Input1_N242;
uniform float Port_RangeMinA_N252;
uniform float Port_RangeMaxA_N252;
uniform float Port_RangeMaxB_N252;
uniform float Port_RangeMinB_N252;
uniform mat3 strokeTextureTransform;
uniform vec4 strokeTextureUvMinMax;
uniform vec4 strokeTextureBorderColor;
uniform vec4 Port_Default_N323;
uniform vec4 Port_Default_N324;
uniform vec4 Port_Default_N126;
uniform vec4 Port_Value0_N154;
uniform vec4 Port_Default_N154;
uniform vec2 Port_Input2_N148;
uniform float Port_Value0_N287;
uniform float Port_Default_N287;
uniform float Port_Value0_N281;
uniform float Port_Default_N281;
uniform float Port_RangeMinA_N268;
uniform float Port_RangeMaxA_N268;
uniform float Port_Value0_N282;
uniform float Port_Value1_N282;
uniform float Port_Default_N282;
uniform float Port_Value0_N308;
uniform float Port_Default_N308;
uniform float Port_Value0_N289;
uniform float Port_Default_N289;
uniform float Port_Value0_N286;
uniform float Port_Default_N286;
uniform float Port_RangeMinA_N277;
uniform float Port_RangeMaxA_N277;
uniform float Port_Value0_N293;
uniform float Port_Value1_N293;
uniform float Port_Default_N293;
uniform float Port_Value0_N301;
uniform float Port_Default_N301;
uniform float Port_Value0_N132;
uniform float Port_Default_N132;
uniform vec2 Port_Center_N092;
uniform float Port_Value0_N131;
uniform float Port_Default_N131;
uniform float Port_Input1_N160;
uniform float Port_Value1_N097;
uniform float Port_Input1_N263;
uniform vec2 Port_Center_N094;
uniform vec2 Port_Center_N100;
uniform float Port_Value0_N125;
uniform float Port_Default_N125;
uniform float Port_RangeMinA_N138;
uniform float Port_RangeMaxA_N138;
uniform float Port_RangeMinB_N138;
uniform float Port_RangeMaxB_N138;
uniform vec2 Port_Center_N137;
uniform float Port_Input1_N019;
uniform float Port_Input1_N020;
uniform float Port_Value0_N122;
uniform float Port_Default_N122;
uniform float Port_Input1_N056;
uniform float Port_RangeMinA_N021;
uniform float Port_RangeMaxA_N021;
uniform float Port_RangeMinB_N021;
uniform float Port_RangeMinA_N022;
uniform float Port_RangeMaxA_N022;
uniform float Port_RangeMinB_N022;
uniform float Port_Input1_N030;
uniform vec2 Port_Input1_N032;
uniform float Port_Input1_N127;
uniform float Port_RangeMinA_N135;
uniform float Port_RangeMaxA_N135;
uniform float Port_RangeMaxB_N135;
uniform float Port_Input1_N038;
uniform float Port_Input2_N038;
uniform float Port_Input1_N264;
uniform float Port_Input2_N264;
uniform float Port_RangeMinA_N039;
uniform float Port_RangeMaxA_N039;
uniform float Port_RangeMaxB_N039;
uniform float Port_RangeMinA_N042;
uniform float Port_RangeMaxA_N042;
uniform float Port_RangeMaxB_N042;
uniform float Port_RangeMinA_N057;
uniform float Port_RangeMaxA_N057;
uniform float Port_RangeMinB_N057;
uniform float Port_RangeMaxB_N057;
uniform float Port_RangeMinA_N101;
uniform float Port_RangeMaxA_N101;
uniform float Port_RangeMinB_N101;
uniform float Port_RangeMinA_N047;
uniform float Port_RangeMaxA_N047;
uniform float Port_RangeMaxB_N047;
uniform float Port_Input1_N051;
uniform vec2 Port_Input1_N053;
uniform float Port_RangeMinA_N133;
uniform float Port_RangeMaxA_N133;
uniform float Port_RangeMaxB_N133;
uniform float Port_Input1_N064;
uniform float Port_Input2_N064;
uniform float Port_Input1_N066;
uniform float Port_Input2_N066;
uniform float Port_Value0_N068;
uniform float Port_Default_N068;
uniform float Port_Input1_N072;
uniform float Port_Input2_N072;
uniform float Port_Value0_N123;
uniform float Port_Default_N123;
uniform vec2 Port_Center_N113;
uniform float Port_Input1_N089;
uniform float Port_Input1_N090;
uniform float Port_Input1_N103;
uniform vec2 Port_Input1_N105;
uniform float Port_Input1_N112;
uniform float Port_Input2_N112;
uniform float Port_Input1_N259;
uniform vec4 Port_Default_N149;
uniform float Port_Input1_N265;
uniform float Port_Input2_N265;
uniform float Port_Input1_N098;
uniform vec2 Port_Input1_N115;
uniform float Port_Input1_N142;
uniform float Port_Input2_N142;
uniform float Port_Input1_N144;
uniform float Port_Input2_N144;
uniform float Port_RangeMinA_N171;
uniform float Port_RangeMaxA_N171;
uniform vec4 Port_Value0_N325;
uniform vec4 Port_Default_N325;
uniform float Port_Input1_N335;
uniform vec4 Port_Input1_N345;
uniform vec4 Port_Input_N339;
uniform vec2 Port_Center_N340;
uniform vec2 Port_Scale_N340;
uniform mat3 baseTexTransform;
uniform vec4 baseTexUvMinMax;
uniform vec4 baseTexBorderColor;
uniform vec4 Port_Input_N006;
uniform vec4 sc_Time;
uniform float Port_Input1_N361;
uniform float Port_Input2_N361;
uniform int PreviewEnabled;
uniform usampler2D sc_RayTracingHitCasterIdAndBarycentric;
uniform sampler2D sc_RayTracingRayDirection;
uniform sampler2D shapeTexture;
uniform sampler2DArray shapeTextureArrSC;
uniform sampler2D strokeTexture;
uniform sampler2DArray strokeTextureArrSC;
uniform sampler2D baseTex;
uniform sampler2DArray baseTexArrSC;
uniform sampler2D sc_ScreenTexture;
uniform sampler2DArray sc_ScreenTextureArrSC;
uniform sampler2D intensityTexture;
uniform sampler2DArray intensityTextureArrSC;
uniform sampler2D sc_OITFrontDepthTexture;
uniform sampler2D sc_OITDepthHigh0;
uniform sampler2D sc_OITDepthLow0;
uniform sampler2D sc_OITAlpha0;
uniform sampler2D sc_OITDepthHigh1;
uniform sampler2D sc_OITDepthLow1;
uniform sampler2D sc_OITAlpha1;
uniform sampler2D sc_OITFilteredDepthBoundsTexture;
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
in vec4 varScreenPos;
in float varViewSpaceDepth;
in vec4 PreviewVertexColor;
in float PreviewVertexSaved;
in vec4 varPackedTex;
in vec3 varPos;
in vec3 varNormal;
in vec4 varTangent;
in vec2 varScreenTexturePos;
in vec4 varColor;
vec3 sc_RayTracingInterpolateAnimatedFloat3(vec3 brc,uvec3 indices,uint offset)
{
uvec3 l9_0=(indices*uvec3(6u))+uvec3(offset);
uint l9_1=l9_0.x;
uint l9_2=l9_0.y;
uint l9_3=l9_0.z;
return ((vec3(sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_1],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_1+1u],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_1+2u])*brc.x)+(vec3(sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_2],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_2+1u],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_2+2u])*brc.y))+(vec3(sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_3],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_3+1u],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_3+2u])*brc.z);
}
vec4 sc_RayTracingFetchUnorm4(uint offset)
{
uint l9_0=floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[offset]);
return vec4(float(l9_0&255u),float((l9_0>>uint(8))&255u),float((l9_0>>uint(16))&255u),float((l9_0>>uint(24))&255u))/vec4(255.0);
}
sc_RayTracingHitPayload sc_RayTracingEvaluateHitPayload(ivec2 screenPos)
{
ivec2 l9_0=screenPos;
uvec4 l9_1=texelFetch(sc_RayTracingHitCasterIdAndBarycentric,l9_0,0);
uvec2 l9_2=l9_1.xy;
if (l9_1.x!=(sc_RayTracingCasterConfiguration.y&65535u))
{
return sc_RayTracingHitPayload(vec3(0.0),vec3(0.0),vec3(0.0),vec4(0.0),vec4(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),l9_2);
}
vec2 l9_3=unpackHalf2x16(l9_1.z|(l9_1.w<<uint(16)));
float l9_4=l9_3.x;
float l9_5=l9_3.y;
float l9_6=(1.0-l9_4)-l9_5;
vec3 l9_7=vec3(l9_6,l9_4,l9_5);
ivec2 l9_8=screenPos;
vec4 l9_9=texelFetch(sc_RayTracingRayDirection,l9_8,0);
float l9_10=l9_9.x;
float l9_11=l9_9.y;
float l9_12=(1.0-abs(l9_10))-abs(l9_11);
vec3 l9_13=vec3(l9_10,l9_11,l9_12);
float l9_14=clamp(-l9_12,0.0,1.0);
float l9_15;
if (l9_10>=0.0)
{
l9_15=-l9_14;
}
else
{
l9_15=l9_14;
}
float l9_16;
if (l9_11>=0.0)
{
l9_16=-l9_14;
}
else
{
l9_16=l9_14;
}
vec2 l9_17=vec2(l9_15,l9_16);
vec2 l9_18=l9_13.xy+l9_17;
uint l9_19=min(l9_1.y,sc_RayTracingCasterConfiguration.z)*6u;
uint l9_20=l9_19&4294967292u;
uint l9_21=l9_20/4u;
uint l9_22=sc_RayTracingCasterIndexBuffer_obj.sc_RayTracingCasterTriangles[l9_21];
uint l9_23=l9_21+1u;
uint l9_24=sc_RayTracingCasterIndexBuffer_obj.sc_RayTracingCasterTriangles[l9_23];
uvec4 l9_25=(uvec4(l9_22,l9_22,l9_24,l9_24)&uvec4(65535u,4294967295u,65535u,4294967295u))>>uvec4(0u,16u,0u,16u);
uvec3 l9_26;
if (l9_19==l9_20)
{
l9_26=l9_25.xyz;
}
else
{
l9_26=l9_25.yzw;
}
bool l9_27=sc_RayTracingCasterConfiguration.x==2u;
vec3 l9_28;
if (l9_27)
{
l9_28=sc_RayTracingInterpolateAnimatedFloat3(l9_7,l9_26,0u);
}
else
{
uint l9_29=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_30=(l9_26.x*l9_29)+sc_RayTracingCasterOffsetPNTC.x;
uint l9_31=(l9_26.y*l9_29)+sc_RayTracingCasterOffsetPNTC.x;
uint l9_32=(l9_26.z*l9_29)+sc_RayTracingCasterOffsetPNTC.x;
vec3 l9_33;
if (sc_RayTracingCasterFormatPNTC.x==5u)
{
l9_33=((vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30+2u])*l9_6)+(vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31+2u])*l9_4))+(vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32+2u])*l9_5);
}
else
{
vec3 l9_34;
if (sc_RayTracingCasterFormatPNTC.x==6u)
{
l9_34=((vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30+1u])).x)*l9_6)+(vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31+1u])).x)*l9_4))+(vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32+1u])).x)*l9_5);
}
else
{
l9_34=vec3(1.0,0.0,0.0);
}
l9_33=l9_34;
}
l9_28=(sc_ModelMatrix*vec4(l9_33,1.0)).xyz;
}
vec3 l9_35;
if (sc_RayTracingCasterOffsetPNTC.y>0u)
{
vec3 l9_36;
if (l9_27)
{
l9_36=sc_RayTracingInterpolateAnimatedFloat3(l9_7,l9_26,3u);
}
else
{
uint l9_37=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_38=(l9_26.x*l9_37)+sc_RayTracingCasterOffsetPNTC.y;
uint l9_39=(l9_26.y*l9_37)+sc_RayTracingCasterOffsetPNTC.y;
uint l9_40=(l9_26.z*l9_37)+sc_RayTracingCasterOffsetPNTC.y;
vec3 l9_41;
if (sc_RayTracingCasterFormatPNTC.y==5u)
{
l9_41=((vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38+2u])*l9_6)+(vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39+2u])*l9_4))+(vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40+2u])*l9_5);
}
else
{
vec3 l9_42;
if (sc_RayTracingCasterFormatPNTC.y==6u)
{
l9_42=((vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38+1u])).x)*l9_6)+(vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39+1u])).x)*l9_4))+(vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40+1u])).x)*l9_5);
}
else
{
l9_42=vec3(1.0,0.0,0.0);
}
l9_41=l9_42;
}
l9_36=normalize(sc_NormalMatrix*l9_41);
}
l9_35=l9_36;
}
else
{
l9_35=vec3(1.0,0.0,0.0);
}
bool l9_43=!l9_27;
bool l9_44;
if (l9_43)
{
l9_44=sc_RayTracingCasterOffsetPNTC.z>0u;
}
else
{
l9_44=l9_43;
}
vec4 l9_45;
if (l9_44)
{
uint l9_46=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_47=(l9_26.x*l9_46)+sc_RayTracingCasterOffsetPNTC.z;
uint l9_48=(l9_26.y*l9_46)+sc_RayTracingCasterOffsetPNTC.z;
uint l9_49=(l9_26.z*l9_46)+sc_RayTracingCasterOffsetPNTC.z;
vec4 l9_50;
if (sc_RayTracingCasterFormatPNTC.z==5u)
{
l9_50=((vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47+3u])*l9_6)+(vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48+3u])*l9_4))+(vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49+3u])*l9_5);
}
else
{
vec4 l9_51;
if (sc_RayTracingCasterFormatPNTC.z==6u)
{
l9_51=((vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47+1u])))*l9_6)+(vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48+1u])))*l9_4))+(vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49+1u])))*l9_5);
}
else
{
vec4 l9_52;
if (sc_RayTracingCasterFormatPNTC.z==2u)
{
l9_52=((sc_RayTracingFetchUnorm4(l9_47)*l9_6)+(sc_RayTracingFetchUnorm4(l9_48)*l9_4))+(sc_RayTracingFetchUnorm4(l9_49)*l9_5);
}
else
{
l9_52=vec4(1.0,0.0,0.0,0.0);
}
l9_51=l9_52;
}
l9_50=l9_51;
}
l9_45=vec4(normalize(sc_NormalMatrix*l9_50.xyz),l9_50.w);
}
else
{
l9_45=vec4(1.0,0.0,0.0,1.0);
}
vec4 l9_53;
if (sc_RayTracingCasterFormatPNTC.w>0u)
{
uint l9_54=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_55=(l9_26.x*l9_54)+sc_RayTracingCasterOffsetPNTC.w;
uint l9_56=(l9_26.y*l9_54)+sc_RayTracingCasterOffsetPNTC.w;
uint l9_57=(l9_26.z*l9_54)+sc_RayTracingCasterOffsetPNTC.w;
vec4 l9_58;
if (sc_RayTracingCasterFormatPNTC.w==5u)
{
l9_58=((vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55+3u])*l9_6)+(vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56+3u])*l9_4))+(vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57+3u])*l9_5);
}
else
{
vec4 l9_59;
if (sc_RayTracingCasterFormatPNTC.w==6u)
{
l9_59=((vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55+1u])))*l9_6)+(vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56+1u])))*l9_4))+(vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57+1u])))*l9_5);
}
else
{
vec4 l9_60;
if (sc_RayTracingCasterFormatPNTC.w==2u)
{
l9_60=((sc_RayTracingFetchUnorm4(l9_55)*l9_6)+(sc_RayTracingFetchUnorm4(l9_56)*l9_4))+(sc_RayTracingFetchUnorm4(l9_57)*l9_5);
}
else
{
l9_60=vec4(1.0,0.0,0.0,0.0);
}
l9_59=l9_60;
}
l9_58=l9_59;
}
l9_53=l9_58;
}
else
{
l9_53=vec4(0.0);
}
uvec3 l9_61=l9_26%uvec3(2u);
vec2 l9_62=vec2(dot(l9_7,vec3(uvec3(1u)-l9_61)),0.0);
vec2 l9_63;
if (sc_RayTracingCasterFormatTexture.x>0u)
{
uint l9_64=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_65=(l9_26.x*l9_64)+sc_RayTracingCasterOffsetTexture.x;
uint l9_66=(l9_26.y*l9_64)+sc_RayTracingCasterOffsetTexture.x;
uint l9_67=(l9_26.z*l9_64)+sc_RayTracingCasterOffsetTexture.x;
vec2 l9_68;
if (sc_RayTracingCasterFormatTexture.x==5u)
{
l9_68=((vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_65],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_65+1u])*l9_6)+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_66],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_66+1u])*l9_4))+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_67],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_67+1u])*l9_5);
}
else
{
vec2 l9_69;
if (sc_RayTracingCasterFormatTexture.x==6u)
{
l9_69=((unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_65]))*l9_6)+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_66]))*l9_4))+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_67]))*l9_5);
}
else
{
l9_69=vec2(1.0,0.0);
}
l9_68=l9_69;
}
l9_63=l9_68;
}
else
{
l9_63=l9_62;
}
vec2 l9_70;
if (sc_RayTracingCasterFormatTexture.y>0u)
{
uint l9_71=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_72=(l9_26.x*l9_71)+sc_RayTracingCasterOffsetTexture.y;
uint l9_73=(l9_26.y*l9_71)+sc_RayTracingCasterOffsetTexture.y;
uint l9_74=(l9_26.z*l9_71)+sc_RayTracingCasterOffsetTexture.y;
vec2 l9_75;
if (sc_RayTracingCasterFormatTexture.y==5u)
{
l9_75=((vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_72],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_72+1u])*l9_6)+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_73],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_73+1u])*l9_4))+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_74],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_74+1u])*l9_5);
}
else
{
vec2 l9_76;
if (sc_RayTracingCasterFormatTexture.y==6u)
{
l9_76=((unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_72]))*l9_6)+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_73]))*l9_4))+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_74]))*l9_5);
}
else
{
l9_76=vec2(1.0,0.0);
}
l9_75=l9_76;
}
l9_70=l9_75;
}
else
{
l9_70=l9_62;
}
vec2 l9_77;
if (sc_RayTracingCasterFormatTexture.z>0u)
{
uint l9_78=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_79=(l9_26.x*l9_78)+sc_RayTracingCasterOffsetTexture.z;
uint l9_80=(l9_26.y*l9_78)+sc_RayTracingCasterOffsetTexture.z;
uint l9_81=(l9_26.z*l9_78)+sc_RayTracingCasterOffsetTexture.z;
vec2 l9_82;
if (sc_RayTracingCasterFormatTexture.z==5u)
{
l9_82=((vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_79],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_79+1u])*l9_6)+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_80],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_80+1u])*l9_4))+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_81],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_81+1u])*l9_5);
}
else
{
vec2 l9_83;
if (sc_RayTracingCasterFormatTexture.z==6u)
{
l9_83=((unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_79]))*l9_6)+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_80]))*l9_4))+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_81]))*l9_5);
}
else
{
l9_83=vec2(1.0,0.0);
}
l9_82=l9_83;
}
l9_77=l9_82;
}
else
{
l9_77=l9_62;
}
vec2 l9_84;
if (sc_RayTracingCasterFormatTexture.w>0u)
{
uint l9_85=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_86=(l9_26.x*l9_85)+sc_RayTracingCasterOffsetTexture.w;
uint l9_87=(l9_26.y*l9_85)+sc_RayTracingCasterOffsetTexture.w;
uint l9_88=(l9_26.z*l9_85)+sc_RayTracingCasterOffsetTexture.w;
vec2 l9_89;
if (sc_RayTracingCasterFormatTexture.w==5u)
{
l9_89=((vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_86],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_86+1u])*l9_6)+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_87],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_87+1u])*l9_4))+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_88],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_88+1u])*l9_5);
}
else
{
vec2 l9_90;
if (sc_RayTracingCasterFormatTexture.w==6u)
{
l9_90=((unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_86]))*l9_6)+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_87]))*l9_4))+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_88]))*l9_5);
}
else
{
l9_90=vec2(1.0,0.0);
}
l9_89=l9_90;
}
l9_84=l9_89;
}
else
{
l9_84=l9_62;
}
return sc_RayTracingHitPayload(-normalize(vec3(l9_18.x,l9_18.y,l9_13.z)),l9_28,l9_35,l9_45,l9_53,l9_63,l9_70,l9_77,l9_84,l9_2);
}
void Node124_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (Tweak_N124)
{
Output=1.001;
}
#else
{
Output=0.001;
}
#endif
Output-=0.001;
}
void Node126_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if ((Tweak_N124)==0)
{
float param;
Node124_Bool_Parameter(param,Globals);
Value0=vec4((((param-Port_RangeMinA_N136)/((Port_RangeMaxA_N136-Port_RangeMinA_N136)+1e-06))*(Port_RangeMaxB_N136-Port_RangeMinB_N136))+Port_RangeMinB_N136);
Result=Value0;
}
#else
{
#if ((Tweak_N124)==1)
{
Value1=shadowColor;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node154_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if ((shapeAspectFix)==0)
{
Result=Value0;
}
#else
{
#if ((shapeAspectFix)==1)
{
Value1=vec4(Port_Value1_N157,1.0/sc_Camera.aspect,0.0,0.0);
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node276_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node294_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Value0=(Port_Value_N288+0.001)-0.001;
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
float param_1;
Node276_Remap(strokeThickness,param_1,Port_RangeMinA_N276,Port_RangeMaxA_N276,Port_RangeMinB_N276,Port_RangeMaxB_N276,Globals);
Value1=param_1;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node287_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
Switch=float(xRightPin);
Switch=floor(Switch);
if (Switch==0.0)
{
Result=Value0;
}
else
{
if (Switch==1.0)
{
float param_4;
Node294_Switch(0.0,0.0,0.0,Port_Default_N294,param_4,Globals);
Value1=param_4;
Result=Value1;
}
else
{
Result=Default;
}
}
}
void Node295_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node296_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Value0=(Port_Value_N288+0.001)-0.001;
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
float param_1;
Node295_Remap(strokeThickness,param_1,Port_RangeMinA_N295,Port_RangeMaxA_N295,Port_RangeMinB_N295,Port_RangeMaxB_N295,Globals);
Value1=param_1;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node281_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
Switch=float(xLeftPin);
Switch=floor(Switch);
if (Switch==0.0)
{
Result=Value0;
}
else
{
if (Switch==1.0)
{
float param_4;
Node296_Switch(0.0,0.0,0.0,Port_Default_N296,param_4,Globals);
Value1=param_4;
Result=Value1;
}
else
{
Result=Default;
}
}
}
void Node268_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node282_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
Switch=float(xLeftPin);
Switch=floor(Switch);
if (Switch==0.0)
{
Result=Value0;
}
else
{
if (Switch==1.0)
{
Result=Value1;
}
else
{
Result=Default;
}
}
}
void Node303_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node304_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
Switch=float(xLeftPin);
Switch=floor(Switch);
if (Switch==0.0)
{
Result=Value0;
}
else
{
if (Switch==1.0)
{
float param_1;
Node303_Remap(strokeThickness,param_1,Port_RangeMinA_N303,Port_RangeMaxA_N303,Port_RangeMinB_N303,Port_RangeMaxB_N303,Globals);
Value1=param_1;
Result=Value1;
}
else
{
Result=Default;
}
}
}
void Node308_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
float param_4;
Node304_Switch(0.0,Port_Value0_N304,0.0,Port_Default_N304,param_4,Globals);
Value1=param_4;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node299_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node297_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Value0=(Port_Value_N288+0.001)-0.001;
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
float param_1;
Node299_Remap(strokeThickness,param_1,Port_RangeMinA_N299,Port_RangeMaxA_N299,Port_RangeMinB_N299,Port_RangeMaxB_N299,Globals);
Value1=param_1;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node289_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
Switch=float(yUpPin);
Switch=floor(Switch);
if (Switch==0.0)
{
Result=Value0;
}
else
{
if (Switch==1.0)
{
float param_4;
Node297_Switch(0.0,0.0,0.0,Port_Default_N297,param_4,Globals);
Value1=param_4;
Result=Value1;
}
else
{
Result=Default;
}
}
}
void Node300_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node298_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Value0=(Port_Value_N288+0.001)-0.001;
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
float param_1;
Node300_Remap(strokeThickness,param_1,Port_RangeMinA_N300,Port_RangeMaxA_N300,Port_RangeMinB_N300,Port_RangeMaxB_N300,Globals);
Value1=param_1;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node286_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
Switch=float(yDownPin);
Switch=floor(Switch);
if (Switch==0.0)
{
Result=Value0;
}
else
{
if (Switch==1.0)
{
float param_4;
Node298_Switch(0.0,0.0,0.0,Port_Default_N298,param_4,Globals);
Value1=param_4;
Result=Value1;
}
else
{
Result=Default;
}
}
}
void Node277_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node293_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
Switch=float(yDownPin);
Switch=floor(Switch);
if (Switch==0.0)
{
Result=Value0;
}
else
{
if (Switch==1.0)
{
Result=Value1;
}
else
{
Result=Default;
}
}
}
void Node305_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node306_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
Switch=float(yDownPin);
Switch=floor(Switch);
if (Switch==0.0)
{
Result=Value0;
}
else
{
if (Switch==1.0)
{
float param_1;
Node305_Remap(strokeThickness,param_1,Port_RangeMinA_N305,Port_RangeMaxA_N305,Port_RangeMinB_N305,Port_RangeMaxB_N305,Globals);
Value1=param_1;
Result=Value1;
}
else
{
Result=Default;
}
}
}
void Node301_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
float param_4;
Node306_Switch(0.0,Port_Value0_N306,0.0,Port_Default_N306,param_4,Globals);
Value1=param_4;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node132_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N124)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N124)==1)
{
Value1=shadowRotation+Port_Input1_N141;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node92_Rotate_Coords(vec2 CoordsIn,float Rotation,vec2 Center,out vec2 CoordsOut,ssGlobals Globals)
{
float l9_0=sin(radians(Rotation));
float l9_1=cos(radians(Rotation));
CoordsOut=CoordsIn-Center;
CoordsOut=vec2(dot(vec2(l9_1,l9_0),CoordsOut),dot(vec2(-l9_0,l9_1),CoordsOut))+Center;
}
void Node131_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N124)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N124)==1)
{
Value1=shadowDistance;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node94_Rotate_Coords(vec2 CoordsIn,float Rotation,vec2 Center,out vec2 CoordsOut,ssGlobals Globals)
{
float l9_0=sin(radians(Rotation));
float l9_1=cos(radians(Rotation));
CoordsOut=CoordsIn-Center;
CoordsOut=vec2(dot(vec2(l9_1,l9_0),CoordsOut),dot(vec2(-l9_0,l9_1),CoordsOut))+Center;
}
void Node100_Rotate_Coords(vec2 CoordsIn,float Rotation,vec2 Center,out vec2 CoordsOut,ssGlobals Globals)
{
float l9_0=sin(radians(Rotation));
float l9_1=cos(radians(Rotation));
CoordsOut=CoordsIn-Center;
CoordsOut=vec2(dot(vec2(l9_1,l9_0),CoordsOut),dot(vec2(-l9_0,l9_1),CoordsOut))+Center;
}
void Node125_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N124)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N124)==1)
{
Value1=shadowBlur;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node138_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node122_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
Value1=strokeThickness;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node21_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node22_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node39_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node42_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node57_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node47_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node68_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
Value1=strokeAlpha;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node123_Switch(float Switch,float Value0,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if ((Tweak_N124)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N124)==1)
{
Value1=shadowAlpha;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node261_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (innerCutout)
{
Output=1.001;
}
#else
{
Output=0.001;
}
#endif
Output-=0.001;
}
void Node113_Rotate_Coords(vec2 CoordsIn,float Rotation,vec2 Center,out vec2 CoordsOut,ssGlobals Globals)
{
float l9_0=sin(radians(Rotation));
float l9_1=cos(radians(Rotation));
CoordsOut=CoordsIn-Center;
CoordsOut=vec2(dot(vec2(l9_1,l9_0),CoordsOut),dot(vec2(-l9_0,l9_1),CoordsOut))+Center;
}
void Node209_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if ((toQuadShapeGrad)==0)
{
vec2 l9_0=shapeGradPointB-shapeGradPointA;
Value0=mix(shapeGradColorA,shapeGradColorB,vec4(smoothstep(Port_Input0_N186,Port_Input1_N186,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N175))/vec2((Port_RangeMaxA_N175-Port_RangeMinA_N175)+1e-06))*(Port_RangeMaxB_N175-Port_RangeMinB_N175))+vec2(Port_RangeMinB_N175))-Port_Center_N177)*shapeScaleGrad)+Port_Center_N177)-shapeGradPointA,l9_0)/dot(l9_0,l9_0))+0.001,Port_Input1_N185+0.001,Port_Input2_N185+0.001)-0.001)));
Result=Value0;
}
#else
{
#if ((toQuadShapeGrad)==1)
{
vec2 l9_1=(((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N198))/vec2((Port_RangeMaxA_N198-Port_RangeMinA_N198)+1e-06))*(Port_RangeMaxB_N198-Port_RangeMinB_N198))+vec2(Port_RangeMinB_N198))*shapeScaleGrad)+shapeQuadOffset;
vec4 l9_2=vec4(l9_1.x);
Value1=mix(mix(shapeGradColorA,shapeGradColorB,l9_2),mix(shapeGradColorC,shapeGradColorD,l9_2),vec4(l9_1.y));
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=varStereoViewID;
}
#endif
return l9_0;
}
int shapeTextureGetStereoViewIndex()
{
int l9_0;
#if (shapeTextureHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void sc_SoftwareWrapEarly(inout float uv,int softwareWrapMode)
{
if (softwareWrapMode==1)
{
uv=fract(uv);
}
else
{
if (softwareWrapMode==2)
{
float l9_0=fract(uv);
uv=mix(l9_0,1.0-l9_0,clamp(step(0.25,fract((uv-l9_0)*0.5)),0.0,1.0));
}
}
}
void sc_ClampUV(inout float value,float minValue,float maxValue,bool useClampToBorder,inout float clampToBorderFactor)
{
float l9_0=clamp(value,minValue,maxValue);
float l9_1=step(abs(value-l9_0),9.9999997e-06);
clampToBorderFactor*=(l9_1+((1.0-float(useClampToBorder))*(1.0-l9_1)));
value=l9_0;
}
vec2 sc_TransformUV(vec2 uv,bool useUvTransform,mat3 uvTransform)
{
if (useUvTransform)
{
uv=vec2((uvTransform*vec3(uv,1.0)).xy);
}
return uv;
}
void sc_SoftwareWrapLate(inout float uv,int softwareWrapMode,bool useClampToBorder,inout float clampToBorderFactor)
{
if ((softwareWrapMode==0)||(softwareWrapMode==3))
{
sc_ClampUV(uv,0.0,1.0,useClampToBorder,clampToBorderFactor);
}
}
vec3 sc_SamplingCoordsViewToGlobal(vec2 uv,int renderingLayout,int viewIndex)
{
vec3 l9_0;
if (renderingLayout==0)
{
l9_0=vec3(uv,0.0);
}
else
{
vec3 l9_1;
if (renderingLayout==1)
{
l9_1=vec3(uv.x,(uv.y*0.5)+(0.5-(float(viewIndex)*0.5)),0.0);
}
else
{
l9_1=vec3(uv,float(viewIndex));
}
l9_0=l9_1;
}
return l9_0;
}
void Node149_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (NODE_161_DROPLIST_ITEM==0)
{
Value0=vec4(shapeColor.xyz,1.0);
Result=Value0;
}
#else
{
#if (NODE_161_DROPLIST_ITEM==1)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*shapeScale)+shapeOffset;
vec4 l9_2;
#if (shapeTextureLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_shapeTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_shapeTexture)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_shapeTexture)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_shapeTexture)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_shapeTexture)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,shapeTextureUvMinMax.x,shapeTextureUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_shapeTexture)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_shapeTexture)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,shapeTextureUvMinMax.y,shapeTextureUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_shapeTexture)!=0),shapeTextureTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),shapeTextureLayout,shapeTextureGetStereoViewIndex());
vec4 l9_25=texture(shapeTextureArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_shapeTexture)
{
l9_26=mix(shapeTextureBorderColor,l9_25,vec4(l9_23));
}
#else
{
l9_26=l9_25;
}
#endif
l9_2=l9_26;
}
#else
{
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_shapeTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_shapeTexture)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_shapeTexture)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_shapeTexture)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_shapeTexture)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,shapeTextureUvMinMax.x,shapeTextureUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_shapeTexture)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_shapeTexture)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,shapeTextureUvMinMax.y,shapeTextureUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_shapeTexture)!=0),shapeTextureTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_shapeTexture,SC_SOFTWARE_WRAP_MODE_V_shapeTexture).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),shapeTextureLayout,shapeTextureGetStereoViewIndex());
vec4 l9_49=texture(shapeTexture,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_shapeTexture)
{
l9_50=mix(shapeTextureBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value1=l9_2*shapeColor;
Result=Value1;
}
#else
{
#if (NODE_161_DROPLIST_ITEM==2)
{
vec4 param_4;
Node209_Switch(0.0,vec4(0.0),vec4(0.0),Port_Default_N209,param_4,Globals);
Value2=param_4;
Result=Value2;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
#endif
}
void Node169_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (shapeColorInvert)
{
Output=1.001;
}
#else
{
Output=0.001;
}
#endif
Output-=0.001;
}
void Node171_Remap(float ValueIn,out float ValueOut,float RangeMinA,float RangeMaxA,float RangeMinB,float RangeMaxB,ssGlobals Globals)
{
ValueOut=(((ValueIn-RangeMinA)/((RangeMaxA-RangeMinA)+1e-06))*(RangeMaxB-RangeMinB))+RangeMinB;
float l9_0;
if (RangeMaxB>RangeMinB)
{
l9_0=clamp(ValueOut,RangeMinB,RangeMaxB);
}
else
{
l9_0=clamp(ValueOut,RangeMaxB,RangeMinB);
}
ValueOut=l9_0;
}
void Node323_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if ((toQuadStrokeGrad)==0)
{
vec2 l9_0=shapeGradPointB2-shapeGradPointA2;
Value0=mix(shapeGradColorA2,shapeGradColorB2,vec4(smoothstep(Port_Input0_N242,Port_Input1_N242,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N231))/vec2((Port_RangeMaxA_N231-Port_RangeMinA_N231)+1e-06))*(Port_RangeMaxB_N231-Port_RangeMinB_N231))+vec2(Port_RangeMinB_N231))-Port_Center_N233)*shapeScaleGrad2)+Port_Center_N233)-shapeGradPointA2,l9_0)/dot(l9_0,l9_0))+0.001,Port_Input1_N241+0.001,Port_Input2_N241+0.001)-0.001)));
Result=Value0;
}
#else
{
#if ((toQuadStrokeGrad)==1)
{
vec2 l9_1=(((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N252))/vec2((Port_RangeMaxA_N252-Port_RangeMinA_N252)+1e-06))*(Port_RangeMaxB_N252-Port_RangeMinB_N252))+vec2(Port_RangeMinB_N252))*shapeScaleGrad2)+shapeQuadOffset2;
vec4 l9_2=vec4(l9_1.x);
Value1=mix(mix(shapeGradColorA2,shapeGradColorB2,l9_2),mix(shapeGradColorC2,shapeGradColorD2,l9_2),vec4(l9_1.y));
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
int strokeTextureGetStereoViewIndex()
{
int l9_0;
#if (strokeTextureHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void Node324_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (NODE_164_DROPLIST_ITEM==0)
{
Value0=strokeColor;
Result=Value0;
}
#else
{
#if (NODE_164_DROPLIST_ITEM==1)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*strokeScale)+strokeOffset;
vec4 l9_2;
#if (strokeTextureLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_strokeTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_strokeTexture)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_strokeTexture)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_strokeTexture)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_strokeTexture)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,strokeTextureUvMinMax.x,strokeTextureUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_strokeTexture)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_strokeTexture)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,strokeTextureUvMinMax.y,strokeTextureUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_strokeTexture)!=0),strokeTextureTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),strokeTextureLayout,strokeTextureGetStereoViewIndex());
vec4 l9_25=texture(strokeTextureArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_strokeTexture)
{
l9_26=mix(strokeTextureBorderColor,l9_25,vec4(l9_23));
}
#else
{
l9_26=l9_25;
}
#endif
l9_2=l9_26;
}
#else
{
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_strokeTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_strokeTexture)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_strokeTexture)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_strokeTexture)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_strokeTexture)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,strokeTextureUvMinMax.x,strokeTextureUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_strokeTexture)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_strokeTexture)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,strokeTextureUvMinMax.y,strokeTextureUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_strokeTexture)!=0),strokeTextureTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_strokeTexture,SC_SOFTWARE_WRAP_MODE_V_strokeTexture).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),strokeTextureLayout,strokeTextureGetStereoViewIndex());
vec4 l9_49=texture(strokeTexture,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_strokeTexture)
{
l9_50=mix(strokeTextureBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value1=l9_2*strokeColor;
Result=Value1;
}
#else
{
#if (NODE_164_DROPLIST_ITEM==2)
{
vec4 param_4;
Node323_Switch(0.0,vec4(0.0),vec4(0.0),Port_Default_N323,param_4,Globals);
Value2=param_4;
Result=Value2;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
#endif
}
void Node325_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if ((Tweak_N139)==0)
{
Result=Value0;
}
#else
{
#if ((Tweak_N139)==1)
{
vec4 param_5;
Node324_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N324,param_5,Globals);
Value1=param_5;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
#endif
}
void Node337_If_else(float Bool1,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
Bool1=float(Hover);
if ((Bool1*1.0)!=0.0)
{
vec4 param_4;
Node126_Switch(0.0,vec4(0.0),vec4(0.0),Port_Default_N126,param_4,Globals);
vec4 param_10;
Node154_Switch(0.0,Port_Value0_N154,vec4(1.0),Port_Default_N154,param_10,Globals);
float param_16;
Node287_Switch(0.0,Port_Value0_N287,0.0,Port_Default_N287,param_16,Globals);
float param_22;
Node281_Switch(0.0,Port_Value0_N281,0.0,Port_Default_N281,param_22,Globals);
float param_25;
Node268_Remap(shapeWidthX,param_25,Port_RangeMinA_N268,Port_RangeMaxA_N268,param_16,param_22,Globals);
float param_35;
Node282_Switch(0.0,Port_Value0_N282,Port_Value1_N282,Port_Default_N282,param_35,Globals);
float param_41;
Node308_Switch(0.0,Port_Value0_N308,0.0,Port_Default_N308,param_41,Globals);
float param_47;
Node289_Switch(0.0,Port_Value0_N289,0.0,Port_Default_N289,param_47,Globals);
float param_53;
Node286_Switch(0.0,Port_Value0_N286,0.0,Port_Default_N286,param_53,Globals);
float param_56;
Node277_Remap(shapeHeightY,param_56,Port_RangeMinA_N277,Port_RangeMaxA_N277,param_47,param_53,Globals);
float param_66;
Node293_Switch(0.0,Port_Value0_N293,Port_Value1_N293,Port_Default_N293,param_66,Globals);
float param_72;
Node301_Switch(0.0,Port_Value0_N301,0.0,Port_Default_N301,param_72,Globals);
vec2 l9_0=((Globals.Surface_UVCoord0*param_10.xy)+Port_Input2_N148)+vec2(param_25+((1.0-(xOffset+param_35))+param_41),param_56+((yOffset+param_66)+param_72));
float param_78;
Node132_Switch(0.0,Port_Value0_N132,0.0,Port_Default_N132,param_78,Globals);
vec2 param_83;
Node92_Rotate_Coords(l9_0,param_78,Port_Center_N092,param_83,Globals);
float param_89;
Node131_Switch(0.0,Port_Value0_N131,0.0,Port_Default_N131,param_89,Globals);
vec2 param_94;
Node94_Rotate_Coords(param_83+vec2(Port_Value1_N097,param_89/Port_Input1_N160),1.0-(param_78+Port_Input1_N263),Port_Center_N094,param_94,Globals);
vec2 param_99;
Node100_Rotate_Coords(param_94,shapeRotation,Port_Center_N100,param_99,Globals);
float param_105;
Node125_Switch(0.0,Port_Value0_N125,0.0,Port_Default_N125,param_105,Globals);
float param_108;
Node138_Remap(param_105,param_108,Port_RangeMinA_N138,Port_RangeMaxA_N138,Port_RangeMinB_N138,Port_RangeMaxB_N138,Globals);
vec2 l9_1=abs(((((param_99-Port_Center_N137)*vec2(param_108))+Port_Center_N137)*vec2(Port_Input1_N019))+vec2(Port_Input1_N020));
float param_118;
Node122_Switch(0.0,Port_Value0_N122,0.0,Port_Default_N122,param_118,Globals);
float l9_2=param_118/Port_Input1_N056;
float l9_3=1.0-l9_2;
float param_121;
Node21_Remap(shapeWidthX,param_121,Port_RangeMinA_N021,Port_RangeMaxA_N021,Port_RangeMinB_N021,l9_3,Globals);
float param_128;
Node22_Remap(shapeHeightY,param_128,Port_RangeMinA_N022,Port_RangeMaxA_N022,Port_RangeMinB_N022,l9_3,Globals);
vec2 l9_4=vec2(param_121,param_128);
float l9_5=min(min(abs(shapeRoundness),param_121),param_128);
float l9_6=max(l9_5,Port_Input1_N030);
float l9_7=1.0-(length(max((l9_1-l9_4)+vec2(l9_6),Port_Input1_N032))/l9_6);
float l9_8=param_105*Port_Input1_N127;
float l9_9=l9_7/((((fwidth(l9_7)-Port_RangeMinA_N135)/((Port_RangeMaxA_N135-Port_RangeMinA_N135)+1e-06))*(Port_RangeMaxB_N135-l9_8))+l9_8);
float param_135;
Node39_Remap(shapeWidthX,param_135,Port_RangeMinA_N039,Port_RangeMaxA_N039,l9_2,Port_RangeMaxB_N039,Globals);
float param_142;
Node42_Remap(shapeHeightY,param_142,Port_RangeMinA_N042,Port_RangeMaxA_N042,l9_2,Port_RangeMaxB_N042,Globals);
vec2 l9_10=vec2(param_135,param_142);
float param_149;
Node57_Remap(shapeRoundness,param_149,Port_RangeMinA_N057,Port_RangeMaxA_N057,Port_RangeMinB_N057,Port_RangeMaxB_N057,Globals);
float param_156;
Node47_Remap(shapeRoundness,param_156,Port_RangeMinA_N047,Port_RangeMaxA_N047,(((param_118-Port_RangeMinA_N101)/((Port_RangeMaxA_N101-Port_RangeMinA_N101)+1e-06))*(param_149-Port_RangeMinB_N101))+Port_RangeMinB_N101,Port_RangeMaxB_N047,Globals);
float l9_11=min(min(abs(param_156),param_135),param_142);
float l9_12=max(l9_11,Port_Input1_N051);
float l9_13=1.0-(length(max((l9_1-l9_10)+vec2(l9_12),Port_Input1_N053))/l9_12);
float param_166;
Node68_Switch(0.0,Port_Value0_N068,0.0,Port_Default_N068,param_166,Globals);
float param_172;
Node123_Switch(0.0,Port_Value0_N123,0.0,Port_Default_N123,param_172,Globals);
float param_174;
Node124_Bool_Parameter(param_174,Globals);
vec4 l9_14=vec4(param_4.x,param_4.y,param_4.z,vec4(0.0).w);
l9_14.w=((clamp(((shapeAlpha*(clamp(l9_9+0.001,Port_Input1_N038+0.001,Port_Input2_N038+0.001)-0.001))+((clamp(((clamp((1.0-l9_9)+0.001,Port_Input1_N264+0.001,Port_Input2_N264+0.001)-0.001)*(clamp((l9_13/((((fwidth(l9_13)-Port_RangeMinA_N133)/((Port_RangeMaxA_N133-Port_RangeMinA_N133)+1e-06))*(Port_RangeMaxB_N133-param_105))+param_105))+0.001,Port_Input1_N064+0.001,Port_Input2_N064+0.001)-0.001))+0.001,Port_Input1_N066+0.001,Port_Input2_N066+0.001)-0.001)*param_166))+0.001,Port_Input1_N072+0.001,Port_Input2_N072+0.001)-0.001)*param_172)*param_174;
float param_176;
Node261_Bool_Parameter(param_176,Globals);
vec2 param_181;
Node113_Rotate_Coords(l9_0,shapeRotation,Port_Center_N113,param_181,Globals);
vec2 l9_15=abs((param_181*vec2(Port_Input1_N089))+vec2(Port_Input1_N090));
float l9_16=max(l9_5,Port_Input1_N103);
float l9_17=1.0-(length(max((l9_15-l9_4)+vec2(l9_16),Port_Input1_N105))/l9_16);
float l9_18=(l9_17/fwidth(l9_17))+0.001;
float l9_19=clamp(l9_18,Port_Input1_N112+0.001,Port_Input2_N112+0.001)-0.001;
vec4 param_188;
Node149_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N149,param_188,Globals);
float l9_20=max(l9_11,Port_Input1_N098);
float l9_21=1.0-(length(max((l9_15-l9_10)+vec2(l9_20),Port_Input1_N115))/l9_20);
float l9_22=(clamp(((1.0-(clamp(l9_18,Port_Input1_N265+0.001,Port_Input2_N265+0.001)-0.001))*(clamp((l9_21/fwidth(l9_21))+0.001,Port_Input1_N142+0.001,Port_Input2_N142+0.001)-0.001))+0.001,Port_Input1_N144+0.001,Port_Input2_N144+0.001)-0.001)*param_166;
float l9_23=l9_19*shapeAlpha;
float param_190;
Node169_Bool_Parameter(param_190,Globals);
float param_193;
Node171_Remap(((l9_22+l9_23)-max(l9_22,l9_23))+l9_23,param_193,Port_RangeMinA_N171,Port_RangeMaxA_N171,1.0-param_190,param_190,Globals);
vec4 param_203;
Node325_Switch(0.0,Port_Value0_N325,vec4(0.0),Port_Default_N325,param_203,Globals);
Value1=mix(mix(mix(l9_14,vec4(Port_Input1_N259),vec4(param_176*l9_19)),param_188,vec4(param_193)),param_203,vec4(l9_22));
Result=Value1;
}
else
{
vec4 param_209;
Node126_Switch(0.0,vec4(0.0),vec4(0.0),Port_Default_N126,param_209,Globals);
vec4 param_215;
Node154_Switch(0.0,Port_Value0_N154,vec4(1.0),Port_Default_N154,param_215,Globals);
float param_221;
Node287_Switch(0.0,Port_Value0_N287,0.0,Port_Default_N287,param_221,Globals);
float param_227;
Node281_Switch(0.0,Port_Value0_N281,0.0,Port_Default_N281,param_227,Globals);
float param_230;
Node268_Remap(shapeWidthX,param_230,Port_RangeMinA_N268,Port_RangeMaxA_N268,param_221,param_227,Globals);
float param_240;
Node282_Switch(0.0,Port_Value0_N282,Port_Value1_N282,Port_Default_N282,param_240,Globals);
float param_246;
Node308_Switch(0.0,Port_Value0_N308,0.0,Port_Default_N308,param_246,Globals);
float param_252;
Node289_Switch(0.0,Port_Value0_N289,0.0,Port_Default_N289,param_252,Globals);
float param_258;
Node286_Switch(0.0,Port_Value0_N286,0.0,Port_Default_N286,param_258,Globals);
float param_261;
Node277_Remap(shapeHeightY,param_261,Port_RangeMinA_N277,Port_RangeMaxA_N277,param_252,param_258,Globals);
float param_271;
Node293_Switch(0.0,Port_Value0_N293,Port_Value1_N293,Port_Default_N293,param_271,Globals);
float param_277;
Node301_Switch(0.0,Port_Value0_N301,0.0,Port_Default_N301,param_277,Globals);
vec2 l9_24=((Globals.Surface_UVCoord0*param_215.xy)+Port_Input2_N148)+vec2(param_230+((1.0-(xOffset+param_240))+param_246),param_261+((yOffset+param_271)+param_277));
float param_283;
Node132_Switch(0.0,Port_Value0_N132,0.0,Port_Default_N132,param_283,Globals);
vec2 param_288;
Node92_Rotate_Coords(l9_24,param_283,Port_Center_N092,param_288,Globals);
float param_294;
Node131_Switch(0.0,Port_Value0_N131,0.0,Port_Default_N131,param_294,Globals);
vec2 param_299;
Node94_Rotate_Coords(param_288+vec2(Port_Value1_N097,param_294/Port_Input1_N160),1.0-(param_283+Port_Input1_N263),Port_Center_N094,param_299,Globals);
vec2 param_304;
Node100_Rotate_Coords(param_299,shapeRotation,Port_Center_N100,param_304,Globals);
float param_310;
Node125_Switch(0.0,Port_Value0_N125,0.0,Port_Default_N125,param_310,Globals);
float param_313;
Node138_Remap(param_310,param_313,Port_RangeMinA_N138,Port_RangeMaxA_N138,Port_RangeMinB_N138,Port_RangeMaxB_N138,Globals);
vec2 l9_25=abs(((((param_304-Port_Center_N137)*vec2(param_313))+Port_Center_N137)*vec2(Port_Input1_N019))+vec2(Port_Input1_N020));
float param_323;
Node122_Switch(0.0,Port_Value0_N122,0.0,Port_Default_N122,param_323,Globals);
float l9_26=param_323/Port_Input1_N056;
float l9_27=1.0-l9_26;
float param_326;
Node21_Remap(shapeWidthX,param_326,Port_RangeMinA_N021,Port_RangeMaxA_N021,Port_RangeMinB_N021,l9_27,Globals);
float param_333;
Node22_Remap(shapeHeightY,param_333,Port_RangeMinA_N022,Port_RangeMaxA_N022,Port_RangeMinB_N022,l9_27,Globals);
vec2 l9_28=vec2(param_326,param_333);
float l9_29=min(min(abs(shapeRoundness),param_326),param_333);
float l9_30=max(l9_29,Port_Input1_N030);
float l9_31=1.0-(length(max((l9_25-l9_28)+vec2(l9_30),Port_Input1_N032))/l9_30);
float l9_32=param_310*Port_Input1_N127;
float l9_33=l9_31/((((fwidth(l9_31)-Port_RangeMinA_N135)/((Port_RangeMaxA_N135-Port_RangeMinA_N135)+1e-06))*(Port_RangeMaxB_N135-l9_32))+l9_32);
float param_340;
Node39_Remap(shapeWidthX,param_340,Port_RangeMinA_N039,Port_RangeMaxA_N039,l9_26,Port_RangeMaxB_N039,Globals);
float param_347;
Node42_Remap(shapeHeightY,param_347,Port_RangeMinA_N042,Port_RangeMaxA_N042,l9_26,Port_RangeMaxB_N042,Globals);
vec2 l9_34=vec2(param_340,param_347);
float param_354;
Node57_Remap(shapeRoundness,param_354,Port_RangeMinA_N057,Port_RangeMaxA_N057,Port_RangeMinB_N057,Port_RangeMaxB_N057,Globals);
float param_361;
Node47_Remap(shapeRoundness,param_361,Port_RangeMinA_N047,Port_RangeMaxA_N047,(((param_323-Port_RangeMinA_N101)/((Port_RangeMaxA_N101-Port_RangeMinA_N101)+1e-06))*(param_354-Port_RangeMinB_N101))+Port_RangeMinB_N101,Port_RangeMaxB_N047,Globals);
float l9_35=min(min(abs(param_361),param_340),param_347);
float l9_36=max(l9_35,Port_Input1_N051);
float l9_37=1.0-(length(max((l9_25-l9_34)+vec2(l9_36),Port_Input1_N053))/l9_36);
float param_371;
Node68_Switch(0.0,Port_Value0_N068,0.0,Port_Default_N068,param_371,Globals);
float param_377;
Node123_Switch(0.0,Port_Value0_N123,0.0,Port_Default_N123,param_377,Globals);
float param_379;
Node124_Bool_Parameter(param_379,Globals);
vec4 l9_38=vec4(param_209.x,param_209.y,param_209.z,vec4(0.0).w);
l9_38.w=((clamp(((shapeAlpha*(clamp(l9_33+0.001,Port_Input1_N038+0.001,Port_Input2_N038+0.001)-0.001))+((clamp(((clamp((1.0-l9_33)+0.001,Port_Input1_N264+0.001,Port_Input2_N264+0.001)-0.001)*(clamp((l9_37/((((fwidth(l9_37)-Port_RangeMinA_N133)/((Port_RangeMaxA_N133-Port_RangeMinA_N133)+1e-06))*(Port_RangeMaxB_N133-param_310))+param_310))+0.001,Port_Input1_N064+0.001,Port_Input2_N064+0.001)-0.001))+0.001,Port_Input1_N066+0.001,Port_Input2_N066+0.001)-0.001)*param_371))+0.001,Port_Input1_N072+0.001,Port_Input2_N072+0.001)-0.001)*param_377)*param_379;
float param_381;
Node261_Bool_Parameter(param_381,Globals);
vec2 param_386;
Node113_Rotate_Coords(l9_24,shapeRotation,Port_Center_N113,param_386,Globals);
vec2 l9_39=abs((param_386*vec2(Port_Input1_N089))+vec2(Port_Input1_N090));
float l9_40=max(l9_29,Port_Input1_N103);
float l9_41=1.0-(length(max((l9_39-l9_28)+vec2(l9_40),Port_Input1_N105))/l9_40);
float l9_42=(l9_41/fwidth(l9_41))+0.001;
float l9_43=clamp(l9_42,Port_Input1_N112+0.001,Port_Input2_N112+0.001)-0.001;
vec4 param_393;
Node149_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N149,param_393,Globals);
float l9_44=max(l9_35,Port_Input1_N098);
float l9_45=1.0-(length(max((l9_39-l9_34)+vec2(l9_44),Port_Input1_N115))/l9_44);
float l9_46=(clamp(((1.0-(clamp(l9_42,Port_Input1_N265+0.001,Port_Input2_N265+0.001)-0.001))*(clamp((l9_45/fwidth(l9_45))+0.001,Port_Input1_N142+0.001,Port_Input2_N142+0.001)-0.001))+0.001,Port_Input1_N144+0.001,Port_Input2_N144+0.001)-0.001)*param_371;
float l9_47=l9_43*shapeAlpha;
float param_395;
Node169_Bool_Parameter(param_395,Globals);
float param_398;
Node171_Remap(((l9_46+l9_47)-max(l9_46,l9_47))+l9_47,param_398,Port_RangeMinA_N171,Port_RangeMaxA_N171,1.0-param_395,param_395,Globals);
vec4 param_408;
Node325_Switch(0.0,Port_Value0_N325,vec4(0.0),Port_Default_N325,param_408,Globals);
vec4 l9_48=mix(mix(mix(l9_38,vec4(Port_Input1_N259),vec4(param_381*l9_43)),param_393,vec4(param_398)),param_408,vec4(l9_46));
Default=vec4(l9_48.xyz,l9_48.w*Port_Input1_N335);
Result=Default;
}
}
int baseTexGetStereoViewIndex()
{
int l9_0;
#if (baseTexHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
col.x+=zero*float(cacheConst);
sc_FragData0=col;
}
vec2 sc_SamplingCoordsGlobalToView(vec3 uvi,int renderingLayout,int viewIndex)
{
if (renderingLayout==1)
{
uvi.y=((2.0*uvi.y)+float(viewIndex))-1.0;
}
return uvi.xy;
}
vec2 sc_ScreenCoordsGlobalToView(vec2 uv)
{
vec2 l9_0;
#if (sc_StereoRenderingMode==1)
{
l9_0=sc_SamplingCoordsGlobalToView(vec3(uv,0.0),1,sc_GetStereoViewIndex());
}
#else
{
l9_0=uv;
}
#endif
return l9_0;
}
int sc_ScreenTextureGetStereoViewIndex()
{
int l9_0;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
vec4 sc_readFragData0_Platform()
{
return getFragData()[0];
}
int intensityTextureGetStereoViewIndex()
{
int l9_0;
#if (intensityTextureHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
float transformSingleColor(float original,float intMap,float target)
{
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
return original/pow(1.0-target,intMap);
}
#else
{
#if (BLEND_MODE_DIVISION)
{
return original/(1.0-target);
}
#else
{
#if (BLEND_MODE_BRIGHT)
{
return original/pow(1.0-target,2.0-(2.0*original));
}
#endif
}
#endif
}
#endif
return 0.0;
}
vec3 RGBtoHCV(vec3 rgb)
{
vec4 l9_0;
if (rgb.y<rgb.z)
{
l9_0=vec4(rgb.zy,-1.0,0.66666669);
}
else
{
l9_0=vec4(rgb.yz,0.0,-0.33333334);
}
vec4 l9_1;
if (rgb.x<l9_0.x)
{
l9_1=vec4(l9_0.xyw,rgb.x);
}
else
{
l9_1=vec4(rgb.x,l9_0.yzx);
}
float l9_2=l9_1.x-min(l9_1.w,l9_1.y);
return vec3(abs(((l9_1.w-l9_1.y)/((6.0*l9_2)+1e-07))+l9_1.z),l9_2,l9_1.x);
}
vec3 RGBToHSL(vec3 rgb)
{
vec3 l9_0=RGBtoHCV(rgb);
float l9_1=l9_0.y;
float l9_2=l9_0.z-(l9_1*0.5);
return vec3(l9_0.x,l9_1/((1.0-abs((2.0*l9_2)-1.0))+1e-07),l9_2);
}
vec3 HUEtoRGB(float hue)
{
return clamp(vec3(abs((6.0*hue)-3.0)-1.0,2.0-abs((6.0*hue)-2.0),2.0-abs((6.0*hue)-4.0)),vec3(0.0),vec3(1.0));
}
vec3 HSLToRGB(vec3 hsl)
{
return ((HUEtoRGB(hsl.x)-vec3(0.5))*((1.0-abs((2.0*hsl.z)-1.0))*hsl.y))+vec3(hsl.z);
}
vec3 transformColor(float yValue,vec3 original,vec3 target,float weight,float intMap)
{
#if (BLEND_MODE_INTENSE)
{
return mix(original,HSLToRGB(vec3(target.x,target.y,RGBToHSL(original).z)),vec3(weight));
}
#else
{
return mix(original,clamp(vec3(transformSingleColor(yValue,intMap,target.x),transformSingleColor(yValue,intMap,target.y),transformSingleColor(yValue,intMap,target.z)),vec3(0.0),vec3(1.0)),vec3(weight));
}
#endif
}
vec3 definedBlend(vec3 a,vec3 b)
{
#if (BLEND_MODE_LIGHTEN)
{
return max(a,b);
}
#else
{
#if (BLEND_MODE_DARKEN)
{
return min(a,b);
}
#else
{
#if (BLEND_MODE_DIVIDE)
{
return b/a;
}
#else
{
#if (BLEND_MODE_AVERAGE)
{
return (a+b)*0.5;
}
#else
{
#if (BLEND_MODE_SUBTRACT)
{
return max((a+b)-vec3(1.0),vec3(0.0));
}
#else
{
#if (BLEND_MODE_DIFFERENCE)
{
return abs(a-b);
}
#else
{
#if (BLEND_MODE_NEGATION)
{
return vec3(1.0)-abs((vec3(1.0)-a)-b);
}
#else
{
#if (BLEND_MODE_EXCLUSION)
{
return (a+b)-((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_OVERLAY)
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1;
if (a.y<0.5)
{
l9_1=(2.0*a.y)*b.y;
}
else
{
l9_1=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_2;
if (a.z<0.5)
{
l9_2=(2.0*a.z)*b.z;
}
else
{
l9_2=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return vec3(l9_0,l9_1,l9_2);
}
#else
{
#if (BLEND_MODE_SOFT_LIGHT)
{
return (((vec3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_HARD_LIGHT)
{
float l9_3;
if (b.x<0.5)
{
l9_3=(2.0*b.x)*a.x;
}
else
{
l9_3=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_4;
if (b.y<0.5)
{
l9_4=(2.0*b.y)*a.y;
}
else
{
l9_4=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_5;
if (b.z<0.5)
{
l9_5=(2.0*b.z)*a.z;
}
else
{
l9_5=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return vec3(l9_3,l9_4,l9_5);
}
#else
{
#if (BLEND_MODE_COLOR_DODGE)
{
float l9_6;
if (b.x==1.0)
{
l9_6=b.x;
}
else
{
l9_6=min(a.x/(1.0-b.x),1.0);
}
float l9_7;
if (b.y==1.0)
{
l9_7=b.y;
}
else
{
l9_7=min(a.y/(1.0-b.y),1.0);
}
float l9_8;
if (b.z==1.0)
{
l9_8=b.z;
}
else
{
l9_8=min(a.z/(1.0-b.z),1.0);
}
return vec3(l9_6,l9_7,l9_8);
}
#else
{
#if (BLEND_MODE_COLOR_BURN)
{
float l9_9;
if (b.x==0.0)
{
l9_9=b.x;
}
else
{
l9_9=max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_10;
if (b.y==0.0)
{
l9_10=b.y;
}
else
{
l9_10=max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_11;
if (b.z==0.0)
{
l9_11=b.z;
}
else
{
l9_11=max(1.0-((1.0-a.z)/b.z),0.0);
}
return vec3(l9_9,l9_10,l9_11);
}
#else
{
#if (BLEND_MODE_LINEAR_LIGHT)
{
float l9_12;
if (b.x<0.5)
{
l9_12=max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_12=min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_13;
if (b.y<0.5)
{
l9_13=max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_13=min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_14;
if (b.z<0.5)
{
l9_14=max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_14=min(a.z+(2.0*(b.z-0.5)),1.0);
}
return vec3(l9_12,l9_13,l9_14);
}
#else
{
#if (BLEND_MODE_VIVID_LIGHT)
{
float l9_15;
if (b.x<0.5)
{
float l9_16;
if ((2.0*b.x)==0.0)
{
l9_16=2.0*b.x;
}
else
{
l9_16=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_15=l9_16;
}
else
{
float l9_17;
if ((2.0*(b.x-0.5))==1.0)
{
l9_17=2.0*(b.x-0.5);
}
else
{
l9_17=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_15=l9_17;
}
float l9_18;
if (b.y<0.5)
{
float l9_19;
if ((2.0*b.y)==0.0)
{
l9_19=2.0*b.y;
}
else
{
l9_19=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_18=l9_19;
}
else
{
float l9_20;
if ((2.0*(b.y-0.5))==1.0)
{
l9_20=2.0*(b.y-0.5);
}
else
{
l9_20=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_18=l9_20;
}
float l9_21;
if (b.z<0.5)
{
float l9_22;
if ((2.0*b.z)==0.0)
{
l9_22=2.0*b.z;
}
else
{
l9_22=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_21=l9_22;
}
else
{
float l9_23;
if ((2.0*(b.z-0.5))==1.0)
{
l9_23=2.0*(b.z-0.5);
}
else
{
l9_23=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_21=l9_23;
}
return vec3(l9_15,l9_18,l9_21);
}
#else
{
#if (BLEND_MODE_PIN_LIGHT)
{
float l9_24;
if (b.x<0.5)
{
l9_24=min(a.x,2.0*b.x);
}
else
{
l9_24=max(a.x,2.0*(b.x-0.5));
}
float l9_25;
if (b.y<0.5)
{
l9_25=min(a.y,2.0*b.y);
}
else
{
l9_25=max(a.y,2.0*(b.y-0.5));
}
float l9_26;
if (b.z<0.5)
{
l9_26=min(a.z,2.0*b.z);
}
else
{
l9_26=max(a.z,2.0*(b.z-0.5));
}
return vec3(l9_24,l9_25,l9_26);
}
#else
{
#if (BLEND_MODE_HARD_MIX)
{
float l9_27;
if (b.x<0.5)
{
float l9_28;
if ((2.0*b.x)==0.0)
{
l9_28=2.0*b.x;
}
else
{
l9_28=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_27=l9_28;
}
else
{
float l9_29;
if ((2.0*(b.x-0.5))==1.0)
{
l9_29=2.0*(b.x-0.5);
}
else
{
l9_29=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_27=l9_29;
}
bool l9_30=l9_27<0.5;
float l9_31;
if (b.y<0.5)
{
float l9_32;
if ((2.0*b.y)==0.0)
{
l9_32=2.0*b.y;
}
else
{
l9_32=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_31=l9_32;
}
else
{
float l9_33;
if ((2.0*(b.y-0.5))==1.0)
{
l9_33=2.0*(b.y-0.5);
}
else
{
l9_33=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_31=l9_33;
}
bool l9_34=l9_31<0.5;
float l9_35;
if (b.z<0.5)
{
float l9_36;
if ((2.0*b.z)==0.0)
{
l9_36=2.0*b.z;
}
else
{
l9_36=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_35=l9_36;
}
else
{
float l9_37;
if ((2.0*(b.z-0.5))==1.0)
{
l9_37=2.0*(b.z-0.5);
}
else
{
l9_37=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_35=l9_37;
}
return vec3(l9_30 ? 0.0 : 1.0,l9_34 ? 0.0 : 1.0,(l9_35<0.5) ? 0.0 : 1.0);
}
#else
{
#if (BLEND_MODE_HARD_REFLECT)
{
float l9_38;
if (b.x==1.0)
{
l9_38=b.x;
}
else
{
l9_38=min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_39;
if (b.y==1.0)
{
l9_39=b.y;
}
else
{
l9_39=min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_40;
if (b.z==1.0)
{
l9_40=b.z;
}
else
{
l9_40=min((a.z*a.z)/(1.0-b.z),1.0);
}
return vec3(l9_38,l9_39,l9_40);
}
#else
{
#if (BLEND_MODE_HARD_GLOW)
{
float l9_41;
if (a.x==1.0)
{
l9_41=a.x;
}
else
{
l9_41=min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_42;
if (a.y==1.0)
{
l9_42=a.y;
}
else
{
l9_42=min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_43;
if (a.z==1.0)
{
l9_43=a.z;
}
else
{
l9_43=min((b.z*b.z)/(1.0-a.z),1.0);
}
return vec3(l9_41,l9_42,l9_43);
}
#else
{
#if (BLEND_MODE_HARD_PHOENIX)
{
return (min(a,b)-max(a,b))+vec3(1.0);
}
#else
{
#if (BLEND_MODE_HUE)
{
return HSLToRGB(vec3(RGBToHSL(b).x,RGBToHSL(a).yz));
}
#else
{
#if (BLEND_MODE_SATURATION)
{
vec3 l9_44=RGBToHSL(a);
return HSLToRGB(vec3(l9_44.x,RGBToHSL(b).y,l9_44.z));
}
#else
{
#if (BLEND_MODE_COLOR)
{
return HSLToRGB(vec3(RGBToHSL(b).xy,RGBToHSL(a).z));
}
#else
{
#if (BLEND_MODE_LUMINOSITY)
{
return HSLToRGB(vec3(RGBToHSL(a).xy,RGBToHSL(b).z));
}
#else
{
vec3 l9_45=a;
vec3 l9_46=b;
float l9_47=((0.29899999*l9_45.x)+(0.58700001*l9_45.y))+(0.114*l9_45.z);
float l9_48=pow(l9_47,1.0/correctedIntensity);
vec4 l9_49;
#if (intensityTextureLayout==2)
{
bool l9_50=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_51=l9_48;
sc_SoftwareWrapEarly(l9_51,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_52=l9_51;
float l9_53=0.5;
sc_SoftwareWrapEarly(l9_53,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_54=l9_53;
vec2 l9_55;
float l9_56;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_57;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_57=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_57=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_58=l9_52;
float l9_59=1.0;
sc_ClampUV(l9_58,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_57,l9_59);
float l9_60=l9_58;
float l9_61=l9_59;
bool l9_62;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_62=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_62=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_63=l9_54;
float l9_64=l9_61;
sc_ClampUV(l9_63,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_62,l9_64);
l9_56=l9_64;
l9_55=vec2(l9_60,l9_63);
}
#else
{
l9_56=1.0;
l9_55=vec2(l9_52,l9_54);
}
#endif
vec2 l9_65=sc_TransformUV(l9_55,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_66=l9_65.x;
float l9_67=l9_56;
sc_SoftwareWrapLate(l9_66,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_50,l9_67);
float l9_68=l9_65.y;
float l9_69=l9_67;
sc_SoftwareWrapLate(l9_68,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_50,l9_69);
float l9_70=l9_69;
vec3 l9_71=sc_SamplingCoordsViewToGlobal(vec2(l9_66,l9_68),intensityTextureLayout,intensityTextureGetStereoViewIndex());
vec4 l9_72=texture(intensityTextureArrSC,l9_71,0.0);
vec4 l9_73;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_73=mix(intensityTextureBorderColor,l9_72,vec4(l9_70));
}
#else
{
l9_73=l9_72;
}
#endif
l9_49=l9_73;
}
#else
{
bool l9_74=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_75=l9_48;
sc_SoftwareWrapEarly(l9_75,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_76=l9_75;
float l9_77=0.5;
sc_SoftwareWrapEarly(l9_77,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_78=l9_77;
vec2 l9_79;
float l9_80;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_81;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_81=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_81=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_82=l9_76;
float l9_83=1.0;
sc_ClampUV(l9_82,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_81,l9_83);
float l9_84=l9_82;
float l9_85=l9_83;
bool l9_86;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_86=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_86=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_87=l9_78;
float l9_88=l9_85;
sc_ClampUV(l9_87,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_86,l9_88);
l9_80=l9_88;
l9_79=vec2(l9_84,l9_87);
}
#else
{
l9_80=1.0;
l9_79=vec2(l9_76,l9_78);
}
#endif
vec2 l9_89=sc_TransformUV(l9_79,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_90=l9_89.x;
float l9_91=l9_80;
sc_SoftwareWrapLate(l9_90,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_74,l9_91);
float l9_92=l9_89.y;
float l9_93=l9_91;
sc_SoftwareWrapLate(l9_92,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_74,l9_93);
float l9_94=l9_93;
vec3 l9_95=sc_SamplingCoordsViewToGlobal(vec2(l9_90,l9_92),intensityTextureLayout,intensityTextureGetStereoViewIndex());
vec4 l9_96=texture(intensityTexture,l9_95.xy,0.0);
vec4 l9_97;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_97=mix(intensityTextureBorderColor,l9_96,vec4(l9_94));
}
#else
{
l9_97=l9_96;
}
#endif
l9_49=l9_97;
}
#endif
float l9_98=((((l9_49.x*256.0)+l9_49.y)+(l9_49.z/256.0))/257.00391)*16.0;
float l9_99;
#if (BLEND_MODE_FORGRAY)
{
l9_99=max(l9_98,1.0);
}
#else
{
l9_99=l9_98;
}
#endif
float l9_100;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_100=min(l9_99,1.0);
}
#else
{
l9_100=l9_99;
}
#endif
return transformColor(l9_47,l9_45,l9_46,1.0,l9_100);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
vec4 sc_OutputMotionVectorsIfNeeded(vec3 surfacePosWorldSpace,vec4 finalColor)
{
#if (sc_MotionVectorsPass)
{
vec4 l9_0=vec4(surfacePosWorldSpace,1.0);
vec4 l9_1=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_0;
vec4 l9_2=((sc_PrevFrameViewProjectionMatrixArray[sc_GetStereoViewIndex()]*sc_PrevFrameModelMatrix)*sc_ModelMatrixInverse)*l9_0;
vec2 l9_3=((l9_1.xy/vec2(l9_1.w)).xy-(l9_2.xy/vec2(l9_2.w)).xy)*0.5;
float l9_4=floor(((l9_3.x*5.0)+0.5)*65535.0);
float l9_5=floor(l9_4*0.00390625);
float l9_6=floor(((l9_3.y*5.0)+0.5)*65535.0);
float l9_7=floor(l9_6*0.00390625);
return vec4(l9_5/255.0,(l9_4-(l9_5*256.0))/255.0,l9_7/255.0,(l9_6-(l9_7*256.0))/255.0);
}
#else
{
return finalColor;
}
#endif
}
float getFrontLayerZTestEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 5e-07;
}
#else
{
return 5.0000001e-08;
}
#endif
}
void unpackValues(float channel,int passIndex,inout int values[8])
{
#if (sc_OITCompositingPass)
{
channel=floor((channel*255.0)+0.5);
int l9_0=((passIndex+1)*4)-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_0>=(passIndex*4))
{
values[l9_0]=(values[l9_0]*4)+int(floor(mod(channel,4.0)));
channel=floor(channel/4.0);
l9_0--;
continue;
}
else
{
break;
}
}
}
#endif
}
float getDepthOrderingEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 0.001;
}
#else
{
return 0.0;
}
#endif
}
int encodeDepth(float depth,vec2 depthBounds)
{
float l9_0=(1.0-depthBounds.x)*1000.0;
return int(clamp((depth-l9_0)/((depthBounds.y*1000.0)-l9_0),0.0,1.0)*65535.0);
}
float viewSpaceDepth()
{
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
return varViewSpaceDepth;
}
#else
{
return sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((gl_FragCoord.z*2.0)-1.0));
}
#endif
}
float packValue(inout int value)
{
#if (sc_OITDepthGatherPass)
{
int l9_0=value;
value/=4;
return floor(floor(mod(float(l9_0),4.0))*64.0)/255.0;
}
#else
{
return 0.0;
}
#endif
}
void sc_writeFragData1(vec4 col)
{
#if sc_FragDataCount>=2
sc_FragData1=col;
#endif
}
void sc_writeFragData2(vec4 col)
{
#if sc_FragDataCount>=3
sc_FragData2=col;
#endif
}
void main()
{
#if (sc_DepthOnly)
{
return;
}
#endif
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==0))
{
if (varClipDistance<0.0)
{
discard;
}
}
#endif
bool l9_0=sc_RayTracingCasterConfiguration.x!=0u;
vec2 l9_1;
if (l9_0)
{
sc_RayTracingHitPayload l9_2=sc_RayTracingEvaluateHitPayload(ivec2(gl_FragCoord.xy));
if (l9_2.id.x!=(sc_RayTracingCasterConfiguration.y&65535u))
{
return;
}
l9_1=l9_2.uv0;
}
else
{
l9_1=varPackedTex.xy;
}
ssGlobals l9_3=ssGlobals(sc_Time.x,sc_Time.y,0.0,l9_1);
float l9_4=float(Active);
float l9_5=float(Hover);
vec4 l9_6;
if ((max(l9_4,l9_5)*1.0)!=0.0)
{
vec4 l9_7;
Node337_If_else(0.0,vec4(0.0),vec4(0.0),l9_7,l9_3);
l9_6=l9_7;
}
else
{
vec4 l9_8;
Node337_If_else(0.0,vec4(0.0),vec4(0.0),l9_8,l9_3);
l9_6=l9_8*Port_Input1_N345;
}
bool l9_9=(l9_4*1.0)!=0.0;
bool l9_10;
if (!l9_9)
{
l9_10=(l9_5*1.0)!=0.0;
}
else
{
l9_10=l9_9;
}
vec4 l9_11;
if ((float(l9_10)*1.0)!=0.0)
{
vec2 l9_12=l9_1-Port_Center_N340;
vec2 l9_13=(l9_12*Port_Scale_N340)+Port_Center_N340;
vec4 l9_14;
#if (baseTexLayout==2)
{
bool l9_15=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_16=l9_13.x;
sc_SoftwareWrapEarly(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_17=l9_16;
float l9_18=l9_13.y;
sc_SoftwareWrapEarly(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_19=l9_18;
vec2 l9_20;
float l9_21;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_22;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_22=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_22=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_23=l9_17;
float l9_24=1.0;
sc_ClampUV(l9_23,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_22,l9_24);
float l9_25=l9_23;
float l9_26=l9_24;
bool l9_27;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_27=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_27=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_28=l9_19;
float l9_29=l9_26;
sc_ClampUV(l9_28,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_27,l9_29);
l9_21=l9_29;
l9_20=vec2(l9_25,l9_28);
}
#else
{
l9_21=1.0;
l9_20=vec2(l9_17,l9_19);
}
#endif
vec2 l9_30=sc_TransformUV(l9_20,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_31=l9_30.x;
float l9_32=l9_21;
sc_SoftwareWrapLate(l9_31,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_15,l9_32);
float l9_33=l9_30.y;
float l9_34=l9_32;
sc_SoftwareWrapLate(l9_33,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_15,l9_34);
float l9_35=l9_34;
vec3 l9_36=sc_SamplingCoordsViewToGlobal(vec2(l9_31,l9_33),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_37=texture(baseTexArrSC,l9_36,0.0);
vec4 l9_38;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_38=mix(baseTexBorderColor,l9_37,vec4(l9_35));
}
#else
{
l9_38=l9_37;
}
#endif
l9_14=l9_38;
}
#else
{
bool l9_39=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_40=l9_13.x;
sc_SoftwareWrapEarly(l9_40,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_41=l9_40;
float l9_42=l9_13.y;
sc_SoftwareWrapEarly(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_43=l9_42;
vec2 l9_44;
float l9_45;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_46;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_46=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_46=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_47=l9_41;
float l9_48=1.0;
sc_ClampUV(l9_47,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_46,l9_48);
float l9_49=l9_47;
float l9_50=l9_48;
bool l9_51;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_51=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_51=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_52=l9_43;
float l9_53=l9_50;
sc_ClampUV(l9_52,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_51,l9_53);
l9_45=l9_53;
l9_44=vec2(l9_49,l9_52);
}
#else
{
l9_45=1.0;
l9_44=vec2(l9_41,l9_43);
}
#endif
vec2 l9_54=sc_TransformUV(l9_44,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_55=l9_54.x;
float l9_56=l9_45;
sc_SoftwareWrapLate(l9_55,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_39,l9_56);
float l9_57=l9_54.y;
float l9_58=l9_56;
sc_SoftwareWrapLate(l9_57,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_39,l9_58);
float l9_59=l9_58;
vec3 l9_60=sc_SamplingCoordsViewToGlobal(vec2(l9_55,l9_57),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_61=texture(baseTex,l9_60.xy,0.0);
vec4 l9_62;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_62=mix(baseTexBorderColor,l9_61,vec4(l9_59));
}
#else
{
l9_62=l9_61;
}
#endif
l9_14=l9_62;
}
#endif
l9_11=vec4(Port_Input_N339.x,Port_Input_N339.y,Port_Input_N339.z,l9_14.w);
}
else
{
vec2 l9_63=l9_1-Port_Center_N340;
vec2 l9_64=(l9_63*Port_Scale_N340)+Port_Center_N340;
vec4 l9_65;
#if (baseTexLayout==2)
{
bool l9_66=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_67=l9_64.x;
sc_SoftwareWrapEarly(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_68=l9_67;
float l9_69=l9_64.y;
sc_SoftwareWrapEarly(l9_69,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_70=l9_69;
vec2 l9_71;
float l9_72;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_73;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_73=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_73=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_74=l9_68;
float l9_75=1.0;
sc_ClampUV(l9_74,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_73,l9_75);
float l9_76=l9_74;
float l9_77=l9_75;
bool l9_78;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_78=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_78=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_79=l9_70;
float l9_80=l9_77;
sc_ClampUV(l9_79,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_78,l9_80);
l9_72=l9_80;
l9_71=vec2(l9_76,l9_79);
}
#else
{
l9_72=1.0;
l9_71=vec2(l9_68,l9_70);
}
#endif
vec2 l9_81=sc_TransformUV(l9_71,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_82=l9_81.x;
float l9_83=l9_72;
sc_SoftwareWrapLate(l9_82,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_66,l9_83);
float l9_84=l9_81.y;
float l9_85=l9_83;
sc_SoftwareWrapLate(l9_84,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_66,l9_85);
float l9_86=l9_85;
vec3 l9_87=sc_SamplingCoordsViewToGlobal(vec2(l9_82,l9_84),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_88=texture(baseTexArrSC,l9_87,0.0);
vec4 l9_89;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_89=mix(baseTexBorderColor,l9_88,vec4(l9_86));
}
#else
{
l9_89=l9_88;
}
#endif
l9_65=l9_89;
}
#else
{
bool l9_90=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_91=l9_64.x;
sc_SoftwareWrapEarly(l9_91,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_92=l9_91;
float l9_93=l9_64.y;
sc_SoftwareWrapEarly(l9_93,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_94=l9_93;
vec2 l9_95;
float l9_96;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_97;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_97=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_97=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_98=l9_92;
float l9_99=1.0;
sc_ClampUV(l9_98,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_97,l9_99);
float l9_100=l9_98;
float l9_101=l9_99;
bool l9_102;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_102=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_102=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_103=l9_94;
float l9_104=l9_101;
sc_ClampUV(l9_103,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_102,l9_104);
l9_96=l9_104;
l9_95=vec2(l9_100,l9_103);
}
#else
{
l9_96=1.0;
l9_95=vec2(l9_92,l9_94);
}
#endif
vec2 l9_105=sc_TransformUV(l9_95,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_106=l9_105.x;
float l9_107=l9_96;
sc_SoftwareWrapLate(l9_106,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_90,l9_107);
float l9_108=l9_105.y;
float l9_109=l9_107;
sc_SoftwareWrapLate(l9_108,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_90,l9_109);
float l9_110=l9_109;
vec3 l9_111=sc_SamplingCoordsViewToGlobal(vec2(l9_106,l9_108),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_112=texture(baseTex,l9_111.xy,0.0);
vec4 l9_113;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_113=mix(baseTexBorderColor,l9_112,vec4(l9_110));
}
#else
{
l9_113=l9_112;
}
#endif
l9_65=l9_113;
}
#endif
l9_11=vec4(Port_Input_N006.x,Port_Input_N006.y,Port_Input_N006.z,l9_65.w);
}
vec3 l9_114=mix(l9_6.xyz,l9_11.xyz,vec3(l9_11.w));
float l9_115=clamp((l9_6.w+l9_11.w)+0.001,Port_Input1_N361+0.001,Port_Input2_N361+0.001)-0.001;
vec4 l9_116=vec4(l9_114.x,l9_114.y,l9_114.z,vec4(0.0).w);
l9_116.w=l9_115;
#if (sc_BlendMode_AlphaTest)
{
if (l9_115<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_115<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
if (l9_0)
{
vec4 l9_117;
#if (sc_RayTracingCasterForceOpaque)
{
vec4 l9_118=l9_116;
l9_118.w=1.0;
l9_117=l9_118;
}
#else
{
l9_117=l9_116;
}
#endif
sc_writeFragData0Internal(max(l9_117,vec4(0.0)),sc_UniformConstants.x,sc_ShaderCacheConstant);
return;
}
vec4 l9_119;
#if (sc_ProjectiveShadowsCaster)
{
float l9_120;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_120=l9_115;
}
#else
{
float l9_121;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_121=clamp(l9_115*2.0,0.0,1.0);
}
#else
{
float l9_122;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_122=clamp(dot(l9_116.xyz,vec3(l9_115)),0.0,1.0);
}
#else
{
float l9_123;
#if (sc_BlendMode_AlphaTest)
{
l9_123=1.0;
}
#else
{
float l9_124;
#if (sc_BlendMode_Multiply)
{
l9_124=(1.0-dot(l9_116.xyz,vec3(0.33333001)))*l9_115;
}
#else
{
float l9_125;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_125=(1.0-clamp(dot(l9_116.xyz,vec3(1.0)),0.0,1.0))*l9_115;
}
#else
{
float l9_126;
#if (sc_BlendMode_ColoredGlass)
{
l9_126=clamp(dot(l9_116.xyz,vec3(1.0)),0.0,1.0)*l9_115;
}
#else
{
float l9_127;
#if (sc_BlendMode_Add)
{
l9_127=clamp(dot(l9_116.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_128;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_128=clamp(dot(l9_116.xyz,vec3(1.0)),0.0,1.0)*l9_115;
}
#else
{
float l9_129;
#if (sc_BlendMode_Screen)
{
l9_129=dot(l9_116.xyz,vec3(0.33333001))*l9_115;
}
#else
{
float l9_130;
#if (sc_BlendMode_Min)
{
l9_130=1.0-clamp(dot(l9_116.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_131;
#if (sc_BlendMode_Max)
{
l9_131=clamp(dot(l9_116.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_131=1.0;
}
#endif
l9_130=l9_131;
}
#endif
l9_129=l9_130;
}
#endif
l9_128=l9_129;
}
#endif
l9_127=l9_128;
}
#endif
l9_126=l9_127;
}
#endif
l9_125=l9_126;
}
#endif
l9_124=l9_125;
}
#endif
l9_123=l9_124;
}
#endif
l9_122=l9_123;
}
#endif
l9_121=l9_122;
}
#endif
l9_120=l9_121;
}
#endif
l9_119=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_116.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_120);
}
#else
{
vec4 l9_132;
#if (sc_RenderAlphaToColor)
{
l9_132=vec4(l9_115);
}
#else
{
vec4 l9_133;
#if (sc_BlendMode_Custom)
{
vec4 l9_134;
#if (sc_FramebufferFetch)
{
l9_134=sc_readFragData0_Platform();
}
#else
{
vec2 l9_135=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
vec4 l9_136;
#if (sc_ScreenTextureLayout==2)
{
l9_136=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(l9_135,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()),0.0);
}
#else
{
l9_136=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_135,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()).xy,0.0);
}
#endif
l9_134=l9_136;
}
#endif
vec3 l9_137=mix(l9_134.xyz,definedBlend(l9_134.xyz,l9_116.xyz).xyz,vec3(l9_115));
vec4 l9_138=vec4(l9_137.x,l9_137.y,l9_137.z,vec4(0.0).w);
l9_138.w=1.0;
l9_133=l9_138;
}
#else
{
vec4 l9_139;
#if (sc_Voxelization)
{
l9_139=vec4(varScreenPos.xyz,1.0);
}
#else
{
vec4 l9_140;
#if (sc_OutputBounds)
{
float l9_141=clamp(abs(gl_FragCoord.z),0.0,1.0);
l9_140=vec4(l9_141,1.0-l9_141,1.0,1.0);
}
#else
{
vec4 l9_142;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_142=vec4(mix(vec3(1.0),l9_116.xyz,vec3(l9_115)),l9_115);
}
#else
{
vec4 l9_143;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_144;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_144=clamp(l9_115,0.0,1.0);
}
#else
{
l9_144=l9_115;
}
#endif
l9_143=vec4(l9_116.xyz*l9_144,l9_144);
}
#else
{
l9_143=l9_116;
}
#endif
l9_142=l9_143;
}
#endif
l9_140=l9_142;
}
#endif
l9_139=l9_140;
}
#endif
l9_133=l9_139;
}
#endif
l9_132=l9_133;
}
#endif
l9_119=l9_132;
}
#endif
vec4 l9_145;
if (PreviewEnabled==1)
{
vec4 l9_146;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_146=PreviewVertexColor;
}
else
{
l9_146=vec4(0.0);
}
l9_145=l9_146;
}
else
{
l9_145=l9_119;
}
vec4 l9_147=sc_OutputMotionVectorsIfNeeded(varPos,max(l9_145,vec4(0.0)));
vec4 l9_148=clamp(l9_147,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_149=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_149-0.0039215689)),min(1.0,l9_149+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
#if (sc_OITDepthPrepass)
{
sc_writeFragData0Internal(vec4(1.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#else
{
#if (sc_OITDepthGatherPass)
{
#if (sc_OITDepthGatherPass)
{
vec2 l9_150=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_150).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_151=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_150).xy);
float l9_152=packValue(l9_151);
int l9_159=int(l9_148.w*255.0);
float l9_160=packValue(l9_159);
sc_writeFragData0Internal(vec4(packValue(l9_151),packValue(l9_151),packValue(l9_151),packValue(l9_151)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_152,packValue(l9_151),packValue(l9_151),packValue(l9_151)));
sc_writeFragData2(vec4(l9_160,packValue(l9_159),packValue(l9_159),packValue(l9_159)));
#if (sc_OITMaxLayersVisualizeLayerCount)
{
sc_writeFragData2(vec4(0.0039215689,0.0,0.0,0.0));
}
#endif
}
#endif
}
#else
{
#if (sc_OITCompositingPass)
{
#if (sc_OITCompositingPass)
{
vec2 l9_163=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_163).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_164[8];
int l9_165[8];
int l9_166=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_166<8)
{
l9_164[l9_166]=0;
l9_165[l9_166]=0;
l9_166++;
continue;
}
else
{
break;
}
}
int l9_167;
#if (sc_OITMaxLayers8)
{
l9_167=2;
}
#else
{
l9_167=1;
}
#endif
int l9_168=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_168<l9_167)
{
vec4 l9_169;
vec4 l9_170;
vec4 l9_171;
if (l9_168==0)
{
l9_171=texture(sc_OITAlpha0,l9_163);
l9_170=texture(sc_OITDepthLow0,l9_163);
l9_169=texture(sc_OITDepthHigh0,l9_163);
}
else
{
l9_171=vec4(0.0);
l9_170=vec4(0.0);
l9_169=vec4(0.0);
}
vec4 l9_172;
vec4 l9_173;
vec4 l9_174;
if (l9_168==1)
{
l9_174=texture(sc_OITAlpha1,l9_163);
l9_173=texture(sc_OITDepthLow1,l9_163);
l9_172=texture(sc_OITDepthHigh1,l9_163);
}
else
{
l9_174=l9_171;
l9_173=l9_170;
l9_172=l9_169;
}
if (any(notEqual(l9_172,vec4(0.0)))||any(notEqual(l9_173,vec4(0.0))))
{
int l9_175[8]=l9_164;
unpackValues(l9_172.w,l9_168,l9_175);
unpackValues(l9_172.z,l9_168,l9_175);
unpackValues(l9_172.y,l9_168,l9_175);
unpackValues(l9_172.x,l9_168,l9_175);
unpackValues(l9_173.w,l9_168,l9_175);
unpackValues(l9_173.z,l9_168,l9_175);
unpackValues(l9_173.y,l9_168,l9_175);
unpackValues(l9_173.x,l9_168,l9_175);
int l9_184[8]=l9_165;
unpackValues(l9_174.w,l9_168,l9_184);
unpackValues(l9_174.z,l9_168,l9_184);
unpackValues(l9_174.y,l9_168,l9_184);
unpackValues(l9_174.x,l9_168,l9_184);
}
l9_168++;
continue;
}
else
{
break;
}
}
vec4 l9_189=texture(sc_OITFilteredDepthBoundsTexture,l9_163);
vec2 l9_190=l9_189.xy;
int l9_191;
#if (sc_SkinBonesCount>0)
{
l9_191=encodeDepth(((1.0-l9_189.x)*1000.0)+getDepthOrderingEpsilon(),l9_190);
}
#else
{
l9_191=0;
}
#endif
int l9_192=encodeDepth(viewSpaceDepth(),l9_190);
vec4 l9_193;
l9_193=l9_148*l9_148.w;
vec4 l9_194;
int l9_195=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_195<8)
{
int l9_196=l9_164[l9_195];
int l9_197=l9_192-l9_191;
bool l9_198=l9_196<l9_197;
bool l9_199;
if (l9_198)
{
l9_199=l9_164[l9_195]>0;
}
else
{
l9_199=l9_198;
}
if (l9_199)
{
vec3 l9_200=l9_193.xyz*(1.0-(float(l9_165[l9_195])/255.0));
l9_194=vec4(l9_200.x,l9_200.y,l9_200.z,l9_193.w);
}
else
{
l9_194=l9_193;
}
l9_193=l9_194;
l9_195++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_193,sc_UniformConstants.x,sc_ShaderCacheConstant);
#if (sc_OITMaxLayersVisualizeLayerCount)
{
discard;
}
#endif
}
#endif
}
#else
{
#if (sc_OITFrontLayerPass)
{
#if (sc_OITFrontLayerPass)
{
if (abs(gl_FragCoord.z-texture(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_148,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_147,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
