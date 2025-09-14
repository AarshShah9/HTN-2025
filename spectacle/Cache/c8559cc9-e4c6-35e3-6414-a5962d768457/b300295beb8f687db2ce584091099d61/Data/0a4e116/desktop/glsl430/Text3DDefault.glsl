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
//output uvec4 sc_RayTracingPositionAndMask 0
//output uvec4 sc_RayTracingNormalAndMore 1
//sampler sampler InnerEdgeTexSmpSC 0:27
//sampler sampler backCapTexSmpSC 0:28
//sampler sampler frontCapTexSmpSC 0:29
//sampler sampler intensityTextureSmpSC 0:30
//sampler sampler outerEdgeTexSmpSC 0:31
//sampler sampler sc_EnvmapDiffuseSmpSC 0:32
//sampler sampler sc_EnvmapSpecularSmpSC 0:33
//sampler sampler sc_OITCommonSampler 0:34
//sampler sampler sc_RayTracingGlobalIlluminationSmpSC 0:35
//sampler sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC 0:36
//sampler sampler sc_RayTracingRayDirectionSmpSC 0:37
//sampler sampler sc_RayTracingReflectionsSmpSC 0:38
//sampler sampler sc_RayTracingShadowsSmpSC 0:39
//sampler sampler sc_SSAOTextureSmpSC 0:40
//sampler sampler sc_ScreenTextureSmpSC 0:41
//sampler sampler sc_ShadowTextureSmpSC 0:42
//texture texture2D InnerEdgeTex 0:3:0:27
//texture texture2D backCapTex 0:4:0:28
//texture texture2D frontCapTex 0:5:0:29
//texture texture2D intensityTexture 0:6:0:30
//texture texture2D outerEdgeTex 0:7:0:31
//texture texture2D sc_EnvmapDiffuse 0:8:0:32
//texture texture2D sc_EnvmapSpecular 0:9:0:33
//texture texture2D sc_OITAlpha0 0:10:0:34
//texture texture2D sc_OITAlpha1 0:11:0:34
//texture texture2D sc_OITDepthHigh0 0:12:0:34
//texture texture2D sc_OITDepthHigh1 0:13:0:34
//texture texture2D sc_OITDepthLow0 0:14:0:34
//texture texture2D sc_OITDepthLow1 0:15:0:34
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:16:0:34
//texture texture2D sc_OITFrontDepthTexture 0:17:0:34
//texture texture2D sc_RayTracingGlobalIllumination 0:18:0:35
//texture utexture2D sc_RayTracingHitCasterIdAndBarycentric 0:19:0:36
//texture texture2D sc_RayTracingRayDirection 0:20:0:37
//texture texture2D sc_RayTracingReflections 0:21:0:38
//texture texture2D sc_RayTracingShadows 0:22:0:39
//texture texture2D sc_SSAOTexture 0:23:0:40
//texture texture2D sc_ScreenTexture 0:24:0:41
//texture texture2D sc_ShadowTexture 0:25:0:42
//texture texture2DArray InnerEdgeTexArrSC 0:44:0:27
//texture texture2DArray backCapTexArrSC 0:45:0:28
//texture texture2DArray frontCapTexArrSC 0:46:0:29
//texture texture2DArray intensityTextureArrSC 0:47:0:30
//texture texture2DArray outerEdgeTexArrSC 0:48:0:31
//texture texture2DArray sc_EnvmapDiffuseArrSC 0:49:0:32
//texture texture2DArray sc_EnvmapSpecularArrSC 0:50:0:33
//texture texture2DArray sc_RayTracingGlobalIlluminationArrSC 0:51:0:35
//texture texture2DArray sc_RayTracingReflectionsArrSC 0:53:0:38
//texture texture2DArray sc_RayTracingShadowsArrSC 0:54:0:39
//texture texture2DArray sc_ScreenTextureArrSC 0:55:0:41
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
//spec_const bool InnerEdgeTexHasSwappedViews 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_InnerEdgeTex 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_backCapTex 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_frontCapTex 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_outerEdgeTex 36 0
//spec_const bool SC_USE_UV_MIN_MAX_InnerEdgeTex 37 0
//spec_const bool SC_USE_UV_MIN_MAX_backCapTex 38 0
//spec_const bool SC_USE_UV_MIN_MAX_frontCapTex 39 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 40 0
//spec_const bool SC_USE_UV_MIN_MAX_outerEdgeTex 41 0
//spec_const bool SC_USE_UV_TRANSFORM_InnerEdgeTex 42 0
//spec_const bool SC_USE_UV_TRANSFORM_backCapTex 43 0
//spec_const bool SC_USE_UV_TRANSFORM_frontCapTex 44 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 45 0
//spec_const bool SC_USE_UV_TRANSFORM_outerEdgeTex 46 0
//spec_const bool UseViewSpaceDepthVariant 47 1
//spec_const bool backCapPBR 48 0
//spec_const bool backCapTexHasSwappedViews 49 0
//spec_const bool frontCapPBR 50 0
//spec_const bool frontCapTexHasSwappedViews 51 0
//spec_const bool innerEdgePBR 52 0
//spec_const bool intensityTextureHasSwappedViews 53 0
//spec_const bool outerEdgePBR 54 0
//spec_const bool outerEdgeTexHasSwappedViews 55 0
//spec_const bool sc_BlendMode_Add 56 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 57 0
//spec_const bool sc_BlendMode_AlphaTest 58 0
//spec_const bool sc_BlendMode_AlphaToCoverage 59 0
//spec_const bool sc_BlendMode_ColoredGlass 60 0
//spec_const bool sc_BlendMode_Custom 61 0
//spec_const bool sc_BlendMode_Max 62 0
//spec_const bool sc_BlendMode_Min 63 0
//spec_const bool sc_BlendMode_Multiply 64 0
//spec_const bool sc_BlendMode_MultiplyOriginal 65 0
//spec_const bool sc_BlendMode_Normal 66 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 67 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 68 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 69 0
//spec_const bool sc_BlendMode_Screen 70 0
//spec_const bool sc_DepthOnly 71 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 72 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 73 0
//spec_const bool sc_FramebufferFetch 74 0
//spec_const bool sc_HasDiffuseEnvmap 75 0
//spec_const bool sc_IsEditor 76 0
//spec_const bool sc_LightEstimation 77 0
//spec_const bool sc_MotionVectorsPass 78 0
//spec_const bool sc_OITCompositingPass 79 0
//spec_const bool sc_OITDepthBoundsPass 80 0
//spec_const bool sc_OITDepthGatherPass 81 0
//spec_const bool sc_OITDepthPrepass 82 0
//spec_const bool sc_OITFrontLayerPass 83 0
//spec_const bool sc_OITMaxLayers4Plus1 84 0
//spec_const bool sc_OITMaxLayers8 85 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 86 0
//spec_const bool sc_OutputBounds 87 0
//spec_const bool sc_ProjectiveShadowsCaster 88 0
//spec_const bool sc_ProjectiveShadowsReceiver 89 0
//spec_const bool sc_RayTracingCasterForceOpaque 90 0
//spec_const bool sc_RayTracingGlobalIlluminationHasSwappedViews 91 0
//spec_const bool sc_RayTracingReflectionsHasSwappedViews 92 0
//spec_const bool sc_RayTracingShadowsHasSwappedViews 93 0
//spec_const bool sc_RenderAlphaToColor 94 0
//spec_const bool sc_SSAOEnabled 95 0
//spec_const bool sc_ScreenTextureHasSwappedViews 96 0
//spec_const bool sc_TAAEnabled 97 0
//spec_const bool sc_VertexBlending 98 0
//spec_const bool sc_VertexBlendingUseNormals 99 0
//spec_const bool sc_Voxelization 100 0
//spec_const int DROPLIST_BACK_CAP_MODE 101 0
//spec_const int DROPLIST_FRONT_CAP_MODE 102 0
//spec_const int DROPLIST_INNER_EDGE_MODE 103 0
//spec_const int DROPLIST_OUTER_EDGE_MODE 104 0
//spec_const int InnerEdgeTexLayout 105 0
//spec_const int SC_DEVICE_CLASS 106 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex 107 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_backCapTex 108 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_frontCapTex 109 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 110 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex 111 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex 112 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_backCapTex 113 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_frontCapTex 114 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 115 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex 116 -1
//spec_const int backCapTexLayout 117 0
//spec_const int frontCapTexLayout 118 0
//spec_const int intensityTextureLayout 119 0
//spec_const int outerEdgeTexLayout 120 0
//spec_const int sc_AmbientLightMode0 121 0
//spec_const int sc_AmbientLightMode1 122 0
//spec_const int sc_AmbientLightMode2 123 0
//spec_const int sc_AmbientLightMode_Constant 124 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 125 0
//spec_const int sc_AmbientLightMode_FromCamera 126 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 127 0
//spec_const int sc_AmbientLightsCount 128 0
//spec_const int sc_DepthBufferMode 129 0
//spec_const int sc_DirectionalLightsCount 130 0
//spec_const int sc_EnvLightMode 131 0
//spec_const int sc_EnvmapDiffuseLayout 132 0
//spec_const int sc_EnvmapSpecularLayout 133 0
//spec_const int sc_LightEstimationSGCount 134 0
//spec_const int sc_PointLightsCount 135 0
//spec_const int sc_RayTracingGlobalIlluminationLayout 136 0
//spec_const int sc_RayTracingReflectionsLayout 137 0
//spec_const int sc_RayTracingShadowsLayout 138 0
//spec_const int sc_RenderingSpace 139 -1
//spec_const int sc_ScreenTextureLayout 140 0
//spec_const int sc_ShaderCacheConstant 141 0
//spec_const int sc_SkinBonesCount 142 0
//spec_const int sc_StereoRenderingMode 143 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 144 0
//spec_const int sc_StereoViewID 145 0
//SG_REFLECTION_END
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
#if SC_RT_RECEIVER_MODE
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec3 BumpedNormal;
vec3 ViewDirWS;
vec3 PositionWS;
vec3 VertexNormal_WorldSpace;
vec2 Surface_UVCoord0;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 0
#elif sc_BlendMode_AlphaTest==1
#undef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef backCapTexHasSwappedViews
#define backCapTexHasSwappedViews 0
#elif backCapTexHasSwappedViews==1
#undef backCapTexHasSwappedViews
#define backCapTexHasSwappedViews 1
#endif
#ifndef backCapTexLayout
#define backCapTexLayout 0
#endif
#ifndef frontCapTexHasSwappedViews
#define frontCapTexHasSwappedViews 0
#elif frontCapTexHasSwappedViews==1
#undef frontCapTexHasSwappedViews
#define frontCapTexHasSwappedViews 1
#endif
#ifndef frontCapTexLayout
#define frontCapTexLayout 0
#endif
#ifndef outerEdgeTexHasSwappedViews
#define outerEdgeTexHasSwappedViews 0
#elif outerEdgeTexHasSwappedViews==1
#undef outerEdgeTexHasSwappedViews
#define outerEdgeTexHasSwappedViews 1
#endif
#ifndef outerEdgeTexLayout
#define outerEdgeTexLayout 0
#endif
#ifndef InnerEdgeTexHasSwappedViews
#define InnerEdgeTexHasSwappedViews 0
#elif InnerEdgeTexHasSwappedViews==1
#undef InnerEdgeTexHasSwappedViews
#define InnerEdgeTexHasSwappedViews 1
#endif
#ifndef InnerEdgeTexLayout
#define InnerEdgeTexLayout 0
#endif
#ifndef backCapPBR
#define backCapPBR 0
#elif backCapPBR==1
#undef backCapPBR
#define backCapPBR 1
#endif
#ifndef DROPLIST_BACK_CAP_MODE
#define DROPLIST_BACK_CAP_MODE 0
#endif
#ifndef SC_USE_UV_TRANSFORM_backCapTex
#define SC_USE_UV_TRANSFORM_backCapTex 0
#elif SC_USE_UV_TRANSFORM_backCapTex==1
#undef SC_USE_UV_TRANSFORM_backCapTex
#define SC_USE_UV_TRANSFORM_backCapTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_backCapTex
#define SC_SOFTWARE_WRAP_MODE_U_backCapTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_backCapTex
#define SC_SOFTWARE_WRAP_MODE_V_backCapTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_backCapTex
#define SC_USE_UV_MIN_MAX_backCapTex 0
#elif SC_USE_UV_MIN_MAX_backCapTex==1
#undef SC_USE_UV_MIN_MAX_backCapTex
#define SC_USE_UV_MIN_MAX_backCapTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_backCapTex
#define SC_USE_CLAMP_TO_BORDER_backCapTex 0
#elif SC_USE_CLAMP_TO_BORDER_backCapTex==1
#undef SC_USE_CLAMP_TO_BORDER_backCapTex
#define SC_USE_CLAMP_TO_BORDER_backCapTex 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
#endif
#ifndef frontCapPBR
#define frontCapPBR 0
#elif frontCapPBR==1
#undef frontCapPBR
#define frontCapPBR 1
#endif
#ifndef DROPLIST_FRONT_CAP_MODE
#define DROPLIST_FRONT_CAP_MODE 0
#endif
#ifndef SC_USE_UV_TRANSFORM_frontCapTex
#define SC_USE_UV_TRANSFORM_frontCapTex 0
#elif SC_USE_UV_TRANSFORM_frontCapTex==1
#undef SC_USE_UV_TRANSFORM_frontCapTex
#define SC_USE_UV_TRANSFORM_frontCapTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_frontCapTex
#define SC_SOFTWARE_WRAP_MODE_U_frontCapTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_frontCapTex
#define SC_SOFTWARE_WRAP_MODE_V_frontCapTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_frontCapTex
#define SC_USE_UV_MIN_MAX_frontCapTex 0
#elif SC_USE_UV_MIN_MAX_frontCapTex==1
#undef SC_USE_UV_MIN_MAX_frontCapTex
#define SC_USE_UV_MIN_MAX_frontCapTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_frontCapTex
#define SC_USE_CLAMP_TO_BORDER_frontCapTex 0
#elif SC_USE_CLAMP_TO_BORDER_frontCapTex==1
#undef SC_USE_CLAMP_TO_BORDER_frontCapTex
#define SC_USE_CLAMP_TO_BORDER_frontCapTex 1
#endif
#ifndef outerEdgePBR
#define outerEdgePBR 0
#elif outerEdgePBR==1
#undef outerEdgePBR
#define outerEdgePBR 1
#endif
#ifndef DROPLIST_OUTER_EDGE_MODE
#define DROPLIST_OUTER_EDGE_MODE 0
#endif
#ifndef SC_USE_UV_TRANSFORM_outerEdgeTex
#define SC_USE_UV_TRANSFORM_outerEdgeTex 0
#elif SC_USE_UV_TRANSFORM_outerEdgeTex==1
#undef SC_USE_UV_TRANSFORM_outerEdgeTex
#define SC_USE_UV_TRANSFORM_outerEdgeTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex
#define SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex
#define SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_outerEdgeTex
#define SC_USE_UV_MIN_MAX_outerEdgeTex 0
#elif SC_USE_UV_MIN_MAX_outerEdgeTex==1
#undef SC_USE_UV_MIN_MAX_outerEdgeTex
#define SC_USE_UV_MIN_MAX_outerEdgeTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_outerEdgeTex
#define SC_USE_CLAMP_TO_BORDER_outerEdgeTex 0
#elif SC_USE_CLAMP_TO_BORDER_outerEdgeTex==1
#undef SC_USE_CLAMP_TO_BORDER_outerEdgeTex
#define SC_USE_CLAMP_TO_BORDER_outerEdgeTex 1
#endif
#ifndef innerEdgePBR
#define innerEdgePBR 0
#elif innerEdgePBR==1
#undef innerEdgePBR
#define innerEdgePBR 1
#endif
#ifndef DROPLIST_INNER_EDGE_MODE
#define DROPLIST_INNER_EDGE_MODE 0
#endif
#ifndef SC_USE_UV_TRANSFORM_InnerEdgeTex
#define SC_USE_UV_TRANSFORM_InnerEdgeTex 0
#elif SC_USE_UV_TRANSFORM_InnerEdgeTex==1
#undef SC_USE_UV_TRANSFORM_InnerEdgeTex
#define SC_USE_UV_TRANSFORM_InnerEdgeTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex
#define SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex
#define SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_InnerEdgeTex
#define SC_USE_UV_MIN_MAX_InnerEdgeTex 0
#elif SC_USE_UV_MIN_MAX_InnerEdgeTex==1
#undef SC_USE_UV_MIN_MAX_InnerEdgeTex
#define SC_USE_UV_MIN_MAX_InnerEdgeTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_InnerEdgeTex
#define SC_USE_CLAMP_TO_BORDER_InnerEdgeTex 0
#elif SC_USE_CLAMP_TO_BORDER_InnerEdgeTex==1
#undef SC_USE_CLAMP_TO_BORDER_InnerEdgeTex
#define SC_USE_CLAMP_TO_BORDER_InnerEdgeTex 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
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
uniform sc_Camera_t sc_Camera;
uniform vec3 sc_RayTracingOriginOffset;
uniform vec3 sc_RayTracingOriginScale;
uniform uint sc_RayTracingReceiverMask;
uniform uint sc_RayTracingReceiverId;
uniform float alphaTestThreshold;
uniform vec2 backCapTexScale;
uniform vec2 backCapTexOffset;
uniform vec4 backCapStartingColor;
uniform vec4 backCapEndingColor;
uniform float backCapGradientRamp;
uniform mat3 backCapTexTransform;
uniform vec4 backCapTexUvMinMax;
uniform vec4 backCapTexBorderColor;
uniform float Port_RangeMinA_N132;
uniform float Port_RangeMaxA_N132;
uniform float Port_RangeMaxB_N132;
uniform float Port_RangeMinB_N132;
uniform vec2 Port_Import_N133;
uniform vec2 Port_Center_N134;
uniform vec2 Port_Import_N135;
uniform float Port_RangeMinA_N164;
uniform float Port_RangeMaxA_N164;
uniform float Port_RangeMaxB_N164;
uniform float Port_RangeMinB_N164;
uniform float Port_Input1_N142;
uniform float Port_Input2_N142;
uniform float Port_Input0_N143;
uniform float Port_Input1_N143;
uniform float backCapRoughness;
uniform vec4 Port_Default_N146;
uniform float Port_Opacity_N149;
uniform vec2 frontCapTexScale;
uniform vec2 frontCapTexOffset;
uniform vec4 frontCapStartingColor;
uniform vec4 frontCapEndingColor;
uniform float frontCapGradientRamp;
uniform mat3 frontCapTexTransform;
uniform vec4 frontCapTexUvMinMax;
uniform vec4 frontCapTexBorderColor;
uniform float Port_RangeMinA_N101;
uniform float Port_RangeMaxA_N101;
uniform float Port_RangeMaxB_N101;
uniform float Port_RangeMinB_N101;
uniform vec2 Port_Import_N102;
uniform vec2 Port_Center_N103;
uniform vec2 Port_Import_N104;
uniform float Port_RangeMinA_N160;
uniform float Port_RangeMaxA_N160;
uniform float Port_RangeMaxB_N160;
uniform float Port_RangeMinB_N160;
uniform float Port_Input1_N111;
uniform float Port_Input2_N111;
uniform float Port_Input0_N112;
uniform float Port_Input1_N112;
uniform float frontCapRoughness;
uniform vec4 Port_Default_N010;
uniform float Port_Opacity_N118;
uniform vec2 outerEdgeTexScale;
uniform vec2 outerEdgeTexOffset;
uniform vec4 outerEdgeStartingColor;
uniform vec4 outerEdgeEndingColor;
uniform float outerEdgeGradientRamp;
uniform mat3 outerEdgeTexTransform;
uniform vec4 outerEdgeTexUvMinMax;
uniform vec4 outerEdgeTexBorderColor;
uniform float Port_RangeMinA_N033;
uniform float Port_RangeMaxA_N033;
uniform float Port_RangeMaxB_N033;
uniform float Port_RangeMinB_N033;
uniform vec2 Port_Import_N017;
uniform vec2 Port_Center_N047;
uniform vec2 Port_Import_N058;
uniform float Port_RangeMinA_N153;
uniform float Port_RangeMaxA_N153;
uniform float Port_RangeMaxB_N153;
uniform float Port_RangeMinB_N153;
uniform float Port_Input1_N065;
uniform float Port_Input2_N065;
uniform float Port_Input0_N066;
uniform float Port_Input1_N066;
uniform float outerRoughness;
uniform vec4 Port_Default_N046;
uniform float Port_Opacity_N057;
uniform vec2 InnerEdgeTexScale;
uniform vec2 InnerEdgeTexOffset;
uniform vec4 InnerEdgeStartingColor;
uniform vec4 InnerEdgeEndingColor;
uniform float InnerEdgeGradientRamp;
uniform mat3 InnerEdgeTexTransform;
uniform vec4 InnerEdgeTexUvMinMax;
uniform vec4 InnerEdgeTexBorderColor;
uniform float Port_RangeMinA_N023;
uniform float Port_RangeMaxA_N023;
uniform float Port_RangeMaxB_N023;
uniform float Port_RangeMinB_N023;
uniform vec2 Port_Import_N024;
uniform vec2 Port_Center_N025;
uniform vec2 Port_Import_N026;
uniform float Port_RangeMinA_N155;
uniform float Port_RangeMaxA_N155;
uniform float Port_RangeMaxB_N155;
uniform float Port_RangeMinB_N155;
uniform float Port_Input1_N034;
uniform float Port_Input2_N034;
uniform float Port_Input0_N035;
uniform float Port_Input1_N035;
uniform float InnerEdgeRoughness;
uniform vec4 Port_Default_N077;
uniform float Port_Opacity_N080;
uniform vec4 sc_Time;
uniform sampler2DArray backCapTexArrSC;
uniform sampler2D backCapTex;
uniform sampler2DArray frontCapTexArrSC;
uniform sampler2D frontCapTex;
uniform sampler2DArray outerEdgeTexArrSC;
uniform sampler2D outerEdgeTex;
uniform sampler2DArray InnerEdgeTexArrSC;
uniform sampler2D InnerEdgeTex;
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
in vec4 varScreenPos;
layout(location=0) out uvec4 sc_RayTracingPositionAndMask;
layout(location=1) out uvec4 sc_RayTracingNormalAndMore;
in vec3 varPos;
in vec3 varNormal;
in vec4 varPackedTex;
in vec4 varTangent;
in vec2 varScreenTexturePos;
in float varViewSpaceDepth;
in vec4 varColor;
in vec4 PreviewVertexColor;
in float PreviewVertexSaved;
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
int backCapTexGetStereoViewIndex()
{
int l9_0;
#if (backCapTexHasSwappedViews)
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
void Node146_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (DROPLIST_BACK_CAP_MODE==0)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*backCapTexScale)+backCapTexOffset;
vec4 l9_2;
#if (backCapTexLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_backCapTex)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_backCapTex)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,backCapTexUvMinMax.x,backCapTexUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,backCapTexUvMinMax.y,backCapTexUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_backCapTex)!=0),backCapTexTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),backCapTexLayout,backCapTexGetStereoViewIndex());
vec4 l9_25=texture(backCapTexArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_26=mix(backCapTexBorderColor,l9_25,vec4(l9_23));
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
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_backCapTex)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_backCapTex)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,backCapTexUvMinMax.x,backCapTexUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,backCapTexUvMinMax.y,backCapTexUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_backCapTex)!=0),backCapTexTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),backCapTexLayout,backCapTexGetStereoViewIndex());
vec4 l9_49=texture(backCapTex,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_50=mix(backCapTexBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value0=l9_2;
Result=Value0;
}
#else
{
#if (DROPLIST_BACK_CAP_MODE==1)
{
vec2 l9_51=vec2(0.0,(((backCapGradientRamp-Port_RangeMinA_N164)/((Port_RangeMaxA_N164-Port_RangeMinA_N164)+1e-06))*(Port_RangeMaxB_N164-Port_RangeMinB_N164))+Port_RangeMinB_N164)-Port_Import_N135;
Value1=mix(backCapStartingColor,backCapEndingColor,vec4(smoothstep(Port_Input0_N143,Port_Input1_N143,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N132))/vec2((Port_RangeMaxA_N132-Port_RangeMinA_N132)+1e-06))*(Port_RangeMaxB_N132-Port_RangeMinB_N132))+vec2(Port_RangeMinB_N132))-Port_Center_N134)*Port_Import_N133)+Port_Center_N134)-Port_Import_N135,l9_51)/(dot(l9_51,l9_51)+1.234e-06))+0.001,Port_Input1_N142+0.001,Port_Input2_N142+0.001)-0.001)));
Result=Value1;
}
#else
{
#if (DROPLIST_BACK_CAP_MODE==2)
{
Value2=backCapStartingColor;
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
void ngsAlphaTest(float opacity)
{
#if (sc_BlendMode_AlphaTest)
{
if (opacity<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (opacity<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
}
uvec2 sc_RayTracingEncodeDirection(vec3 d)
{
d/=vec3(dot(abs(d),vec3(1.0)));
vec2 l9_0=vec2(clamp(-d.z,0.0,1.0));
uint l9_1=packHalf2x16(d.xy+mix(-l9_0,l9_0,step(vec2(0.0),d.xy)));
return uvec2(l9_1&65535u,l9_1>>16u);
}
void sc_WriteReceiverDataEx(vec3 positionWS,vec3 normalWS,float roughness,uint u16Reserved)
{
uvec3 l9_0=uvec3(round((positionWS-sc_RayTracingOriginOffset)*sc_RayTracingOriginScale));
sc_RayTracingPositionAndMask=uvec4(l9_0.x,l9_0.y,l9_0.z,sc_RayTracingPositionAndMask.w);
sc_RayTracingPositionAndMask.w=sc_RayTracingReceiverMask;
uvec2 l9_1=sc_RayTracingEncodeDirection(normalWS);
sc_RayTracingNormalAndMore=uvec4(l9_1.x,l9_1.y,sc_RayTracingNormalAndMore.z,sc_RayTracingNormalAndMore.w);
sc_RayTracingNormalAndMore.z=u16Reserved;
sc_RayTracingNormalAndMore.w=uint(clamp(roughness,0.0,1.0)*1000.0)|((sc_RayTracingReceiverId%32u)<<10u);
}
int frontCapTexGetStereoViewIndex()
{
int l9_0;
#if (frontCapTexHasSwappedViews)
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
void Node10_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (DROPLIST_FRONT_CAP_MODE==0)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*frontCapTexScale)+frontCapTexOffset;
vec4 l9_2;
#if (frontCapTexLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_frontCapTex)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_frontCapTex)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,frontCapTexUvMinMax.x,frontCapTexUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,frontCapTexUvMinMax.y,frontCapTexUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_frontCapTex)!=0),frontCapTexTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),frontCapTexLayout,frontCapTexGetStereoViewIndex());
vec4 l9_25=texture(frontCapTexArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_26=mix(frontCapTexBorderColor,l9_25,vec4(l9_23));
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
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_frontCapTex)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_frontCapTex)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,frontCapTexUvMinMax.x,frontCapTexUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,frontCapTexUvMinMax.y,frontCapTexUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_frontCapTex)!=0),frontCapTexTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),frontCapTexLayout,frontCapTexGetStereoViewIndex());
vec4 l9_49=texture(frontCapTex,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_50=mix(frontCapTexBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value0=l9_2;
Result=Value0;
}
#else
{
#if (DROPLIST_FRONT_CAP_MODE==1)
{
vec2 l9_51=vec2(0.0,(((frontCapGradientRamp-Port_RangeMinA_N160)/((Port_RangeMaxA_N160-Port_RangeMinA_N160)+1e-06))*(Port_RangeMaxB_N160-Port_RangeMinB_N160))+Port_RangeMinB_N160)-Port_Import_N104;
Value1=mix(frontCapStartingColor,frontCapEndingColor,vec4(smoothstep(Port_Input0_N112,Port_Input1_N112,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N101))/vec2((Port_RangeMaxA_N101-Port_RangeMinA_N101)+1e-06))*(Port_RangeMaxB_N101-Port_RangeMinB_N101))+vec2(Port_RangeMinB_N101))-Port_Center_N103)*Port_Import_N102)+Port_Center_N103)-Port_Import_N104,l9_51)/(dot(l9_51,l9_51)+1.234e-06))+0.001,Port_Input1_N111+0.001,Port_Input2_N111+0.001)-0.001)));
Result=Value1;
}
#else
{
#if (DROPLIST_FRONT_CAP_MODE==2)
{
Value2=frontCapStartingColor;
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
int outerEdgeTexGetStereoViewIndex()
{
int l9_0;
#if (outerEdgeTexHasSwappedViews)
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
void Node46_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (DROPLIST_OUTER_EDGE_MODE==0)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*outerEdgeTexScale)+outerEdgeTexOffset;
vec4 l9_2;
#if (outerEdgeTexLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_outerEdgeTex)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_outerEdgeTex)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,outerEdgeTexUvMinMax.x,outerEdgeTexUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,outerEdgeTexUvMinMax.y,outerEdgeTexUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_outerEdgeTex)!=0),outerEdgeTexTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),outerEdgeTexLayout,outerEdgeTexGetStereoViewIndex());
vec4 l9_25=texture(outerEdgeTexArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_26=mix(outerEdgeTexBorderColor,l9_25,vec4(l9_23));
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
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_outerEdgeTex)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_outerEdgeTex)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,outerEdgeTexUvMinMax.x,outerEdgeTexUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,outerEdgeTexUvMinMax.y,outerEdgeTexUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_outerEdgeTex)!=0),outerEdgeTexTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),outerEdgeTexLayout,outerEdgeTexGetStereoViewIndex());
vec4 l9_49=texture(outerEdgeTex,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_50=mix(outerEdgeTexBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value0=l9_2;
Result=Value0;
}
#else
{
#if (DROPLIST_OUTER_EDGE_MODE==1)
{
vec2 l9_51=vec2(0.0,(((outerEdgeGradientRamp-Port_RangeMinA_N153)/((Port_RangeMaxA_N153-Port_RangeMinA_N153)+1e-06))*(Port_RangeMaxB_N153-Port_RangeMinB_N153))+Port_RangeMinB_N153)-Port_Import_N058;
Value1=mix(outerEdgeStartingColor,outerEdgeEndingColor,vec4(smoothstep(Port_Input0_N066,Port_Input1_N066,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N033))/vec2((Port_RangeMaxA_N033-Port_RangeMinA_N033)+1e-06))*(Port_RangeMaxB_N033-Port_RangeMinB_N033))+vec2(Port_RangeMinB_N033))-Port_Center_N047)*Port_Import_N017)+Port_Center_N047)-Port_Import_N058,l9_51)/(dot(l9_51,l9_51)+1.234e-06))+0.001,Port_Input1_N065+0.001,Port_Input2_N065+0.001)-0.001)));
Result=Value1;
}
#else
{
#if (DROPLIST_OUTER_EDGE_MODE==2)
{
Value2=outerEdgeStartingColor;
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
int InnerEdgeTexGetStereoViewIndex()
{
int l9_0;
#if (InnerEdgeTexHasSwappedViews)
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
void Node77_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (DROPLIST_INNER_EDGE_MODE==0)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*InnerEdgeTexScale)+InnerEdgeTexOffset;
vec4 l9_2;
#if (InnerEdgeTexLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_InnerEdgeTex)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_InnerEdgeTex)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,InnerEdgeTexUvMinMax.x,InnerEdgeTexUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,InnerEdgeTexUvMinMax.y,InnerEdgeTexUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_InnerEdgeTex)!=0),InnerEdgeTexTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),InnerEdgeTexLayout,InnerEdgeTexGetStereoViewIndex());
vec4 l9_25=texture(InnerEdgeTexArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_26=mix(InnerEdgeTexBorderColor,l9_25,vec4(l9_23));
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
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_InnerEdgeTex)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_InnerEdgeTex)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,InnerEdgeTexUvMinMax.x,InnerEdgeTexUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,InnerEdgeTexUvMinMax.y,InnerEdgeTexUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_InnerEdgeTex)!=0),InnerEdgeTexTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),InnerEdgeTexLayout,InnerEdgeTexGetStereoViewIndex());
vec4 l9_49=texture(InnerEdgeTex,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_50=mix(InnerEdgeTexBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value0=l9_2;
Result=Value0;
}
#else
{
#if (DROPLIST_INNER_EDGE_MODE==1)
{
vec2 l9_51=vec2(0.0,(((InnerEdgeGradientRamp-Port_RangeMinA_N155)/((Port_RangeMaxA_N155-Port_RangeMinA_N155)+1e-06))*(Port_RangeMaxB_N155-Port_RangeMinB_N155))+Port_RangeMinB_N155)-Port_Import_N026;
Value1=mix(InnerEdgeStartingColor,InnerEdgeEndingColor,vec4(smoothstep(Port_Input0_N035,Port_Input1_N035,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N023))/vec2((Port_RangeMaxA_N023-Port_RangeMinA_N023)+1e-06))*(Port_RangeMaxB_N023-Port_RangeMinB_N023))+vec2(Port_RangeMinB_N023))-Port_Center_N025)*Port_Import_N024)+Port_Center_N025)-Port_Import_N026,l9_51)/(dot(l9_51,l9_51)+1.234e-06))+0.001,Port_Input1_N034+0.001,Port_Input2_N034+0.001)-0.001)));
Result=Value1;
}
#else
{
#if (DROPLIST_INNER_EDGE_MODE==2)
{
Value2=InnerEdgeStartingColor;
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
void main()
{
#if (sc_DepthOnly)
{
return;
}
#endif
vec3 l9_0=normalize(varNormal);
ssGlobals l9_1=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec3(0.0),normalize(sc_Camera.position-varPos),varPos,l9_0,varPackedTex.xy);
#if (backCapPBR)
{
vec4 l9_2;
Node146_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N146,l9_2,l9_1);
vec3 l9_3;
#if (!sc_ProjectiveShadowsCaster)
{
l9_3=l9_0;
}
#else
{
l9_3=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N149);
sc_WriteReceiverDataEx(varPos,l9_3,backCapRoughness,0u);
}
#else
{
vec4 l9_4;
Node146_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N146,l9_4,l9_1);
}
#endif
#if (frontCapPBR)
{
vec4 l9_5;
Node10_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N010,l9_5,l9_1);
vec3 l9_6;
#if (!sc_ProjectiveShadowsCaster)
{
l9_6=l9_0;
}
#else
{
l9_6=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N118);
sc_WriteReceiverDataEx(varPos,l9_6,frontCapRoughness,0u);
}
#else
{
vec4 l9_7;
Node10_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N010,l9_7,l9_1);
}
#endif
#if (outerEdgePBR)
{
vec4 l9_8;
Node46_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N046,l9_8,l9_1);
vec3 l9_9;
#if (!sc_ProjectiveShadowsCaster)
{
l9_9=l9_0;
}
#else
{
l9_9=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N057);
sc_WriteReceiverDataEx(varPos,l9_9,outerRoughness,0u);
}
#else
{
vec4 l9_10;
Node46_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N046,l9_10,l9_1);
}
#endif
#if (innerEdgePBR)
{
vec4 l9_11;
Node77_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N077,l9_11,l9_1);
vec3 l9_12;
#if (!sc_ProjectiveShadowsCaster)
{
l9_12=l9_0;
}
#else
{
l9_12=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N080);
sc_WriteReceiverDataEx(varPos,l9_12,InnerEdgeRoughness,0u);
}
#else
{
vec4 l9_13;
Node77_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N077,l9_13,l9_1);
}
#endif
}
#else // #if SC_RT_RECEIVER_MODE
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
struct SurfaceProperties
{
vec3 albedo;
float opacity;
vec3 normal;
vec3 positionWS;
vec3 viewDirWS;
float metallic;
float roughness;
vec3 emissive;
vec3 ao;
vec3 specularAo;
vec3 bakedShadows;
vec3 specColor;
};
struct LightingComponents
{
vec3 directDiffuse;
vec3 directSpecular;
vec3 indirectDiffuse;
vec3 indirectSpecular;
vec3 emitted;
vec3 transmitted;
};
struct LightProperties
{
vec3 direction;
vec3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec3 BumpedNormal;
vec3 ViewDirWS;
vec3 PositionWS;
vec3 VertexNormal_WorldSpace;
vec2 Surface_UVCoord0;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 0
#elif sc_EnvmapDiffuseHasSwappedViews==1
#undef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 1
#endif
#ifndef sc_EnvmapDiffuseLayout
#define sc_EnvmapDiffuseLayout 0
#endif
#ifndef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 0
#elif sc_EnvmapSpecularHasSwappedViews==1
#undef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 1
#endif
#ifndef sc_EnvmapSpecularLayout
#define sc_EnvmapSpecularLayout 0
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
#ifndef sc_RayTracingReflectionsHasSwappedViews
#define sc_RayTracingReflectionsHasSwappedViews 0
#elif sc_RayTracingReflectionsHasSwappedViews==1
#undef sc_RayTracingReflectionsHasSwappedViews
#define sc_RayTracingReflectionsHasSwappedViews 1
#endif
#ifndef sc_RayTracingReflectionsLayout
#define sc_RayTracingReflectionsLayout 0
#endif
#ifndef sc_RayTracingGlobalIlluminationHasSwappedViews
#define sc_RayTracingGlobalIlluminationHasSwappedViews 0
#elif sc_RayTracingGlobalIlluminationHasSwappedViews==1
#undef sc_RayTracingGlobalIlluminationHasSwappedViews
#define sc_RayTracingGlobalIlluminationHasSwappedViews 1
#endif
#ifndef sc_RayTracingGlobalIlluminationLayout
#define sc_RayTracingGlobalIlluminationLayout 0
#endif
#ifndef sc_RayTracingShadowsHasSwappedViews
#define sc_RayTracingShadowsHasSwappedViews 0
#elif sc_RayTracingShadowsHasSwappedViews==1
#undef sc_RayTracingShadowsHasSwappedViews
#define sc_RayTracingShadowsHasSwappedViews 1
#endif
#ifndef sc_RayTracingShadowsLayout
#define sc_RayTracingShadowsLayout 0
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
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
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
#ifndef sc_SSAOEnabled
#define sc_SSAOEnabled 0
#elif sc_SSAOEnabled==1
#undef sc_SSAOEnabled
#define sc_SSAOEnabled 1
#endif
#ifndef sc_RayTracingCasterForceOpaque
#define sc_RayTracingCasterForceOpaque 0
#elif sc_RayTracingCasterForceOpaque==1
#undef sc_RayTracingCasterForceOpaque
#define sc_RayTracingCasterForceOpaque 1
#endif
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
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
#ifndef backCapTexHasSwappedViews
#define backCapTexHasSwappedViews 0
#elif backCapTexHasSwappedViews==1
#undef backCapTexHasSwappedViews
#define backCapTexHasSwappedViews 1
#endif
#ifndef backCapTexLayout
#define backCapTexLayout 0
#endif
#ifndef frontCapTexHasSwappedViews
#define frontCapTexHasSwappedViews 0
#elif frontCapTexHasSwappedViews==1
#undef frontCapTexHasSwappedViews
#define frontCapTexHasSwappedViews 1
#endif
#ifndef frontCapTexLayout
#define frontCapTexLayout 0
#endif
#ifndef outerEdgeTexHasSwappedViews
#define outerEdgeTexHasSwappedViews 0
#elif outerEdgeTexHasSwappedViews==1
#undef outerEdgeTexHasSwappedViews
#define outerEdgeTexHasSwappedViews 1
#endif
#ifndef outerEdgeTexLayout
#define outerEdgeTexLayout 0
#endif
#ifndef InnerEdgeTexHasSwappedViews
#define InnerEdgeTexHasSwappedViews 0
#elif InnerEdgeTexHasSwappedViews==1
#undef InnerEdgeTexHasSwappedViews
#define InnerEdgeTexHasSwappedViews 1
#endif
#ifndef InnerEdgeTexLayout
#define InnerEdgeTexLayout 0
#endif
#ifndef sc_EnvLightMode
#define sc_EnvLightMode 0
#endif
#ifndef sc_AmbientLightMode_EnvironmentMap
#define sc_AmbientLightMode_EnvironmentMap 0
#endif
#ifndef sc_AmbientLightMode_FromCamera
#define sc_AmbientLightMode_FromCamera 0
#endif
#ifndef sc_LightEstimation
#define sc_LightEstimation 0
#elif sc_LightEstimation==1
#undef sc_LightEstimation
#define sc_LightEstimation 1
#endif
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
#ifndef sc_LightEstimationSGCount
#define sc_LightEstimationSGCount 0
#endif
#ifndef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 0
#elif sc_HasDiffuseEnvmap==1
#undef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 1
#endif
#ifndef sc_AmbientLightMode_SphericalHarmonics
#define sc_AmbientLightMode_SphericalHarmonics 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
#endif
#ifndef sc_AmbientLightMode0
#define sc_AmbientLightMode0 0
#endif
#ifndef sc_AmbientLightMode_Constant
#define sc_AmbientLightMode_Constant 0
#endif
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
#ifndef sc_AmbientLightMode1
#define sc_AmbientLightMode1 0
#endif
#ifndef sc_AmbientLightMode2
#define sc_AmbientLightMode2 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
struct sc_PointLight_t
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
vec3 direction;
vec3 position;
vec4 color;
};
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef backCapPBR
#define backCapPBR 0
#elif backCapPBR==1
#undef backCapPBR
#define backCapPBR 1
#endif
#ifndef DROPLIST_BACK_CAP_MODE
#define DROPLIST_BACK_CAP_MODE 0
#endif
#ifndef SC_USE_UV_TRANSFORM_backCapTex
#define SC_USE_UV_TRANSFORM_backCapTex 0
#elif SC_USE_UV_TRANSFORM_backCapTex==1
#undef SC_USE_UV_TRANSFORM_backCapTex
#define SC_USE_UV_TRANSFORM_backCapTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_backCapTex
#define SC_SOFTWARE_WRAP_MODE_U_backCapTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_backCapTex
#define SC_SOFTWARE_WRAP_MODE_V_backCapTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_backCapTex
#define SC_USE_UV_MIN_MAX_backCapTex 0
#elif SC_USE_UV_MIN_MAX_backCapTex==1
#undef SC_USE_UV_MIN_MAX_backCapTex
#define SC_USE_UV_MIN_MAX_backCapTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_backCapTex
#define SC_USE_CLAMP_TO_BORDER_backCapTex 0
#elif SC_USE_CLAMP_TO_BORDER_backCapTex==1
#undef SC_USE_CLAMP_TO_BORDER_backCapTex
#define SC_USE_CLAMP_TO_BORDER_backCapTex 1
#endif
#ifndef frontCapPBR
#define frontCapPBR 0
#elif frontCapPBR==1
#undef frontCapPBR
#define frontCapPBR 1
#endif
#ifndef DROPLIST_FRONT_CAP_MODE
#define DROPLIST_FRONT_CAP_MODE 0
#endif
#ifndef SC_USE_UV_TRANSFORM_frontCapTex
#define SC_USE_UV_TRANSFORM_frontCapTex 0
#elif SC_USE_UV_TRANSFORM_frontCapTex==1
#undef SC_USE_UV_TRANSFORM_frontCapTex
#define SC_USE_UV_TRANSFORM_frontCapTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_frontCapTex
#define SC_SOFTWARE_WRAP_MODE_U_frontCapTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_frontCapTex
#define SC_SOFTWARE_WRAP_MODE_V_frontCapTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_frontCapTex
#define SC_USE_UV_MIN_MAX_frontCapTex 0
#elif SC_USE_UV_MIN_MAX_frontCapTex==1
#undef SC_USE_UV_MIN_MAX_frontCapTex
#define SC_USE_UV_MIN_MAX_frontCapTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_frontCapTex
#define SC_USE_CLAMP_TO_BORDER_frontCapTex 0
#elif SC_USE_CLAMP_TO_BORDER_frontCapTex==1
#undef SC_USE_CLAMP_TO_BORDER_frontCapTex
#define SC_USE_CLAMP_TO_BORDER_frontCapTex 1
#endif
#ifndef outerEdgePBR
#define outerEdgePBR 0
#elif outerEdgePBR==1
#undef outerEdgePBR
#define outerEdgePBR 1
#endif
#ifndef DROPLIST_OUTER_EDGE_MODE
#define DROPLIST_OUTER_EDGE_MODE 0
#endif
#ifndef SC_USE_UV_TRANSFORM_outerEdgeTex
#define SC_USE_UV_TRANSFORM_outerEdgeTex 0
#elif SC_USE_UV_TRANSFORM_outerEdgeTex==1
#undef SC_USE_UV_TRANSFORM_outerEdgeTex
#define SC_USE_UV_TRANSFORM_outerEdgeTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex
#define SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex
#define SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_outerEdgeTex
#define SC_USE_UV_MIN_MAX_outerEdgeTex 0
#elif SC_USE_UV_MIN_MAX_outerEdgeTex==1
#undef SC_USE_UV_MIN_MAX_outerEdgeTex
#define SC_USE_UV_MIN_MAX_outerEdgeTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_outerEdgeTex
#define SC_USE_CLAMP_TO_BORDER_outerEdgeTex 0
#elif SC_USE_CLAMP_TO_BORDER_outerEdgeTex==1
#undef SC_USE_CLAMP_TO_BORDER_outerEdgeTex
#define SC_USE_CLAMP_TO_BORDER_outerEdgeTex 1
#endif
#ifndef innerEdgePBR
#define innerEdgePBR 0
#elif innerEdgePBR==1
#undef innerEdgePBR
#define innerEdgePBR 1
#endif
#ifndef DROPLIST_INNER_EDGE_MODE
#define DROPLIST_INNER_EDGE_MODE 0
#endif
#ifndef SC_USE_UV_TRANSFORM_InnerEdgeTex
#define SC_USE_UV_TRANSFORM_InnerEdgeTex 0
#elif SC_USE_UV_TRANSFORM_InnerEdgeTex==1
#undef SC_USE_UV_TRANSFORM_InnerEdgeTex
#define SC_USE_UV_TRANSFORM_InnerEdgeTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex
#define SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex
#define SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_InnerEdgeTex
#define SC_USE_UV_MIN_MAX_InnerEdgeTex 0
#elif SC_USE_UV_MIN_MAX_InnerEdgeTex==1
#undef SC_USE_UV_MIN_MAX_InnerEdgeTex
#define SC_USE_UV_MIN_MAX_InnerEdgeTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_InnerEdgeTex
#define SC_USE_CLAMP_TO_BORDER_InnerEdgeTex 0
#elif SC_USE_CLAMP_TO_BORDER_InnerEdgeTex==1
#undef SC_USE_CLAMP_TO_BORDER_InnerEdgeTex
#define SC_USE_CLAMP_TO_BORDER_InnerEdgeTex 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
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
uniform int sc_RayTracingReceiverEffectsMask;
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec3 sc_EnvmapRotation;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapDiffuseSize;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform sc_AmbientLight_t sc_AmbientLights[sc_AmbientLightsCount+1];
uniform sc_DirectionalLight_t sc_DirectionalLights[sc_DirectionalLightsCount+1];
uniform sc_PointLight_t sc_PointLights[sc_PointLightsCount+1];
uniform vec2 backCapTexScale;
uniform vec2 backCapTexOffset;
uniform vec4 backCapStartingColor;
uniform vec4 backCapEndingColor;
uniform float backCapGradientRamp;
uniform mat3 backCapTexTransform;
uniform vec4 backCapTexUvMinMax;
uniform vec4 backCapTexBorderColor;
uniform float Port_RangeMinA_N132;
uniform float Port_RangeMaxA_N132;
uniform float Port_RangeMaxB_N132;
uniform float Port_RangeMinB_N132;
uniform vec2 Port_Import_N133;
uniform vec2 Port_Center_N134;
uniform vec2 Port_Import_N135;
uniform float Port_RangeMinA_N164;
uniform float Port_RangeMaxA_N164;
uniform float Port_RangeMaxB_N164;
uniform float Port_RangeMinB_N164;
uniform float Port_Input1_N142;
uniform float Port_Input2_N142;
uniform float Port_Input0_N143;
uniform float Port_Input1_N143;
uniform float backCapMetallic;
uniform float backCapRoughness;
uniform vec4 Port_Default_N146;
uniform float Port_Opacity_N149;
uniform vec3 Port_Emissive_N149;
uniform vec3 Port_AO_N149;
uniform vec3 Port_SpecularAO_N149;
uniform vec2 frontCapTexScale;
uniform vec2 frontCapTexOffset;
uniform vec4 frontCapStartingColor;
uniform vec4 frontCapEndingColor;
uniform float frontCapGradientRamp;
uniform mat3 frontCapTexTransform;
uniform vec4 frontCapTexUvMinMax;
uniform vec4 frontCapTexBorderColor;
uniform float Port_RangeMinA_N101;
uniform float Port_RangeMaxA_N101;
uniform float Port_RangeMaxB_N101;
uniform float Port_RangeMinB_N101;
uniform vec2 Port_Import_N102;
uniform vec2 Port_Center_N103;
uniform vec2 Port_Import_N104;
uniform float Port_RangeMinA_N160;
uniform float Port_RangeMaxA_N160;
uniform float Port_RangeMaxB_N160;
uniform float Port_RangeMinB_N160;
uniform float Port_Input1_N111;
uniform float Port_Input2_N111;
uniform float Port_Input0_N112;
uniform float Port_Input1_N112;
uniform float frontCapMetallic;
uniform float frontCapRoughness;
uniform vec4 Port_Default_N010;
uniform float Port_Opacity_N118;
uniform vec3 Port_Emissive_N118;
uniform vec3 Port_AO_N118;
uniform vec3 Port_SpecularAO_N118;
uniform vec2 outerEdgeTexScale;
uniform vec2 outerEdgeTexOffset;
uniform vec4 outerEdgeStartingColor;
uniform vec4 outerEdgeEndingColor;
uniform float outerEdgeGradientRamp;
uniform mat3 outerEdgeTexTransform;
uniform vec4 outerEdgeTexUvMinMax;
uniform vec4 outerEdgeTexBorderColor;
uniform float Port_RangeMinA_N033;
uniform float Port_RangeMaxA_N033;
uniform float Port_RangeMaxB_N033;
uniform float Port_RangeMinB_N033;
uniform vec2 Port_Import_N017;
uniform vec2 Port_Center_N047;
uniform vec2 Port_Import_N058;
uniform float Port_RangeMinA_N153;
uniform float Port_RangeMaxA_N153;
uniform float Port_RangeMaxB_N153;
uniform float Port_RangeMinB_N153;
uniform float Port_Input1_N065;
uniform float Port_Input2_N065;
uniform float Port_Input0_N066;
uniform float Port_Input1_N066;
uniform float outerEdgeMetallic;
uniform float outerRoughness;
uniform vec4 Port_Default_N046;
uniform float Port_Opacity_N057;
uniform vec3 Port_Emissive_N057;
uniform vec3 Port_AO_N057;
uniform vec3 Port_SpecularAO_N057;
uniform vec2 InnerEdgeTexScale;
uniform vec2 InnerEdgeTexOffset;
uniform vec4 InnerEdgeStartingColor;
uniform vec4 InnerEdgeEndingColor;
uniform float InnerEdgeGradientRamp;
uniform mat3 InnerEdgeTexTransform;
uniform vec4 InnerEdgeTexUvMinMax;
uniform vec4 InnerEdgeTexBorderColor;
uniform float Port_RangeMinA_N023;
uniform float Port_RangeMaxA_N023;
uniform float Port_RangeMaxB_N023;
uniform float Port_RangeMinB_N023;
uniform vec2 Port_Import_N024;
uniform vec2 Port_Center_N025;
uniform vec2 Port_Import_N026;
uniform float Port_RangeMinA_N155;
uniform float Port_RangeMaxA_N155;
uniform float Port_RangeMaxB_N155;
uniform float Port_RangeMinB_N155;
uniform float Port_Input1_N034;
uniform float Port_Input2_N034;
uniform float Port_Input0_N035;
uniform float Port_Input1_N035;
uniform float InnerEdgeMetallic;
uniform float InnerEdgeRoughness;
uniform vec4 Port_Default_N077;
uniform float Port_Opacity_N080;
uniform vec3 Port_Emissive_N080;
uniform vec3 Port_AO_N080;
uniform vec3 Port_SpecularAO_N080;
uniform vec4 sc_Time;
uniform sc_Camera_t sc_Camera;
uniform float Port_Input1_N054;
uniform float Port_Input1_N043;
uniform float Port_Input1_N014;
uniform int PreviewEnabled;
uniform usampler2D sc_RayTracingHitCasterIdAndBarycentric;
uniform sampler2D sc_RayTracingRayDirection;
uniform sampler2D backCapTex;
uniform sampler2DArray backCapTexArrSC;
uniform sampler2D sc_SSAOTexture;
uniform sampler2D sc_ShadowTexture;
uniform sampler2D sc_RayTracingShadows;
uniform sampler2DArray sc_RayTracingShadowsArrSC;
uniform sampler2D sc_EnvmapSpecular;
uniform sampler2DArray sc_EnvmapSpecularArrSC;
uniform sampler2D sc_EnvmapDiffuse;
uniform sampler2DArray sc_EnvmapDiffuseArrSC;
uniform sampler2D sc_RayTracingGlobalIllumination;
uniform sampler2DArray sc_RayTracingGlobalIlluminationArrSC;
uniform sampler2D sc_RayTracingReflections;
uniform sampler2DArray sc_RayTracingReflectionsArrSC;
uniform sampler2D sc_ScreenTexture;
uniform sampler2DArray sc_ScreenTextureArrSC;
uniform sampler2D frontCapTex;
uniform sampler2DArray frontCapTexArrSC;
uniform sampler2D outerEdgeTex;
uniform sampler2DArray outerEdgeTexArrSC;
uniform sampler2D InnerEdgeTex;
uniform sampler2DArray InnerEdgeTexArrSC;
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
in vec3 varPos;
in vec3 varNormal;
in vec4 varPackedTex;
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
int backCapTexGetStereoViewIndex()
{
int l9_0;
#if (backCapTexHasSwappedViews)
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
void Node146_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (DROPLIST_BACK_CAP_MODE==0)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*backCapTexScale)+backCapTexOffset;
vec4 l9_2;
#if (backCapTexLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_backCapTex)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_backCapTex)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,backCapTexUvMinMax.x,backCapTexUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,backCapTexUvMinMax.y,backCapTexUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_backCapTex)!=0),backCapTexTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),backCapTexLayout,backCapTexGetStereoViewIndex());
vec4 l9_25=texture(backCapTexArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_26=mix(backCapTexBorderColor,l9_25,vec4(l9_23));
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
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_backCapTex)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_backCapTex)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,backCapTexUvMinMax.x,backCapTexUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_backCapTex)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,backCapTexUvMinMax.y,backCapTexUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_backCapTex)!=0),backCapTexTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_backCapTex,SC_SOFTWARE_WRAP_MODE_V_backCapTex).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),backCapTexLayout,backCapTexGetStereoViewIndex());
vec4 l9_49=texture(backCapTex,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_backCapTex)
{
l9_50=mix(backCapTexBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value0=l9_2;
Result=Value0;
}
#else
{
#if (DROPLIST_BACK_CAP_MODE==1)
{
vec2 l9_51=vec2(0.0,(((backCapGradientRamp-Port_RangeMinA_N164)/((Port_RangeMaxA_N164-Port_RangeMinA_N164)+1e-06))*(Port_RangeMaxB_N164-Port_RangeMinB_N164))+Port_RangeMinB_N164)-Port_Import_N135;
Value1=mix(backCapStartingColor,backCapEndingColor,vec4(smoothstep(Port_Input0_N143,Port_Input1_N143,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N132))/vec2((Port_RangeMaxA_N132-Port_RangeMinA_N132)+1e-06))*(Port_RangeMaxB_N132-Port_RangeMinB_N132))+vec2(Port_RangeMinB_N132))-Port_Center_N134)*Port_Import_N133)+Port_Center_N134)-Port_Import_N135,l9_51)/(dot(l9_51,l9_51)+1.234e-06))+0.001,Port_Input1_N142+0.001,Port_Input2_N142+0.001)-0.001)));
Result=Value1;
}
#else
{
#if (DROPLIST_BACK_CAP_MODE==2)
{
Value2=backCapStartingColor;
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
void ngsAlphaTest(float opacity)
{
#if (sc_BlendMode_AlphaTest)
{
if (opacity<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (opacity<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
}
SurfaceProperties defaultSurfaceProperties()
{
return SurfaceProperties(vec3(0.0),1.0,vec3(0.0),vec3(0.0),vec3(0.0),0.0,0.0,vec3(0.0),vec3(1.0),vec3(1.0),vec3(1.0),vec3(0.0));
}
vec3 ssSRGB_to_Linear(vec3 value)
{
vec3 l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=vec3(pow(value.x,2.2),pow(value.y,2.2),pow(value.z,2.2));
}
#else
{
l9_0=value*value;
}
#endif
return l9_0;
}
vec3 evaluateSSAO(vec3 positionWS)
{
#if (sc_SSAOEnabled)
{
vec4 l9_0=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(positionWS,1.0);
return vec3(texture(sc_SSAOTexture,((l9_0.xyz/vec3(l9_0.w)).xy*0.5)+vec2(0.5)).x);
}
#else
{
return vec3(1.0);
}
#endif
}
void deriveAlbedoAndSpecColorFromSurfaceProperties(SurfaceProperties surfaceProperties,out vec3 albedo,out vec3 specColor)
{
specColor=mix(vec3(0.039999999),surfaceProperties.albedo*surfaceProperties.metallic,vec3(surfaceProperties.metallic));
albedo=mix(surfaceProperties.albedo*(1.0-surfaceProperties.metallic),vec3(0.0),vec3(surfaceProperties.metallic));
}
vec3 fresnelSchlickSub(float cosTheta,vec3 F0,vec3 fresnelMax)
{
float l9_0=1.0-cosTheta;
float l9_1=l9_0*l9_0;
return F0+((fresnelMax-F0)*((l9_1*l9_1)*l9_0));
}
float Dggx(float NdotH,float roughness)
{
float l9_0=roughness;
float l9_1=roughness;
float l9_2=l9_0*l9_1;
float l9_3=l9_2*l9_2;
float l9_4=NdotH;
float l9_5=NdotH;
float l9_6=((l9_4*l9_5)*(l9_3-1.0))+1.0;
float l9_7;
if (sc_RayTracingCasterConfiguration.x!=0u)
{
l9_7=1e-07;
}
else
{
l9_7=9.9999999e-09;
}
return l9_3/((l9_6*l9_6)+l9_7);
}
vec3 calculateDirectSpecular(SurfaceProperties surfaceProperties,vec3 L,vec3 V)
{
float l9_0=surfaceProperties.roughness;
float l9_1=max(l9_0,0.029999999);
vec3 l9_2=surfaceProperties.specColor;
vec3 l9_3=surfaceProperties.normal;
vec3 l9_4=L;
vec3 l9_5=V;
vec3 l9_6=normalize(l9_4+l9_5);
vec3 l9_7=L;
float l9_8=clamp(dot(l9_3,l9_7),0.0,1.0);
vec3 l9_9=V;
float l9_10=clamp(dot(l9_3,l9_6),0.0,1.0);
vec3 l9_11=V;
float l9_12=clamp(dot(l9_11,l9_6),0.0,1.0);
#if (SC_DEVICE_CLASS>=2)
{
float l9_13=l9_1+1.0;
float l9_14=(l9_13*l9_13)*0.125;
float l9_15=1.0-l9_14;
return fresnelSchlickSub(l9_12,l9_2,vec3(1.0))*(((Dggx(l9_10,l9_1)*(1.0/(((l9_8*l9_15)+l9_14)*((clamp(dot(l9_3,l9_9),0.0,1.0)*l9_15)+l9_14))))*0.25)*l9_8);
}
#else
{
float l9_16=exp2(11.0-(10.0*l9_1));
return ((fresnelSchlickSub(l9_12,l9_2,vec3(1.0))*((l9_16*0.125)+0.25))*pow(l9_10,l9_16))*l9_8;
}
#endif
}
LightingComponents accumulateLight(LightingComponents lighting,LightProperties light,SurfaceProperties surfaceProperties,vec3 V)
{
lighting.directDiffuse+=((vec3(clamp(dot(surfaceProperties.normal,light.direction),0.0,1.0))*light.color)*light.attenuation);
lighting.directSpecular+=((calculateDirectSpecular(surfaceProperties,light.direction,V)*light.color)*light.attenuation);
return lighting;
}
float computeDistanceAttenuation(float distanceToLight,float falloffEndDistance)
{
float l9_0=distanceToLight;
float l9_1=distanceToLight;
float l9_2=l9_0*l9_1;
if (falloffEndDistance==0.0)
{
return 1.0/l9_2;
}
return max(min(1.0-((l9_2*l9_2)/pow(falloffEndDistance,4.0)),1.0),0.0)/l9_2;
}
vec3 evaluateShadow()
{
vec3 l9_0;
#if (sc_ProjectiveShadowsReceiver)
{
vec2 l9_1=abs(varShadowTex-vec2(0.5));
vec4 l9_2=texture(sc_ShadowTexture,varShadowTex)*step(max(l9_1.x,l9_1.y),0.5);
l9_0=mix(vec3(1.0),mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_2.xyz,vec3(sc_ShadowColor.w)),vec3(l9_2.w*sc_ShadowDensity));
}
#else
{
l9_0=vec3(1.0);
}
#endif
return l9_0;
}
int sc_RayTracingShadowsGetStereoViewIndex()
{
int l9_0;
#if (sc_RayTracingShadowsHasSwappedViews)
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
vec4 sc_RayTracingShadowsSampleViewBias(vec2 uv,float bias)
{
vec4 l9_0;
#if (sc_RayTracingShadowsLayout==2)
{
l9_0=texture(sc_RayTracingShadowsArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracingShadowsLayout,sc_RayTracingShadowsGetStereoViewIndex()),bias);
}
#else
{
l9_0=texture(sc_RayTracingShadows,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracingShadowsLayout,sc_RayTracingShadowsGetStereoViewIndex()).xy,bias);
}
#endif
return l9_0;
}
vec3 evaluateSh(vec3 L00,vec3 L1_1,vec3 L10,vec3 L11,vec3 L2_2,vec3 L2_1,vec3 L20,vec3 L21,vec3 L22,vec3 n)
{
return ((((((L22*0.42904299)*((n.x*n.x)-(n.y*n.y)))+((L20*0.74312502)*(n.z*n.z)))+(L00*0.88622701))-(L20*0.24770799))+((((L2_2*(n.x*n.y))+(L21*(n.x*n.z)))+(L2_1*(n.y*n.z)))*0.85808599))+((((L11*n.x)+(L1_1*n.y))+(L10*n.z))*1.0233279);
}
vec2 calcPanoramicTexCoordsFromDir(vec3 reflDir,float rotationDegrees)
{
float l9_0=-reflDir.z;
vec2 l9_1=vec2((((reflDir.x<0.0) ? (-1.0) : 1.0)*acos(clamp(l9_0/length(vec2(reflDir.x,l9_0)),-1.0,1.0)))-1.5707964,acos(reflDir.y))/vec2(6.2831855,3.1415927);
float l9_2=l9_1.x+(rotationDegrees/360.0);
vec2 l9_3=vec2(l9_2,1.0-l9_1.y);
l9_3.x=fract((l9_2+floor(l9_2))+1.0);
return l9_3;
}
int sc_EnvmapSpecularGetStereoViewIndex()
{
int l9_0;
#if (sc_EnvmapSpecularHasSwappedViews)
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
vec4 sc_EnvmapSpecularSampleViewBias(vec2 uv,float bias)
{
vec4 l9_0;
#if (sc_EnvmapSpecularLayout==2)
{
l9_0=texture(sc_EnvmapSpecularArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,sc_EnvmapSpecularGetStereoViewIndex()),bias);
}
#else
{
l9_0=texture(sc_EnvmapSpecular,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,sc_EnvmapSpecularGetStereoViewIndex()).xy,bias);
}
#endif
return l9_0;
}
vec2 calcSeamlessPanoramicUvsForSampling(vec2 uv,vec2 topMipRes,float lod)
{
#if (SC_DEVICE_CLASS>=2)
{
vec2 l9_0=max(vec2(1.0),topMipRes/vec2(exp2(lod)));
return ((uv*(l9_0-vec2(1.0)))/l9_0)+(vec2(0.5)/l9_0);
}
#else
{
return uv;
}
#endif
}
int sc_EnvmapDiffuseGetStereoViewIndex()
{
int l9_0;
#if (sc_EnvmapDiffuseHasSwappedViews)
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
vec4 sc_EnvmapDiffuseSampleViewBias(vec2 uv,float bias)
{
vec4 l9_0;
#if (sc_EnvmapDiffuseLayout==2)
{
l9_0=texture(sc_EnvmapDiffuseArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapDiffuseLayout,sc_EnvmapDiffuseGetStereoViewIndex()),bias);
}
#else
{
l9_0=texture(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapDiffuseLayout,sc_EnvmapDiffuseGetStereoViewIndex()).xy,bias);
}
#endif
return l9_0;
}
vec4 sc_EnvmapDiffuseSampleViewLevel(vec2 uv,float level_)
{
vec4 l9_0;
#if (sc_EnvmapDiffuseLayout==2)
{
l9_0=textureLod(sc_EnvmapDiffuseArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapDiffuseLayout,sc_EnvmapDiffuseGetStereoViewIndex()),level_);
}
#else
{
l9_0=textureLod(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapDiffuseLayout,sc_EnvmapDiffuseGetStereoViewIndex()).xy,level_);
}
#endif
return l9_0;
}
vec3 sampleDiffuseEnvmap(vec3 N)
{
vec2 l9_0=calcPanoramicTexCoordsFromDir(N,sc_EnvmapRotation.y);
vec4 l9_1;
#if (sc_EnvLightMode==sc_AmbientLightMode_FromCamera)
{
vec2 l9_2;
#if (SC_DEVICE_CLASS>=2)
{
l9_2=calcSeamlessPanoramicUvsForSampling(l9_0,sc_EnvmapSpecularSize.xy,5.0);
}
#else
{
l9_2=l9_0;
}
#endif
l9_1=sc_EnvmapSpecularSampleViewBias(l9_2,13.0);
}
#else
{
vec4 l9_3;
#if (sc_HasDiffuseEnvmap)
{
vec2 l9_4=calcSeamlessPanoramicUvsForSampling(l9_0,sc_EnvmapDiffuseSize.xy,0.0);
vec4 l9_5;
if (sc_RayTracingCasterConfiguration.x!=0u)
{
l9_5=sc_EnvmapDiffuseSampleViewLevel(l9_4,0.0);
}
else
{
l9_5=sc_EnvmapDiffuseSampleViewBias(l9_4,-13.0);
}
l9_3=l9_5;
}
#else
{
l9_3=sc_EnvmapSpecularSampleViewBias(l9_0,13.0);
}
#endif
l9_1=l9_3;
}
#endif
return (l9_1.xyz*(1.0/l9_1.w))*sc_EnvmapExposure;
}
int sc_RayTracingGlobalIlluminationGetStereoViewIndex()
{
int l9_0;
#if (sc_RayTracingGlobalIlluminationHasSwappedViews)
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
vec4 sc_RayTracingGlobalIlluminationSampleViewBias(vec2 uv,float bias)
{
vec4 l9_0;
#if (sc_RayTracingGlobalIlluminationLayout==2)
{
l9_0=texture(sc_RayTracingGlobalIlluminationArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracingGlobalIlluminationLayout,sc_RayTracingGlobalIlluminationGetStereoViewIndex()),bias);
}
#else
{
l9_0=texture(sc_RayTracingGlobalIllumination,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracingGlobalIlluminationLayout,sc_RayTracingGlobalIlluminationGetStereoViewIndex()).xy,bias);
}
#endif
return l9_0;
}
vec3 DiffuseTermSG(sc_SphericalGaussianLight_t lightingLobe,vec3 normal)
{
vec3 l9_0=lightingLobe.axis;
vec3 l9_1=normal;
float l9_2=dot(l9_0,l9_1);
float l9_3=lightingLobe.sharpness;
float l9_4=exp(-l9_3);
float l9_5=l9_4*l9_4;
float l9_6=1.0/l9_3;
float l9_7=(1.0+(2.0*l9_5))-l9_6;
float l9_8=sqrt(1.0-l9_7);
float l9_9=0.36000001*l9_2;
float l9_10=(1.0/(4.0*0.36000001))*l9_8;
float l9_11=l9_9+l9_10;
float l9_12;
if (step(abs(l9_9),l9_10)>0.5)
{
l9_12=(l9_11*l9_11)/l9_8;
}
else
{
l9_12=clamp(l9_2,0.0,1.0);
}
return (((lightingLobe.color/vec3(lightingLobe.sharpness))*6.2831855)*((l9_7*l9_12)+(((l9_4-l9_5)*l9_6)-l9_5)))/vec3(3.1415927);
}
vec3 calculateLightEstimationDiffuse(vec3 N)
{
vec3 l9_0;
l9_0=sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t param;
vec3 param_1;
int l9_1=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1<sc_LightEstimationSGCount)
{
l9_0+=DiffuseTermSG(sc_LightEstimationData.sg[l9_1],N);
l9_1++;
continue;
}
else
{
break;
}
}
return l9_0;
}
vec3 calculateDiffuseIrradiance(vec3 N)
{
vec3 l9_0;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
l9_0=sampleDiffuseEnvmap(N);
}
#else
{
vec3 l9_1;
#if (sc_EnvLightMode==sc_AmbientLightMode_SphericalHarmonics)
{
l9_1=evaluateSh(sc_Sh[0],sc_Sh[1],sc_Sh[2],sc_Sh[3],sc_Sh[4],sc_Sh[5],sc_Sh[6],sc_Sh[7],sc_Sh[8],-N)*sc_ShIntensity;
}
#else
{
l9_1=vec3(0.0);
}
#endif
l9_0=l9_1;
}
#endif
vec3 l9_2;
if ((sc_RayTracingReceiverEffectsMask&2)!=0)
{
vec4 l9_3=sc_RayTracingGlobalIlluminationSampleViewBias(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw,0.0);
l9_2=mix(l9_0,l9_3.xyz,vec3(l9_3.w));
}
else
{
l9_2=l9_0;
}
vec3 l9_4;
#if (sc_AmbientLightsCount>0)
{
vec3 l9_5;
#if (sc_AmbientLightMode0==sc_AmbientLightMode_Constant)
{
l9_5=l9_2+(sc_AmbientLights[0].color*sc_AmbientLights[0].intensity);
}
#else
{
vec3 l9_6=l9_2;
l9_6.x=l9_2.x+(1e-06*sc_AmbientLights[0].color.x);
l9_5=l9_6;
}
#endif
l9_4=l9_5;
}
#else
{
l9_4=l9_2;
}
#endif
vec3 l9_7;
#if (sc_AmbientLightsCount>1)
{
vec3 l9_8;
#if (sc_AmbientLightMode1==sc_AmbientLightMode_Constant)
{
l9_8=l9_4+(sc_AmbientLights[1].color*sc_AmbientLights[1].intensity);
}
#else
{
vec3 l9_9=l9_4;
l9_9.x=l9_4.x+(1e-06*sc_AmbientLights[1].color.x);
l9_8=l9_9;
}
#endif
l9_7=l9_8;
}
#else
{
l9_7=l9_4;
}
#endif
vec3 l9_10;
#if (sc_AmbientLightsCount>2)
{
vec3 l9_11;
#if (sc_AmbientLightMode2==sc_AmbientLightMode_Constant)
{
l9_11=l9_7+(sc_AmbientLights[2].color*sc_AmbientLights[2].intensity);
}
#else
{
vec3 l9_12=l9_7;
l9_12.x=l9_7.x+(1e-06*sc_AmbientLights[2].color.x);
l9_11=l9_12;
}
#endif
l9_10=l9_11;
}
#else
{
l9_10=l9_7;
}
#endif
vec3 l9_13;
#if (sc_LightEstimation)
{
l9_13=l9_10+calculateLightEstimationDiffuse(N);
}
#else
{
l9_13=l9_10;
}
#endif
return l9_13;
}
vec3 getSpecularDominantDir(vec3 N,vec3 R,float roughness)
{
#if (SC_DEVICE_CLASS>=2)
{
return normalize(mix(R,N,vec3((roughness*roughness)*roughness)));
}
#else
{
return R;
}
#endif
}
vec4 sc_EnvmapSpecularSampleViewLevel(vec2 uv,float level_)
{
vec4 l9_0;
#if (sc_EnvmapSpecularLayout==2)
{
l9_0=textureLod(sc_EnvmapSpecularArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,sc_EnvmapSpecularGetStereoViewIndex()),level_);
}
#else
{
l9_0=textureLod(sc_EnvmapSpecular,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,sc_EnvmapSpecularGetStereoViewIndex()).xy,level_);
}
#endif
return l9_0;
}
vec3 sampleSpecularEnvTextureLod(vec3 R,float lod)
{
vec2 l9_0=calcPanoramicTexCoordsFromDir(R,sc_EnvmapRotation.y);
vec4 l9_1;
#if (SC_DEVICE_CLASS>=2)
{
float l9_2=floor(lod);
float l9_3=ceil(lod);
l9_1=mix(sc_EnvmapSpecularSampleViewLevel(calcSeamlessPanoramicUvsForSampling(l9_0,sc_EnvmapSpecularSize.xy,l9_2),l9_2),sc_EnvmapSpecularSampleViewLevel(calcSeamlessPanoramicUvsForSampling(l9_0,sc_EnvmapSpecularSize.xy,l9_3),l9_3),vec4(lod-l9_2));
}
#else
{
l9_1=sc_EnvmapSpecularSampleViewLevel(l9_0,lod);
}
#endif
return l9_1.xyz*(1.0/l9_1.w);
}
int sc_RayTracingReflectionsGetStereoViewIndex()
{
int l9_0;
#if (sc_RayTracingReflectionsHasSwappedViews)
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
vec4 sc_RayTracingReflectionsSampleViewBias(vec2 uv,float bias)
{
vec4 l9_0;
#if (sc_RayTracingReflectionsLayout==2)
{
l9_0=texture(sc_RayTracingReflectionsArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracingReflectionsLayout,sc_RayTracingReflectionsGetStereoViewIndex()),bias);
}
#else
{
l9_0=texture(sc_RayTracingReflections,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracingReflectionsLayout,sc_RayTracingReflectionsGetStereoViewIndex()).xy,bias);
}
#endif
return l9_0;
}
vec3 envBRDFApprox(SurfaceProperties surfaceProperties,float NdotV)
{
#if (SC_DEVICE_CLASS>=2)
{
vec4 l9_0=(vec4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+vec4(1.0,0.0425,1.04,-0.039999999);
float l9_1=l9_0.x;
vec2 l9_2=(vec2(-1.04,1.04)*((min(l9_1*l9_1,exp2((-9.2799997)*NdotV))*l9_1)+l9_0.y))+l9_0.zw;
return max((surfaceProperties.specColor*l9_2.x)+vec3(l9_2.y),vec3(0.0));
}
#else
{
return fresnelSchlickSub(NdotV,surfaceProperties.specColor,max(vec3(1.0-surfaceProperties.roughness),surfaceProperties.specColor));
}
#endif
}
vec3 calculateIndirectSpecularEnvmap(SurfaceProperties surfaceProperties,vec3 V)
{
vec3 l9_0=surfaceProperties.normal;
vec3 l9_1=sampleSpecularEnvTextureLod(getSpecularDominantDir(l9_0,reflect(-V,l9_0),surfaceProperties.roughness),clamp(pow(surfaceProperties.roughness,0.66666669),0.0,1.0)*5.0);
vec3 l9_2=(l9_1*sc_EnvmapExposure)+vec3(1e-06);
vec3 l9_3;
if ((sc_RayTracingReceiverEffectsMask&1)!=0)
{
vec4 l9_4=sc_RayTracingReflectionsSampleViewBias(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw,0.0);
l9_3=mix(l9_2,l9_4.xyz,vec3(l9_4.w));
}
else
{
l9_3=l9_2;
}
return l9_3*envBRDFApprox(surfaceProperties,abs(dot(l9_0,V)));
}
sc_SphericalGaussianLight_t DistributionTermSG(vec3 direction,float roughness)
{
float l9_0=roughness*roughness;
return sc_SphericalGaussianLight_t(vec3(1.0/(3.1415927*l9_0)),2.0/l9_0,direction);
}
sc_SphericalGaussianLight_t WarpDistributionSG(sc_SphericalGaussianLight_t ndf,vec3 view)
{
return sc_SphericalGaussianLight_t(ndf.color,ndf.sharpness/(4.0*max(dot(ndf.axis,view),9.9999997e-05)),reflect(-view,ndf.axis));
}
vec3 SGInnerProduct(sc_SphericalGaussianLight_t lhs,sc_SphericalGaussianLight_t rhs)
{
float l9_0=length((lhs.axis*lhs.sharpness)+(rhs.axis*rhs.sharpness));
return ((((lhs.color*exp((l9_0-lhs.sharpness)-rhs.sharpness))*rhs.color)*6.2831855)*(1.0-exp((-2.0)*l9_0)))/vec3(l9_0);
}
vec3 SpecularTermSG(sc_SphericalGaussianLight_t light,vec3 normal,float roughness,vec3 view,vec3 specColor)
{
sc_SphericalGaussianLight_t l9_0=WarpDistributionSG(DistributionTermSG(normal,roughness),view);
vec3 l9_1=l9_0.axis;
float l9_2=roughness*roughness;
float l9_3=clamp(dot(normal,l9_1),0.0,1.0);
float l9_4=clamp(dot(normal,view),0.0,1.0);
float l9_5=1.0-l9_2;
return ((SGInnerProduct(l9_0,light)*((1.0/(l9_3+sqrt(l9_2+((l9_5*l9_3)*l9_3))))*(1.0/(l9_4+sqrt(l9_2+((l9_5*l9_4)*l9_4))))))*(specColor+((vec3(1.0)-specColor)*pow(1.0-clamp(dot(l9_1,normalize(l9_1+view)),0.0,1.0),5.0))))*l9_3;
}
vec3 calculateLightEstimationSpecular(SurfaceProperties surfaceProperties,vec3 V)
{
float l9_0=surfaceProperties.roughness;
float l9_1=surfaceProperties.roughness;
vec3 l9_2;
l9_2=sc_LightEstimationData.ambientLight*surfaceProperties.specColor;
sc_SphericalGaussianLight_t param;
vec3 param_1;
float param_2;
vec3 param_3;
vec3 param_4;
int l9_3=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3<sc_LightEstimationSGCount)
{
l9_2+=SpecularTermSG(sc_LightEstimationData.sg[l9_3],surfaceProperties.normal,clamp(l9_0*l9_1,0.0099999998,1.0),V,surfaceProperties.specColor);
l9_3++;
continue;
}
else
{
break;
}
}
return l9_2;
}
vec3 calculateIndirectSpecular(SurfaceProperties surfaceProperties,vec3 V)
{
vec3 l9_0;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
l9_0=vec3(0.0)+calculateIndirectSpecularEnvmap(surfaceProperties,V);
}
#else
{
l9_0=vec3(0.0);
}
#endif
vec3 l9_1;
#if (sc_LightEstimation)
{
l9_1=l9_0+calculateLightEstimationSpecular(surfaceProperties,V);
}
#else
{
l9_1=l9_0;
}
#endif
return l9_1;
}
LightingComponents evaluateLighting(SurfaceProperties surfaceProperties)
{
vec3 l9_0=surfaceProperties.viewDirWS;
vec4 bakedShadows=vec4(surfaceProperties.bakedShadows,1.0);
vec3 l9_1;
vec3 l9_2;
vec3 l9_3;
vec3 l9_4;
int l9_5;
vec3 l9_6;
vec3 l9_7;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_8;
vec3 l9_9;
vec3 l9_10;
vec3 l9_11;
int l9_12;
vec3 l9_13;
vec3 l9_14;
l9_14=vec3(1.0);
l9_13=vec3(0.0);
l9_12=0;
l9_11=vec3(0.0);
l9_10=vec3(0.0);
l9_9=vec3(0.0);
l9_8=vec3(0.0);
LightingComponents param;
LightProperties param_1;
SurfaceProperties param_2;
vec3 param_3;
int l9_15=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_15<sc_DirectionalLightsCount)
{
LightingComponents l9_16=accumulateLight(LightingComponents(l9_8,l9_9,l9_14,l9_13,l9_11,l9_10),LightProperties(sc_DirectionalLights[l9_15].direction,sc_DirectionalLights[l9_15].color.xyz,sc_DirectionalLights[l9_15].color.w*bakedShadows[(l9_12<3) ? l9_12 : 3]),surfaceProperties,l9_0);
l9_14=l9_16.indirectDiffuse;
l9_13=l9_16.indirectSpecular;
l9_12++;
l9_11=l9_16.emitted;
l9_10=l9_16.transmitted;
l9_9=l9_16.directSpecular;
l9_8=l9_16.directDiffuse;
l9_15++;
continue;
}
else
{
break;
}
}
l9_7=l9_14;
l9_6=l9_13;
l9_5=l9_12;
l9_4=l9_11;
l9_3=l9_10;
l9_2=l9_9;
l9_1=l9_8;
}
#else
{
l9_7=vec3(1.0);
l9_6=vec3(0.0);
l9_5=0;
l9_4=vec3(0.0);
l9_3=vec3(0.0);
l9_2=vec3(0.0);
l9_1=vec3(0.0);
}
#endif
vec3 l9_17;
vec3 l9_18;
vec3 l9_19;
vec3 l9_20;
#if (sc_PointLightsCount>0)
{
vec3 l9_21;
vec3 l9_22;
vec3 l9_23;
vec3 l9_24;
vec3 l9_25;
vec3 l9_26;
l9_26=l9_7;
l9_25=l9_6;
l9_24=l9_4;
l9_23=l9_3;
l9_22=l9_2;
l9_21=l9_1;
int l9_27;
vec3 l9_28;
vec3 l9_29;
vec3 l9_30;
vec3 l9_31;
vec3 l9_32;
vec3 l9_33;
int l9_34=0;
int l9_35=l9_5;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount)
{
vec3 l9_36=surfaceProperties.positionWS;
vec3 l9_37=sc_PointLights[l9_34].position-l9_36;
vec3 l9_38=normalize(l9_37);
float l9_39=bakedShadows[(l9_35<3) ? l9_35 : 3];
float l9_40=clamp((dot(l9_38,sc_PointLights[l9_34].direction)*sc_PointLights[l9_34].angleScale)+sc_PointLights[l9_34].angleOffset,0.0,1.0);
float l9_41=(sc_PointLights[l9_34].color.w*l9_39)*(l9_40*l9_40);
float l9_42;
if (sc_PointLights[l9_34].falloffEnabled)
{
l9_42=l9_41*computeDistanceAttenuation(length(l9_37),sc_PointLights[l9_34].falloffEndDistance);
}
else
{
l9_42=l9_41;
}
l9_27=l9_35+1;
LightingComponents l9_43=accumulateLight(LightingComponents(l9_21,l9_22,l9_26,l9_25,l9_24,l9_23),LightProperties(l9_38,sc_PointLights[l9_34].color.xyz,l9_42),surfaceProperties,l9_0);
l9_28=l9_43.directDiffuse;
l9_29=l9_43.directSpecular;
l9_30=l9_43.indirectDiffuse;
l9_31=l9_43.indirectSpecular;
l9_32=l9_43.emitted;
l9_33=l9_43.transmitted;
l9_26=l9_30;
l9_25=l9_31;
l9_35=l9_27;
l9_24=l9_32;
l9_23=l9_33;
l9_22=l9_29;
l9_21=l9_28;
l9_34++;
continue;
}
else
{
break;
}
}
l9_20=l9_24;
l9_19=l9_23;
l9_18=l9_22;
l9_17=l9_21;
}
#else
{
l9_20=l9_4;
l9_19=l9_3;
l9_18=l9_2;
l9_17=l9_1;
}
#endif
vec3 l9_44;
vec3 l9_45;
#if (sc_ProjectiveShadowsReceiver)
{
vec3 l9_46=evaluateShadow();
l9_45=l9_18*l9_46;
l9_44=l9_17*l9_46;
}
#else
{
l9_45=l9_18;
l9_44=l9_17;
}
#endif
vec3 l9_47;
vec3 l9_48;
if ((sc_RayTracingReceiverEffectsMask&4)!=0)
{
float l9_49=1.0-sc_RayTracingShadowsSampleViewBias(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw,0.0).x;
l9_48=l9_44*l9_49;
l9_47=l9_45*l9_49;
}
else
{
l9_48=l9_44;
l9_47=l9_45;
}
return LightingComponents(l9_48,l9_47,calculateDiffuseIrradiance(surfaceProperties.normal),calculateIndirectSpecular(surfaceProperties,l9_0),l9_20,l9_19);
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
vec4 sc_ScreenTextureSampleViewBias(vec2 uv,float bias)
{
vec4 l9_0;
#if (sc_ScreenTextureLayout==2)
{
l9_0=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()),bias);
}
#else
{
l9_0=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(uv,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()).xy,bias);
}
#endif
return l9_0;
}
vec4 sc_readFragData0_Platform()
{
return getFragData()[0];
}
vec4 sc_GetFramebufferColor()
{
vec4 l9_0;
#if (sc_FramebufferFetch)
{
l9_0=sc_readFragData0_Platform();
}
#else
{
l9_0=sc_ScreenTextureSampleViewBias(sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw),0.0);
}
#endif
return l9_0;
}
float srgbToLinear(float x)
{
#if (SC_DEVICE_CLASS>=2)
{
return pow(x,2.2);
}
#else
{
return x*x;
}
#endif
}
vec3 combineSurfacePropertiesWithLighting(SurfaceProperties surfaceProperties,LightingComponents lighting,bool enablePremultipliedAlpha)
{
vec3 l9_0=surfaceProperties.albedo;
vec3 l9_1=lighting.directDiffuse;
vec3 l9_2=lighting.indirectDiffuse;
vec3 l9_3=surfaceProperties.ao;
vec3 l9_4=l9_0*(l9_1+(l9_2*l9_3));
vec3 l9_5=lighting.directSpecular;
vec3 l9_6=lighting.indirectSpecular;
vec3 l9_7=surfaceProperties.specularAo;
vec3 l9_8=surfaceProperties.emissive;
vec3 l9_9=lighting.transmitted;
vec3 l9_10;
if (enablePremultipliedAlpha)
{
l9_10=l9_4*srgbToLinear(surfaceProperties.opacity);
}
else
{
l9_10=l9_4;
}
return ((l9_10+(l9_5+(l9_6*l9_7)))+l9_8)+l9_9;
}
vec3 linearToneMapping(vec3 x)
{
return (x*((x*1.8)+vec3(1.4)))/((x*((x*1.8)+vec3(0.5)))+vec3(1.5));
}
float linearToSrgb(float x)
{
#if (SC_DEVICE_CLASS>=2)
{
return pow(x,0.45454547);
}
#else
{
return sqrt(x);
}
#endif
}
vec4 ngsCalculateLighting(vec3 albedo,float opacity,vec3 normal,vec3 position,vec3 viewDir,vec3 emissive,float metallic,float roughness,vec3 ao,vec3 specularAO)
{
SurfaceProperties l9_0=defaultSurfaceProperties();
vec3 l9_1=l9_0.bakedShadows;
float l9_2=opacity;
vec3 l9_3=ssSRGB_to_Linear(albedo);
vec3 l9_4=normal;
vec3 l9_5=normalize(l9_4);
vec3 l9_6=position;
vec3 l9_7=viewDir;
vec3 l9_8=ssSRGB_to_Linear(emissive);
float l9_9=metallic;
float l9_10=roughness;
vec3 l9_11=ao;
vec3 l9_12=specularAO;
vec3 l9_13;
#if (sc_SSAOEnabled)
{
l9_13=evaluateSSAO(l9_6);
}
#else
{
l9_13=l9_11;
}
#endif
vec3 l9_14;
vec3 l9_15;
deriveAlbedoAndSpecColorFromSurfaceProperties(SurfaceProperties(l9_3,l9_2,l9_5,l9_6,l9_7,l9_9,l9_10,l9_8,l9_13,l9_12,l9_1,l9_0.specColor),l9_14,l9_15);
vec3 l9_16=l9_14;
vec3 l9_17=l9_15;
LightingComponents l9_18=evaluateLighting(SurfaceProperties(l9_16,l9_2,l9_5,l9_6,l9_7,l9_9,l9_10,l9_8,l9_13,l9_12,l9_1,l9_17));
float l9_19;
vec3 l9_20;
vec3 l9_21;
vec3 l9_22;
#if (sc_BlendMode_ColoredGlass)
{
l9_22=vec3(0.0);
l9_21=vec3(0.0);
l9_20=ssSRGB_to_Linear(sc_GetFramebufferColor().xyz)*mix(vec3(1.0),l9_16,vec3(l9_2));
l9_19=1.0;
}
#else
{
l9_22=l9_18.directDiffuse;
l9_21=l9_18.indirectDiffuse;
l9_20=l9_18.transmitted;
l9_19=l9_2;
}
#endif
bool l9_23;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_23=true;
}
#else
{
l9_23=false;
}
#endif
vec3 l9_24=combineSurfacePropertiesWithLighting(SurfaceProperties(l9_16,l9_19,l9_5,l9_6,l9_7,l9_9,l9_10,l9_8,l9_13,l9_12,l9_1,l9_17),LightingComponents(l9_22,l9_18.directSpecular,l9_21,l9_18.indirectSpecular,l9_18.emitted,l9_20),l9_23);
float l9_25=l9_24.x;
vec4 l9_26=vec4(l9_25,l9_24.yz,l9_19);
vec4 l9_27;
#if (sc_IsEditor)
{
vec4 l9_28=l9_26;
l9_28.x=l9_25+((l9_13.x*l9_12.x)*9.9999997e-06);
l9_27=l9_28;
}
#else
{
l9_27=l9_26;
}
#endif
if (sc_RayTracingCasterConfiguration.x!=0u)
{
return l9_27;
}
vec4 l9_29;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_30=linearToneMapping(l9_27.xyz);
l9_29=vec4(l9_30.x,l9_30.y,l9_30.z,l9_27.w);
}
#else
{
l9_29=l9_27;
}
#endif
vec3 l9_31=vec3(linearToSrgb(l9_29.x),linearToSrgb(l9_29.y),linearToSrgb(l9_29.z));
return vec4(l9_31.x,l9_31.y,l9_31.z,l9_29.w);
}
int frontCapTexGetStereoViewIndex()
{
int l9_0;
#if (frontCapTexHasSwappedViews)
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
void Node10_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (DROPLIST_FRONT_CAP_MODE==0)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*frontCapTexScale)+frontCapTexOffset;
vec4 l9_2;
#if (frontCapTexLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_frontCapTex)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_frontCapTex)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,frontCapTexUvMinMax.x,frontCapTexUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,frontCapTexUvMinMax.y,frontCapTexUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_frontCapTex)!=0),frontCapTexTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),frontCapTexLayout,frontCapTexGetStereoViewIndex());
vec4 l9_25=texture(frontCapTexArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_26=mix(frontCapTexBorderColor,l9_25,vec4(l9_23));
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
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_frontCapTex)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_frontCapTex)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,frontCapTexUvMinMax.x,frontCapTexUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,frontCapTexUvMinMax.y,frontCapTexUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_frontCapTex)!=0),frontCapTexTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex,SC_SOFTWARE_WRAP_MODE_V_frontCapTex).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),frontCapTexLayout,frontCapTexGetStereoViewIndex());
vec4 l9_49=texture(frontCapTex,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_frontCapTex)
{
l9_50=mix(frontCapTexBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value0=l9_2;
Result=Value0;
}
#else
{
#if (DROPLIST_FRONT_CAP_MODE==1)
{
vec2 l9_51=vec2(0.0,(((frontCapGradientRamp-Port_RangeMinA_N160)/((Port_RangeMaxA_N160-Port_RangeMinA_N160)+1e-06))*(Port_RangeMaxB_N160-Port_RangeMinB_N160))+Port_RangeMinB_N160)-Port_Import_N104;
Value1=mix(frontCapStartingColor,frontCapEndingColor,vec4(smoothstep(Port_Input0_N112,Port_Input1_N112,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N101))/vec2((Port_RangeMaxA_N101-Port_RangeMinA_N101)+1e-06))*(Port_RangeMaxB_N101-Port_RangeMinB_N101))+vec2(Port_RangeMinB_N101))-Port_Center_N103)*Port_Import_N102)+Port_Center_N103)-Port_Import_N104,l9_51)/(dot(l9_51,l9_51)+1.234e-06))+0.001,Port_Input1_N111+0.001,Port_Input2_N111+0.001)-0.001)));
Result=Value1;
}
#else
{
#if (DROPLIST_FRONT_CAP_MODE==2)
{
Value2=frontCapStartingColor;
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
int outerEdgeTexGetStereoViewIndex()
{
int l9_0;
#if (outerEdgeTexHasSwappedViews)
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
void Node46_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (DROPLIST_OUTER_EDGE_MODE==0)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*outerEdgeTexScale)+outerEdgeTexOffset;
vec4 l9_2;
#if (outerEdgeTexLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_outerEdgeTex)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_outerEdgeTex)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,outerEdgeTexUvMinMax.x,outerEdgeTexUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,outerEdgeTexUvMinMax.y,outerEdgeTexUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_outerEdgeTex)!=0),outerEdgeTexTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),outerEdgeTexLayout,outerEdgeTexGetStereoViewIndex());
vec4 l9_25=texture(outerEdgeTexArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_26=mix(outerEdgeTexBorderColor,l9_25,vec4(l9_23));
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
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_outerEdgeTex)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_outerEdgeTex)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,outerEdgeTexUvMinMax.x,outerEdgeTexUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,outerEdgeTexUvMinMax.y,outerEdgeTexUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_outerEdgeTex)!=0),outerEdgeTexTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),outerEdgeTexLayout,outerEdgeTexGetStereoViewIndex());
vec4 l9_49=texture(outerEdgeTex,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_outerEdgeTex)
{
l9_50=mix(outerEdgeTexBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value0=l9_2;
Result=Value0;
}
#else
{
#if (DROPLIST_OUTER_EDGE_MODE==1)
{
vec2 l9_51=vec2(0.0,(((outerEdgeGradientRamp-Port_RangeMinA_N153)/((Port_RangeMaxA_N153-Port_RangeMinA_N153)+1e-06))*(Port_RangeMaxB_N153-Port_RangeMinB_N153))+Port_RangeMinB_N153)-Port_Import_N058;
Value1=mix(outerEdgeStartingColor,outerEdgeEndingColor,vec4(smoothstep(Port_Input0_N066,Port_Input1_N066,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N033))/vec2((Port_RangeMaxA_N033-Port_RangeMinA_N033)+1e-06))*(Port_RangeMaxB_N033-Port_RangeMinB_N033))+vec2(Port_RangeMinB_N033))-Port_Center_N047)*Port_Import_N017)+Port_Center_N047)-Port_Import_N058,l9_51)/(dot(l9_51,l9_51)+1.234e-06))+0.001,Port_Input1_N065+0.001,Port_Input2_N065+0.001)-0.001)));
Result=Value1;
}
#else
{
#if (DROPLIST_OUTER_EDGE_MODE==2)
{
Value2=outerEdgeStartingColor;
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
int InnerEdgeTexGetStereoViewIndex()
{
int l9_0;
#if (InnerEdgeTexHasSwappedViews)
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
void Node77_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (DROPLIST_INNER_EDGE_MODE==0)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=(l9_0*InnerEdgeTexScale)+InnerEdgeTexOffset;
vec4 l9_2;
#if (InnerEdgeTexLayout==2)
{
bool l9_3=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_InnerEdgeTex)!=0));
float l9_4=l9_1.x;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x);
float l9_5=l9_4;
float l9_6=l9_1.y;
sc_SoftwareWrapEarly(l9_6,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y);
float l9_7=l9_6;
vec2 l9_8;
float l9_9;
#if (SC_USE_UV_MIN_MAX_InnerEdgeTex)
{
bool l9_10;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_10=ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x==3;
}
#else
{
l9_10=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0);
}
#endif
float l9_11=l9_5;
float l9_12=1.0;
sc_ClampUV(l9_11,InnerEdgeTexUvMinMax.x,InnerEdgeTexUvMinMax.z,l9_10,l9_12);
float l9_13=l9_11;
float l9_14=l9_12;
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0);
}
#endif
float l9_16=l9_7;
float l9_17=l9_14;
sc_ClampUV(l9_16,InnerEdgeTexUvMinMax.y,InnerEdgeTexUvMinMax.w,l9_15,l9_17);
l9_9=l9_17;
l9_8=vec2(l9_13,l9_16);
}
#else
{
l9_9=1.0;
l9_8=vec2(l9_5,l9_7);
}
#endif
vec2 l9_18=sc_TransformUV(l9_8,(int(SC_USE_UV_TRANSFORM_InnerEdgeTex)!=0),InnerEdgeTexTransform);
float l9_19=l9_18.x;
float l9_20=l9_9;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x,l9_3,l9_20);
float l9_21=l9_18.y;
float l9_22=l9_20;
sc_SoftwareWrapLate(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y,l9_3,l9_22);
float l9_23=l9_22;
vec3 l9_24=sc_SamplingCoordsViewToGlobal(vec2(l9_19,l9_21),InnerEdgeTexLayout,InnerEdgeTexGetStereoViewIndex());
vec4 l9_25=texture(InnerEdgeTexArrSC,l9_24,0.0);
vec4 l9_26;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_26=mix(InnerEdgeTexBorderColor,l9_25,vec4(l9_23));
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
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_InnerEdgeTex)!=0));
float l9_28=l9_1.x;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x);
float l9_29=l9_28;
float l9_30=l9_1.y;
sc_SoftwareWrapEarly(l9_30,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y);
float l9_31=l9_30;
vec2 l9_32;
float l9_33;
#if (SC_USE_UV_MIN_MAX_InnerEdgeTex)
{
bool l9_34;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_34=ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x==3;
}
#else
{
l9_34=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0);
}
#endif
float l9_35=l9_29;
float l9_36=1.0;
sc_ClampUV(l9_35,InnerEdgeTexUvMinMax.x,InnerEdgeTexUvMinMax.z,l9_34,l9_36);
float l9_37=l9_35;
float l9_38=l9_36;
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)!=0);
}
#endif
float l9_40=l9_31;
float l9_41=l9_38;
sc_ClampUV(l9_40,InnerEdgeTexUvMinMax.y,InnerEdgeTexUvMinMax.w,l9_39,l9_41);
l9_33=l9_41;
l9_32=vec2(l9_37,l9_40);
}
#else
{
l9_33=1.0;
l9_32=vec2(l9_29,l9_31);
}
#endif
vec2 l9_42=sc_TransformUV(l9_32,(int(SC_USE_UV_TRANSFORM_InnerEdgeTex)!=0),InnerEdgeTexTransform);
float l9_43=l9_42.x;
float l9_44=l9_33;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).x,l9_27,l9_44);
float l9_45=l9_42.y;
float l9_46=l9_44;
sc_SoftwareWrapLate(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex).y,l9_27,l9_46);
float l9_47=l9_46;
vec3 l9_48=sc_SamplingCoordsViewToGlobal(vec2(l9_43,l9_45),InnerEdgeTexLayout,InnerEdgeTexGetStereoViewIndex());
vec4 l9_49=texture(InnerEdgeTex,l9_48.xy,0.0);
vec4 l9_50;
#if (SC_USE_CLAMP_TO_BORDER_InnerEdgeTex)
{
l9_50=mix(InnerEdgeTexBorderColor,l9_49,vec4(l9_47));
}
#else
{
l9_50=l9_49;
}
#endif
l9_2=l9_50;
}
#endif
Value0=l9_2;
Result=Value0;
}
#else
{
#if (DROPLIST_INNER_EDGE_MODE==1)
{
vec2 l9_51=vec2(0.0,(((InnerEdgeGradientRamp-Port_RangeMinA_N155)/((Port_RangeMaxA_N155-Port_RangeMinA_N155)+1e-06))*(Port_RangeMaxB_N155-Port_RangeMinB_N155))+Port_RangeMinB_N155)-Port_Import_N026;
Value1=mix(InnerEdgeStartingColor,InnerEdgeEndingColor,vec4(smoothstep(Port_Input0_N035,Port_Input1_N035,clamp((dot((((((((Globals.Surface_UVCoord0-vec2(Port_RangeMinA_N023))/vec2((Port_RangeMaxA_N023-Port_RangeMinA_N023)+1e-06))*(Port_RangeMaxB_N023-Port_RangeMinB_N023))+vec2(Port_RangeMinB_N023))-Port_Center_N025)*Port_Import_N024)+Port_Center_N025)-Port_Import_N026,l9_51)/(dot(l9_51,l9_51)+1.234e-06))+0.001,Port_Input1_N034+0.001,Port_Input2_N034+0.001)-0.001)));
Result=Value1;
}
#else
{
#if (DROPLIST_INNER_EDGE_MODE==2)
{
Value2=InnerEdgeStartingColor;
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
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
col.x+=zero*float(cacheConst);
sc_FragData0=col;
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
vec3 l9_2;
vec3 l9_3;
vec3 l9_4;
if (l9_0)
{
sc_RayTracingHitPayload l9_5=sc_RayTracingEvaluateHitPayload(ivec2(gl_FragCoord.xy));
if (l9_5.id.x!=(sc_RayTracingCasterConfiguration.y&65535u))
{
return;
}
l9_4=l9_5.viewDirWS;
l9_3=l9_5.positionWS;
l9_2=l9_5.normalWS;
l9_1=l9_5.uv0;
}
else
{
l9_4=normalize(sc_Camera.position-varPos);
l9_3=varPos;
l9_2=normalize(varNormal);
l9_1=varPackedTex.xy;
}
ssGlobals l9_6=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec3(0.0),l9_4,l9_3,l9_2,l9_1);
vec4 l9_7;
#if (backCapPBR)
{
vec4 l9_8;
Node146_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N146,l9_8,l9_6);
vec3 l9_9;
#if (!sc_ProjectiveShadowsCaster)
{
l9_9=l9_2;
}
#else
{
l9_9=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N149);
vec3 l9_10=max(l9_8.xyz,vec3(0.0));
vec4 l9_11;
#if (sc_ProjectiveShadowsCaster)
{
l9_11=vec4(l9_10,Port_Opacity_N149);
}
#else
{
l9_11=ngsCalculateLighting(l9_10,Port_Opacity_N149,l9_9,l9_3,l9_4,Port_Emissive_N149,clamp(backCapMetallic,0.0,1.0),clamp(backCapRoughness,0.0,1.0),Port_AO_N149,Port_SpecularAO_N149);
}
#endif
l9_7=max(l9_11,vec4(0.0));
}
#else
{
vec4 l9_12;
Node146_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N146,l9_12,l9_6);
l9_7=l9_12;
}
#endif
vec4 l9_13;
#if (frontCapPBR)
{
vec4 l9_14;
Node10_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N010,l9_14,l9_6);
vec3 l9_15;
#if (!sc_ProjectiveShadowsCaster)
{
l9_15=l9_2;
}
#else
{
l9_15=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N118);
vec3 l9_16=max(l9_14.xyz,vec3(0.0));
vec4 l9_17;
#if (sc_ProjectiveShadowsCaster)
{
l9_17=vec4(l9_16,Port_Opacity_N118);
}
#else
{
l9_17=ngsCalculateLighting(l9_16,Port_Opacity_N118,l9_15,l9_3,l9_4,Port_Emissive_N118,clamp(frontCapMetallic,0.0,1.0),clamp(frontCapRoughness,0.0,1.0),Port_AO_N118,Port_SpecularAO_N118);
}
#endif
l9_13=max(l9_17,vec4(0.0));
}
#else
{
vec4 l9_18;
Node10_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N010,l9_18,l9_6);
l9_13=l9_18;
}
#endif
vec4 l9_19=mix(l9_7,l9_13,vec4(step(l9_1.x,Port_Input1_N054)));
vec4 l9_20;
#if (outerEdgePBR)
{
vec4 l9_21;
Node46_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N046,l9_21,l9_6);
vec3 l9_22;
#if (!sc_ProjectiveShadowsCaster)
{
l9_22=l9_2;
}
#else
{
l9_22=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N057);
vec3 l9_23=max(l9_21.xyz,vec3(0.0));
vec4 l9_24;
#if (sc_ProjectiveShadowsCaster)
{
l9_24=vec4(l9_23,Port_Opacity_N057);
}
#else
{
l9_24=ngsCalculateLighting(l9_23,Port_Opacity_N057,l9_22,l9_3,l9_4,Port_Emissive_N057,clamp(outerEdgeMetallic,0.0,1.0),clamp(outerRoughness,0.0,1.0),Port_AO_N057,Port_SpecularAO_N057);
}
#endif
l9_20=max(l9_24,vec4(0.0));
}
#else
{
vec4 l9_25;
Node46_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N046,l9_25,l9_6);
l9_20=l9_25;
}
#endif
vec4 l9_26;
#if (innerEdgePBR)
{
vec4 l9_27;
Node77_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N077,l9_27,l9_6);
vec3 l9_28;
#if (!sc_ProjectiveShadowsCaster)
{
l9_28=l9_2;
}
#else
{
l9_28=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N080);
vec3 l9_29=max(l9_27.xyz,vec3(0.0));
vec4 l9_30;
#if (sc_ProjectiveShadowsCaster)
{
l9_30=vec4(l9_29,Port_Opacity_N080);
}
#else
{
l9_30=ngsCalculateLighting(l9_29,Port_Opacity_N080,l9_28,l9_3,l9_4,Port_Emissive_N080,clamp(InnerEdgeMetallic,0.0,1.0),clamp(InnerEdgeRoughness,0.0,1.0),Port_AO_N080,Port_SpecularAO_N080);
}
#endif
l9_26=max(l9_30,vec4(0.0));
}
#else
{
vec4 l9_31;
Node77_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N077,l9_31,l9_6);
l9_26=l9_31;
}
#endif
vec4 l9_32=mix(l9_20,l9_26,vec4(step(l9_1.y,Port_Input1_N043)));
vec4 l9_33=mix(l9_19,l9_32,vec4(step(l9_1.y,Port_Input1_N014)));
if (l9_0)
{
vec4 l9_34;
#if (sc_RayTracingCasterForceOpaque)
{
vec4 l9_35=l9_33;
l9_35.w=1.0;
l9_34=l9_35;
}
#else
{
l9_34=l9_33;
}
#endif
sc_writeFragData0Internal(max(l9_34,vec4(0.0)),sc_UniformConstants.x,sc_ShaderCacheConstant);
return;
}
vec4 l9_36;
#if (sc_ProjectiveShadowsCaster)
{
float l9_37;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_37=l9_33.w;
}
#else
{
float l9_38;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_38=clamp(l9_33.w*2.0,0.0,1.0);
}
#else
{
float l9_39;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_39=clamp(dot(l9_33.xyz,vec3(l9_33.w)),0.0,1.0);
}
#else
{
float l9_40;
#if (sc_BlendMode_AlphaTest)
{
l9_40=1.0;
}
#else
{
float l9_41;
#if (sc_BlendMode_Multiply)
{
l9_41=(1.0-dot(l9_33.xyz,vec3(0.33333001)))*l9_33.w;
}
#else
{
float l9_42;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_42=(1.0-clamp(dot(l9_33.xyz,vec3(1.0)),0.0,1.0))*l9_33.w;
}
#else
{
float l9_43;
#if (sc_BlendMode_ColoredGlass)
{
l9_43=clamp(dot(l9_33.xyz,vec3(1.0)),0.0,1.0)*l9_33.w;
}
#else
{
float l9_44;
#if (sc_BlendMode_Add)
{
l9_44=clamp(dot(l9_33.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_45;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_45=clamp(dot(l9_33.xyz,vec3(1.0)),0.0,1.0)*l9_33.w;
}
#else
{
float l9_46;
#if (sc_BlendMode_Screen)
{
l9_46=dot(l9_33.xyz,vec3(0.33333001))*l9_33.w;
}
#else
{
float l9_47;
#if (sc_BlendMode_Min)
{
l9_47=1.0-clamp(dot(l9_33.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_48;
#if (sc_BlendMode_Max)
{
l9_48=clamp(dot(l9_33.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_48=1.0;
}
#endif
l9_47=l9_48;
}
#endif
l9_46=l9_47;
}
#endif
l9_45=l9_46;
}
#endif
l9_44=l9_45;
}
#endif
l9_43=l9_44;
}
#endif
l9_42=l9_43;
}
#endif
l9_41=l9_42;
}
#endif
l9_40=l9_41;
}
#endif
l9_39=l9_40;
}
#endif
l9_38=l9_39;
}
#endif
l9_37=l9_38;
}
#endif
l9_36=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_33.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_37);
}
#else
{
vec4 l9_49;
#if (sc_RenderAlphaToColor)
{
l9_49=vec4(l9_33.w);
}
#else
{
vec4 l9_50;
#if (sc_BlendMode_Custom)
{
vec3 l9_51=sc_GetFramebufferColor().xyz;
vec3 l9_52=mix(l9_51,definedBlend(l9_51,l9_33.xyz).xyz,vec3(l9_33.w));
vec4 l9_53=vec4(l9_52.x,l9_52.y,l9_52.z,vec4(0.0).w);
l9_53.w=1.0;
l9_50=l9_53;
}
#else
{
vec4 l9_54;
#if (sc_Voxelization)
{
l9_54=vec4(varScreenPos.xyz,1.0);
}
#else
{
vec4 l9_55;
#if (sc_OutputBounds)
{
float l9_56=clamp(abs(gl_FragCoord.z),0.0,1.0);
l9_55=vec4(l9_56,1.0-l9_56,1.0,1.0);
}
#else
{
vec4 l9_57;
#if (sc_BlendMode_MultiplyOriginal)
{
float l9_58=l9_33.w;
l9_57=vec4(mix(vec3(1.0),l9_33.xyz,vec3(l9_58)),l9_58);
}
#else
{
vec4 l9_59;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_60=l9_33.w;
float l9_61;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_61=clamp(l9_60,0.0,1.0);
}
#else
{
l9_61=l9_60;
}
#endif
l9_59=vec4(l9_33.xyz*l9_61,l9_61);
}
#else
{
l9_59=l9_33;
}
#endif
l9_57=l9_59;
}
#endif
l9_55=l9_57;
}
#endif
l9_54=l9_55;
}
#endif
l9_50=l9_54;
}
#endif
l9_49=l9_50;
}
#endif
l9_36=l9_49;
}
#endif
vec4 l9_62;
if (PreviewEnabled==1)
{
vec4 l9_63;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_63=PreviewVertexColor;
}
else
{
l9_63=vec4(0.0);
}
l9_62=l9_63;
}
else
{
l9_62=l9_36;
}
vec4 l9_64=sc_OutputMotionVectorsIfNeeded(varPos,max(l9_62,vec4(0.0)));
vec4 l9_65=clamp(l9_64,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_66=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_66-0.0039215689)),min(1.0,l9_66+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_67=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_67).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_68=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_67).xy);
float l9_69=packValue(l9_68);
int l9_76=int(l9_65.w*255.0);
float l9_77=packValue(l9_76);
sc_writeFragData0Internal(vec4(packValue(l9_68),packValue(l9_68),packValue(l9_68),packValue(l9_68)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_69,packValue(l9_68),packValue(l9_68),packValue(l9_68)));
sc_writeFragData2(vec4(l9_77,packValue(l9_76),packValue(l9_76),packValue(l9_76)));
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
vec2 l9_80=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_80).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_81[8];
int l9_82[8];
int l9_83=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_83<8)
{
l9_81[l9_83]=0;
l9_82[l9_83]=0;
l9_83++;
continue;
}
else
{
break;
}
}
int l9_84;
#if (sc_OITMaxLayers8)
{
l9_84=2;
}
#else
{
l9_84=1;
}
#endif
int l9_85=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_85<l9_84)
{
vec4 l9_86;
vec4 l9_87;
vec4 l9_88;
if (l9_85==0)
{
l9_88=texture(sc_OITAlpha0,l9_80);
l9_87=texture(sc_OITDepthLow0,l9_80);
l9_86=texture(sc_OITDepthHigh0,l9_80);
}
else
{
l9_88=vec4(0.0);
l9_87=vec4(0.0);
l9_86=vec4(0.0);
}
vec4 l9_89;
vec4 l9_90;
vec4 l9_91;
if (l9_85==1)
{
l9_91=texture(sc_OITAlpha1,l9_80);
l9_90=texture(sc_OITDepthLow1,l9_80);
l9_89=texture(sc_OITDepthHigh1,l9_80);
}
else
{
l9_91=l9_88;
l9_90=l9_87;
l9_89=l9_86;
}
if (any(notEqual(l9_89,vec4(0.0)))||any(notEqual(l9_90,vec4(0.0))))
{
int l9_92[8]=l9_81;
unpackValues(l9_89.w,l9_85,l9_92);
unpackValues(l9_89.z,l9_85,l9_92);
unpackValues(l9_89.y,l9_85,l9_92);
unpackValues(l9_89.x,l9_85,l9_92);
unpackValues(l9_90.w,l9_85,l9_92);
unpackValues(l9_90.z,l9_85,l9_92);
unpackValues(l9_90.y,l9_85,l9_92);
unpackValues(l9_90.x,l9_85,l9_92);
int l9_101[8]=l9_82;
unpackValues(l9_91.w,l9_85,l9_101);
unpackValues(l9_91.z,l9_85,l9_101);
unpackValues(l9_91.y,l9_85,l9_101);
unpackValues(l9_91.x,l9_85,l9_101);
}
l9_85++;
continue;
}
else
{
break;
}
}
vec4 l9_106=texture(sc_OITFilteredDepthBoundsTexture,l9_80);
vec2 l9_107=l9_106.xy;
int l9_108;
#if (sc_SkinBonesCount>0)
{
l9_108=encodeDepth(((1.0-l9_106.x)*1000.0)+getDepthOrderingEpsilon(),l9_107);
}
#else
{
l9_108=0;
}
#endif
int l9_109=encodeDepth(viewSpaceDepth(),l9_107);
vec4 l9_110;
l9_110=l9_65*l9_65.w;
vec4 l9_111;
int l9_112=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_112<8)
{
int l9_113=l9_81[l9_112];
int l9_114=l9_109-l9_108;
bool l9_115=l9_113<l9_114;
bool l9_116;
if (l9_115)
{
l9_116=l9_81[l9_112]>0;
}
else
{
l9_116=l9_115;
}
if (l9_116)
{
vec3 l9_117=l9_110.xyz*(1.0-(float(l9_82[l9_112])/255.0));
l9_111=vec4(l9_117.x,l9_117.y,l9_117.z,l9_110.w);
}
else
{
l9_111=l9_110;
}
l9_110=l9_111;
l9_112++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_110,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
sc_writeFragData0Internal(l9_65,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_64,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
#endif // #if SC_RT_RECEIVER_MODE
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
