#version 430
//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// NGS_FLAG_IS_NORMAL_MAP normalTex
// NGS_FLAG_IS_NORMAL_MAP detailNormalTex
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
//sampler sampler baseTexSmpSC 0:27
//sampler sampler detailNormalTexSmpSC 0:28
//sampler sampler intensityTextureSmpSC 0:29
//sampler sampler normalTexSmpSC 0:30
//sampler sampler opacityTexSmpSC 0:31
//sampler sampler sc_EnvmapDiffuseSmpSC 0:32
//sampler sampler sc_EnvmapSpecularSmpSC 0:33
//sampler sampler sc_OITCommonSampler 0:34
//sampler sampler sc_RayTracingGlobalIlluminationSmpSC 0:35
//sampler sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC 0:36
//sampler sampler sc_RayTracingRayDirectionSmpSC 0:37
//sampler sampler sc_RayTracingShadowsSmpSC 0:39
//sampler sampler sc_SSAOTextureSmpSC 0:40
//sampler sampler sc_ScreenTextureSmpSC 0:41
//sampler sampler sc_ShadowTextureSmpSC 0:42
//texture texture2D baseTex 0:3:0:27
//texture texture2D detailNormalTex 0:4:0:28
//texture texture2D intensityTexture 0:5:0:29
//texture texture2D normalTex 0:6:0:30
//texture texture2D opacityTex 0:7:0:31
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
//texture texture2D sc_RayTracingShadows 0:22:0:39
//texture texture2D sc_SSAOTexture 0:23:0:40
//texture texture2D sc_ScreenTexture 0:24:0:41
//texture texture2D sc_ShadowTexture 0:25:0:42
//texture texture2DArray baseTexArrSC 0:44:0:27
//texture texture2DArray detailNormalTexArrSC 0:45:0:28
//texture texture2DArray intensityTextureArrSC 0:46:0:29
//texture texture2DArray normalTexArrSC 0:47:0:30
//texture texture2DArray opacityTexArrSC 0:48:0:31
//texture texture2DArray sc_EnvmapDiffuseArrSC 0:49:0:32
//texture texture2DArray sc_EnvmapSpecularArrSC 0:50:0:33
//texture texture2DArray sc_RayTracingGlobalIlluminationArrSC 0:51:0:35
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
//spec_const bool ENABLE_BASE_TEX 30 0
//spec_const bool ENABLE_DETAIL_NORMAL 31 0
//spec_const bool ENABLE_NORMALMAP 32 0
//spec_const bool ENABLE_OPACITY_TEX 33 0
//spec_const bool ENABLE_RECOLOR 34 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 35 0
//spec_const bool ENABLE_UV2 36 0
//spec_const bool ENABLE_UV2_ANIMATION 37 0
//spec_const bool ENABLE_UV3 38 0
//spec_const bool ENABLE_UV3_ANIMATION 39 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 40 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 41 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 42 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 43 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 44 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 45 0
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 46 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 47 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 48 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 49 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 50 0
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 51 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 52 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 53 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 54 0
//spec_const bool UseViewSpaceDepthVariant 55 1
//spec_const bool baseTexHasSwappedViews 56 0
//spec_const bool detailNormalTexHasSwappedViews 57 0
//spec_const bool intensityTextureHasSwappedViews 58 0
//spec_const bool normalTexHasSwappedViews 59 0
//spec_const bool opacityTexHasSwappedViews 60 0
//spec_const bool sc_BlendMode_Add 61 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 62 0
//spec_const bool sc_BlendMode_AlphaTest 63 0
//spec_const bool sc_BlendMode_AlphaToCoverage 64 0
//spec_const bool sc_BlendMode_ColoredGlass 65 0
//spec_const bool sc_BlendMode_Custom 66 0
//spec_const bool sc_BlendMode_Max 67 0
//spec_const bool sc_BlendMode_Min 68 0
//spec_const bool sc_BlendMode_Multiply 69 0
//spec_const bool sc_BlendMode_MultiplyOriginal 70 0
//spec_const bool sc_BlendMode_Normal 71 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 72 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 73 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 74 0
//spec_const bool sc_BlendMode_Screen 75 0
//spec_const bool sc_DepthOnly 76 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 77 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 78 0
//spec_const bool sc_FramebufferFetch 79 0
//spec_const bool sc_HasDiffuseEnvmap 80 0
//spec_const bool sc_IsEditor 81 0
//spec_const bool sc_LightEstimation 82 0
//spec_const bool sc_MotionVectorsPass 83 0
//spec_const bool sc_OITCompositingPass 84 0
//spec_const bool sc_OITDepthBoundsPass 85 0
//spec_const bool sc_OITDepthGatherPass 86 0
//spec_const bool sc_OITDepthPrepass 87 0
//spec_const bool sc_OITFrontLayerPass 88 0
//spec_const bool sc_OITMaxLayers4Plus1 89 0
//spec_const bool sc_OITMaxLayers8 90 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 91 0
//spec_const bool sc_OutputBounds 92 0
//spec_const bool sc_ProjectiveShadowsCaster 93 0
//spec_const bool sc_ProjectiveShadowsReceiver 94 0
//spec_const bool sc_RayTracingCasterForceOpaque 95 0
//spec_const bool sc_RayTracingGlobalIlluminationHasSwappedViews 96 0
//spec_const bool sc_RayTracingShadowsHasSwappedViews 97 0
//spec_const bool sc_RenderAlphaToColor 98 0
//spec_const bool sc_SSAOEnabled 99 0
//spec_const bool sc_ScreenTextureHasSwappedViews 100 0
//spec_const bool sc_TAAEnabled 101 0
//spec_const bool sc_VertexBlending 102 0
//spec_const bool sc_VertexBlendingUseNormals 103 0
//spec_const bool sc_Voxelization 104 0
//spec_const int NODE_13_DROPLIST_ITEM 105 0
//spec_const int NODE_181_DROPLIST_ITEM 106 0
//spec_const int NODE_184_DROPLIST_ITEM 107 0
//spec_const int NODE_27_DROPLIST_ITEM 108 0
//spec_const int NODE_38_DROPLIST_ITEM 109 0
//spec_const int NODE_49_DROPLIST_ITEM 110 0
//spec_const int NODE_69_DROPLIST_ITEM 111 0
//spec_const int SC_DEVICE_CLASS 112 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 113 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 114 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 115 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 116 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 117 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 118 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 119 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 120 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 121 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 122 -1
//spec_const int baseTexLayout 123 0
//spec_const int detailNormalTexLayout 124 0
//spec_const int intensityTextureLayout 125 0
//spec_const int normalTexLayout 126 0
//spec_const int opacityTexLayout 127 0
//spec_const int sc_AmbientLightMode0 128 0
//spec_const int sc_AmbientLightMode1 129 0
//spec_const int sc_AmbientLightMode2 130 0
//spec_const int sc_AmbientLightMode_Constant 131 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 132 0
//spec_const int sc_AmbientLightMode_FromCamera 133 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 134 0
//spec_const int sc_AmbientLightsCount 135 0
//spec_const int sc_DepthBufferMode 136 0
//spec_const int sc_DirectionalLightsCount 137 0
//spec_const int sc_EnvLightMode 138 0
//spec_const int sc_EnvmapDiffuseLayout 139 0
//spec_const int sc_EnvmapSpecularLayout 140 0
//spec_const int sc_LightEstimationSGCount 141 0
//spec_const int sc_PointLightsCount 142 0
//spec_const int sc_RayTracingGlobalIlluminationLayout 143 0
//spec_const int sc_RayTracingShadowsLayout 144 0
//spec_const int sc_RenderingSpace 145 -1
//spec_const int sc_ScreenTextureLayout 146 0
//spec_const int sc_ShaderCacheConstant 147 0
//spec_const int sc_SkinBonesCount 148 0
//spec_const int sc_StereoRenderingMode 149 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 150 0
//spec_const int sc_StereoViewID 151 0
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
vec4 VertexColor;
vec2 Surface_UVCoord0;
vec2 Surface_UVCoord1;
vec2 gScreenCoord;
vec3 VertexTangent_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexBinormal_WorldSpace;
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
#ifndef baseTexHasSwappedViews
#define baseTexHasSwappedViews 0
#elif baseTexHasSwappedViews==1
#undef baseTexHasSwappedViews
#define baseTexHasSwappedViews 1
#endif
#ifndef baseTexLayout
#define baseTexLayout 0
#endif
#ifndef opacityTexHasSwappedViews
#define opacityTexHasSwappedViews 0
#elif opacityTexHasSwappedViews==1
#undef opacityTexHasSwappedViews
#define opacityTexHasSwappedViews 1
#endif
#ifndef opacityTexLayout
#define opacityTexLayout 0
#endif
#ifndef normalTexHasSwappedViews
#define normalTexHasSwappedViews 0
#elif normalTexHasSwappedViews==1
#undef normalTexHasSwappedViews
#define normalTexHasSwappedViews 1
#endif
#ifndef normalTexLayout
#define normalTexLayout 0
#endif
#ifndef detailNormalTexHasSwappedViews
#define detailNormalTexHasSwappedViews 0
#elif detailNormalTexHasSwappedViews==1
#undef detailNormalTexHasSwappedViews
#define detailNormalTexHasSwappedViews 1
#endif
#ifndef detailNormalTexLayout
#define detailNormalTexLayout 0
#endif
#ifndef ENABLE_RECOLOR
#define ENABLE_RECOLOR 0
#elif ENABLE_RECOLOR==1
#undef ENABLE_RECOLOR
#define ENABLE_RECOLOR 1
#endif
#ifndef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 0
#elif ENABLE_BASE_TEX==1
#undef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 1
#endif
#ifndef ENABLE_UV2
#define ENABLE_UV2 0
#elif ENABLE_UV2==1
#undef ENABLE_UV2
#define ENABLE_UV2 1
#endif
#ifndef ENABLE_UV2_ANIMATION
#define ENABLE_UV2_ANIMATION 0
#elif ENABLE_UV2_ANIMATION==1
#undef ENABLE_UV2_ANIMATION
#define ENABLE_UV2_ANIMATION 1
#endif
#ifndef NODE_13_DROPLIST_ITEM
#define NODE_13_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_UV3
#define ENABLE_UV3 0
#elif ENABLE_UV3==1
#undef ENABLE_UV3
#define ENABLE_UV3 1
#endif
#ifndef ENABLE_UV3_ANIMATION
#define ENABLE_UV3_ANIMATION 0
#elif ENABLE_UV3_ANIMATION==1
#undef ENABLE_UV3_ANIMATION
#define ENABLE_UV3_ANIMATION 1
#endif
#ifndef NODE_49_DROPLIST_ITEM
#define NODE_49_DROPLIST_ITEM 0
#endif
#ifndef NODE_27_DROPLIST_ITEM
#define NODE_27_DROPLIST_ITEM 0
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
#ifndef NODE_38_DROPLIST_ITEM
#define NODE_38_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 0
#elif ENABLE_OPACITY_TEX==1
#undef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 1
#endif
#ifndef NODE_69_DROPLIST_ITEM
#define NODE_69_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_opacityTex
#define SC_USE_UV_TRANSFORM_opacityTex 0
#elif SC_USE_UV_TRANSFORM_opacityTex==1
#undef SC_USE_UV_TRANSFORM_opacityTex
#define SC_USE_UV_TRANSFORM_opacityTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_opacityTex
#define SC_SOFTWARE_WRAP_MODE_U_opacityTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_opacityTex
#define SC_SOFTWARE_WRAP_MODE_V_opacityTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_opacityTex
#define SC_USE_UV_MIN_MAX_opacityTex 0
#elif SC_USE_UV_MIN_MAX_opacityTex==1
#undef SC_USE_UV_MIN_MAX_opacityTex
#define SC_USE_UV_MIN_MAX_opacityTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_opacityTex
#define SC_USE_CLAMP_TO_BORDER_opacityTex 0
#elif SC_USE_CLAMP_TO_BORDER_opacityTex==1
#undef SC_USE_CLAMP_TO_BORDER_opacityTex
#define SC_USE_CLAMP_TO_BORDER_opacityTex 1
#endif
#ifndef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 0
#elif ENABLE_NORMALMAP==1
#undef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 1
#endif
#ifndef NODE_181_DROPLIST_ITEM
#define NODE_181_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_normalTex
#define SC_USE_UV_TRANSFORM_normalTex 0
#elif SC_USE_UV_TRANSFORM_normalTex==1
#undef SC_USE_UV_TRANSFORM_normalTex
#define SC_USE_UV_TRANSFORM_normalTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_normalTex
#define SC_SOFTWARE_WRAP_MODE_U_normalTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_normalTex
#define SC_SOFTWARE_WRAP_MODE_V_normalTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_normalTex
#define SC_USE_UV_MIN_MAX_normalTex 0
#elif SC_USE_UV_MIN_MAX_normalTex==1
#undef SC_USE_UV_MIN_MAX_normalTex
#define SC_USE_UV_MIN_MAX_normalTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_normalTex
#define SC_USE_CLAMP_TO_BORDER_normalTex 0
#elif SC_USE_CLAMP_TO_BORDER_normalTex==1
#undef SC_USE_CLAMP_TO_BORDER_normalTex
#define SC_USE_CLAMP_TO_BORDER_normalTex 1
#endif
#ifndef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 0
#elif ENABLE_DETAIL_NORMAL==1
#undef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 1
#endif
#ifndef NODE_184_DROPLIST_ITEM
#define NODE_184_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_detailNormalTex
#define SC_USE_UV_TRANSFORM_detailNormalTex 0
#elif SC_USE_UV_TRANSFORM_detailNormalTex==1
#undef SC_USE_UV_TRANSFORM_detailNormalTex
#define SC_USE_UV_TRANSFORM_detailNormalTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_detailNormalTex
#define SC_SOFTWARE_WRAP_MODE_U_detailNormalTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_detailNormalTex
#define SC_SOFTWARE_WRAP_MODE_V_detailNormalTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_detailNormalTex
#define SC_USE_UV_MIN_MAX_detailNormalTex 0
#elif SC_USE_UV_MIN_MAX_detailNormalTex==1
#undef SC_USE_UV_MIN_MAX_detailNormalTex
#define SC_USE_UV_MIN_MAX_detailNormalTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_detailNormalTex
#define SC_USE_CLAMP_TO_BORDER_detailNormalTex 0
#elif SC_USE_CLAMP_TO_BORDER_detailNormalTex==1
#undef SC_USE_CLAMP_TO_BORDER_detailNormalTex
#define SC_USE_CLAMP_TO_BORDER_detailNormalTex 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
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
uniform vec4 sc_CurrentRenderTargetDims;
uniform sc_Camera_t sc_Camera;
uniform vec3 sc_RayTracingOriginOffset;
uniform vec3 sc_RayTracingOriginScale;
uniform uint sc_RayTracingReceiverMask;
uniform uint sc_RayTracingReceiverId;
uniform float alphaTestThreshold;
uniform vec3 recolorRed;
uniform vec4 baseColor;
uniform vec2 uv2Scale;
uniform vec2 uv2Offset;
uniform float Port_Speed_N022;
uniform vec2 uv3Scale;
uniform vec2 uv3Offset;
uniform float Port_Speed_N063;
uniform mat3 baseTexTransform;
uniform vec4 baseTexUvMinMax;
uniform vec4 baseTexBorderColor;
uniform vec3 recolorGreen;
uniform vec3 recolorBlue;
uniform vec4 Port_Default_N369;
uniform mat3 opacityTexTransform;
uniform vec4 opacityTexUvMinMax;
uniform vec4 opacityTexBorderColor;
uniform mat3 normalTexTransform;
uniform vec4 normalTexUvMinMax;
uniform vec4 normalTexBorderColor;
uniform mat3 detailNormalTexTransform;
uniform vec4 detailNormalTexUvMinMax;
uniform vec4 detailNormalTexBorderColor;
uniform vec3 Port_Default_N113;
uniform float Port_Strength1_N200;
uniform float Port_Strength2_N200;
uniform vec4 sc_Time;
uniform float Port_Default_N204;
uniform float Port_Input2_N072;
uniform sampler2D baseTex;
uniform sampler2DArray baseTexArrSC;
uniform sampler2D opacityTex;
uniform sampler2DArray opacityTexArrSC;
uniform sampler2D normalTex;
uniform sampler2DArray normalTexArrSC;
uniform sampler2D detailNormalTex;
uniform sampler2DArray detailNormalTexArrSC;
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
in vec4 varScreenPos;
layout(location=0) out uvec4 sc_RayTracingPositionAndMask;
layout(location=1) out uvec4 sc_RayTracingNormalAndMore;
in vec3 varPos;
in vec4 varColor;
in vec4 varPackedTex;
in vec4 varTangent;
in vec3 varNormal;
in vec2 varScreenTexturePos;
in float varViewSpaceDepth;
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
void Node17_Switch(float Switch,vec2 Value0,vec2 Value1,vec2 Value2,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (NODE_13_DROPLIST_ITEM==0)
{
Value0=Globals.Surface_UVCoord0;
Result=Value0;
}
#else
{
#if (NODE_13_DROPLIST_ITEM==1)
{
Value1=Globals.Surface_UVCoord1;
Result=Value1;
}
#else
{
#if (NODE_13_DROPLIST_ITEM==2)
{
Value2=Globals.gScreenCoord;
Result=Value2;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
#endif
}
#endif
}
void Node122_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (ENABLE_UV2_ANIMATION)
{
vec2 param_5;
Node17_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_5,Globals);
Value1=((param_5*uv2Scale)+uv2Offset)+(uv2Offset*(Globals.gTimeElapsed*Port_Speed_N022));
Result=Value1;
}
#else
{
vec2 param_12;
Node17_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_12,Globals);
Default=(param_12*uv2Scale)+uv2Offset;
Result=Default;
}
#endif
}
void Node1_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (ENABLE_UV2)
{
vec2 param_3;
Node122_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value1=param_3;
Result=Value1;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
void Node59_Switch(float Switch,vec2 Value0,vec2 Value1,vec2 Value2,vec2 Value3,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (NODE_49_DROPLIST_ITEM==0)
{
Value0=Globals.Surface_UVCoord0;
Result=Value0;
}
#else
{
#if (NODE_49_DROPLIST_ITEM==1)
{
Value1=Globals.Surface_UVCoord1;
Result=Value1;
}
#else
{
#if (NODE_49_DROPLIST_ITEM==2)
{
Value2=Globals.gScreenCoord;
Result=Value2;
}
#else
{
#if (NODE_49_DROPLIST_ITEM==3)
{
vec2 param_3;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value3=param_3;
Result=Value3;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
#endif
}
#endif
}
#endif
}
void Node64_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (ENABLE_UV3_ANIMATION)
{
vec2 param_6;
Node59_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_6,Globals);
Value1=((param_6*uv3Scale)+uv3Offset)+(uv3Offset*(Globals.gTimeElapsed*Port_Speed_N063));
Result=Value1;
}
#else
{
vec2 param_14;
Node59_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_14,Globals);
Default=(param_14*uv3Scale)+uv3Offset;
Result=Default;
}
#endif
}
void Node24_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (ENABLE_UV3)
{
vec2 param_3;
Node64_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value1=param_3;
Result=Value1;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
void Node388_Switch(float Switch,vec2 Value0,vec2 Value1,vec2 Value2,vec2 Value3,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (NODE_27_DROPLIST_ITEM==0)
{
Value0=Globals.Surface_UVCoord0;
Result=Value0;
}
#else
{
#if (NODE_27_DROPLIST_ITEM==1)
{
Value1=Globals.Surface_UVCoord1;
Result=Value1;
}
#else
{
#if (NODE_27_DROPLIST_ITEM==2)
{
vec2 param_3;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value2=param_3;
Result=Value2;
}
#else
{
#if (NODE_27_DROPLIST_ITEM==3)
{
vec2 param_8;
Node24_If_else(0.0,vec2(0.0),vec2(0.0),param_8,Globals);
Value3=param_8;
Result=Value3;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
#endif
}
#endif
}
#endif
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
void Node369_If_else(float Bool1,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (ENABLE_BASE_TEX)
{
vec2 param_6;
Node388_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_6,Globals);
vec2 l9_0=param_6;
vec4 l9_1;
#if (baseTexLayout==2)
{
bool l9_2=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_3=l9_0.x;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_4=l9_3;
float l9_5=l9_0.y;
sc_SoftwareWrapEarly(l9_5,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_6=l9_5;
vec2 l9_7;
float l9_8;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_9;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_9=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_9=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_10=l9_4;
float l9_11=1.0;
sc_ClampUV(l9_10,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_9,l9_11);
float l9_12=l9_10;
float l9_13=l9_11;
bool l9_14;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_14=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_14=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_15=l9_6;
float l9_16=l9_13;
sc_ClampUV(l9_15,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_14,l9_16);
l9_8=l9_16;
l9_7=vec2(l9_12,l9_15);
}
#else
{
l9_8=1.0;
l9_7=vec2(l9_4,l9_6);
}
#endif
vec2 l9_17=sc_TransformUV(l9_7,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_18=l9_17.x;
float l9_19=l9_8;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_2,l9_19);
float l9_20=l9_17.y;
float l9_21=l9_19;
sc_SoftwareWrapLate(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_2,l9_21);
float l9_22=l9_21;
vec3 l9_23=sc_SamplingCoordsViewToGlobal(vec2(l9_18,l9_20),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_24=texture(baseTexArrSC,l9_23,0.0);
vec4 l9_25;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_25=mix(baseTexBorderColor,l9_24,vec4(l9_22));
}
#else
{
l9_25=l9_24;
}
#endif
l9_1=l9_25;
}
#else
{
bool l9_26=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_27=l9_0.x;
sc_SoftwareWrapEarly(l9_27,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_28=l9_27;
float l9_29=l9_0.y;
sc_SoftwareWrapEarly(l9_29,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_30=l9_29;
vec2 l9_31;
float l9_32;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_33;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_33=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_33=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_34=l9_28;
float l9_35=1.0;
sc_ClampUV(l9_34,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_33,l9_35);
float l9_36=l9_34;
float l9_37=l9_35;
bool l9_38;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_38=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_38=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_39=l9_30;
float l9_40=l9_37;
sc_ClampUV(l9_39,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_38,l9_40);
l9_32=l9_40;
l9_31=vec2(l9_36,l9_39);
}
#else
{
l9_32=1.0;
l9_31=vec2(l9_28,l9_30);
}
#endif
vec2 l9_41=sc_TransformUV(l9_31,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_42=l9_41.x;
float l9_43=l9_32;
sc_SoftwareWrapLate(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_26,l9_43);
float l9_44=l9_41.y;
float l9_45=l9_43;
sc_SoftwareWrapLate(l9_44,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_26,l9_45);
float l9_46=l9_45;
vec3 l9_47=sc_SamplingCoordsViewToGlobal(vec2(l9_42,l9_44),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_48=texture(baseTex,l9_47.xy,0.0);
vec4 l9_49;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_49=mix(baseTexBorderColor,l9_48,vec4(l9_46));
}
#else
{
l9_49=l9_48;
}
#endif
l9_1=l9_49;
}
#endif
Value1=l9_1;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
void Node80_If_else(float Bool1,vec3 Value1,vec3 Default,out vec3 Result,ssGlobals Globals)
{
#if (ENABLE_RECOLOR)
{
vec4 param_3;
Node369_If_else(0.0,vec4(0.0),Port_Default_N369,param_3,Globals);
vec4 l9_0=baseColor*param_3;
Value1=((recolorRed*vec3(l9_0.x))+(recolorGreen*vec3(l9_0.y)))+(recolorBlue*vec3(l9_0.z));
Result=Value1;
}
#else
{
vec4 param_8;
Node369_If_else(0.0,vec4(0.0),Port_Default_N369,param_8,Globals);
Default=(baseColor*param_8).xyz;
Result=Default;
}
#endif
}
int opacityTexGetStereoViewIndex()
{
int l9_0;
#if (opacityTexHasSwappedViews)
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
int normalTexGetStereoViewIndex()
{
int l9_0;
#if (normalTexHasSwappedViews)
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
int detailNormalTexGetStereoViewIndex()
{
int l9_0;
#if (detailNormalTexHasSwappedViews)
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
void main()
{
#if (sc_DepthOnly)
{
return;
}
#endif
vec2 l9_0=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec2 l9_1;
#if (sc_StereoRenderingMode==1)
{
vec3 l9_2=vec3(l9_0,0.0);
l9_2.y=((2.0*l9_0.y)+float(sc_GetStereoViewIndex()))-1.0;
l9_1=l9_2.xy;
}
#else
{
l9_1=l9_0;
}
#endif
vec3 l9_3=normalize(varTangent.xyz);
vec3 l9_4=normalize(varNormal);
vec3 l9_5=cross(l9_4,l9_3)*varTangent.w;
ssGlobals l9_6=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec3(0.0),normalize(sc_Camera.position-varPos),varPos,varColor,varPackedTex.xy,varPackedTex.zw,l9_1,l9_3,l9_4,l9_5);
#if (NODE_38_DROPLIST_ITEM==1)
{
vec3 l9_7;
Node80_If_else(0.0,vec3(0.0),vec3(0.0),l9_7,l9_6);
}
#else
{
vec3 l9_8;
Node80_If_else(0.0,vec3(0.0),vec3(0.0),l9_8,l9_6);
}
#endif
vec4 param_3;
Node369_If_else(0.0,vec4(0.0),Port_Default_N369,param_3,l9_6);
vec4 l9_9=param_3;
float l9_10;
#if (ENABLE_OPACITY_TEX)
{
vec2 l9_11;
#if (NODE_69_DROPLIST_ITEM==0)
{
l9_11=varPackedTex.xy;
}
#else
{
vec2 l9_12;
#if (NODE_69_DROPLIST_ITEM==1)
{
l9_12=varPackedTex.zw;
}
#else
{
vec2 l9_13;
#if (NODE_69_DROPLIST_ITEM==2)
{
vec2 l9_14;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),l9_14,l9_6);
l9_13=l9_14;
}
#else
{
vec2 l9_15;
#if (NODE_69_DROPLIST_ITEM==3)
{
vec2 l9_16;
Node24_If_else(0.0,vec2(0.0),vec2(0.0),l9_16,l9_6);
l9_15=l9_16;
}
#else
{
l9_15=varPackedTex.xy;
}
#endif
l9_13=l9_15;
}
#endif
l9_12=l9_13;
}
#endif
l9_11=l9_12;
}
#endif
vec4 l9_17;
#if (opacityTexLayout==2)
{
bool l9_18=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_19=l9_11.x;
sc_SoftwareWrapEarly(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_20=l9_19;
float l9_21=l9_11.y;
sc_SoftwareWrapEarly(l9_21,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_22=l9_21;
vec2 l9_23;
float l9_24;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_25;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_25=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_25=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_26=l9_20;
float l9_27=1.0;
sc_ClampUV(l9_26,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_25,l9_27);
float l9_28=l9_26;
float l9_29=l9_27;
bool l9_30;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_30=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_30=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_31=l9_22;
float l9_32=l9_29;
sc_ClampUV(l9_31,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_30,l9_32);
l9_24=l9_32;
l9_23=vec2(l9_28,l9_31);
}
#else
{
l9_24=1.0;
l9_23=vec2(l9_20,l9_22);
}
#endif
vec2 l9_33=sc_TransformUV(l9_23,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_34=l9_33.x;
float l9_35=l9_24;
sc_SoftwareWrapLate(l9_34,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_18,l9_35);
float l9_36=l9_33.y;
float l9_37=l9_35;
sc_SoftwareWrapLate(l9_36,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_18,l9_37);
float l9_38=l9_37;
vec3 l9_39=sc_SamplingCoordsViewToGlobal(vec2(l9_34,l9_36),opacityTexLayout,opacityTexGetStereoViewIndex());
vec4 l9_40=texture(opacityTexArrSC,l9_39,0.0);
vec4 l9_41;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_41=mix(opacityTexBorderColor,l9_40,vec4(l9_38));
}
#else
{
l9_41=l9_40;
}
#endif
l9_17=l9_41;
}
#else
{
bool l9_42=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_43=l9_11.x;
sc_SoftwareWrapEarly(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_44=l9_43;
float l9_45=l9_11.y;
sc_SoftwareWrapEarly(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_46=l9_45;
vec2 l9_47;
float l9_48;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_49;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_49=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_49=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_50=l9_44;
float l9_51=1.0;
sc_ClampUV(l9_50,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_49,l9_51);
float l9_52=l9_50;
float l9_53=l9_51;
bool l9_54;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_54=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_54=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_55=l9_46;
float l9_56=l9_53;
sc_ClampUV(l9_55,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_54,l9_56);
l9_48=l9_56;
l9_47=vec2(l9_52,l9_55);
}
#else
{
l9_48=1.0;
l9_47=vec2(l9_44,l9_46);
}
#endif
vec2 l9_57=sc_TransformUV(l9_47,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_58=l9_57.x;
float l9_59=l9_48;
sc_SoftwareWrapLate(l9_58,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_42,l9_59);
float l9_60=l9_57.y;
float l9_61=l9_59;
sc_SoftwareWrapLate(l9_60,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_42,l9_61);
float l9_62=l9_61;
vec3 l9_63=sc_SamplingCoordsViewToGlobal(vec2(l9_58,l9_60),opacityTexLayout,opacityTexGetStereoViewIndex());
vec4 l9_64=texture(opacityTex,l9_63.xy,0.0);
vec4 l9_65;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_65=mix(opacityTexBorderColor,l9_64,vec4(l9_62));
}
#else
{
l9_65=l9_64;
}
#endif
l9_17=l9_65;
}
#endif
l9_10=l9_17.x;
}
#else
{
l9_10=Port_Default_N204;
}
#endif
float l9_66;
#if (NODE_38_DROPLIST_ITEM==1)
{
l9_66=varColor.w;
}
#else
{
l9_66=Port_Input2_N072;
}
#endif
float l9_67=(baseColor*l9_9).w*l9_10;
float l9_68=l9_67*l9_66;
vec3 l9_69;
#if (ENABLE_NORMALMAP)
{
vec2 l9_70;
#if (NODE_181_DROPLIST_ITEM==0)
{
l9_70=varPackedTex.xy;
}
#else
{
vec2 l9_71;
#if (NODE_181_DROPLIST_ITEM==1)
{
l9_71=varPackedTex.zw;
}
#else
{
vec2 l9_72;
#if (NODE_181_DROPLIST_ITEM==2)
{
vec2 l9_73;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),l9_73,l9_6);
l9_72=l9_73;
}
#else
{
vec2 l9_74;
#if (NODE_181_DROPLIST_ITEM==3)
{
vec2 l9_75;
Node24_If_else(0.0,vec2(0.0),vec2(0.0),l9_75,l9_6);
l9_74=l9_75;
}
#else
{
l9_74=varPackedTex.xy;
}
#endif
l9_72=l9_74;
}
#endif
l9_71=l9_72;
}
#endif
l9_70=l9_71;
}
#endif
vec4 l9_76;
#if (normalTexLayout==2)
{
bool l9_77=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_78=l9_70.x;
sc_SoftwareWrapEarly(l9_78,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_79=l9_78;
float l9_80=l9_70.y;
sc_SoftwareWrapEarly(l9_80,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_81=l9_80;
vec2 l9_82;
float l9_83;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_84;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_84=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_84=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_85=l9_79;
float l9_86=1.0;
sc_ClampUV(l9_85,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_84,l9_86);
float l9_87=l9_85;
float l9_88=l9_86;
bool l9_89;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_89=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_89=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_90=l9_81;
float l9_91=l9_88;
sc_ClampUV(l9_90,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_89,l9_91);
l9_83=l9_91;
l9_82=vec2(l9_87,l9_90);
}
#else
{
l9_83=1.0;
l9_82=vec2(l9_79,l9_81);
}
#endif
vec2 l9_92=sc_TransformUV(l9_82,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_93=l9_92.x;
float l9_94=l9_83;
sc_SoftwareWrapLate(l9_93,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_77,l9_94);
float l9_95=l9_92.y;
float l9_96=l9_94;
sc_SoftwareWrapLate(l9_95,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_77,l9_96);
float l9_97=l9_96;
vec3 l9_98=sc_SamplingCoordsViewToGlobal(vec2(l9_93,l9_95),normalTexLayout,normalTexGetStereoViewIndex());
vec4 l9_99=texture(normalTexArrSC,l9_98,0.0);
vec4 l9_100;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_100=mix(normalTexBorderColor,l9_99,vec4(l9_97));
}
#else
{
l9_100=l9_99;
}
#endif
l9_76=l9_100;
}
#else
{
bool l9_101=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_102=l9_70.x;
sc_SoftwareWrapEarly(l9_102,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_103=l9_102;
float l9_104=l9_70.y;
sc_SoftwareWrapEarly(l9_104,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_105=l9_104;
vec2 l9_106;
float l9_107;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_108;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_108=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_108=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_109=l9_103;
float l9_110=1.0;
sc_ClampUV(l9_109,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_108,l9_110);
float l9_111=l9_109;
float l9_112=l9_110;
bool l9_113;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_113=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_113=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_114=l9_105;
float l9_115=l9_112;
sc_ClampUV(l9_114,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_113,l9_115);
l9_107=l9_115;
l9_106=vec2(l9_111,l9_114);
}
#else
{
l9_107=1.0;
l9_106=vec2(l9_103,l9_105);
}
#endif
vec2 l9_116=sc_TransformUV(l9_106,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_117=l9_116.x;
float l9_118=l9_107;
sc_SoftwareWrapLate(l9_117,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_101,l9_118);
float l9_119=l9_116.y;
float l9_120=l9_118;
sc_SoftwareWrapLate(l9_119,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_101,l9_120);
float l9_121=l9_120;
vec3 l9_122=sc_SamplingCoordsViewToGlobal(vec2(l9_117,l9_119),normalTexLayout,normalTexGetStereoViewIndex());
vec4 l9_123=texture(normalTex,l9_122.xy,0.0);
vec4 l9_124;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_124=mix(normalTexBorderColor,l9_123,vec4(l9_121));
}
#else
{
l9_124=l9_123;
}
#endif
l9_76=l9_124;
}
#endif
vec3 l9_125;
#if (ENABLE_DETAIL_NORMAL)
{
vec2 l9_126;
#if (NODE_184_DROPLIST_ITEM==0)
{
l9_126=varPackedTex.xy;
}
#else
{
vec2 l9_127;
#if (NODE_184_DROPLIST_ITEM==1)
{
l9_127=varPackedTex.zw;
}
#else
{
vec2 l9_128;
#if (NODE_184_DROPLIST_ITEM==2)
{
vec2 l9_129;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),l9_129,l9_6);
l9_128=l9_129;
}
#else
{
vec2 l9_130;
#if (NODE_184_DROPLIST_ITEM==3)
{
vec2 l9_131;
Node24_If_else(0.0,vec2(0.0),vec2(0.0),l9_131,l9_6);
l9_130=l9_131;
}
#else
{
l9_130=varPackedTex.xy;
}
#endif
l9_128=l9_130;
}
#endif
l9_127=l9_128;
}
#endif
l9_126=l9_127;
}
#endif
vec4 l9_132;
#if (detailNormalTexLayout==2)
{
bool l9_133=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_134=l9_126.x;
sc_SoftwareWrapEarly(l9_134,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_135=l9_134;
float l9_136=l9_126.y;
sc_SoftwareWrapEarly(l9_136,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_137=l9_136;
vec2 l9_138;
float l9_139;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_140;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_140=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_140=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_141=l9_135;
float l9_142=1.0;
sc_ClampUV(l9_141,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_140,l9_142);
float l9_143=l9_141;
float l9_144=l9_142;
bool l9_145;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_145=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_145=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_146=l9_137;
float l9_147=l9_144;
sc_ClampUV(l9_146,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_145,l9_147);
l9_139=l9_147;
l9_138=vec2(l9_143,l9_146);
}
#else
{
l9_139=1.0;
l9_138=vec2(l9_135,l9_137);
}
#endif
vec2 l9_148=sc_TransformUV(l9_138,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_149=l9_148.x;
float l9_150=l9_139;
sc_SoftwareWrapLate(l9_149,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_133,l9_150);
float l9_151=l9_148.y;
float l9_152=l9_150;
sc_SoftwareWrapLate(l9_151,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_133,l9_152);
float l9_153=l9_152;
vec3 l9_154=sc_SamplingCoordsViewToGlobal(vec2(l9_149,l9_151),detailNormalTexLayout,detailNormalTexGetStereoViewIndex());
vec4 l9_155=texture(detailNormalTexArrSC,l9_154,0.0);
vec4 l9_156;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_156=mix(detailNormalTexBorderColor,l9_155,vec4(l9_153));
}
#else
{
l9_156=l9_155;
}
#endif
l9_132=l9_156;
}
#else
{
bool l9_157=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_158=l9_126.x;
sc_SoftwareWrapEarly(l9_158,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_159=l9_158;
float l9_160=l9_126.y;
sc_SoftwareWrapEarly(l9_160,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_161=l9_160;
vec2 l9_162;
float l9_163;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_164;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_164=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_164=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_165=l9_159;
float l9_166=1.0;
sc_ClampUV(l9_165,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_164,l9_166);
float l9_167=l9_165;
float l9_168=l9_166;
bool l9_169;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_169=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_169=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_170=l9_161;
float l9_171=l9_168;
sc_ClampUV(l9_170,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_169,l9_171);
l9_163=l9_171;
l9_162=vec2(l9_167,l9_170);
}
#else
{
l9_163=1.0;
l9_162=vec2(l9_159,l9_161);
}
#endif
vec2 l9_172=sc_TransformUV(l9_162,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_173=l9_172.x;
float l9_174=l9_163;
sc_SoftwareWrapLate(l9_173,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_157,l9_174);
float l9_175=l9_172.y;
float l9_176=l9_174;
sc_SoftwareWrapLate(l9_175,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_157,l9_176);
float l9_177=l9_176;
vec3 l9_178=sc_SamplingCoordsViewToGlobal(vec2(l9_173,l9_175),detailNormalTexLayout,detailNormalTexGetStereoViewIndex());
vec4 l9_179=texture(detailNormalTex,l9_178.xy,0.0);
vec4 l9_180;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_180=mix(detailNormalTexBorderColor,l9_179,vec4(l9_177));
}
#else
{
l9_180=l9_179;
}
#endif
l9_132=l9_180;
}
#endif
l9_125=((l9_132.xyz*1.9921875)-vec3(1.0)).xyz;
}
#else
{
l9_125=Port_Default_N113;
}
#endif
vec3 l9_181=mix(vec3(0.0,0.0,1.0),((l9_76.xyz*1.9921875)-vec3(1.0)).xyz,vec3(Port_Strength1_N200))+vec3(0.0,0.0,1.0);
vec3 l9_182=mix(vec3(0.0,0.0,1.0),l9_125,vec3(Port_Strength2_N200));
vec3 l9_183=l9_182*vec3(-1.0,-1.0,1.0);
vec3 l9_184=mat3(l9_3,l9_5,l9_4)*normalize((l9_181*dot(l9_181,l9_183))-(l9_183*l9_181.z));
float l9_185=dot(l9_184,l9_184);
float l9_186;
if (l9_185>0.0)
{
l9_186=1.0/sqrt(l9_185);
}
else
{
l9_186=0.0;
}
l9_69=l9_184*l9_186;
}
#else
{
float l9_187=dot(l9_4,l9_4);
float l9_188;
if (l9_187>0.0)
{
l9_188=1.0/sqrt(l9_187);
}
else
{
l9_188=0.0;
}
l9_69=l9_4*l9_188;
}
#endif
vec3 l9_189;
#if (!sc_ProjectiveShadowsCaster)
{
l9_189=l9_69;
}
#else
{
l9_189=vec3(0.0);
}
#endif
float l9_190=clamp(l9_68,0.0,1.0);
#if (sc_BlendMode_AlphaTest)
{
if (l9_190<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_190<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
uvec3 l9_191=uvec3(round((varPos-sc_RayTracingOriginOffset)*sc_RayTracingOriginScale));
sc_RayTracingPositionAndMask=uvec4(l9_191.x,l9_191.y,l9_191.z,sc_RayTracingPositionAndMask.w);
sc_RayTracingPositionAndMask.w=sc_RayTracingReceiverMask;
vec3 l9_192=l9_189/vec3(dot(abs(l9_189),vec3(1.0)));
vec2 l9_193=vec2(clamp(-l9_192.z,0.0,1.0));
vec2 l9_194=l9_192.xy;
uint l9_195=packHalf2x16(l9_194+mix(-l9_193,l9_193,step(vec2(0.0),l9_194)));
uvec2 l9_196=uvec2(l9_195&65535u,l9_195>>16u);
sc_RayTracingNormalAndMore=uvec4(l9_196.x,l9_196.y,sc_RayTracingNormalAndMore.z,sc_RayTracingNormalAndMore.w);
sc_RayTracingNormalAndMore.z=0u;
sc_RayTracingNormalAndMore.w=uint(1.0*1000.0)|((sc_RayTracingReceiverId%32u)<<10u);
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
vec4 VertexColor;
vec2 Surface_UVCoord0;
vec2 Surface_UVCoord1;
vec2 gScreenCoord;
vec3 VertexTangent_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexBinormal_WorldSpace;
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
#ifndef baseTexHasSwappedViews
#define baseTexHasSwappedViews 0
#elif baseTexHasSwappedViews==1
#undef baseTexHasSwappedViews
#define baseTexHasSwappedViews 1
#endif
#ifndef baseTexLayout
#define baseTexLayout 0
#endif
#ifndef opacityTexHasSwappedViews
#define opacityTexHasSwappedViews 0
#elif opacityTexHasSwappedViews==1
#undef opacityTexHasSwappedViews
#define opacityTexHasSwappedViews 1
#endif
#ifndef opacityTexLayout
#define opacityTexLayout 0
#endif
#ifndef normalTexHasSwappedViews
#define normalTexHasSwappedViews 0
#elif normalTexHasSwappedViews==1
#undef normalTexHasSwappedViews
#define normalTexHasSwappedViews 1
#endif
#ifndef normalTexLayout
#define normalTexLayout 0
#endif
#ifndef detailNormalTexHasSwappedViews
#define detailNormalTexHasSwappedViews 0
#elif detailNormalTexHasSwappedViews==1
#undef detailNormalTexHasSwappedViews
#define detailNormalTexHasSwappedViews 1
#endif
#ifndef detailNormalTexLayout
#define detailNormalTexLayout 0
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
#ifndef ENABLE_RECOLOR
#define ENABLE_RECOLOR 0
#elif ENABLE_RECOLOR==1
#undef ENABLE_RECOLOR
#define ENABLE_RECOLOR 1
#endif
#ifndef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 0
#elif ENABLE_BASE_TEX==1
#undef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 1
#endif
#ifndef ENABLE_UV2
#define ENABLE_UV2 0
#elif ENABLE_UV2==1
#undef ENABLE_UV2
#define ENABLE_UV2 1
#endif
#ifndef ENABLE_UV2_ANIMATION
#define ENABLE_UV2_ANIMATION 0
#elif ENABLE_UV2_ANIMATION==1
#undef ENABLE_UV2_ANIMATION
#define ENABLE_UV2_ANIMATION 1
#endif
#ifndef NODE_13_DROPLIST_ITEM
#define NODE_13_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_UV3
#define ENABLE_UV3 0
#elif ENABLE_UV3==1
#undef ENABLE_UV3
#define ENABLE_UV3 1
#endif
#ifndef ENABLE_UV3_ANIMATION
#define ENABLE_UV3_ANIMATION 0
#elif ENABLE_UV3_ANIMATION==1
#undef ENABLE_UV3_ANIMATION
#define ENABLE_UV3_ANIMATION 1
#endif
#ifndef NODE_49_DROPLIST_ITEM
#define NODE_49_DROPLIST_ITEM 0
#endif
#ifndef NODE_27_DROPLIST_ITEM
#define NODE_27_DROPLIST_ITEM 0
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
#ifndef NODE_38_DROPLIST_ITEM
#define NODE_38_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 0
#elif ENABLE_OPACITY_TEX==1
#undef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 1
#endif
#ifndef NODE_69_DROPLIST_ITEM
#define NODE_69_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_opacityTex
#define SC_USE_UV_TRANSFORM_opacityTex 0
#elif SC_USE_UV_TRANSFORM_opacityTex==1
#undef SC_USE_UV_TRANSFORM_opacityTex
#define SC_USE_UV_TRANSFORM_opacityTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_opacityTex
#define SC_SOFTWARE_WRAP_MODE_U_opacityTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_opacityTex
#define SC_SOFTWARE_WRAP_MODE_V_opacityTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_opacityTex
#define SC_USE_UV_MIN_MAX_opacityTex 0
#elif SC_USE_UV_MIN_MAX_opacityTex==1
#undef SC_USE_UV_MIN_MAX_opacityTex
#define SC_USE_UV_MIN_MAX_opacityTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_opacityTex
#define SC_USE_CLAMP_TO_BORDER_opacityTex 0
#elif SC_USE_CLAMP_TO_BORDER_opacityTex==1
#undef SC_USE_CLAMP_TO_BORDER_opacityTex
#define SC_USE_CLAMP_TO_BORDER_opacityTex 1
#endif
#ifndef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 0
#elif ENABLE_NORMALMAP==1
#undef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 1
#endif
#ifndef NODE_181_DROPLIST_ITEM
#define NODE_181_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_normalTex
#define SC_USE_UV_TRANSFORM_normalTex 0
#elif SC_USE_UV_TRANSFORM_normalTex==1
#undef SC_USE_UV_TRANSFORM_normalTex
#define SC_USE_UV_TRANSFORM_normalTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_normalTex
#define SC_SOFTWARE_WRAP_MODE_U_normalTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_normalTex
#define SC_SOFTWARE_WRAP_MODE_V_normalTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_normalTex
#define SC_USE_UV_MIN_MAX_normalTex 0
#elif SC_USE_UV_MIN_MAX_normalTex==1
#undef SC_USE_UV_MIN_MAX_normalTex
#define SC_USE_UV_MIN_MAX_normalTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_normalTex
#define SC_USE_CLAMP_TO_BORDER_normalTex 0
#elif SC_USE_CLAMP_TO_BORDER_normalTex==1
#undef SC_USE_CLAMP_TO_BORDER_normalTex
#define SC_USE_CLAMP_TO_BORDER_normalTex 1
#endif
#ifndef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 0
#elif ENABLE_DETAIL_NORMAL==1
#undef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 1
#endif
#ifndef NODE_184_DROPLIST_ITEM
#define NODE_184_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_detailNormalTex
#define SC_USE_UV_TRANSFORM_detailNormalTex 0
#elif SC_USE_UV_TRANSFORM_detailNormalTex==1
#undef SC_USE_UV_TRANSFORM_detailNormalTex
#define SC_USE_UV_TRANSFORM_detailNormalTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_detailNormalTex
#define SC_SOFTWARE_WRAP_MODE_U_detailNormalTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_detailNormalTex
#define SC_SOFTWARE_WRAP_MODE_V_detailNormalTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_detailNormalTex
#define SC_USE_UV_MIN_MAX_detailNormalTex 0
#elif SC_USE_UV_MIN_MAX_detailNormalTex==1
#undef SC_USE_UV_MIN_MAX_detailNormalTex
#define SC_USE_UV_MIN_MAX_detailNormalTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_detailNormalTex
#define SC_USE_CLAMP_TO_BORDER_detailNormalTex 0
#elif SC_USE_CLAMP_TO_BORDER_detailNormalTex==1
#undef SC_USE_CLAMP_TO_BORDER_detailNormalTex
#define SC_USE_CLAMP_TO_BORDER_detailNormalTex 1
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
uniform vec3 recolorRed;
uniform vec4 baseColor;
uniform vec2 uv2Scale;
uniform vec2 uv2Offset;
uniform float Port_Speed_N022;
uniform vec2 uv3Scale;
uniform vec2 uv3Offset;
uniform float Port_Speed_N063;
uniform mat3 baseTexTransform;
uniform vec4 baseTexUvMinMax;
uniform vec4 baseTexBorderColor;
uniform vec3 recolorGreen;
uniform vec3 recolorBlue;
uniform vec4 Port_Default_N369;
uniform mat3 opacityTexTransform;
uniform vec4 opacityTexUvMinMax;
uniform vec4 opacityTexBorderColor;
uniform mat3 normalTexTransform;
uniform vec4 normalTexUvMinMax;
uniform vec4 normalTexBorderColor;
uniform mat3 detailNormalTexTransform;
uniform vec4 detailNormalTexUvMinMax;
uniform vec4 detailNormalTexBorderColor;
uniform vec3 Port_Default_N113;
uniform float Port_Strength1_N200;
uniform float Port_Strength2_N200;
uniform float colorMultiplier;
uniform vec4 sc_Time;
uniform sc_Camera_t sc_Camera;
uniform float Port_Default_N204;
uniform float Port_Input2_N072;
uniform vec3 Port_Emissive_N036;
uniform vec3 Port_AO_N036;
uniform int PreviewEnabled;
uniform usampler2D sc_RayTracingHitCasterIdAndBarycentric;
uniform sampler2D sc_RayTracingRayDirection;
uniform sampler2D baseTex;
uniform sampler2DArray baseTexArrSC;
uniform sampler2D opacityTex;
uniform sampler2DArray opacityTexArrSC;
uniform sampler2D normalTex;
uniform sampler2DArray normalTexArrSC;
uniform sampler2D detailNormalTex;
uniform sampler2DArray detailNormalTexArrSC;
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
in vec3 varPos;
in vec4 varColor;
in vec4 varPackedTex;
in vec4 varTangent;
in vec3 varNormal;
in vec2 varScreenTexturePos;
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
void Node17_Switch(float Switch,vec2 Value0,vec2 Value1,vec2 Value2,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (NODE_13_DROPLIST_ITEM==0)
{
Value0=Globals.Surface_UVCoord0;
Result=Value0;
}
#else
{
#if (NODE_13_DROPLIST_ITEM==1)
{
Value1=Globals.Surface_UVCoord1;
Result=Value1;
}
#else
{
#if (NODE_13_DROPLIST_ITEM==2)
{
Value2=Globals.gScreenCoord;
Result=Value2;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
#endif
}
#endif
}
void Node122_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (ENABLE_UV2_ANIMATION)
{
vec2 param_5;
Node17_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_5,Globals);
Value1=((param_5*uv2Scale)+uv2Offset)+(uv2Offset*(Globals.gTimeElapsed*Port_Speed_N022));
Result=Value1;
}
#else
{
vec2 param_12;
Node17_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_12,Globals);
Default=(param_12*uv2Scale)+uv2Offset;
Result=Default;
}
#endif
}
void Node1_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (ENABLE_UV2)
{
vec2 param_3;
Node122_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value1=param_3;
Result=Value1;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
void Node59_Switch(float Switch,vec2 Value0,vec2 Value1,vec2 Value2,vec2 Value3,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (NODE_49_DROPLIST_ITEM==0)
{
Value0=Globals.Surface_UVCoord0;
Result=Value0;
}
#else
{
#if (NODE_49_DROPLIST_ITEM==1)
{
Value1=Globals.Surface_UVCoord1;
Result=Value1;
}
#else
{
#if (NODE_49_DROPLIST_ITEM==2)
{
Value2=Globals.gScreenCoord;
Result=Value2;
}
#else
{
#if (NODE_49_DROPLIST_ITEM==3)
{
vec2 param_3;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value3=param_3;
Result=Value3;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
#endif
}
#endif
}
#endif
}
void Node64_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (ENABLE_UV3_ANIMATION)
{
vec2 param_6;
Node59_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_6,Globals);
Value1=((param_6*uv3Scale)+uv3Offset)+(uv3Offset*(Globals.gTimeElapsed*Port_Speed_N063));
Result=Value1;
}
#else
{
vec2 param_14;
Node59_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_14,Globals);
Default=(param_14*uv3Scale)+uv3Offset;
Result=Default;
}
#endif
}
void Node24_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (ENABLE_UV3)
{
vec2 param_3;
Node64_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value1=param_3;
Result=Value1;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
void Node388_Switch(float Switch,vec2 Value0,vec2 Value1,vec2 Value2,vec2 Value3,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (NODE_27_DROPLIST_ITEM==0)
{
Value0=Globals.Surface_UVCoord0;
Result=Value0;
}
#else
{
#if (NODE_27_DROPLIST_ITEM==1)
{
Value1=Globals.Surface_UVCoord1;
Result=Value1;
}
#else
{
#if (NODE_27_DROPLIST_ITEM==2)
{
vec2 param_3;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value2=param_3;
Result=Value2;
}
#else
{
#if (NODE_27_DROPLIST_ITEM==3)
{
vec2 param_8;
Node24_If_else(0.0,vec2(0.0),vec2(0.0),param_8,Globals);
Value3=param_8;
Result=Value3;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
#endif
}
#endif
}
#endif
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
void Node369_If_else(float Bool1,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (ENABLE_BASE_TEX)
{
vec2 param_6;
Node388_Switch(0.0,vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),param_6,Globals);
vec2 l9_0=param_6;
vec4 l9_1;
#if (baseTexLayout==2)
{
bool l9_2=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_3=l9_0.x;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_4=l9_3;
float l9_5=l9_0.y;
sc_SoftwareWrapEarly(l9_5,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_6=l9_5;
vec2 l9_7;
float l9_8;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_9;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_9=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_9=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_10=l9_4;
float l9_11=1.0;
sc_ClampUV(l9_10,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_9,l9_11);
float l9_12=l9_10;
float l9_13=l9_11;
bool l9_14;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_14=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_14=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_15=l9_6;
float l9_16=l9_13;
sc_ClampUV(l9_15,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_14,l9_16);
l9_8=l9_16;
l9_7=vec2(l9_12,l9_15);
}
#else
{
l9_8=1.0;
l9_7=vec2(l9_4,l9_6);
}
#endif
vec2 l9_17=sc_TransformUV(l9_7,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_18=l9_17.x;
float l9_19=l9_8;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_2,l9_19);
float l9_20=l9_17.y;
float l9_21=l9_19;
sc_SoftwareWrapLate(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_2,l9_21);
float l9_22=l9_21;
vec3 l9_23=sc_SamplingCoordsViewToGlobal(vec2(l9_18,l9_20),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_24=texture(baseTexArrSC,l9_23,0.0);
vec4 l9_25;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_25=mix(baseTexBorderColor,l9_24,vec4(l9_22));
}
#else
{
l9_25=l9_24;
}
#endif
l9_1=l9_25;
}
#else
{
bool l9_26=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_27=l9_0.x;
sc_SoftwareWrapEarly(l9_27,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_28=l9_27;
float l9_29=l9_0.y;
sc_SoftwareWrapEarly(l9_29,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_30=l9_29;
vec2 l9_31;
float l9_32;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_33;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_33=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_33=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_34=l9_28;
float l9_35=1.0;
sc_ClampUV(l9_34,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_33,l9_35);
float l9_36=l9_34;
float l9_37=l9_35;
bool l9_38;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_38=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_38=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_39=l9_30;
float l9_40=l9_37;
sc_ClampUV(l9_39,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_38,l9_40);
l9_32=l9_40;
l9_31=vec2(l9_36,l9_39);
}
#else
{
l9_32=1.0;
l9_31=vec2(l9_28,l9_30);
}
#endif
vec2 l9_41=sc_TransformUV(l9_31,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_42=l9_41.x;
float l9_43=l9_32;
sc_SoftwareWrapLate(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_26,l9_43);
float l9_44=l9_41.y;
float l9_45=l9_43;
sc_SoftwareWrapLate(l9_44,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_26,l9_45);
float l9_46=l9_45;
vec3 l9_47=sc_SamplingCoordsViewToGlobal(vec2(l9_42,l9_44),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_48=texture(baseTex,l9_47.xy,0.0);
vec4 l9_49;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_49=mix(baseTexBorderColor,l9_48,vec4(l9_46));
}
#else
{
l9_49=l9_48;
}
#endif
l9_1=l9_49;
}
#endif
Value1=l9_1;
Result=Value1;
}
#else
{
Result=Default;
}
#endif
}
void Node80_If_else(float Bool1,vec3 Value1,vec3 Default,out vec3 Result,ssGlobals Globals)
{
#if (ENABLE_RECOLOR)
{
vec4 param_3;
Node369_If_else(0.0,vec4(0.0),Port_Default_N369,param_3,Globals);
vec4 l9_0=baseColor*param_3;
Value1=((recolorRed*vec3(l9_0.x))+(recolorGreen*vec3(l9_0.y)))+(recolorBlue*vec3(l9_0.z));
Result=Value1;
}
#else
{
vec4 param_8;
Node369_If_else(0.0,vec4(0.0),Port_Default_N369,param_8,Globals);
Default=(baseColor*param_8).xyz;
Result=Default;
}
#endif
}
int opacityTexGetStereoViewIndex()
{
int l9_0;
#if (opacityTexHasSwappedViews)
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
int normalTexGetStereoViewIndex()
{
int l9_0;
#if (normalTexHasSwappedViews)
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
int detailNormalTexGetStereoViewIndex()
{
int l9_0;
#if (detailNormalTexHasSwappedViews)
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
float l9_0=opacity;
vec3 l9_1=ssSRGB_to_Linear(albedo);
vec3 l9_2=normal;
vec3 l9_3=normalize(l9_2);
vec3 l9_4=position;
vec3 l9_5=viewDir;
vec3 l9_6=ssSRGB_to_Linear(emissive);
float l9_7=metallic;
float l9_8=roughness;
vec3 l9_9=ao;
vec3 l9_10=specularAO;
vec3 l9_11;
#if (sc_SSAOEnabled)
{
l9_11=evaluateSSAO(l9_4);
}
#else
{
l9_11=l9_9;
}
#endif
vec3 l9_12=vec3(l9_7);
vec3 l9_13=mix(l9_1*(1.0-l9_7),vec3(0.0),l9_12);
SurfaceProperties l9_14=SurfaceProperties(l9_13,l9_0,l9_3,l9_4,l9_5,l9_7,l9_8,l9_6,l9_11,l9_10,vec3(1.0),mix(vec3(0.039999999),l9_1*l9_7,l9_12));
vec4 l9_15=vec4(1.0);
vec3 l9_16;
vec3 l9_17;
vec3 l9_18;
vec3 l9_19;
vec3 l9_20;
int l9_21;
vec3 l9_22;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_23;
vec3 l9_24;
vec3 l9_25;
vec3 l9_26;
vec3 l9_27;
int l9_28;
vec3 l9_29;
l9_29=vec3(1.0);
l9_28=0;
l9_27=vec3(0.0);
l9_26=vec3(0.0);
l9_25=vec3(0.0);
l9_24=vec3(0.0);
l9_23=vec3(0.0);
LightingComponents l9_30;
LightProperties l9_31;
SurfaceProperties l9_32;
vec3 l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_DirectionalLightsCount)
{
LightingComponents l9_35=accumulateLight(LightingComponents(l9_23,l9_24,l9_29,l9_27,l9_26,l9_25),LightProperties(sc_DirectionalLights[l9_34].direction,sc_DirectionalLights[l9_34].color.xyz,sc_DirectionalLights[l9_34].color.w*l9_15[(l9_28<3) ? l9_28 : 3]),l9_14,l9_5);
l9_29=l9_35.indirectDiffuse;
l9_28++;
l9_27=l9_35.indirectSpecular;
l9_26=l9_35.emitted;
l9_25=l9_35.transmitted;
l9_24=l9_35.directSpecular;
l9_23=l9_35.directDiffuse;
l9_34++;
continue;
}
else
{
break;
}
}
l9_22=l9_29;
l9_21=l9_28;
l9_20=l9_27;
l9_19=l9_26;
l9_18=l9_25;
l9_17=l9_24;
l9_16=l9_23;
}
#else
{
l9_22=vec3(1.0);
l9_21=0;
l9_20=vec3(0.0);
l9_19=vec3(0.0);
l9_18=vec3(0.0);
l9_17=vec3(0.0);
l9_16=vec3(0.0);
}
#endif
vec3 l9_36;
vec3 l9_37;
vec3 l9_38;
#if (sc_PointLightsCount>0)
{
vec3 l9_39;
vec3 l9_40;
vec3 l9_41;
vec3 l9_42;
vec3 l9_43;
vec3 l9_44;
l9_44=l9_22;
l9_43=l9_20;
l9_42=l9_19;
l9_41=l9_18;
l9_40=l9_17;
l9_39=l9_16;
int l9_45;
vec3 l9_46;
vec3 l9_47;
vec3 l9_48;
vec3 l9_49;
vec3 l9_50;
vec3 l9_51;
int l9_52=0;
int l9_53=l9_21;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_52<sc_PointLightsCount)
{
vec3 l9_54=sc_PointLights[l9_52].position-l9_4;
vec3 l9_55=normalize(l9_54);
float l9_56=l9_15[(l9_53<3) ? l9_53 : 3];
float l9_57=clamp((dot(l9_55,sc_PointLights[l9_52].direction)*sc_PointLights[l9_52].angleScale)+sc_PointLights[l9_52].angleOffset,0.0,1.0);
float l9_58=(sc_PointLights[l9_52].color.w*l9_56)*(l9_57*l9_57);
float l9_59;
if (sc_PointLights[l9_52].falloffEnabled)
{
l9_59=l9_58*computeDistanceAttenuation(length(l9_54),sc_PointLights[l9_52].falloffEndDistance);
}
else
{
l9_59=l9_58;
}
l9_45=l9_53+1;
LightingComponents l9_60=accumulateLight(LightingComponents(l9_39,l9_40,l9_44,l9_43,l9_42,l9_41),LightProperties(l9_55,sc_PointLights[l9_52].color.xyz,l9_59),l9_14,l9_5);
l9_46=l9_60.directDiffuse;
l9_47=l9_60.directSpecular;
l9_48=l9_60.indirectDiffuse;
l9_49=l9_60.indirectSpecular;
l9_50=l9_60.emitted;
l9_51=l9_60.transmitted;
l9_44=l9_48;
l9_53=l9_45;
l9_43=l9_49;
l9_42=l9_50;
l9_41=l9_51;
l9_40=l9_47;
l9_39=l9_46;
l9_52++;
continue;
}
else
{
break;
}
}
l9_38=l9_43;
l9_37=l9_41;
l9_36=l9_39;
}
#else
{
l9_38=l9_20;
l9_37=l9_18;
l9_36=l9_16;
}
#endif
vec3 l9_61;
#if (sc_ProjectiveShadowsReceiver)
{
vec3 l9_62;
#if (sc_ProjectiveShadowsReceiver)
{
vec2 l9_63=abs(varShadowTex-vec2(0.5));
vec4 l9_64=texture(sc_ShadowTexture,varShadowTex)*step(max(l9_63.x,l9_63.y),0.5);
l9_62=mix(vec3(1.0),mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_64.xyz,vec3(sc_ShadowColor.w)),vec3(l9_64.w*sc_ShadowDensity));
}
#else
{
l9_62=vec3(1.0);
}
#endif
l9_61=l9_36*l9_62;
}
#else
{
l9_61=l9_36;
}
#endif
vec3 l9_65;
if ((sc_RayTracingReceiverEffectsMask&4)!=0)
{
vec2 l9_66=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec4 l9_67;
#if (sc_RayTracingShadowsLayout==2)
{
l9_67=texture(sc_RayTracingShadowsArrSC,sc_SamplingCoordsViewToGlobal(l9_66,sc_RayTracingShadowsLayout,sc_RayTracingShadowsGetStereoViewIndex()),0.0);
}
#else
{
l9_67=texture(sc_RayTracingShadows,sc_SamplingCoordsViewToGlobal(l9_66,sc_RayTracingShadowsLayout,sc_RayTracingShadowsGetStereoViewIndex()).xy,0.0);
}
#endif
l9_65=l9_61*(1.0-l9_67.x);
}
else
{
l9_65=l9_61;
}
vec3 l9_68;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
float l9_69=-l9_3.z;
float l9_70=l9_3.x;
vec2 l9_71=vec2((((l9_70<0.0) ? (-1.0) : 1.0)*acos(clamp(l9_69/length(vec2(l9_70,l9_69)),-1.0,1.0)))-1.5707964,acos(l9_3.y))/vec2(6.2831855,3.1415927);
float l9_72=l9_71.x+(sc_EnvmapRotation.y/360.0);
vec2 l9_73=vec2(l9_72,1.0-l9_71.y);
l9_73.x=fract((l9_72+floor(l9_72))+1.0);
vec4 l9_74;
#if (sc_EnvLightMode==sc_AmbientLightMode_FromCamera)
{
vec2 l9_75;
#if (SC_DEVICE_CLASS>=2)
{
l9_75=calcSeamlessPanoramicUvsForSampling(l9_73,sc_EnvmapSpecularSize.xy,5.0);
}
#else
{
l9_75=l9_73;
}
#endif
l9_74=sc_EnvmapSpecularSampleViewBias(l9_75,13.0);
}
#else
{
vec4 l9_76;
#if (sc_HasDiffuseEnvmap)
{
vec2 l9_77=calcSeamlessPanoramicUvsForSampling(l9_73,sc_EnvmapDiffuseSize.xy,0.0);
vec4 l9_78;
if (sc_RayTracingCasterConfiguration.x!=0u)
{
vec4 l9_79;
#if (sc_EnvmapDiffuseLayout==2)
{
l9_79=textureLod(sc_EnvmapDiffuseArrSC,sc_SamplingCoordsViewToGlobal(l9_77,sc_EnvmapDiffuseLayout,sc_EnvmapDiffuseGetStereoViewIndex()),0.0);
}
#else
{
l9_79=textureLod(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(l9_77,sc_EnvmapDiffuseLayout,sc_EnvmapDiffuseGetStereoViewIndex()).xy,0.0);
}
#endif
l9_78=l9_79;
}
else
{
vec4 l9_80;
#if (sc_EnvmapDiffuseLayout==2)
{
l9_80=texture(sc_EnvmapDiffuseArrSC,sc_SamplingCoordsViewToGlobal(l9_77,sc_EnvmapDiffuseLayout,sc_EnvmapDiffuseGetStereoViewIndex()),-13.0);
}
#else
{
l9_80=texture(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(l9_77,sc_EnvmapDiffuseLayout,sc_EnvmapDiffuseGetStereoViewIndex()).xy,-13.0);
}
#endif
l9_78=l9_80;
}
l9_76=l9_78;
}
#else
{
l9_76=sc_EnvmapSpecularSampleViewBias(l9_73,13.0);
}
#endif
l9_74=l9_76;
}
#endif
l9_68=(l9_74.xyz*(1.0/l9_74.w))*sc_EnvmapExposure;
}
#else
{
vec3 l9_81;
#if (sc_EnvLightMode==sc_AmbientLightMode_SphericalHarmonics)
{
vec3 l9_82=-l9_3;
float l9_83=l9_82.x;
float l9_84=l9_82.y;
float l9_85=l9_82.z;
l9_81=(((((((sc_Sh[8]*0.42904299)*((l9_83*l9_83)-(l9_84*l9_84)))+((sc_Sh[6]*0.74312502)*(l9_85*l9_85)))+(sc_Sh[0]*0.88622701))-(sc_Sh[6]*0.24770799))+((((sc_Sh[4]*(l9_83*l9_84))+(sc_Sh[7]*(l9_83*l9_85)))+(sc_Sh[5]*(l9_84*l9_85)))*0.85808599))+((((sc_Sh[3]*l9_83)+(sc_Sh[1]*l9_84))+(sc_Sh[2]*l9_85))*1.0233279))*sc_ShIntensity;
}
#else
{
l9_81=vec3(0.0);
}
#endif
l9_68=l9_81;
}
#endif
vec3 l9_86;
if ((sc_RayTracingReceiverEffectsMask&2)!=0)
{
vec2 l9_87=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec4 l9_88;
#if (sc_RayTracingGlobalIlluminationLayout==2)
{
l9_88=texture(sc_RayTracingGlobalIlluminationArrSC,sc_SamplingCoordsViewToGlobal(l9_87,sc_RayTracingGlobalIlluminationLayout,sc_RayTracingGlobalIlluminationGetStereoViewIndex()),0.0);
}
#else
{
l9_88=texture(sc_RayTracingGlobalIllumination,sc_SamplingCoordsViewToGlobal(l9_87,sc_RayTracingGlobalIlluminationLayout,sc_RayTracingGlobalIlluminationGetStereoViewIndex()).xy,0.0);
}
#endif
l9_86=mix(l9_68,l9_88.xyz,vec3(l9_88.w));
}
else
{
l9_86=l9_68;
}
vec3 l9_89;
#if (sc_AmbientLightsCount>0)
{
vec3 l9_90;
#if (sc_AmbientLightMode0==sc_AmbientLightMode_Constant)
{
l9_90=l9_86+(sc_AmbientLights[0].color*sc_AmbientLights[0].intensity);
}
#else
{
vec3 l9_91=l9_86;
l9_91.x=l9_86.x+(1e-06*sc_AmbientLights[0].color.x);
l9_90=l9_91;
}
#endif
l9_89=l9_90;
}
#else
{
l9_89=l9_86;
}
#endif
vec3 l9_92;
#if (sc_AmbientLightsCount>1)
{
vec3 l9_93;
#if (sc_AmbientLightMode1==sc_AmbientLightMode_Constant)
{
l9_93=l9_89+(sc_AmbientLights[1].color*sc_AmbientLights[1].intensity);
}
#else
{
vec3 l9_94=l9_89;
l9_94.x=l9_89.x+(1e-06*sc_AmbientLights[1].color.x);
l9_93=l9_94;
}
#endif
l9_92=l9_93;
}
#else
{
l9_92=l9_89;
}
#endif
vec3 l9_95;
#if (sc_AmbientLightsCount>2)
{
vec3 l9_96;
#if (sc_AmbientLightMode2==sc_AmbientLightMode_Constant)
{
l9_96=l9_92+(sc_AmbientLights[2].color*sc_AmbientLights[2].intensity);
}
#else
{
vec3 l9_97=l9_92;
l9_97.x=l9_92.x+(1e-06*sc_AmbientLights[2].color.x);
l9_96=l9_97;
}
#endif
l9_95=l9_96;
}
#else
{
l9_95=l9_92;
}
#endif
vec3 l9_98;
#if (sc_LightEstimation)
{
vec3 l9_99;
l9_99=sc_LightEstimationData.ambientLight;
vec3 l9_100;
int l9_101=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_101<sc_LightEstimationSGCount)
{
float l9_102=dot(sc_LightEstimationData.sg[l9_101].axis,l9_3);
float l9_103=exp(-sc_LightEstimationData.sg[l9_101].sharpness);
float l9_104=l9_103*l9_103;
float l9_105=1.0/sc_LightEstimationData.sg[l9_101].sharpness;
float l9_106=(1.0+(2.0*l9_104))-l9_105;
float l9_107=sqrt(1.0-l9_106);
float l9_108=0.36000001*l9_102;
float l9_109=(1.0/(4.0*0.36000001))*l9_107;
float l9_110=l9_108+l9_109;
float l9_111;
if (step(abs(l9_108),l9_109)>0.5)
{
l9_111=(l9_110*l9_110)/l9_107;
}
else
{
l9_111=clamp(l9_102,0.0,1.0);
}
l9_100=l9_99+((((sc_LightEstimationData.sg[l9_101].color/vec3(sc_LightEstimationData.sg[l9_101].sharpness))*6.2831855)*((l9_106*l9_111)+(((l9_103-l9_104)*l9_105)-l9_104)))/vec3(3.1415927));
l9_99=l9_100;
l9_101++;
continue;
}
else
{
break;
}
}
l9_98=l9_95+l9_99;
}
#else
{
l9_98=l9_95;
}
#endif
float l9_112;
vec3 l9_113;
vec3 l9_114;
vec3 l9_115;
#if (sc_BlendMode_ColoredGlass)
{
l9_115=vec3(0.0);
l9_114=vec3(0.0);
l9_113=ssSRGB_to_Linear(sc_GetFramebufferColor().xyz)*mix(vec3(1.0),l9_13,vec3(l9_0));
l9_112=1.0;
}
#else
{
l9_115=l9_65;
l9_114=l9_98;
l9_113=l9_37;
l9_112=l9_0;
}
#endif
bool l9_116;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_116=true;
}
#else
{
l9_116=false;
}
#endif
vec3 l9_117=l9_114*l9_11;
vec3 l9_118=l9_115+l9_117;
vec3 l9_119=l9_13*l9_118;
vec3 l9_120=l9_38*l9_10;
vec3 l9_121;
if (l9_116)
{
l9_121=l9_119*srgbToLinear(l9_112);
}
else
{
l9_121=l9_119;
}
vec3 l9_122=l9_121+(vec3(0.0)+l9_120);
vec3 l9_123=(l9_122+l9_6)+l9_113;
float l9_124=l9_123.x;
vec4 l9_125=vec4(l9_124,l9_123.yz,l9_112);
vec4 l9_126;
#if (sc_IsEditor)
{
vec4 l9_127=l9_125;
l9_127.x=l9_124+((l9_11.x*l9_10.x)*9.9999997e-06);
l9_126=l9_127;
}
#else
{
l9_126=l9_125;
}
#endif
if (sc_RayTracingCasterConfiguration.x!=0u)
{
return l9_126;
}
vec4 l9_128;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_129=l9_126.xyz*1.8;
vec3 l9_130=(l9_126.xyz*(l9_129+vec3(1.4)))/((l9_126.xyz*(l9_129+vec3(0.5)))+vec3(1.5));
l9_128=vec4(l9_130.x,l9_130.y,l9_130.z,l9_126.w);
}
#else
{
l9_128=l9_126;
}
#endif
vec3 l9_131=vec3(linearToSrgb(l9_128.x),linearToSrgb(l9_128.y),linearToSrgb(l9_128.z));
return vec4(l9_131.x,l9_131.y,l9_131.z,l9_128.w);
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
vec3 l9_1;
vec3 l9_2;
vec3 l9_3;
vec2 l9_4;
vec2 l9_5;
vec2 l9_6;
vec4 l9_7;
vec3 l9_8;
vec3 l9_9;
if (l9_0)
{
sc_RayTracingHitPayload l9_10=sc_RayTracingEvaluateHitPayload(ivec2(gl_FragCoord.xy));
vec3 l9_11=l9_10.positionWS;
vec3 l9_12=l9_10.normalWS;
vec4 l9_13=l9_10.tangentWS;
if (l9_10.id.x!=(sc_RayTracingCasterConfiguration.y&65535u))
{
return;
}
vec4 l9_14=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(l9_11,1.0);
vec3 l9_15=l9_13.xyz;
l9_9=l9_10.viewDirWS;
l9_8=l9_11;
l9_7=l9_10.color;
l9_6=l9_10.uv0;
l9_5=l9_10.uv1;
l9_4=((l9_14.xy/vec2(l9_14.w))*0.5)+vec2(0.5);
l9_3=l9_15;
l9_2=l9_12;
l9_1=cross(l9_12,l9_15)*l9_13.w;
}
else
{
vec3 l9_16=normalize(varTangent.xyz);
vec3 l9_17=normalize(varNormal);
l9_9=normalize(sc_Camera.position-varPos);
l9_8=varPos;
l9_7=varColor;
l9_6=varPackedTex.xy;
l9_5=varPackedTex.zw;
l9_4=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
l9_3=l9_16;
l9_2=l9_17;
l9_1=cross(l9_17,l9_16)*varTangent.w;
}
ssGlobals l9_18=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec3(0.0),l9_9,l9_8,l9_7,l9_6,l9_5,l9_4,l9_3,l9_2,l9_1);
vec4 l9_19;
#if (NODE_38_DROPLIST_ITEM==1)
{
vec3 l9_20;
Node80_If_else(0.0,vec3(0.0),vec3(0.0),l9_20,l9_18);
l9_19=l9_7*vec4(l9_20.x,l9_20.y,l9_20.z,vec4(0.0).w);
}
#else
{
vec3 l9_21;
Node80_If_else(0.0,vec3(0.0),vec3(0.0),l9_21,l9_18);
l9_19=vec4(l9_21.x,l9_21.y,l9_21.z,vec4(0.0).w);
}
#endif
vec4 param_4;
Node369_If_else(0.0,vec4(0.0),Port_Default_N369,param_4,l9_18);
vec4 l9_22=param_4;
float l9_23;
#if (ENABLE_OPACITY_TEX)
{
vec2 l9_24;
#if (NODE_69_DROPLIST_ITEM==0)
{
l9_24=l9_6;
}
#else
{
vec2 l9_25;
#if (NODE_69_DROPLIST_ITEM==1)
{
l9_25=l9_5;
}
#else
{
vec2 l9_26;
#if (NODE_69_DROPLIST_ITEM==2)
{
vec2 l9_27;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),l9_27,l9_18);
l9_26=l9_27;
}
#else
{
vec2 l9_28;
#if (NODE_69_DROPLIST_ITEM==3)
{
vec2 l9_29;
Node24_If_else(0.0,vec2(0.0),vec2(0.0),l9_29,l9_18);
l9_28=l9_29;
}
#else
{
l9_28=l9_6;
}
#endif
l9_26=l9_28;
}
#endif
l9_25=l9_26;
}
#endif
l9_24=l9_25;
}
#endif
vec4 l9_30;
#if (opacityTexLayout==2)
{
bool l9_31=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_32=l9_24.x;
sc_SoftwareWrapEarly(l9_32,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_33=l9_32;
float l9_34=l9_24.y;
sc_SoftwareWrapEarly(l9_34,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_35=l9_34;
vec2 l9_36;
float l9_37;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_38;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_38=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_38=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_39=l9_33;
float l9_40=1.0;
sc_ClampUV(l9_39,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_38,l9_40);
float l9_41=l9_39;
float l9_42=l9_40;
bool l9_43;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_43=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_43=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_44=l9_35;
float l9_45=l9_42;
sc_ClampUV(l9_44,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_43,l9_45);
l9_37=l9_45;
l9_36=vec2(l9_41,l9_44);
}
#else
{
l9_37=1.0;
l9_36=vec2(l9_33,l9_35);
}
#endif
vec2 l9_46=sc_TransformUV(l9_36,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_47=l9_46.x;
float l9_48=l9_37;
sc_SoftwareWrapLate(l9_47,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_31,l9_48);
float l9_49=l9_46.y;
float l9_50=l9_48;
sc_SoftwareWrapLate(l9_49,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_31,l9_50);
float l9_51=l9_50;
vec3 l9_52=sc_SamplingCoordsViewToGlobal(vec2(l9_47,l9_49),opacityTexLayout,opacityTexGetStereoViewIndex());
vec4 l9_53=texture(opacityTexArrSC,l9_52,0.0);
vec4 l9_54;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_54=mix(opacityTexBorderColor,l9_53,vec4(l9_51));
}
#else
{
l9_54=l9_53;
}
#endif
l9_30=l9_54;
}
#else
{
bool l9_55=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_56=l9_24.x;
sc_SoftwareWrapEarly(l9_56,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_57=l9_56;
float l9_58=l9_24.y;
sc_SoftwareWrapEarly(l9_58,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_59=l9_58;
vec2 l9_60;
float l9_61;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_62;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_62=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_62=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_63=l9_57;
float l9_64=1.0;
sc_ClampUV(l9_63,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_62,l9_64);
float l9_65=l9_63;
float l9_66=l9_64;
bool l9_67;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_67=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_67=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_68=l9_59;
float l9_69=l9_66;
sc_ClampUV(l9_68,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_67,l9_69);
l9_61=l9_69;
l9_60=vec2(l9_65,l9_68);
}
#else
{
l9_61=1.0;
l9_60=vec2(l9_57,l9_59);
}
#endif
vec2 l9_70=sc_TransformUV(l9_60,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_71=l9_70.x;
float l9_72=l9_61;
sc_SoftwareWrapLate(l9_71,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_55,l9_72);
float l9_73=l9_70.y;
float l9_74=l9_72;
sc_SoftwareWrapLate(l9_73,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_55,l9_74);
float l9_75=l9_74;
vec3 l9_76=sc_SamplingCoordsViewToGlobal(vec2(l9_71,l9_73),opacityTexLayout,opacityTexGetStereoViewIndex());
vec4 l9_77=texture(opacityTex,l9_76.xy,0.0);
vec4 l9_78;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_78=mix(opacityTexBorderColor,l9_77,vec4(l9_75));
}
#else
{
l9_78=l9_77;
}
#endif
l9_30=l9_78;
}
#endif
l9_23=l9_30.x;
}
#else
{
l9_23=Port_Default_N204;
}
#endif
float l9_79;
#if (NODE_38_DROPLIST_ITEM==1)
{
l9_79=l9_7.w;
}
#else
{
l9_79=Port_Input2_N072;
}
#endif
float l9_80=(baseColor*l9_22).w*l9_23;
float l9_81=l9_80*l9_79;
vec3 l9_82;
#if (ENABLE_NORMALMAP)
{
mat3 l9_83=mat3(l9_3,l9_1,l9_2);
vec2 l9_84;
#if (NODE_181_DROPLIST_ITEM==0)
{
l9_84=l9_6;
}
#else
{
vec2 l9_85;
#if (NODE_181_DROPLIST_ITEM==1)
{
l9_85=l9_5;
}
#else
{
vec2 l9_86;
#if (NODE_181_DROPLIST_ITEM==2)
{
vec2 l9_87;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),l9_87,l9_18);
l9_86=l9_87;
}
#else
{
vec2 l9_88;
#if (NODE_181_DROPLIST_ITEM==3)
{
vec2 l9_89;
Node24_If_else(0.0,vec2(0.0),vec2(0.0),l9_89,l9_18);
l9_88=l9_89;
}
#else
{
l9_88=l9_6;
}
#endif
l9_86=l9_88;
}
#endif
l9_85=l9_86;
}
#endif
l9_84=l9_85;
}
#endif
vec4 l9_90;
#if (normalTexLayout==2)
{
bool l9_91=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_92=l9_84.x;
sc_SoftwareWrapEarly(l9_92,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_93=l9_92;
float l9_94=l9_84.y;
sc_SoftwareWrapEarly(l9_94,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_95=l9_94;
vec2 l9_96;
float l9_97;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_98;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_98=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_98=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_99=l9_93;
float l9_100=1.0;
sc_ClampUV(l9_99,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_98,l9_100);
float l9_101=l9_99;
float l9_102=l9_100;
bool l9_103;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_103=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_103=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_104=l9_95;
float l9_105=l9_102;
sc_ClampUV(l9_104,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_103,l9_105);
l9_97=l9_105;
l9_96=vec2(l9_101,l9_104);
}
#else
{
l9_97=1.0;
l9_96=vec2(l9_93,l9_95);
}
#endif
vec2 l9_106=sc_TransformUV(l9_96,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_107=l9_106.x;
float l9_108=l9_97;
sc_SoftwareWrapLate(l9_107,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_91,l9_108);
float l9_109=l9_106.y;
float l9_110=l9_108;
sc_SoftwareWrapLate(l9_109,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_91,l9_110);
float l9_111=l9_110;
vec3 l9_112=sc_SamplingCoordsViewToGlobal(vec2(l9_107,l9_109),normalTexLayout,normalTexGetStereoViewIndex());
vec4 l9_113=texture(normalTexArrSC,l9_112,0.0);
vec4 l9_114;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_114=mix(normalTexBorderColor,l9_113,vec4(l9_111));
}
#else
{
l9_114=l9_113;
}
#endif
l9_90=l9_114;
}
#else
{
bool l9_115=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_116=l9_84.x;
sc_SoftwareWrapEarly(l9_116,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_117=l9_116;
float l9_118=l9_84.y;
sc_SoftwareWrapEarly(l9_118,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_119=l9_118;
vec2 l9_120;
float l9_121;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_122;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_122=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_122=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_123=l9_117;
float l9_124=1.0;
sc_ClampUV(l9_123,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_122,l9_124);
float l9_125=l9_123;
float l9_126=l9_124;
bool l9_127;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_127=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_127=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_128=l9_119;
float l9_129=l9_126;
sc_ClampUV(l9_128,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_127,l9_129);
l9_121=l9_129;
l9_120=vec2(l9_125,l9_128);
}
#else
{
l9_121=1.0;
l9_120=vec2(l9_117,l9_119);
}
#endif
vec2 l9_130=sc_TransformUV(l9_120,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_131=l9_130.x;
float l9_132=l9_121;
sc_SoftwareWrapLate(l9_131,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_115,l9_132);
float l9_133=l9_130.y;
float l9_134=l9_132;
sc_SoftwareWrapLate(l9_133,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_115,l9_134);
float l9_135=l9_134;
vec3 l9_136=sc_SamplingCoordsViewToGlobal(vec2(l9_131,l9_133),normalTexLayout,normalTexGetStereoViewIndex());
vec4 l9_137=texture(normalTex,l9_136.xy,0.0);
vec4 l9_138;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_138=mix(normalTexBorderColor,l9_137,vec4(l9_135));
}
#else
{
l9_138=l9_137;
}
#endif
l9_90=l9_138;
}
#endif
vec3 l9_139;
#if (ENABLE_DETAIL_NORMAL)
{
vec2 l9_140;
#if (NODE_184_DROPLIST_ITEM==0)
{
l9_140=l9_6;
}
#else
{
vec2 l9_141;
#if (NODE_184_DROPLIST_ITEM==1)
{
l9_141=l9_5;
}
#else
{
vec2 l9_142;
#if (NODE_184_DROPLIST_ITEM==2)
{
vec2 l9_143;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),l9_143,l9_18);
l9_142=l9_143;
}
#else
{
vec2 l9_144;
#if (NODE_184_DROPLIST_ITEM==3)
{
vec2 l9_145;
Node24_If_else(0.0,vec2(0.0),vec2(0.0),l9_145,l9_18);
l9_144=l9_145;
}
#else
{
l9_144=l9_6;
}
#endif
l9_142=l9_144;
}
#endif
l9_141=l9_142;
}
#endif
l9_140=l9_141;
}
#endif
vec4 l9_146;
#if (detailNormalTexLayout==2)
{
bool l9_147=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_148=l9_140.x;
sc_SoftwareWrapEarly(l9_148,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_149=l9_148;
float l9_150=l9_140.y;
sc_SoftwareWrapEarly(l9_150,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_151=l9_150;
vec2 l9_152;
float l9_153;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_154;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_154=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_154=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_155=l9_149;
float l9_156=1.0;
sc_ClampUV(l9_155,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_154,l9_156);
float l9_157=l9_155;
float l9_158=l9_156;
bool l9_159;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_159=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_159=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_160=l9_151;
float l9_161=l9_158;
sc_ClampUV(l9_160,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_159,l9_161);
l9_153=l9_161;
l9_152=vec2(l9_157,l9_160);
}
#else
{
l9_153=1.0;
l9_152=vec2(l9_149,l9_151);
}
#endif
vec2 l9_162=sc_TransformUV(l9_152,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_163=l9_162.x;
float l9_164=l9_153;
sc_SoftwareWrapLate(l9_163,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_147,l9_164);
float l9_165=l9_162.y;
float l9_166=l9_164;
sc_SoftwareWrapLate(l9_165,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_147,l9_166);
float l9_167=l9_166;
vec3 l9_168=sc_SamplingCoordsViewToGlobal(vec2(l9_163,l9_165),detailNormalTexLayout,detailNormalTexGetStereoViewIndex());
vec4 l9_169=texture(detailNormalTexArrSC,l9_168,0.0);
vec4 l9_170;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_170=mix(detailNormalTexBorderColor,l9_169,vec4(l9_167));
}
#else
{
l9_170=l9_169;
}
#endif
l9_146=l9_170;
}
#else
{
bool l9_171=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_172=l9_140.x;
sc_SoftwareWrapEarly(l9_172,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_173=l9_172;
float l9_174=l9_140.y;
sc_SoftwareWrapEarly(l9_174,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_175=l9_174;
vec2 l9_176;
float l9_177;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_178;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_178=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_178=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_179=l9_173;
float l9_180=1.0;
sc_ClampUV(l9_179,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_178,l9_180);
float l9_181=l9_179;
float l9_182=l9_180;
bool l9_183;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_183=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_183=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_184=l9_175;
float l9_185=l9_182;
sc_ClampUV(l9_184,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_183,l9_185);
l9_177=l9_185;
l9_176=vec2(l9_181,l9_184);
}
#else
{
l9_177=1.0;
l9_176=vec2(l9_173,l9_175);
}
#endif
vec2 l9_186=sc_TransformUV(l9_176,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_187=l9_186.x;
float l9_188=l9_177;
sc_SoftwareWrapLate(l9_187,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_171,l9_188);
float l9_189=l9_186.y;
float l9_190=l9_188;
sc_SoftwareWrapLate(l9_189,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_171,l9_190);
float l9_191=l9_190;
vec3 l9_192=sc_SamplingCoordsViewToGlobal(vec2(l9_187,l9_189),detailNormalTexLayout,detailNormalTexGetStereoViewIndex());
vec4 l9_193=texture(detailNormalTex,l9_192.xy,0.0);
vec4 l9_194;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_194=mix(detailNormalTexBorderColor,l9_193,vec4(l9_191));
}
#else
{
l9_194=l9_193;
}
#endif
l9_146=l9_194;
}
#endif
l9_139=((l9_146.xyz*1.9921875)-vec3(1.0)).xyz;
}
#else
{
l9_139=Port_Default_N113;
}
#endif
vec3 l9_195=mix(vec3(0.0,0.0,1.0),((l9_90.xyz*1.9921875)-vec3(1.0)).xyz,vec3(Port_Strength1_N200))+vec3(0.0,0.0,1.0);
vec3 l9_196=mix(vec3(0.0,0.0,1.0),l9_139,vec3(Port_Strength2_N200));
vec3 l9_197=l9_196*vec3(-1.0,-1.0,1.0);
vec3 l9_198=l9_83*normalize((l9_195*dot(l9_195,l9_197))-(l9_197*l9_195.z));
float l9_199=dot(l9_198,l9_198);
float l9_200;
if (l9_199>0.0)
{
l9_200=1.0/sqrt(l9_199);
}
else
{
l9_200=0.0;
}
l9_82=l9_198*l9_200;
}
#else
{
float l9_201=dot(l9_2,l9_2);
float l9_202;
if (l9_201>0.0)
{
l9_202=1.0/sqrt(l9_201);
}
else
{
l9_202=0.0;
}
l9_82=l9_2*l9_202;
}
#endif
vec3 l9_203;
#if (!sc_ProjectiveShadowsCaster)
{
l9_203=l9_82;
}
#else
{
l9_203=vec3(0.0);
}
#endif
float l9_204=clamp(l9_81,0.0,1.0);
#if (sc_BlendMode_AlphaTest)
{
if (l9_204<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_204<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec3 l9_205=max(l9_19.xyz,vec3(0.0));
vec4 l9_206;
#if (sc_ProjectiveShadowsCaster)
{
l9_206=vec4(l9_205,l9_204);
}
#else
{
l9_206=ngsCalculateLighting(l9_205,l9_204,l9_203,l9_8,l9_9,Port_Emissive_N036,0.0,1.0,Port_AO_N036,vec3(1.0));
}
#endif
vec4 l9_207=max(l9_206,vec4(0.0));
vec4 l9_208=l9_207*vec4(colorMultiplier+1.0);
float l9_209=l9_207.w;
vec4 l9_210=vec4(l9_208.x,l9_208.y,l9_208.z,vec4(0.0).w);
l9_210.w=l9_209;
if (l9_0)
{
vec4 l9_211;
#if (sc_RayTracingCasterForceOpaque)
{
vec4 l9_212=l9_210;
l9_212.w=1.0;
l9_211=l9_212;
}
#else
{
l9_211=l9_210;
}
#endif
sc_writeFragData0Internal(max(l9_211,vec4(0.0)),sc_UniformConstants.x,sc_ShaderCacheConstant);
return;
}
vec4 l9_213;
#if (sc_ProjectiveShadowsCaster)
{
float l9_214;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_214=l9_209;
}
#else
{
float l9_215;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_215=clamp(l9_209*2.0,0.0,1.0);
}
#else
{
float l9_216;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_216=clamp(dot(l9_210.xyz,vec3(l9_209)),0.0,1.0);
}
#else
{
float l9_217;
#if (sc_BlendMode_AlphaTest)
{
l9_217=1.0;
}
#else
{
float l9_218;
#if (sc_BlendMode_Multiply)
{
l9_218=(1.0-dot(l9_210.xyz,vec3(0.33333001)))*l9_209;
}
#else
{
float l9_219;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_219=(1.0-clamp(dot(l9_210.xyz,vec3(1.0)),0.0,1.0))*l9_209;
}
#else
{
float l9_220;
#if (sc_BlendMode_ColoredGlass)
{
l9_220=clamp(dot(l9_210.xyz,vec3(1.0)),0.0,1.0)*l9_209;
}
#else
{
float l9_221;
#if (sc_BlendMode_Add)
{
l9_221=clamp(dot(l9_210.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_222;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_222=clamp(dot(l9_210.xyz,vec3(1.0)),0.0,1.0)*l9_209;
}
#else
{
float l9_223;
#if (sc_BlendMode_Screen)
{
l9_223=dot(l9_210.xyz,vec3(0.33333001))*l9_209;
}
#else
{
float l9_224;
#if (sc_BlendMode_Min)
{
l9_224=1.0-clamp(dot(l9_210.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_225;
#if (sc_BlendMode_Max)
{
l9_225=clamp(dot(l9_210.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_225=1.0;
}
#endif
l9_224=l9_225;
}
#endif
l9_223=l9_224;
}
#endif
l9_222=l9_223;
}
#endif
l9_221=l9_222;
}
#endif
l9_220=l9_221;
}
#endif
l9_219=l9_220;
}
#endif
l9_218=l9_219;
}
#endif
l9_217=l9_218;
}
#endif
l9_216=l9_217;
}
#endif
l9_215=l9_216;
}
#endif
l9_214=l9_215;
}
#endif
l9_213=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_210.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_214);
}
#else
{
vec4 l9_226;
#if (sc_RenderAlphaToColor)
{
l9_226=vec4(l9_209);
}
#else
{
vec4 l9_227;
#if (sc_BlendMode_Custom)
{
vec3 l9_228=sc_GetFramebufferColor().xyz;
vec3 l9_229=mix(l9_228,definedBlend(l9_228,l9_210.xyz).xyz,vec3(l9_209));
vec4 l9_230=vec4(l9_229.x,l9_229.y,l9_229.z,vec4(0.0).w);
l9_230.w=1.0;
l9_227=l9_230;
}
#else
{
vec4 l9_231;
#if (sc_Voxelization)
{
l9_231=vec4(varScreenPos.xyz,1.0);
}
#else
{
vec4 l9_232;
#if (sc_OutputBounds)
{
float l9_233=clamp(abs(gl_FragCoord.z),0.0,1.0);
l9_232=vec4(l9_233,1.0-l9_233,1.0,1.0);
}
#else
{
vec4 l9_234;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_234=vec4(mix(vec3(1.0),l9_210.xyz,vec3(l9_209)),l9_209);
}
#else
{
vec4 l9_235;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_236;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_236=clamp(l9_209,0.0,1.0);
}
#else
{
l9_236=l9_209;
}
#endif
l9_235=vec4(l9_210.xyz*l9_236,l9_236);
}
#else
{
l9_235=l9_210;
}
#endif
l9_234=l9_235;
}
#endif
l9_232=l9_234;
}
#endif
l9_231=l9_232;
}
#endif
l9_227=l9_231;
}
#endif
l9_226=l9_227;
}
#endif
l9_213=l9_226;
}
#endif
vec4 l9_237;
if (PreviewEnabled==1)
{
vec4 l9_238;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_238=PreviewVertexColor;
}
else
{
l9_238=vec4(0.0);
}
l9_237=l9_238;
}
else
{
l9_237=l9_213;
}
vec4 l9_239=sc_OutputMotionVectorsIfNeeded(varPos,max(l9_237,vec4(0.0)));
vec4 l9_240=clamp(l9_239,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_241=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_241-0.0039215689)),min(1.0,l9_241+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_242=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_242).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_243=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_242).xy);
float l9_244=packValue(l9_243);
int l9_251=int(l9_240.w*255.0);
float l9_252=packValue(l9_251);
sc_writeFragData0Internal(vec4(packValue(l9_243),packValue(l9_243),packValue(l9_243),packValue(l9_243)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_244,packValue(l9_243),packValue(l9_243),packValue(l9_243)));
sc_writeFragData2(vec4(l9_252,packValue(l9_251),packValue(l9_251),packValue(l9_251)));
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
vec2 l9_255=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_255).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_256[8];
int l9_257[8];
int l9_258=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_258<8)
{
l9_256[l9_258]=0;
l9_257[l9_258]=0;
l9_258++;
continue;
}
else
{
break;
}
}
int l9_259;
#if (sc_OITMaxLayers8)
{
l9_259=2;
}
#else
{
l9_259=1;
}
#endif
int l9_260=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_260<l9_259)
{
vec4 l9_261;
vec4 l9_262;
vec4 l9_263;
if (l9_260==0)
{
l9_263=texture(sc_OITAlpha0,l9_255);
l9_262=texture(sc_OITDepthLow0,l9_255);
l9_261=texture(sc_OITDepthHigh0,l9_255);
}
else
{
l9_263=vec4(0.0);
l9_262=vec4(0.0);
l9_261=vec4(0.0);
}
vec4 l9_264;
vec4 l9_265;
vec4 l9_266;
if (l9_260==1)
{
l9_266=texture(sc_OITAlpha1,l9_255);
l9_265=texture(sc_OITDepthLow1,l9_255);
l9_264=texture(sc_OITDepthHigh1,l9_255);
}
else
{
l9_266=l9_263;
l9_265=l9_262;
l9_264=l9_261;
}
if (any(notEqual(l9_264,vec4(0.0)))||any(notEqual(l9_265,vec4(0.0))))
{
int l9_267[8]=l9_256;
unpackValues(l9_264.w,l9_260,l9_267);
unpackValues(l9_264.z,l9_260,l9_267);
unpackValues(l9_264.y,l9_260,l9_267);
unpackValues(l9_264.x,l9_260,l9_267);
unpackValues(l9_265.w,l9_260,l9_267);
unpackValues(l9_265.z,l9_260,l9_267);
unpackValues(l9_265.y,l9_260,l9_267);
unpackValues(l9_265.x,l9_260,l9_267);
int l9_276[8]=l9_257;
unpackValues(l9_266.w,l9_260,l9_276);
unpackValues(l9_266.z,l9_260,l9_276);
unpackValues(l9_266.y,l9_260,l9_276);
unpackValues(l9_266.x,l9_260,l9_276);
}
l9_260++;
continue;
}
else
{
break;
}
}
vec4 l9_281=texture(sc_OITFilteredDepthBoundsTexture,l9_255);
vec2 l9_282=l9_281.xy;
int l9_283;
#if (sc_SkinBonesCount>0)
{
l9_283=encodeDepth(((1.0-l9_281.x)*1000.0)+getDepthOrderingEpsilon(),l9_282);
}
#else
{
l9_283=0;
}
#endif
int l9_284=encodeDepth(viewSpaceDepth(),l9_282);
vec4 l9_285;
l9_285=l9_240*l9_240.w;
vec4 l9_286;
int l9_287=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_287<8)
{
int l9_288=l9_256[l9_287];
int l9_289=l9_284-l9_283;
bool l9_290=l9_288<l9_289;
bool l9_291;
if (l9_290)
{
l9_291=l9_256[l9_287]>0;
}
else
{
l9_291=l9_290;
}
if (l9_291)
{
vec3 l9_292=l9_285.xyz*(1.0-(float(l9_257[l9_287])/255.0));
l9_286=vec4(l9_292.x,l9_292.y,l9_292.z,l9_285.w);
}
else
{
l9_286=l9_285;
}
l9_285=l9_286;
l9_287++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_285,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
sc_writeFragData0Internal(l9_240,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_239,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
