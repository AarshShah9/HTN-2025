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
//sampler sampler baseTexSmpSC 0:32
//sampler sampler detailNormalTexSmpSC 0:33
//sampler sampler emissiveTexSmpSC 0:34
//sampler sampler intensityTextureSmpSC 0:35
//sampler sampler materialParamsTexSmpSC 0:36
//sampler sampler normalTexSmpSC 0:37
//sampler sampler opacityTexSmpSC 0:38
//sampler sampler reflectionModulationTexSmpSC 0:39
//sampler sampler reflectionTexSmpSC 0:40
//sampler sampler rimColorTexSmpSC 0:41
//sampler sampler sc_EnvmapDiffuseSmpSC 0:42
//sampler sampler sc_EnvmapSpecularSmpSC 0:43
//sampler sampler sc_OITCommonSampler 0:44
//sampler sampler sc_RayTracingGlobalIlluminationSmpSC 0:45
//sampler sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC 0:46
//sampler sampler sc_RayTracingRayDirectionSmpSC 0:47
//sampler sampler sc_RayTracingReflectionsSmpSC 0:48
//sampler sampler sc_RayTracingShadowsSmpSC 0:49
//sampler sampler sc_SSAOTextureSmpSC 0:50
//sampler sampler sc_ScreenTextureSmpSC 0:51
//sampler sampler sc_ShadowTextureSmpSC 0:52
//texture texture2D baseTex 0:3:0:32
//texture texture2D detailNormalTex 0:4:0:33
//texture texture2D emissiveTex 0:5:0:34
//texture texture2D intensityTexture 0:6:0:35
//texture texture2D materialParamsTex 0:7:0:36
//texture texture2D normalTex 0:8:0:37
//texture texture2D opacityTex 0:9:0:38
//texture texture2D reflectionModulationTex 0:10:0:39
//texture texture2D reflectionTex 0:11:0:40
//texture texture2D rimColorTex 0:12:0:41
//texture texture2D sc_EnvmapDiffuse 0:13:0:42
//texture texture2D sc_EnvmapSpecular 0:14:0:43
//texture texture2D sc_OITAlpha0 0:15:0:44
//texture texture2D sc_OITAlpha1 0:16:0:44
//texture texture2D sc_OITDepthHigh0 0:17:0:44
//texture texture2D sc_OITDepthHigh1 0:18:0:44
//texture texture2D sc_OITDepthLow0 0:19:0:44
//texture texture2D sc_OITDepthLow1 0:20:0:44
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:21:0:44
//texture texture2D sc_OITFrontDepthTexture 0:22:0:44
//texture texture2D sc_RayTracingGlobalIllumination 0:23:0:45
//texture utexture2D sc_RayTracingHitCasterIdAndBarycentric 0:24:0:46
//texture texture2D sc_RayTracingRayDirection 0:25:0:47
//texture texture2D sc_RayTracingReflections 0:26:0:48
//texture texture2D sc_RayTracingShadows 0:27:0:49
//texture texture2D sc_SSAOTexture 0:28:0:50
//texture texture2D sc_ScreenTexture 0:29:0:51
//texture texture2D sc_ShadowTexture 0:30:0:52
//texture texture2DArray baseTexArrSC 0:54:0:32
//texture texture2DArray detailNormalTexArrSC 0:55:0:33
//texture texture2DArray emissiveTexArrSC 0:56:0:34
//texture texture2DArray intensityTextureArrSC 0:57:0:35
//texture texture2DArray materialParamsTexArrSC 0:58:0:36
//texture texture2DArray normalTexArrSC 0:59:0:37
//texture texture2DArray opacityTexArrSC 0:60:0:38
//texture texture2DArray reflectionModulationTexArrSC 0:61:0:39
//texture texture2DArray reflectionTexArrSC 0:62:0:40
//texture texture2DArray rimColorTexArrSC 0:63:0:41
//texture texture2DArray sc_EnvmapDiffuseArrSC 0:64:0:42
//texture texture2DArray sc_EnvmapSpecularArrSC 0:65:0:43
//texture texture2DArray sc_RayTracingGlobalIlluminationArrSC 0:66:0:45
//texture texture2DArray sc_RayTracingReflectionsArrSC 0:68:0:48
//texture texture2DArray sc_RayTracingShadowsArrSC 0:69:0:49
//texture texture2DArray sc_ScreenTextureArrSC 0:70:0:51
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
//spec_const bool ENABLE_EMISSIVE 32 0
//spec_const bool ENABLE_NORMALMAP 33 0
//spec_const bool ENABLE_OPACITY_TEX 34 0
//spec_const bool ENABLE_RECOLOR 35 0
//spec_const bool ENABLE_RIM_HIGHLIGHT 36 0
//spec_const bool ENABLE_RIM_INVERT 37 0
//spec_const bool ENABLE_SIMPLE_REFLECTION 38 0
//spec_const bool ENABLE_SPECULAR_AO 39 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 40 0
//spec_const bool ENABLE_UV2 41 0
//spec_const bool ENABLE_UV3 42 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 43 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 44 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTex 45 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 46 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 47 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 48 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 49 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 50 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionTex 51 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_rimColorTex 52 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 53 0
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 54 0
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTex 55 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 56 0
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 57 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 58 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 59 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionModulationTex 60 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionTex 61 0
//spec_const bool SC_USE_UV_MIN_MAX_rimColorTex 62 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 63 0
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 64 0
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTex 65 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 66 0
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 67 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 68 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 69 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionModulationTex 70 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionTex 71 0
//spec_const bool SC_USE_UV_TRANSFORM_rimColorTex 72 0
//spec_const bool Tweak_N177 73 0
//spec_const bool Tweak_N216 74 0
//spec_const bool UseViewSpaceDepthVariant 75 1
//spec_const bool baseTexHasSwappedViews 76 0
//spec_const bool detailNormalTexHasSwappedViews 77 0
//spec_const bool emissiveTexHasSwappedViews 78 0
//spec_const bool intensityTextureHasSwappedViews 79 0
//spec_const bool materialParamsTexHasSwappedViews 80 0
//spec_const bool normalTexHasSwappedViews 81 0
//spec_const bool opacityTexHasSwappedViews 82 0
//spec_const bool reflectionModulationTexHasSwappedViews 83 0
//spec_const bool reflectionTexHasSwappedViews 84 0
//spec_const bool rimColorTexHasSwappedViews 85 0
//spec_const bool sc_BlendMode_Add 86 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 87 0
//spec_const bool sc_BlendMode_AlphaTest 88 0
//spec_const bool sc_BlendMode_AlphaToCoverage 89 0
//spec_const bool sc_BlendMode_ColoredGlass 90 0
//spec_const bool sc_BlendMode_Custom 91 0
//spec_const bool sc_BlendMode_Max 92 0
//spec_const bool sc_BlendMode_Min 93 0
//spec_const bool sc_BlendMode_Multiply 94 0
//spec_const bool sc_BlendMode_MultiplyOriginal 95 0
//spec_const bool sc_BlendMode_Normal 96 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 97 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 98 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 99 0
//spec_const bool sc_BlendMode_Screen 100 0
//spec_const bool sc_DepthOnly 101 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 102 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 103 0
//spec_const bool sc_FramebufferFetch 104 0
//spec_const bool sc_HasDiffuseEnvmap 105 0
//spec_const bool sc_IsEditor 106 0
//spec_const bool sc_LightEstimation 107 0
//spec_const bool sc_MotionVectorsPass 108 0
//spec_const bool sc_OITCompositingPass 109 0
//spec_const bool sc_OITDepthBoundsPass 110 0
//spec_const bool sc_OITDepthGatherPass 111 0
//spec_const bool sc_OITDepthPrepass 112 0
//spec_const bool sc_OITFrontLayerPass 113 0
//spec_const bool sc_OITMaxLayers4Plus1 114 0
//spec_const bool sc_OITMaxLayers8 115 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 116 0
//spec_const bool sc_OutputBounds 117 0
//spec_const bool sc_ProjectiveShadowsCaster 118 0
//spec_const bool sc_ProjectiveShadowsReceiver 119 0
//spec_const bool sc_RayTracingCasterForceOpaque 120 0
//spec_const bool sc_RayTracingGlobalIlluminationHasSwappedViews 121 0
//spec_const bool sc_RayTracingReflectionsHasSwappedViews 122 0
//spec_const bool sc_RayTracingShadowsHasSwappedViews 123 0
//spec_const bool sc_RenderAlphaToColor 124 0
//spec_const bool sc_SSAOEnabled 125 0
//spec_const bool sc_ScreenTextureHasSwappedViews 126 0
//spec_const bool sc_TAAEnabled 127 0
//spec_const bool sc_VertexBlending 128 0
//spec_const bool sc_VertexBlendingUseNormals 129 0
//spec_const bool sc_Voxelization 130 0
//spec_const bool uv2EnableAnimation 131 0
//spec_const bool uv3EnableAnimation 132 0
//spec_const int NODE_13_DROPLIST_ITEM 133 0
//spec_const int NODE_181_DROPLIST_ITEM 134 0
//spec_const int NODE_184_DROPLIST_ITEM 135 0
//spec_const int NODE_221_DROPLIST_ITEM 136 0
//spec_const int NODE_228_DROPLIST_ITEM 137 0
//spec_const int NODE_27_DROPLIST_ITEM 138 0
//spec_const int NODE_315_DROPLIST_ITEM 139 0
//spec_const int NODE_38_DROPLIST_ITEM 140 0
//spec_const int NODE_49_DROPLIST_ITEM 141 0
//spec_const int NODE_69_DROPLIST_ITEM 142 0
//spec_const int NODE_76_DROPLIST_ITEM 143 0
//spec_const int SC_DEVICE_CLASS 144 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 145 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 146 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTex 147 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 148 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 149 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 150 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 151 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex 152 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionTex 153 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_rimColorTex 154 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 155 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 156 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTex 157 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 158 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 159 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 160 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 161 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex 162 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionTex 163 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_rimColorTex 164 -1
//spec_const int baseTexLayout 165 0
//spec_const int detailNormalTexLayout 166 0
//spec_const int emissiveTexLayout 167 0
//spec_const int intensityTextureLayout 168 0
//spec_const int materialParamsTexLayout 169 0
//spec_const int normalTexLayout 170 0
//spec_const int opacityTexLayout 171 0
//spec_const int reflectionModulationTexLayout 172 0
//spec_const int reflectionTexLayout 173 0
//spec_const int rimColorTexLayout 174 0
//spec_const int sc_AmbientLightMode0 175 0
//spec_const int sc_AmbientLightMode1 176 0
//spec_const int sc_AmbientLightMode2 177 0
//spec_const int sc_AmbientLightMode_Constant 178 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 179 0
//spec_const int sc_AmbientLightMode_FromCamera 180 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 181 0
//spec_const int sc_AmbientLightsCount 182 0
//spec_const int sc_DepthBufferMode 183 0
//spec_const int sc_DirectionalLightsCount 184 0
//spec_const int sc_EnvLightMode 185 0
//spec_const int sc_EnvmapDiffuseLayout 186 0
//spec_const int sc_EnvmapSpecularLayout 187 0
//spec_const int sc_LightEstimationSGCount 188 0
//spec_const int sc_PointLightsCount 189 0
//spec_const int sc_RayTracingGlobalIlluminationLayout 190 0
//spec_const int sc_RayTracingReflectionsLayout 191 0
//spec_const int sc_RayTracingShadowsLayout 192 0
//spec_const int sc_RenderingSpace 193 -1
//spec_const int sc_ScreenTextureLayout 194 0
//spec_const int sc_ShaderCacheConstant 195 0
//spec_const int sc_SkinBonesCount 196 0
//spec_const int sc_StereoRenderingMode 197 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 198 0
//spec_const int sc_StereoViewID 199 0
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
vec2 N7_TransformedUV2;
vec2 N7_TransformedUV3;
vec3 BumpedNormal;
vec3 ViewDirWS;
vec3 PositionWS;
vec3 VertexNormal_WorldSpace;
vec3 VertexTangent_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
vec2 Surface_UVCoord1;
vec4 VertexColor;
vec2 gScreenCoord;
vec3 SurfacePosition_WorldSpace;
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
#ifndef emissiveTexHasSwappedViews
#define emissiveTexHasSwappedViews 0
#elif emissiveTexHasSwappedViews==1
#undef emissiveTexHasSwappedViews
#define emissiveTexHasSwappedViews 1
#endif
#ifndef emissiveTexLayout
#define emissiveTexLayout 0
#endif
#ifndef reflectionTexHasSwappedViews
#define reflectionTexHasSwappedViews 0
#elif reflectionTexHasSwappedViews==1
#undef reflectionTexHasSwappedViews
#define reflectionTexHasSwappedViews 1
#endif
#ifndef reflectionTexLayout
#define reflectionTexLayout 0
#endif
#ifndef reflectionModulationTexHasSwappedViews
#define reflectionModulationTexHasSwappedViews 0
#elif reflectionModulationTexHasSwappedViews==1
#undef reflectionModulationTexHasSwappedViews
#define reflectionModulationTexHasSwappedViews 1
#endif
#ifndef reflectionModulationTexLayout
#define reflectionModulationTexLayout 0
#endif
#ifndef rimColorTexHasSwappedViews
#define rimColorTexHasSwappedViews 0
#elif rimColorTexHasSwappedViews==1
#undef rimColorTexHasSwappedViews
#define rimColorTexHasSwappedViews 1
#endif
#ifndef rimColorTexLayout
#define rimColorTexLayout 0
#endif
#ifndef materialParamsTexHasSwappedViews
#define materialParamsTexHasSwappedViews 0
#elif materialParamsTexHasSwappedViews==1
#undef materialParamsTexHasSwappedViews
#define materialParamsTexHasSwappedViews 1
#endif
#ifndef materialParamsTexLayout
#define materialParamsTexLayout 0
#endif
#ifndef NODE_38_DROPLIST_ITEM
#define NODE_38_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 0
#elif ENABLE_BASE_TEX==1
#undef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 1
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
#ifndef NODE_27_DROPLIST_ITEM
#define NODE_27_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_RECOLOR
#define ENABLE_RECOLOR 0
#elif ENABLE_RECOLOR==1
#undef ENABLE_RECOLOR
#define ENABLE_RECOLOR 1
#endif
#ifndef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 0
#elif ENABLE_OPACITY_TEX==1
#undef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 1
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
#ifndef NODE_69_DROPLIST_ITEM
#define NODE_69_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 0
#elif ENABLE_NORMALMAP==1
#undef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 1
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
#ifndef NODE_181_DROPLIST_ITEM
#define NODE_181_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 0
#elif ENABLE_DETAIL_NORMAL==1
#undef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 1
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
#ifndef NODE_184_DROPLIST_ITEM
#define NODE_184_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 0
#elif ENABLE_EMISSIVE==1
#undef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_emissiveTex
#define SC_USE_UV_TRANSFORM_emissiveTex 0
#elif SC_USE_UV_TRANSFORM_emissiveTex==1
#undef SC_USE_UV_TRANSFORM_emissiveTex
#define SC_USE_UV_TRANSFORM_emissiveTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_emissiveTex
#define SC_SOFTWARE_WRAP_MODE_U_emissiveTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_emissiveTex
#define SC_SOFTWARE_WRAP_MODE_V_emissiveTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_emissiveTex
#define SC_USE_UV_MIN_MAX_emissiveTex 0
#elif SC_USE_UV_MIN_MAX_emissiveTex==1
#undef SC_USE_UV_MIN_MAX_emissiveTex
#define SC_USE_UV_MIN_MAX_emissiveTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_emissiveTex
#define SC_USE_CLAMP_TO_BORDER_emissiveTex 0
#elif SC_USE_CLAMP_TO_BORDER_emissiveTex==1
#undef SC_USE_CLAMP_TO_BORDER_emissiveTex
#define SC_USE_CLAMP_TO_BORDER_emissiveTex 1
#endif
#ifndef NODE_76_DROPLIST_ITEM
#define NODE_76_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_SIMPLE_REFLECTION
#define ENABLE_SIMPLE_REFLECTION 0
#elif ENABLE_SIMPLE_REFLECTION==1
#undef ENABLE_SIMPLE_REFLECTION
#define ENABLE_SIMPLE_REFLECTION 1
#endif
#ifndef SC_USE_UV_TRANSFORM_reflectionTex
#define SC_USE_UV_TRANSFORM_reflectionTex 0
#elif SC_USE_UV_TRANSFORM_reflectionTex==1
#undef SC_USE_UV_TRANSFORM_reflectionTex
#define SC_USE_UV_TRANSFORM_reflectionTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_reflectionTex
#define SC_SOFTWARE_WRAP_MODE_U_reflectionTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_reflectionTex
#define SC_SOFTWARE_WRAP_MODE_V_reflectionTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_reflectionTex
#define SC_USE_UV_MIN_MAX_reflectionTex 0
#elif SC_USE_UV_MIN_MAX_reflectionTex==1
#undef SC_USE_UV_MIN_MAX_reflectionTex
#define SC_USE_UV_MIN_MAX_reflectionTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_reflectionTex
#define SC_USE_CLAMP_TO_BORDER_reflectionTex 0
#elif SC_USE_CLAMP_TO_BORDER_reflectionTex==1
#undef SC_USE_CLAMP_TO_BORDER_reflectionTex
#define SC_USE_CLAMP_TO_BORDER_reflectionTex 1
#endif
#ifndef Tweak_N177
#define Tweak_N177 0
#elif Tweak_N177==1
#undef Tweak_N177
#define Tweak_N177 1
#endif
#ifndef NODE_228_DROPLIST_ITEM
#define NODE_228_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_reflectionModulationTex
#define SC_USE_UV_TRANSFORM_reflectionModulationTex 0
#elif SC_USE_UV_TRANSFORM_reflectionModulationTex==1
#undef SC_USE_UV_TRANSFORM_reflectionModulationTex
#define SC_USE_UV_TRANSFORM_reflectionModulationTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex
#define SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex
#define SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_reflectionModulationTex
#define SC_USE_UV_MIN_MAX_reflectionModulationTex 0
#elif SC_USE_UV_MIN_MAX_reflectionModulationTex==1
#undef SC_USE_UV_MIN_MAX_reflectionModulationTex
#define SC_USE_UV_MIN_MAX_reflectionModulationTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_reflectionModulationTex
#define SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 0
#elif SC_USE_CLAMP_TO_BORDER_reflectionModulationTex==1
#undef SC_USE_CLAMP_TO_BORDER_reflectionModulationTex
#define SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 1
#endif
#ifndef ENABLE_RIM_HIGHLIGHT
#define ENABLE_RIM_HIGHLIGHT 0
#elif ENABLE_RIM_HIGHLIGHT==1
#undef ENABLE_RIM_HIGHLIGHT
#define ENABLE_RIM_HIGHLIGHT 1
#endif
#ifndef Tweak_N216
#define Tweak_N216 0
#elif Tweak_N216==1
#undef Tweak_N216
#define Tweak_N216 1
#endif
#ifndef ENABLE_RIM_INVERT
#define ENABLE_RIM_INVERT 0
#elif ENABLE_RIM_INVERT==1
#undef ENABLE_RIM_INVERT
#define ENABLE_RIM_INVERT 1
#endif
#ifndef SC_USE_UV_TRANSFORM_rimColorTex
#define SC_USE_UV_TRANSFORM_rimColorTex 0
#elif SC_USE_UV_TRANSFORM_rimColorTex==1
#undef SC_USE_UV_TRANSFORM_rimColorTex
#define SC_USE_UV_TRANSFORM_rimColorTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_rimColorTex
#define SC_SOFTWARE_WRAP_MODE_U_rimColorTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_rimColorTex
#define SC_SOFTWARE_WRAP_MODE_V_rimColorTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_rimColorTex
#define SC_USE_UV_MIN_MAX_rimColorTex 0
#elif SC_USE_UV_MIN_MAX_rimColorTex==1
#undef SC_USE_UV_MIN_MAX_rimColorTex
#define SC_USE_UV_MIN_MAX_rimColorTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_rimColorTex
#define SC_USE_CLAMP_TO_BORDER_rimColorTex 0
#elif SC_USE_CLAMP_TO_BORDER_rimColorTex==1
#undef SC_USE_CLAMP_TO_BORDER_rimColorTex
#define SC_USE_CLAMP_TO_BORDER_rimColorTex 1
#endif
#ifndef NODE_315_DROPLIST_ITEM
#define NODE_315_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_materialParamsTex
#define SC_USE_UV_TRANSFORM_materialParamsTex 0
#elif SC_USE_UV_TRANSFORM_materialParamsTex==1
#undef SC_USE_UV_TRANSFORM_materialParamsTex
#define SC_USE_UV_TRANSFORM_materialParamsTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_materialParamsTex
#define SC_SOFTWARE_WRAP_MODE_U_materialParamsTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_materialParamsTex
#define SC_SOFTWARE_WRAP_MODE_V_materialParamsTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_materialParamsTex
#define SC_USE_UV_MIN_MAX_materialParamsTex 0
#elif SC_USE_UV_MIN_MAX_materialParamsTex==1
#undef SC_USE_UV_MIN_MAX_materialParamsTex
#define SC_USE_UV_MIN_MAX_materialParamsTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_materialParamsTex
#define SC_USE_CLAMP_TO_BORDER_materialParamsTex 0
#elif SC_USE_CLAMP_TO_BORDER_materialParamsTex==1
#undef SC_USE_CLAMP_TO_BORDER_materialParamsTex
#define SC_USE_CLAMP_TO_BORDER_materialParamsTex 1
#endif
#ifndef NODE_221_DROPLIST_ITEM
#define NODE_221_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_UV2
#define ENABLE_UV2 0
#elif ENABLE_UV2==1
#undef ENABLE_UV2
#define ENABLE_UV2 1
#endif
#ifndef NODE_13_DROPLIST_ITEM
#define NODE_13_DROPLIST_ITEM 0
#endif
#ifndef uv2EnableAnimation
#define uv2EnableAnimation 0
#elif uv2EnableAnimation==1
#undef uv2EnableAnimation
#define uv2EnableAnimation 1
#endif
#ifndef ENABLE_UV3
#define ENABLE_UV3 0
#elif ENABLE_UV3==1
#undef ENABLE_UV3
#define ENABLE_UV3 1
#endif
#ifndef NODE_49_DROPLIST_ITEM
#define NODE_49_DROPLIST_ITEM 0
#endif
#ifndef uv3EnableAnimation
#define uv3EnableAnimation 0
#elif uv3EnableAnimation==1
#undef uv3EnableAnimation
#define uv3EnableAnimation 1
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
uniform mat3 baseTexTransform;
uniform vec4 baseTexUvMinMax;
uniform vec4 baseTexBorderColor;
uniform mat3 opacityTexTransform;
uniform vec4 opacityTexUvMinMax;
uniform vec4 opacityTexBorderColor;
uniform mat3 normalTexTransform;
uniform vec4 normalTexUvMinMax;
uniform vec4 normalTexBorderColor;
uniform mat3 detailNormalTexTransform;
uniform vec4 detailNormalTexUvMinMax;
uniform vec4 detailNormalTexBorderColor;
uniform mat3 emissiveTexTransform;
uniform vec4 emissiveTexUvMinMax;
uniform vec4 emissiveTexBorderColor;
uniform mat3 reflectionTexTransform;
uniform vec4 reflectionTexUvMinMax;
uniform vec4 reflectionTexBorderColor;
uniform mat3 reflectionModulationTexTransform;
uniform vec4 reflectionModulationTexUvMinMax;
uniform vec4 reflectionModulationTexBorderColor;
uniform mat3 rimColorTexTransform;
uniform vec4 rimColorTexUvMinMax;
uniform vec4 rimColorTexBorderColor;
uniform mat3 materialParamsTexTransform;
uniform vec4 materialParamsTexUvMinMax;
uniform vec4 materialParamsTexBorderColor;
uniform vec4 baseColor;
uniform vec3 emissiveColor;
uniform float emissiveIntensity;
uniform float reflectionIntensity;
uniform vec3 rimColor;
uniform float rimIntensity;
uniform float rimExponent;
uniform float roughness;
uniform vec2 uv2Scale;
uniform vec2 uv2Offset;
uniform vec2 uv3Scale;
uniform vec2 uv3Offset;
uniform vec4 sc_Time;
uniform sampler2D baseTex;
uniform sampler2DArray baseTexArrSC;
uniform sampler2D opacityTex;
uniform sampler2DArray opacityTexArrSC;
uniform sampler2D normalTex;
uniform sampler2DArray normalTexArrSC;
uniform sampler2D detailNormalTex;
uniform sampler2DArray detailNormalTexArrSC;
uniform sampler2D emissiveTex;
uniform sampler2DArray emissiveTexArrSC;
uniform sampler2D reflectionTex;
uniform sampler2DArray reflectionTexArrSC;
uniform sampler2D reflectionModulationTex;
uniform sampler2DArray reflectionModulationTexArrSC;
uniform sampler2D rimColorTex;
uniform sampler2DArray rimColorTexArrSC;
uniform sampler2D materialParamsTex;
uniform sampler2DArray materialParamsTexArrSC;
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
in vec4 varScreenPos;
layout(location=0) out uvec4 sc_RayTracingPositionAndMask;
layout(location=1) out uvec4 sc_RayTracingNormalAndMore;
in vec3 varPos;
in vec3 varNormal;
in vec4 varTangent;
in vec4 varPackedTex;
in vec4 varColor;
in vec2 varScreenTexturePos;
in float varViewSpaceDepth;
in vec4 PreviewVertexColor;
in float PreviewVertexSaved;
bool N7_EnableUV2;
ssGlobals tempGlobals;
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
vec2 N7_gettransformUV(int pickUV,vec2 scale,vec2 offset,bool animated,bool enabled)
{
vec2 l9_0=tempGlobals.Surface_UVCoord0;
vec2 l9_1;
if (enabled==N7_EnableUV2)
{
vec2 l9_2;
if (pickUV==0)
{
l9_2=tempGlobals.Surface_UVCoord0;
}
else
{
l9_2=l9_0;
}
vec2 l9_3;
if (pickUV==1)
{
l9_3=tempGlobals.Surface_UVCoord1;
}
else
{
l9_3=l9_2;
}
vec2 l9_4;
if (pickUV==2)
{
l9_4=tempGlobals.gScreenCoord;
}
else
{
l9_4=l9_3;
}
l9_1=l9_4;
}
else
{
vec2 l9_5;
if (pickUV==0)
{
l9_5=tempGlobals.Surface_UVCoord0;
}
else
{
l9_5=l9_0;
}
vec2 l9_6;
if (pickUV==1)
{
l9_6=tempGlobals.Surface_UVCoord1;
}
else
{
l9_6=l9_5;
}
vec2 l9_7;
if (pickUV==2)
{
l9_7=tempGlobals.gScreenCoord;
}
else
{
l9_7=l9_6;
}
vec2 l9_8;
if (pickUV==3)
{
l9_8=tempGlobals.N7_TransformedUV2;
}
else
{
l9_8=l9_7;
}
l9_1=l9_8;
}
vec2 l9_9=scale;
vec2 l9_10=l9_1*l9_9;
vec2 l9_11=offset;
vec2 l9_12=l9_10+l9_11;
vec2 l9_13;
if (animated)
{
l9_13=l9_12+(offset*tempGlobals.gTimeElapsed);
}
else
{
l9_13=l9_12;
}
return l9_13;
}
vec2 N7_getUV(int pickUV)
{
vec2 l9_0=tempGlobals.Surface_UVCoord0;
vec2 l9_1;
if (pickUV==0)
{
l9_1=tempGlobals.Surface_UVCoord0;
}
else
{
l9_1=l9_0;
}
vec2 l9_2;
if (pickUV==1)
{
l9_2=tempGlobals.Surface_UVCoord1;
}
else
{
l9_2=l9_1;
}
vec2 l9_3;
if (pickUV==2)
{
l9_3=tempGlobals.N7_TransformedUV2;
}
else
{
l9_3=l9_2;
}
vec2 l9_4;
if (pickUV==3)
{
l9_4=tempGlobals.N7_TransformedUV3;
}
else
{
l9_4=l9_3;
}
return l9_4;
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
int emissiveTexGetStereoViewIndex()
{
int l9_0;
#if (emissiveTexHasSwappedViews)
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
vec3 ssPow(vec3 A,vec3 B)
{
float l9_0;
if (A.x<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(A.x,B.x);
}
float l9_1;
if (A.y<=0.0)
{
l9_1=0.0;
}
else
{
l9_1=pow(A.y,B.y);
}
float l9_2;
if (A.z<=0.0)
{
l9_2=0.0;
}
else
{
l9_2=pow(A.z,B.z);
}
return vec3(l9_0,l9_1,l9_2);
}
int reflectionTexGetStereoViewIndex()
{
int l9_0;
#if (reflectionTexHasSwappedViews)
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
int reflectionModulationTexGetStereoViewIndex()
{
int l9_0;
#if (reflectionModulationTexHasSwappedViews)
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
float ssPow(float A,float B)
{
float l9_0;
if (A<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(A,B);
}
return l9_0;
}
vec3 N7_vec3srgbToLinear(vec3 color)
{
return vec3(ssPow(color.x,2.2),ssPow(color.y,2.2),ssPow(color.z,2.2));
}
int rimColorTexGetStereoViewIndex()
{
int l9_0;
#if (rimColorTexHasSwappedViews)
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
int materialParamsTexGetStereoViewIndex()
{
int l9_0;
#if (materialParamsTexHasSwappedViews)
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
N7_EnableUV2=false;
#if (sc_DepthOnly)
{
return;
}
#endif
vec3 l9_0=normalize(varNormal);
vec3 l9_1=normalize(varTangent.xyz);
vec2 l9_2=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec2 l9_3;
#if (sc_StereoRenderingMode==1)
{
vec3 l9_4=vec3(l9_2,0.0);
l9_4.y=((2.0*l9_2.y)+float(sc_GetStereoViewIndex()))-1.0;
l9_3=l9_4.xy;
}
#else
{
l9_3=l9_2;
}
#endif
tempGlobals=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec2(0.0),vec2(0.0),vec3(0.0),normalize(sc_Camera.position-varPos),varPos,l9_0,l9_1,cross(l9_0,l9_1)*varTangent.w,varPackedTex.xy,varPackedTex.zw,varColor,l9_3,varPos);
N7_EnableUV2=(int(ENABLE_UV2)!=0);
tempGlobals.N7_TransformedUV2=N7_gettransformUV(NODE_13_DROPLIST_ITEM,uv2Scale,uv2Offset,(int(uv2EnableAnimation)!=0),N7_EnableUV2);
tempGlobals.N7_TransformedUV3=N7_gettransformUV(NODE_49_DROPLIST_ITEM,uv3Scale,uv3Offset,(int(uv3EnableAnimation)!=0),(int(ENABLE_UV3)!=0));
vec4 l9_5;
#if (ENABLE_BASE_TEX)
{
vec2 l9_6=N7_getUV(NODE_27_DROPLIST_ITEM);
vec4 l9_7;
#if (baseTexLayout==2)
{
bool l9_8=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_9=l9_6.x;
sc_SoftwareWrapEarly(l9_9,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_10=l9_9;
float l9_11=l9_6.y;
sc_SoftwareWrapEarly(l9_11,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_12=l9_11;
vec2 l9_13;
float l9_14;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_15;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_15=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_15=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_16=l9_10;
float l9_17=1.0;
sc_ClampUV(l9_16,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_15,l9_17);
float l9_18=l9_16;
float l9_19=l9_17;
bool l9_20;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_20=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_20=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_21=l9_12;
float l9_22=l9_19;
sc_ClampUV(l9_21,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_20,l9_22);
l9_14=l9_22;
l9_13=vec2(l9_18,l9_21);
}
#else
{
l9_14=1.0;
l9_13=vec2(l9_10,l9_12);
}
#endif
vec2 l9_23=sc_TransformUV(l9_13,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_24=l9_23.x;
float l9_25=l9_14;
sc_SoftwareWrapLate(l9_24,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_8,l9_25);
float l9_26=l9_23.y;
float l9_27=l9_25;
sc_SoftwareWrapLate(l9_26,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_8,l9_27);
float l9_28=l9_27;
vec3 l9_29=sc_SamplingCoordsViewToGlobal(vec2(l9_24,l9_26),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_30=texture(baseTexArrSC,l9_29,0.0);
vec4 l9_31;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_31=mix(baseTexBorderColor,l9_30,vec4(l9_28));
}
#else
{
l9_31=l9_30;
}
#endif
l9_7=l9_31;
}
#else
{
bool l9_32=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_33=l9_6.x;
sc_SoftwareWrapEarly(l9_33,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_34=l9_33;
float l9_35=l9_6.y;
sc_SoftwareWrapEarly(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_36=l9_35;
vec2 l9_37;
float l9_38;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_39;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_39=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_39=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_40=l9_34;
float l9_41=1.0;
sc_ClampUV(l9_40,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_39,l9_41);
float l9_42=l9_40;
float l9_43=l9_41;
bool l9_44;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_44=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_44=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_45=l9_36;
float l9_46=l9_43;
sc_ClampUV(l9_45,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_44,l9_46);
l9_38=l9_46;
l9_37=vec2(l9_42,l9_45);
}
#else
{
l9_38=1.0;
l9_37=vec2(l9_34,l9_36);
}
#endif
vec2 l9_47=sc_TransformUV(l9_37,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_48=l9_47.x;
float l9_49=l9_38;
sc_SoftwareWrapLate(l9_48,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_32,l9_49);
float l9_50=l9_47.y;
float l9_51=l9_49;
sc_SoftwareWrapLate(l9_50,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_32,l9_51);
float l9_52=l9_51;
vec3 l9_53=sc_SamplingCoordsViewToGlobal(vec2(l9_48,l9_50),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_54=texture(baseTex,l9_53.xy,0.0);
vec4 l9_55;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_55=mix(baseTexBorderColor,l9_54,vec4(l9_52));
}
#else
{
l9_55=l9_54;
}
#endif
l9_7=l9_55;
}
#endif
l9_5=baseColor*l9_7;
}
#else
{
l9_5=baseColor;
}
#endif
vec4 l9_56;
#if (ENABLE_RECOLOR)
{
l9_56=vec4(vec3(0.0).x,vec3(0.0).y,vec3(0.0).z,l9_5.w);
}
#else
{
l9_56=l9_5;
}
#endif
float l9_57;
#if (ENABLE_OPACITY_TEX)
{
vec2 l9_58=N7_getUV(NODE_69_DROPLIST_ITEM);
vec4 l9_59;
#if (opacityTexLayout==2)
{
bool l9_60=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_61=l9_58.x;
sc_SoftwareWrapEarly(l9_61,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_62=l9_61;
float l9_63=l9_58.y;
sc_SoftwareWrapEarly(l9_63,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_64=l9_63;
vec2 l9_65;
float l9_66;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_67;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_67=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_67=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_68=l9_62;
float l9_69=1.0;
sc_ClampUV(l9_68,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_67,l9_69);
float l9_70=l9_68;
float l9_71=l9_69;
bool l9_72;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_72=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_72=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_73=l9_64;
float l9_74=l9_71;
sc_ClampUV(l9_73,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_72,l9_74);
l9_66=l9_74;
l9_65=vec2(l9_70,l9_73);
}
#else
{
l9_66=1.0;
l9_65=vec2(l9_62,l9_64);
}
#endif
vec2 l9_75=sc_TransformUV(l9_65,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_76=l9_75.x;
float l9_77=l9_66;
sc_SoftwareWrapLate(l9_76,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_60,l9_77);
float l9_78=l9_75.y;
float l9_79=l9_77;
sc_SoftwareWrapLate(l9_78,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_60,l9_79);
float l9_80=l9_79;
vec3 l9_81=sc_SamplingCoordsViewToGlobal(vec2(l9_76,l9_78),opacityTexLayout,opacityTexGetStereoViewIndex());
vec4 l9_82=texture(opacityTexArrSC,l9_81,0.0);
vec4 l9_83;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_83=mix(opacityTexBorderColor,l9_82,vec4(l9_80));
}
#else
{
l9_83=l9_82;
}
#endif
l9_59=l9_83;
}
#else
{
bool l9_84=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_85=l9_58.x;
sc_SoftwareWrapEarly(l9_85,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_86=l9_85;
float l9_87=l9_58.y;
sc_SoftwareWrapEarly(l9_87,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_88=l9_87;
vec2 l9_89;
float l9_90;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_91;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_91=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_91=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_92=l9_86;
float l9_93=1.0;
sc_ClampUV(l9_92,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_91,l9_93);
float l9_94=l9_92;
float l9_95=l9_93;
bool l9_96;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_96=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_96=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_97=l9_88;
float l9_98=l9_95;
sc_ClampUV(l9_97,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_96,l9_98);
l9_90=l9_98;
l9_89=vec2(l9_94,l9_97);
}
#else
{
l9_90=1.0;
l9_89=vec2(l9_86,l9_88);
}
#endif
vec2 l9_99=sc_TransformUV(l9_89,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_100=l9_99.x;
float l9_101=l9_90;
sc_SoftwareWrapLate(l9_100,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_84,l9_101);
float l9_102=l9_99.y;
float l9_103=l9_101;
sc_SoftwareWrapLate(l9_102,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_84,l9_103);
float l9_104=l9_103;
vec3 l9_105=sc_SamplingCoordsViewToGlobal(vec2(l9_100,l9_102),opacityTexLayout,opacityTexGetStereoViewIndex());
vec4 l9_106=texture(opacityTex,l9_105.xy,0.0);
vec4 l9_107;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_107=mix(opacityTexBorderColor,l9_106,vec4(l9_104));
}
#else
{
l9_107=l9_106;
}
#endif
l9_59=l9_107;
}
#endif
l9_57=l9_59.x;
}
#else
{
l9_57=1.0;
}
#endif
float l9_108=l9_57*l9_56.w;
float l9_109;
if (NODE_38_DROPLIST_ITEM==1)
{
l9_109=l9_108*tempGlobals.VertexColor.w;
}
else
{
l9_109=l9_108;
}
vec3 l9_110;
#if (ENABLE_NORMALMAP)
{
vec2 l9_111=N7_getUV(NODE_181_DROPLIST_ITEM);
vec4 l9_112;
#if (normalTexLayout==2)
{
bool l9_113=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_114=l9_111.x;
sc_SoftwareWrapEarly(l9_114,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_115=l9_114;
float l9_116=l9_111.y;
sc_SoftwareWrapEarly(l9_116,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_117=l9_116;
vec2 l9_118;
float l9_119;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_120;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_120=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_120=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_121=l9_115;
float l9_122=1.0;
sc_ClampUV(l9_121,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_120,l9_122);
float l9_123=l9_121;
float l9_124=l9_122;
bool l9_125;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_125=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_125=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_126=l9_117;
float l9_127=l9_124;
sc_ClampUV(l9_126,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_125,l9_127);
l9_119=l9_127;
l9_118=vec2(l9_123,l9_126);
}
#else
{
l9_119=1.0;
l9_118=vec2(l9_115,l9_117);
}
#endif
vec2 l9_128=sc_TransformUV(l9_118,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_129=l9_128.x;
float l9_130=l9_119;
sc_SoftwareWrapLate(l9_129,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_113,l9_130);
float l9_131=l9_128.y;
float l9_132=l9_130;
sc_SoftwareWrapLate(l9_131,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_113,l9_132);
float l9_133=l9_132;
vec3 l9_134=sc_SamplingCoordsViewToGlobal(vec2(l9_129,l9_131),normalTexLayout,normalTexGetStereoViewIndex());
vec4 l9_135=texture(normalTexArrSC,l9_134,0.0);
vec4 l9_136;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_136=mix(normalTexBorderColor,l9_135,vec4(l9_133));
}
#else
{
l9_136=l9_135;
}
#endif
l9_112=l9_136;
}
#else
{
bool l9_137=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_138=l9_111.x;
sc_SoftwareWrapEarly(l9_138,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_139=l9_138;
float l9_140=l9_111.y;
sc_SoftwareWrapEarly(l9_140,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_141=l9_140;
vec2 l9_142;
float l9_143;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_144;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_144=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_144=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_145=l9_139;
float l9_146=1.0;
sc_ClampUV(l9_145,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_144,l9_146);
float l9_147=l9_145;
float l9_148=l9_146;
bool l9_149;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_149=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_149=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_150=l9_141;
float l9_151=l9_148;
sc_ClampUV(l9_150,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_149,l9_151);
l9_143=l9_151;
l9_142=vec2(l9_147,l9_150);
}
#else
{
l9_143=1.0;
l9_142=vec2(l9_139,l9_141);
}
#endif
vec2 l9_152=sc_TransformUV(l9_142,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_153=l9_152.x;
float l9_154=l9_143;
sc_SoftwareWrapLate(l9_153,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_137,l9_154);
float l9_155=l9_152.y;
float l9_156=l9_154;
sc_SoftwareWrapLate(l9_155,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_137,l9_156);
float l9_157=l9_156;
vec3 l9_158=sc_SamplingCoordsViewToGlobal(vec2(l9_153,l9_155),normalTexLayout,normalTexGetStereoViewIndex());
vec4 l9_159=texture(normalTex,l9_158.xy,0.0);
vec4 l9_160;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_160=mix(normalTexBorderColor,l9_159,vec4(l9_157));
}
#else
{
l9_160=l9_159;
}
#endif
l9_112=l9_160;
}
#endif
vec3 l9_161;
#if (ENABLE_DETAIL_NORMAL)
{
vec2 l9_162=N7_getUV(NODE_184_DROPLIST_ITEM);
vec4 l9_163;
#if (detailNormalTexLayout==2)
{
bool l9_164=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_165=l9_162.x;
sc_SoftwareWrapEarly(l9_165,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_166=l9_165;
float l9_167=l9_162.y;
sc_SoftwareWrapEarly(l9_167,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_168=l9_167;
vec2 l9_169;
float l9_170;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_171;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_171=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_171=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_172=l9_166;
float l9_173=1.0;
sc_ClampUV(l9_172,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_171,l9_173);
float l9_174=l9_172;
float l9_175=l9_173;
bool l9_176;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_176=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_176=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_177=l9_168;
float l9_178=l9_175;
sc_ClampUV(l9_177,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_176,l9_178);
l9_170=l9_178;
l9_169=vec2(l9_174,l9_177);
}
#else
{
l9_170=1.0;
l9_169=vec2(l9_166,l9_168);
}
#endif
vec2 l9_179=sc_TransformUV(l9_169,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_180=l9_179.x;
float l9_181=l9_170;
sc_SoftwareWrapLate(l9_180,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_164,l9_181);
float l9_182=l9_179.y;
float l9_183=l9_181;
sc_SoftwareWrapLate(l9_182,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_164,l9_183);
float l9_184=l9_183;
vec3 l9_185=sc_SamplingCoordsViewToGlobal(vec2(l9_180,l9_182),detailNormalTexLayout,detailNormalTexGetStereoViewIndex());
vec4 l9_186=texture(detailNormalTexArrSC,l9_185,0.0);
vec4 l9_187;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_187=mix(detailNormalTexBorderColor,l9_186,vec4(l9_184));
}
#else
{
l9_187=l9_186;
}
#endif
l9_163=l9_187;
}
#else
{
bool l9_188=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_189=l9_162.x;
sc_SoftwareWrapEarly(l9_189,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_190=l9_189;
float l9_191=l9_162.y;
sc_SoftwareWrapEarly(l9_191,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_192=l9_191;
vec2 l9_193;
float l9_194;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_195;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_195=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_195=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_196=l9_190;
float l9_197=1.0;
sc_ClampUV(l9_196,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_195,l9_197);
float l9_198=l9_196;
float l9_199=l9_197;
bool l9_200;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_200=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_200=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_201=l9_192;
float l9_202=l9_199;
sc_ClampUV(l9_201,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_200,l9_202);
l9_194=l9_202;
l9_193=vec2(l9_198,l9_201);
}
#else
{
l9_194=1.0;
l9_193=vec2(l9_190,l9_192);
}
#endif
vec2 l9_203=sc_TransformUV(l9_193,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_204=l9_203.x;
float l9_205=l9_194;
sc_SoftwareWrapLate(l9_204,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_188,l9_205);
float l9_206=l9_203.y;
float l9_207=l9_205;
sc_SoftwareWrapLate(l9_206,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_188,l9_207);
float l9_208=l9_207;
vec3 l9_209=sc_SamplingCoordsViewToGlobal(vec2(l9_204,l9_206),detailNormalTexLayout,detailNormalTexGetStereoViewIndex());
vec4 l9_210=texture(detailNormalTex,l9_209.xy,0.0);
vec4 l9_211;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_211=mix(detailNormalTexBorderColor,l9_210,vec4(l9_208));
}
#else
{
l9_211=l9_210;
}
#endif
l9_163=l9_211;
}
#endif
l9_161=(l9_163.xyz*1.9921875)-vec3(1.0);
}
#else
{
l9_161=vec3(0.0,0.0,1.0);
}
#endif
vec3 l9_212=((l9_112.xyz*1.9921875)-vec3(1.0))+vec3(0.0,0.0,1.0);
vec3 l9_213=l9_161*vec3(-1.0,-1.0,1.0);
l9_110=normalize(mat3(tempGlobals.VertexTangent_WorldSpace,tempGlobals.VertexBinormal_WorldSpace,tempGlobals.VertexNormal_WorldSpace)*normalize((l9_212*dot(l9_212,l9_213))-(l9_213*l9_212.z)));
}
#else
{
l9_110=normalize(tempGlobals.VertexNormal_WorldSpace);
}
#endif
vec3 l9_214;
#if (ENABLE_EMISSIVE)
{
vec2 l9_215=N7_getUV(NODE_76_DROPLIST_ITEM);
vec4 l9_216;
#if (emissiveTexLayout==2)
{
bool l9_217=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTex)!=0));
float l9_218=l9_215.x;
sc_SoftwareWrapEarly(l9_218,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x);
float l9_219=l9_218;
float l9_220=l9_215.y;
sc_SoftwareWrapEarly(l9_220,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y);
float l9_221=l9_220;
vec2 l9_222;
float l9_223;
#if (SC_USE_UV_MIN_MAX_emissiveTex)
{
bool l9_224;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_224=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x==3;
}
#else
{
l9_224=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_225=l9_219;
float l9_226=1.0;
sc_ClampUV(l9_225,emissiveTexUvMinMax.x,emissiveTexUvMinMax.z,l9_224,l9_226);
float l9_227=l9_225;
float l9_228=l9_226;
bool l9_229;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_229=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y==3;
}
#else
{
l9_229=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_230=l9_221;
float l9_231=l9_228;
sc_ClampUV(l9_230,emissiveTexUvMinMax.y,emissiveTexUvMinMax.w,l9_229,l9_231);
l9_223=l9_231;
l9_222=vec2(l9_227,l9_230);
}
#else
{
l9_223=1.0;
l9_222=vec2(l9_219,l9_221);
}
#endif
vec2 l9_232=sc_TransformUV(l9_222,(int(SC_USE_UV_TRANSFORM_emissiveTex)!=0),emissiveTexTransform);
float l9_233=l9_232.x;
float l9_234=l9_223;
sc_SoftwareWrapLate(l9_233,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x,l9_217,l9_234);
float l9_235=l9_232.y;
float l9_236=l9_234;
sc_SoftwareWrapLate(l9_235,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y,l9_217,l9_236);
float l9_237=l9_236;
vec3 l9_238=sc_SamplingCoordsViewToGlobal(vec2(l9_233,l9_235),emissiveTexLayout,emissiveTexGetStereoViewIndex());
vec4 l9_239=texture(emissiveTexArrSC,l9_238,0.0);
vec4 l9_240;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_240=mix(emissiveTexBorderColor,l9_239,vec4(l9_237));
}
#else
{
l9_240=l9_239;
}
#endif
l9_216=l9_240;
}
#else
{
bool l9_241=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTex)!=0));
float l9_242=l9_215.x;
sc_SoftwareWrapEarly(l9_242,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x);
float l9_243=l9_242;
float l9_244=l9_215.y;
sc_SoftwareWrapEarly(l9_244,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y);
float l9_245=l9_244;
vec2 l9_246;
float l9_247;
#if (SC_USE_UV_MIN_MAX_emissiveTex)
{
bool l9_248;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_248=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x==3;
}
#else
{
l9_248=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_249=l9_243;
float l9_250=1.0;
sc_ClampUV(l9_249,emissiveTexUvMinMax.x,emissiveTexUvMinMax.z,l9_248,l9_250);
float l9_251=l9_249;
float l9_252=l9_250;
bool l9_253;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_253=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y==3;
}
#else
{
l9_253=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_254=l9_245;
float l9_255=l9_252;
sc_ClampUV(l9_254,emissiveTexUvMinMax.y,emissiveTexUvMinMax.w,l9_253,l9_255);
l9_247=l9_255;
l9_246=vec2(l9_251,l9_254);
}
#else
{
l9_247=1.0;
l9_246=vec2(l9_243,l9_245);
}
#endif
vec2 l9_256=sc_TransformUV(l9_246,(int(SC_USE_UV_TRANSFORM_emissiveTex)!=0),emissiveTexTransform);
float l9_257=l9_256.x;
float l9_258=l9_247;
sc_SoftwareWrapLate(l9_257,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x,l9_241,l9_258);
float l9_259=l9_256.y;
float l9_260=l9_258;
sc_SoftwareWrapLate(l9_259,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y,l9_241,l9_260);
float l9_261=l9_260;
vec3 l9_262=sc_SamplingCoordsViewToGlobal(vec2(l9_257,l9_259),emissiveTexLayout,emissiveTexGetStereoViewIndex());
vec4 l9_263=texture(emissiveTex,l9_262.xy,0.0);
vec4 l9_264;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_264=mix(emissiveTexBorderColor,l9_263,vec4(l9_261));
}
#else
{
l9_264=l9_263;
}
#endif
l9_216=l9_264;
}
#endif
l9_214=l9_216.xyz;
}
#else
{
l9_214=vec3(0.0);
}
#endif
bool l9_265=NODE_38_DROPLIST_ITEM==2;
vec3 l9_266;
if (l9_265)
{
l9_266=l9_214+tempGlobals.VertexColor.xyz;
}
else
{
l9_266=l9_214;
}
vec3 l9_267;
if (l9_265||(int(ENABLE_EMISSIVE)!=0))
{
l9_267=ssPow((l9_266*emissiveColor)*vec3(emissiveIntensity),vec3(2.2));
}
else
{
l9_267=l9_266;
}
vec3 l9_268;
#if (ENABLE_SIMPLE_REFLECTION)
{
vec3 l9_269=tempGlobals.ViewDirWS;
vec3 l9_270=reflect(l9_269,l9_110);
float l9_271=l9_270.x;
float l9_272=l9_270.y;
float l9_273=(-l9_270.z)+1.0;
float l9_274=((l9_271*l9_271)+(l9_272*l9_272))+(l9_273*l9_273);
float l9_275;
if (l9_274<=0.0)
{
l9_275=0.0;
}
else
{
l9_275=sqrt(l9_274);
}
float l9_276=2.0*l9_275;
vec2 l9_277=vec2(1.0)-((l9_270.xy/vec2(l9_276))+vec2(0.5));
vec4 l9_278;
#if (reflectionTexLayout==2)
{
bool l9_279=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionTex)!=0));
float l9_280=l9_277.x;
sc_SoftwareWrapEarly(l9_280,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x);
float l9_281=l9_280;
float l9_282=l9_277.y;
sc_SoftwareWrapEarly(l9_282,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y);
float l9_283=l9_282;
vec2 l9_284;
float l9_285;
#if (SC_USE_UV_MIN_MAX_reflectionTex)
{
bool l9_286;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_286=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x==3;
}
#else
{
l9_286=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_287=l9_281;
float l9_288=1.0;
sc_ClampUV(l9_287,reflectionTexUvMinMax.x,reflectionTexUvMinMax.z,l9_286,l9_288);
float l9_289=l9_287;
float l9_290=l9_288;
bool l9_291;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_291=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y==3;
}
#else
{
l9_291=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_292=l9_283;
float l9_293=l9_290;
sc_ClampUV(l9_292,reflectionTexUvMinMax.y,reflectionTexUvMinMax.w,l9_291,l9_293);
l9_285=l9_293;
l9_284=vec2(l9_289,l9_292);
}
#else
{
l9_285=1.0;
l9_284=vec2(l9_281,l9_283);
}
#endif
vec2 l9_294=sc_TransformUV(l9_284,(int(SC_USE_UV_TRANSFORM_reflectionTex)!=0),reflectionTexTransform);
float l9_295=l9_294.x;
float l9_296=l9_285;
sc_SoftwareWrapLate(l9_295,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x,l9_279,l9_296);
float l9_297=l9_294.y;
float l9_298=l9_296;
sc_SoftwareWrapLate(l9_297,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y,l9_279,l9_298);
float l9_299=l9_298;
vec3 l9_300=sc_SamplingCoordsViewToGlobal(vec2(l9_295,l9_297),reflectionTexLayout,reflectionTexGetStereoViewIndex());
vec4 l9_301=texture(reflectionTexArrSC,l9_300,0.0);
vec4 l9_302;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_302=mix(reflectionTexBorderColor,l9_301,vec4(l9_299));
}
#else
{
l9_302=l9_301;
}
#endif
l9_278=l9_302;
}
#else
{
bool l9_303=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionTex)!=0));
float l9_304=l9_277.x;
sc_SoftwareWrapEarly(l9_304,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x);
float l9_305=l9_304;
float l9_306=l9_277.y;
sc_SoftwareWrapEarly(l9_306,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y);
float l9_307=l9_306;
vec2 l9_308;
float l9_309;
#if (SC_USE_UV_MIN_MAX_reflectionTex)
{
bool l9_310;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_310=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x==3;
}
#else
{
l9_310=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_311=l9_305;
float l9_312=1.0;
sc_ClampUV(l9_311,reflectionTexUvMinMax.x,reflectionTexUvMinMax.z,l9_310,l9_312);
float l9_313=l9_311;
float l9_314=l9_312;
bool l9_315;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_315=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y==3;
}
#else
{
l9_315=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_316=l9_307;
float l9_317=l9_314;
sc_ClampUV(l9_316,reflectionTexUvMinMax.y,reflectionTexUvMinMax.w,l9_315,l9_317);
l9_309=l9_317;
l9_308=vec2(l9_313,l9_316);
}
#else
{
l9_309=1.0;
l9_308=vec2(l9_305,l9_307);
}
#endif
vec2 l9_318=sc_TransformUV(l9_308,(int(SC_USE_UV_TRANSFORM_reflectionTex)!=0),reflectionTexTransform);
float l9_319=l9_318.x;
float l9_320=l9_309;
sc_SoftwareWrapLate(l9_319,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x,l9_303,l9_320);
float l9_321=l9_318.y;
float l9_322=l9_320;
sc_SoftwareWrapLate(l9_321,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y,l9_303,l9_322);
float l9_323=l9_322;
vec3 l9_324=sc_SamplingCoordsViewToGlobal(vec2(l9_319,l9_321),reflectionTexLayout,reflectionTexGetStereoViewIndex());
vec4 l9_325=texture(reflectionTex,l9_324.xy,0.0);
vec4 l9_326;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_326=mix(reflectionTexBorderColor,l9_325,vec4(l9_323));
}
#else
{
l9_326=l9_325;
}
#endif
l9_278=l9_326;
}
#endif
vec3 l9_327;
#if (Tweak_N177)
{
vec2 l9_328=N7_getUV(NODE_228_DROPLIST_ITEM);
vec4 l9_329;
#if (reflectionModulationTexLayout==2)
{
bool l9_330=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionModulationTex)!=0));
float l9_331=l9_328.x;
sc_SoftwareWrapEarly(l9_331,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x);
float l9_332=l9_331;
float l9_333=l9_328.y;
sc_SoftwareWrapEarly(l9_333,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y);
float l9_334=l9_333;
vec2 l9_335;
float l9_336;
#if (SC_USE_UV_MIN_MAX_reflectionModulationTex)
{
bool l9_337;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_337=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x==3;
}
#else
{
l9_337=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_338=l9_332;
float l9_339=1.0;
sc_ClampUV(l9_338,reflectionModulationTexUvMinMax.x,reflectionModulationTexUvMinMax.z,l9_337,l9_339);
float l9_340=l9_338;
float l9_341=l9_339;
bool l9_342;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_342=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y==3;
}
#else
{
l9_342=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_343=l9_334;
float l9_344=l9_341;
sc_ClampUV(l9_343,reflectionModulationTexUvMinMax.y,reflectionModulationTexUvMinMax.w,l9_342,l9_344);
l9_336=l9_344;
l9_335=vec2(l9_340,l9_343);
}
#else
{
l9_336=1.0;
l9_335=vec2(l9_332,l9_334);
}
#endif
vec2 l9_345=sc_TransformUV(l9_335,(int(SC_USE_UV_TRANSFORM_reflectionModulationTex)!=0),reflectionModulationTexTransform);
float l9_346=l9_345.x;
float l9_347=l9_336;
sc_SoftwareWrapLate(l9_346,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x,l9_330,l9_347);
float l9_348=l9_345.y;
float l9_349=l9_347;
sc_SoftwareWrapLate(l9_348,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y,l9_330,l9_349);
float l9_350=l9_349;
vec3 l9_351=sc_SamplingCoordsViewToGlobal(vec2(l9_346,l9_348),reflectionModulationTexLayout,reflectionModulationTexGetStereoViewIndex());
vec4 l9_352=texture(reflectionModulationTexArrSC,l9_351,0.0);
vec4 l9_353;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_353=mix(reflectionModulationTexBorderColor,l9_352,vec4(l9_350));
}
#else
{
l9_353=l9_352;
}
#endif
l9_329=l9_353;
}
#else
{
bool l9_354=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionModulationTex)!=0));
float l9_355=l9_328.x;
sc_SoftwareWrapEarly(l9_355,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x);
float l9_356=l9_355;
float l9_357=l9_328.y;
sc_SoftwareWrapEarly(l9_357,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y);
float l9_358=l9_357;
vec2 l9_359;
float l9_360;
#if (SC_USE_UV_MIN_MAX_reflectionModulationTex)
{
bool l9_361;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_361=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x==3;
}
#else
{
l9_361=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_362=l9_356;
float l9_363=1.0;
sc_ClampUV(l9_362,reflectionModulationTexUvMinMax.x,reflectionModulationTexUvMinMax.z,l9_361,l9_363);
float l9_364=l9_362;
float l9_365=l9_363;
bool l9_366;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_366=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y==3;
}
#else
{
l9_366=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_367=l9_358;
float l9_368=l9_365;
sc_ClampUV(l9_367,reflectionModulationTexUvMinMax.y,reflectionModulationTexUvMinMax.w,l9_366,l9_368);
l9_360=l9_368;
l9_359=vec2(l9_364,l9_367);
}
#else
{
l9_360=1.0;
l9_359=vec2(l9_356,l9_358);
}
#endif
vec2 l9_369=sc_TransformUV(l9_359,(int(SC_USE_UV_TRANSFORM_reflectionModulationTex)!=0),reflectionModulationTexTransform);
float l9_370=l9_369.x;
float l9_371=l9_360;
sc_SoftwareWrapLate(l9_370,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x,l9_354,l9_371);
float l9_372=l9_369.y;
float l9_373=l9_371;
sc_SoftwareWrapLate(l9_372,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y,l9_354,l9_373);
float l9_374=l9_373;
vec3 l9_375=sc_SamplingCoordsViewToGlobal(vec2(l9_370,l9_372),reflectionModulationTexLayout,reflectionModulationTexGetStereoViewIndex());
vec4 l9_376=texture(reflectionModulationTex,l9_375.xy,0.0);
vec4 l9_377;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_377=mix(reflectionModulationTexBorderColor,l9_376,vec4(l9_374));
}
#else
{
l9_377=l9_376;
}
#endif
l9_329=l9_377;
}
#endif
l9_327=l9_278.xyz*l9_329.xyz;
}
#else
{
l9_327=l9_278.xyz;
}
#endif
l9_268=N7_vec3srgbToLinear(l9_327)*reflectionIntensity;
}
#else
{
l9_268=vec3(0.0);
}
#endif
vec3 l9_378;
#if (ENABLE_RIM_HIGHLIGHT)
{
vec3 l9_379=rimColor*rimIntensity;
vec3 l9_380;
#if (Tweak_N216)
{
vec2 l9_381=N7_getUV(NODE_315_DROPLIST_ITEM);
vec4 l9_382;
#if (rimColorTexLayout==2)
{
bool l9_383=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_rimColorTex)!=0));
float l9_384=l9_381.x;
sc_SoftwareWrapEarly(l9_384,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x);
float l9_385=l9_384;
float l9_386=l9_381.y;
sc_SoftwareWrapEarly(l9_386,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y);
float l9_387=l9_386;
vec2 l9_388;
float l9_389;
#if (SC_USE_UV_MIN_MAX_rimColorTex)
{
bool l9_390;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_390=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x==3;
}
#else
{
l9_390=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_391=l9_385;
float l9_392=1.0;
sc_ClampUV(l9_391,rimColorTexUvMinMax.x,rimColorTexUvMinMax.z,l9_390,l9_392);
float l9_393=l9_391;
float l9_394=l9_392;
bool l9_395;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_395=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y==3;
}
#else
{
l9_395=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_396=l9_387;
float l9_397=l9_394;
sc_ClampUV(l9_396,rimColorTexUvMinMax.y,rimColorTexUvMinMax.w,l9_395,l9_397);
l9_389=l9_397;
l9_388=vec2(l9_393,l9_396);
}
#else
{
l9_389=1.0;
l9_388=vec2(l9_385,l9_387);
}
#endif
vec2 l9_398=sc_TransformUV(l9_388,(int(SC_USE_UV_TRANSFORM_rimColorTex)!=0),rimColorTexTransform);
float l9_399=l9_398.x;
float l9_400=l9_389;
sc_SoftwareWrapLate(l9_399,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x,l9_383,l9_400);
float l9_401=l9_398.y;
float l9_402=l9_400;
sc_SoftwareWrapLate(l9_401,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y,l9_383,l9_402);
float l9_403=l9_402;
vec3 l9_404=sc_SamplingCoordsViewToGlobal(vec2(l9_399,l9_401),rimColorTexLayout,rimColorTexGetStereoViewIndex());
vec4 l9_405=texture(rimColorTexArrSC,l9_404,0.0);
vec4 l9_406;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_406=mix(rimColorTexBorderColor,l9_405,vec4(l9_403));
}
#else
{
l9_406=l9_405;
}
#endif
l9_382=l9_406;
}
#else
{
bool l9_407=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_rimColorTex)!=0));
float l9_408=l9_381.x;
sc_SoftwareWrapEarly(l9_408,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x);
float l9_409=l9_408;
float l9_410=l9_381.y;
sc_SoftwareWrapEarly(l9_410,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y);
float l9_411=l9_410;
vec2 l9_412;
float l9_413;
#if (SC_USE_UV_MIN_MAX_rimColorTex)
{
bool l9_414;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_414=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x==3;
}
#else
{
l9_414=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_415=l9_409;
float l9_416=1.0;
sc_ClampUV(l9_415,rimColorTexUvMinMax.x,rimColorTexUvMinMax.z,l9_414,l9_416);
float l9_417=l9_415;
float l9_418=l9_416;
bool l9_419;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_419=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y==3;
}
#else
{
l9_419=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_420=l9_411;
float l9_421=l9_418;
sc_ClampUV(l9_420,rimColorTexUvMinMax.y,rimColorTexUvMinMax.w,l9_419,l9_421);
l9_413=l9_421;
l9_412=vec2(l9_417,l9_420);
}
#else
{
l9_413=1.0;
l9_412=vec2(l9_409,l9_411);
}
#endif
vec2 l9_422=sc_TransformUV(l9_412,(int(SC_USE_UV_TRANSFORM_rimColorTex)!=0),rimColorTexTransform);
float l9_423=l9_422.x;
float l9_424=l9_413;
sc_SoftwareWrapLate(l9_423,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x,l9_407,l9_424);
float l9_425=l9_422.y;
float l9_426=l9_424;
sc_SoftwareWrapLate(l9_425,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y,l9_407,l9_426);
float l9_427=l9_426;
vec3 l9_428=sc_SamplingCoordsViewToGlobal(vec2(l9_423,l9_425),rimColorTexLayout,rimColorTexGetStereoViewIndex());
vec4 l9_429=texture(rimColorTex,l9_428.xy,0.0);
vec4 l9_430;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_430=mix(rimColorTexBorderColor,l9_429,vec4(l9_427));
}
#else
{
l9_430=l9_429;
}
#endif
l9_382=l9_430;
}
#endif
l9_380=l9_379*l9_382.xyz;
}
#else
{
l9_380=l9_379;
}
#endif
vec3 l9_431=tempGlobals.ViewDirWS;
float l9_432=dot(l9_110,l9_431);
float l9_433=abs(l9_432);
float l9_434;
if (!(int(ENABLE_RIM_INVERT)!=0))
{
l9_434=1.0-l9_433;
}
else
{
l9_434=l9_433;
}
l9_378=vec3(0.0)+(N7_vec3srgbToLinear(l9_380)*ssPow(l9_434,rimExponent));
}
#else
{
l9_378=vec3(0.0);
}
#endif
vec2 l9_435=N7_getUV(NODE_221_DROPLIST_ITEM);
vec4 l9_436;
#if (materialParamsTexLayout==2)
{
bool l9_437=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_materialParamsTex)!=0));
float l9_438=l9_435.x;
sc_SoftwareWrapEarly(l9_438,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x);
float l9_439=l9_438;
float l9_440=l9_435.y;
sc_SoftwareWrapEarly(l9_440,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y);
float l9_441=l9_440;
vec2 l9_442;
float l9_443;
#if (SC_USE_UV_MIN_MAX_materialParamsTex)
{
bool l9_444;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_444=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x==3;
}
#else
{
l9_444=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_445=l9_439;
float l9_446=1.0;
sc_ClampUV(l9_445,materialParamsTexUvMinMax.x,materialParamsTexUvMinMax.z,l9_444,l9_446);
float l9_447=l9_445;
float l9_448=l9_446;
bool l9_449;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_449=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y==3;
}
#else
{
l9_449=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_450=l9_441;
float l9_451=l9_448;
sc_ClampUV(l9_450,materialParamsTexUvMinMax.y,materialParamsTexUvMinMax.w,l9_449,l9_451);
l9_443=l9_451;
l9_442=vec2(l9_447,l9_450);
}
#else
{
l9_443=1.0;
l9_442=vec2(l9_439,l9_441);
}
#endif
vec2 l9_452=sc_TransformUV(l9_442,(int(SC_USE_UV_TRANSFORM_materialParamsTex)!=0),materialParamsTexTransform);
float l9_453=l9_452.x;
float l9_454=l9_443;
sc_SoftwareWrapLate(l9_453,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x,l9_437,l9_454);
float l9_455=l9_452.y;
float l9_456=l9_454;
sc_SoftwareWrapLate(l9_455,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y,l9_437,l9_456);
float l9_457=l9_456;
vec3 l9_458=sc_SamplingCoordsViewToGlobal(vec2(l9_453,l9_455),materialParamsTexLayout,materialParamsTexGetStereoViewIndex());
vec4 l9_459=texture(materialParamsTexArrSC,l9_458,0.0);
vec4 l9_460;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_460=mix(materialParamsTexBorderColor,l9_459,vec4(l9_457));
}
#else
{
l9_460=l9_459;
}
#endif
l9_436=l9_460;
}
#else
{
bool l9_461=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_materialParamsTex)!=0));
float l9_462=l9_435.x;
sc_SoftwareWrapEarly(l9_462,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x);
float l9_463=l9_462;
float l9_464=l9_435.y;
sc_SoftwareWrapEarly(l9_464,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y);
float l9_465=l9_464;
vec2 l9_466;
float l9_467;
#if (SC_USE_UV_MIN_MAX_materialParamsTex)
{
bool l9_468;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_468=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x==3;
}
#else
{
l9_468=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_469=l9_463;
float l9_470=1.0;
sc_ClampUV(l9_469,materialParamsTexUvMinMax.x,materialParamsTexUvMinMax.z,l9_468,l9_470);
float l9_471=l9_469;
float l9_472=l9_470;
bool l9_473;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_473=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y==3;
}
#else
{
l9_473=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_474=l9_465;
float l9_475=l9_472;
sc_ClampUV(l9_474,materialParamsTexUvMinMax.y,materialParamsTexUvMinMax.w,l9_473,l9_475);
l9_467=l9_475;
l9_466=vec2(l9_471,l9_474);
}
#else
{
l9_467=1.0;
l9_466=vec2(l9_463,l9_465);
}
#endif
vec2 l9_476=sc_TransformUV(l9_466,(int(SC_USE_UV_TRANSFORM_materialParamsTex)!=0),materialParamsTexTransform);
float l9_477=l9_476.x;
float l9_478=l9_467;
sc_SoftwareWrapLate(l9_477,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x,l9_461,l9_478);
float l9_479=l9_476.y;
float l9_480=l9_478;
sc_SoftwareWrapLate(l9_479,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y,l9_461,l9_480);
float l9_481=l9_480;
vec3 l9_482=sc_SamplingCoordsViewToGlobal(vec2(l9_477,l9_479),materialParamsTexLayout,materialParamsTexGetStereoViewIndex());
vec4 l9_483=texture(materialParamsTex,l9_482.xy,0.0);
vec4 l9_484;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_484=mix(materialParamsTexBorderColor,l9_483,vec4(l9_481));
}
#else
{
l9_484=l9_483;
}
#endif
l9_436=l9_484;
}
#endif
vec3 l9_485;
#if (!sc_ProjectiveShadowsCaster)
{
l9_485=l9_110;
}
#else
{
l9_485=vec3(0.0);
}
#endif
float l9_486=clamp(l9_109,0.0,1.0);
#if (sc_BlendMode_AlphaTest)
{
if (l9_486<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_486<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
uvec3 l9_487=uvec3(round((varPos-sc_RayTracingOriginOffset)*sc_RayTracingOriginScale));
sc_RayTracingPositionAndMask=uvec4(l9_487.x,l9_487.y,l9_487.z,sc_RayTracingPositionAndMask.w);
sc_RayTracingPositionAndMask.w=sc_RayTracingReceiverMask;
vec3 l9_488=l9_485/vec3(dot(abs(l9_485),vec3(1.0)));
vec2 l9_489=vec2(clamp(-l9_488.z,0.0,1.0));
vec2 l9_490=l9_488.xy;
uint l9_491=packHalf2x16(l9_490+mix(-l9_489,l9_489,step(vec2(0.0),l9_490)));
uvec2 l9_492=uvec2(l9_491&65535u,l9_491>>16u);
sc_RayTracingNormalAndMore=uvec4(l9_492.x,l9_492.y,sc_RayTracingNormalAndMore.z,sc_RayTracingNormalAndMore.w);
sc_RayTracingNormalAndMore.z=0u;
sc_RayTracingNormalAndMore.w=uint(clamp(l9_436.y*roughness,0.0,1.0)*1000.0)|((sc_RayTracingReceiverId%32u)<<10u);
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
vec2 N7_TransformedUV2;
vec2 N7_TransformedUV3;
vec3 BumpedNormal;
vec3 ViewDirWS;
vec3 PositionWS;
vec3 VertexNormal_WorldSpace;
vec3 VertexTangent_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
vec2 Surface_UVCoord1;
vec4 VertexColor;
vec2 gScreenCoord;
vec3 SurfacePosition_WorldSpace;
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
#ifndef emissiveTexHasSwappedViews
#define emissiveTexHasSwappedViews 0
#elif emissiveTexHasSwappedViews==1
#undef emissiveTexHasSwappedViews
#define emissiveTexHasSwappedViews 1
#endif
#ifndef emissiveTexLayout
#define emissiveTexLayout 0
#endif
#ifndef reflectionTexHasSwappedViews
#define reflectionTexHasSwappedViews 0
#elif reflectionTexHasSwappedViews==1
#undef reflectionTexHasSwappedViews
#define reflectionTexHasSwappedViews 1
#endif
#ifndef reflectionTexLayout
#define reflectionTexLayout 0
#endif
#ifndef reflectionModulationTexHasSwappedViews
#define reflectionModulationTexHasSwappedViews 0
#elif reflectionModulationTexHasSwappedViews==1
#undef reflectionModulationTexHasSwappedViews
#define reflectionModulationTexHasSwappedViews 1
#endif
#ifndef reflectionModulationTexLayout
#define reflectionModulationTexLayout 0
#endif
#ifndef rimColorTexHasSwappedViews
#define rimColorTexHasSwappedViews 0
#elif rimColorTexHasSwappedViews==1
#undef rimColorTexHasSwappedViews
#define rimColorTexHasSwappedViews 1
#endif
#ifndef rimColorTexLayout
#define rimColorTexLayout 0
#endif
#ifndef materialParamsTexHasSwappedViews
#define materialParamsTexHasSwappedViews 0
#elif materialParamsTexHasSwappedViews==1
#undef materialParamsTexHasSwappedViews
#define materialParamsTexHasSwappedViews 1
#endif
#ifndef materialParamsTexLayout
#define materialParamsTexLayout 0
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
#ifndef NODE_38_DROPLIST_ITEM
#define NODE_38_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 0
#elif ENABLE_BASE_TEX==1
#undef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 1
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
#ifndef NODE_27_DROPLIST_ITEM
#define NODE_27_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_RECOLOR
#define ENABLE_RECOLOR 0
#elif ENABLE_RECOLOR==1
#undef ENABLE_RECOLOR
#define ENABLE_RECOLOR 1
#endif
#ifndef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 0
#elif ENABLE_OPACITY_TEX==1
#undef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 1
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
#ifndef NODE_69_DROPLIST_ITEM
#define NODE_69_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 0
#elif ENABLE_NORMALMAP==1
#undef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 1
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
#ifndef NODE_181_DROPLIST_ITEM
#define NODE_181_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 0
#elif ENABLE_DETAIL_NORMAL==1
#undef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 1
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
#ifndef NODE_184_DROPLIST_ITEM
#define NODE_184_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 0
#elif ENABLE_EMISSIVE==1
#undef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_emissiveTex
#define SC_USE_UV_TRANSFORM_emissiveTex 0
#elif SC_USE_UV_TRANSFORM_emissiveTex==1
#undef SC_USE_UV_TRANSFORM_emissiveTex
#define SC_USE_UV_TRANSFORM_emissiveTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_emissiveTex
#define SC_SOFTWARE_WRAP_MODE_U_emissiveTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_emissiveTex
#define SC_SOFTWARE_WRAP_MODE_V_emissiveTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_emissiveTex
#define SC_USE_UV_MIN_MAX_emissiveTex 0
#elif SC_USE_UV_MIN_MAX_emissiveTex==1
#undef SC_USE_UV_MIN_MAX_emissiveTex
#define SC_USE_UV_MIN_MAX_emissiveTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_emissiveTex
#define SC_USE_CLAMP_TO_BORDER_emissiveTex 0
#elif SC_USE_CLAMP_TO_BORDER_emissiveTex==1
#undef SC_USE_CLAMP_TO_BORDER_emissiveTex
#define SC_USE_CLAMP_TO_BORDER_emissiveTex 1
#endif
#ifndef NODE_76_DROPLIST_ITEM
#define NODE_76_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_SIMPLE_REFLECTION
#define ENABLE_SIMPLE_REFLECTION 0
#elif ENABLE_SIMPLE_REFLECTION==1
#undef ENABLE_SIMPLE_REFLECTION
#define ENABLE_SIMPLE_REFLECTION 1
#endif
#ifndef SC_USE_UV_TRANSFORM_reflectionTex
#define SC_USE_UV_TRANSFORM_reflectionTex 0
#elif SC_USE_UV_TRANSFORM_reflectionTex==1
#undef SC_USE_UV_TRANSFORM_reflectionTex
#define SC_USE_UV_TRANSFORM_reflectionTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_reflectionTex
#define SC_SOFTWARE_WRAP_MODE_U_reflectionTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_reflectionTex
#define SC_SOFTWARE_WRAP_MODE_V_reflectionTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_reflectionTex
#define SC_USE_UV_MIN_MAX_reflectionTex 0
#elif SC_USE_UV_MIN_MAX_reflectionTex==1
#undef SC_USE_UV_MIN_MAX_reflectionTex
#define SC_USE_UV_MIN_MAX_reflectionTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_reflectionTex
#define SC_USE_CLAMP_TO_BORDER_reflectionTex 0
#elif SC_USE_CLAMP_TO_BORDER_reflectionTex==1
#undef SC_USE_CLAMP_TO_BORDER_reflectionTex
#define SC_USE_CLAMP_TO_BORDER_reflectionTex 1
#endif
#ifndef Tweak_N177
#define Tweak_N177 0
#elif Tweak_N177==1
#undef Tweak_N177
#define Tweak_N177 1
#endif
#ifndef NODE_228_DROPLIST_ITEM
#define NODE_228_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_reflectionModulationTex
#define SC_USE_UV_TRANSFORM_reflectionModulationTex 0
#elif SC_USE_UV_TRANSFORM_reflectionModulationTex==1
#undef SC_USE_UV_TRANSFORM_reflectionModulationTex
#define SC_USE_UV_TRANSFORM_reflectionModulationTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex
#define SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex
#define SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_reflectionModulationTex
#define SC_USE_UV_MIN_MAX_reflectionModulationTex 0
#elif SC_USE_UV_MIN_MAX_reflectionModulationTex==1
#undef SC_USE_UV_MIN_MAX_reflectionModulationTex
#define SC_USE_UV_MIN_MAX_reflectionModulationTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_reflectionModulationTex
#define SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 0
#elif SC_USE_CLAMP_TO_BORDER_reflectionModulationTex==1
#undef SC_USE_CLAMP_TO_BORDER_reflectionModulationTex
#define SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 1
#endif
#ifndef ENABLE_RIM_HIGHLIGHT
#define ENABLE_RIM_HIGHLIGHT 0
#elif ENABLE_RIM_HIGHLIGHT==1
#undef ENABLE_RIM_HIGHLIGHT
#define ENABLE_RIM_HIGHLIGHT 1
#endif
#ifndef Tweak_N216
#define Tweak_N216 0
#elif Tweak_N216==1
#undef Tweak_N216
#define Tweak_N216 1
#endif
#ifndef ENABLE_RIM_INVERT
#define ENABLE_RIM_INVERT 0
#elif ENABLE_RIM_INVERT==1
#undef ENABLE_RIM_INVERT
#define ENABLE_RIM_INVERT 1
#endif
#ifndef SC_USE_UV_TRANSFORM_rimColorTex
#define SC_USE_UV_TRANSFORM_rimColorTex 0
#elif SC_USE_UV_TRANSFORM_rimColorTex==1
#undef SC_USE_UV_TRANSFORM_rimColorTex
#define SC_USE_UV_TRANSFORM_rimColorTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_rimColorTex
#define SC_SOFTWARE_WRAP_MODE_U_rimColorTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_rimColorTex
#define SC_SOFTWARE_WRAP_MODE_V_rimColorTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_rimColorTex
#define SC_USE_UV_MIN_MAX_rimColorTex 0
#elif SC_USE_UV_MIN_MAX_rimColorTex==1
#undef SC_USE_UV_MIN_MAX_rimColorTex
#define SC_USE_UV_MIN_MAX_rimColorTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_rimColorTex
#define SC_USE_CLAMP_TO_BORDER_rimColorTex 0
#elif SC_USE_CLAMP_TO_BORDER_rimColorTex==1
#undef SC_USE_CLAMP_TO_BORDER_rimColorTex
#define SC_USE_CLAMP_TO_BORDER_rimColorTex 1
#endif
#ifndef NODE_315_DROPLIST_ITEM
#define NODE_315_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_materialParamsTex
#define SC_USE_UV_TRANSFORM_materialParamsTex 0
#elif SC_USE_UV_TRANSFORM_materialParamsTex==1
#undef SC_USE_UV_TRANSFORM_materialParamsTex
#define SC_USE_UV_TRANSFORM_materialParamsTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_materialParamsTex
#define SC_SOFTWARE_WRAP_MODE_U_materialParamsTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_materialParamsTex
#define SC_SOFTWARE_WRAP_MODE_V_materialParamsTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_materialParamsTex
#define SC_USE_UV_MIN_MAX_materialParamsTex 0
#elif SC_USE_UV_MIN_MAX_materialParamsTex==1
#undef SC_USE_UV_MIN_MAX_materialParamsTex
#define SC_USE_UV_MIN_MAX_materialParamsTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_materialParamsTex
#define SC_USE_CLAMP_TO_BORDER_materialParamsTex 0
#elif SC_USE_CLAMP_TO_BORDER_materialParamsTex==1
#undef SC_USE_CLAMP_TO_BORDER_materialParamsTex
#define SC_USE_CLAMP_TO_BORDER_materialParamsTex 1
#endif
#ifndef NODE_221_DROPLIST_ITEM
#define NODE_221_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_SPECULAR_AO
#define ENABLE_SPECULAR_AO 0
#elif ENABLE_SPECULAR_AO==1
#undef ENABLE_SPECULAR_AO
#define ENABLE_SPECULAR_AO 1
#endif
#ifndef ENABLE_UV2
#define ENABLE_UV2 0
#elif ENABLE_UV2==1
#undef ENABLE_UV2
#define ENABLE_UV2 1
#endif
#ifndef NODE_13_DROPLIST_ITEM
#define NODE_13_DROPLIST_ITEM 0
#endif
#ifndef uv2EnableAnimation
#define uv2EnableAnimation 0
#elif uv2EnableAnimation==1
#undef uv2EnableAnimation
#define uv2EnableAnimation 1
#endif
#ifndef ENABLE_UV3
#define ENABLE_UV3 0
#elif ENABLE_UV3==1
#undef ENABLE_UV3
#define ENABLE_UV3 1
#endif
#ifndef NODE_49_DROPLIST_ITEM
#define NODE_49_DROPLIST_ITEM 0
#endif
#ifndef uv3EnableAnimation
#define uv3EnableAnimation 0
#elif uv3EnableAnimation==1
#undef uv3EnableAnimation
#define uv3EnableAnimation 1
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
uniform mat3 baseTexTransform;
uniform vec4 baseTexUvMinMax;
uniform vec4 baseTexBorderColor;
uniform mat3 opacityTexTransform;
uniform vec4 opacityTexUvMinMax;
uniform vec4 opacityTexBorderColor;
uniform mat3 normalTexTransform;
uniform vec4 normalTexUvMinMax;
uniform vec4 normalTexBorderColor;
uniform mat3 detailNormalTexTransform;
uniform vec4 detailNormalTexUvMinMax;
uniform vec4 detailNormalTexBorderColor;
uniform mat3 emissiveTexTransform;
uniform vec4 emissiveTexUvMinMax;
uniform vec4 emissiveTexBorderColor;
uniform mat3 reflectionTexTransform;
uniform vec4 reflectionTexUvMinMax;
uniform vec4 reflectionTexBorderColor;
uniform mat3 reflectionModulationTexTransform;
uniform vec4 reflectionModulationTexUvMinMax;
uniform vec4 reflectionModulationTexBorderColor;
uniform mat3 rimColorTexTransform;
uniform vec4 rimColorTexUvMinMax;
uniform vec4 rimColorTexBorderColor;
uniform mat3 materialParamsTexTransform;
uniform vec4 materialParamsTexUvMinMax;
uniform vec4 materialParamsTexBorderColor;
uniform vec4 baseColor;
uniform vec3 recolorRed;
uniform vec3 recolorGreen;
uniform vec3 recolorBlue;
uniform vec3 emissiveColor;
uniform float emissiveIntensity;
uniform float reflectionIntensity;
uniform vec3 rimColor;
uniform float rimIntensity;
uniform float rimExponent;
uniform float metallic;
uniform float roughness;
uniform float specularAoIntensity;
uniform float specularAoDarkening;
uniform vec2 uv2Scale;
uniform vec2 uv2Offset;
uniform vec2 uv3Scale;
uniform vec2 uv3Offset;
uniform vec4 sc_Time;
uniform sc_Camera_t sc_Camera;
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
uniform sampler2D emissiveTex;
uniform sampler2DArray emissiveTexArrSC;
uniform sampler2D reflectionTex;
uniform sampler2DArray reflectionTexArrSC;
uniform sampler2D reflectionModulationTex;
uniform sampler2DArray reflectionModulationTexArrSC;
uniform sampler2D rimColorTex;
uniform sampler2DArray rimColorTexArrSC;
uniform sampler2D materialParamsTex;
uniform sampler2DArray materialParamsTexArrSC;
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
in vec4 varTangent;
in vec4 varPackedTex;
in vec4 varColor;
in vec2 varScreenTexturePos;
bool N7_EnableUV2;
ssGlobals tempGlobals;
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
vec2 N7_gettransformUV(int pickUV,vec2 scale,vec2 offset,bool animated,bool enabled)
{
vec2 l9_0=tempGlobals.Surface_UVCoord0;
vec2 l9_1;
if (enabled==N7_EnableUV2)
{
vec2 l9_2;
if (pickUV==0)
{
l9_2=tempGlobals.Surface_UVCoord0;
}
else
{
l9_2=l9_0;
}
vec2 l9_3;
if (pickUV==1)
{
l9_3=tempGlobals.Surface_UVCoord1;
}
else
{
l9_3=l9_2;
}
vec2 l9_4;
if (pickUV==2)
{
l9_4=tempGlobals.gScreenCoord;
}
else
{
l9_4=l9_3;
}
l9_1=l9_4;
}
else
{
vec2 l9_5;
if (pickUV==0)
{
l9_5=tempGlobals.Surface_UVCoord0;
}
else
{
l9_5=l9_0;
}
vec2 l9_6;
if (pickUV==1)
{
l9_6=tempGlobals.Surface_UVCoord1;
}
else
{
l9_6=l9_5;
}
vec2 l9_7;
if (pickUV==2)
{
l9_7=tempGlobals.gScreenCoord;
}
else
{
l9_7=l9_6;
}
vec2 l9_8;
if (pickUV==3)
{
l9_8=tempGlobals.N7_TransformedUV2;
}
else
{
l9_8=l9_7;
}
l9_1=l9_8;
}
vec2 l9_9=scale;
vec2 l9_10=l9_1*l9_9;
vec2 l9_11=offset;
vec2 l9_12=l9_10+l9_11;
vec2 l9_13;
if (animated)
{
l9_13=l9_12+(offset*tempGlobals.gTimeElapsed);
}
else
{
l9_13=l9_12;
}
return l9_13;
}
vec2 N7_getUV(int pickUV)
{
vec2 l9_0=tempGlobals.Surface_UVCoord0;
vec2 l9_1;
if (pickUV==0)
{
l9_1=tempGlobals.Surface_UVCoord0;
}
else
{
l9_1=l9_0;
}
vec2 l9_2;
if (pickUV==1)
{
l9_2=tempGlobals.Surface_UVCoord1;
}
else
{
l9_2=l9_1;
}
vec2 l9_3;
if (pickUV==2)
{
l9_3=tempGlobals.N7_TransformedUV2;
}
else
{
l9_3=l9_2;
}
vec2 l9_4;
if (pickUV==3)
{
l9_4=tempGlobals.N7_TransformedUV3;
}
else
{
l9_4=l9_3;
}
return l9_4;
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
int emissiveTexGetStereoViewIndex()
{
int l9_0;
#if (emissiveTexHasSwappedViews)
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
vec3 ssPow(vec3 A,vec3 B)
{
float l9_0;
if (A.x<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(A.x,B.x);
}
float l9_1;
if (A.y<=0.0)
{
l9_1=0.0;
}
else
{
l9_1=pow(A.y,B.y);
}
float l9_2;
if (A.z<=0.0)
{
l9_2=0.0;
}
else
{
l9_2=pow(A.z,B.z);
}
return vec3(l9_0,l9_1,l9_2);
}
int reflectionTexGetStereoViewIndex()
{
int l9_0;
#if (reflectionTexHasSwappedViews)
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
int reflectionModulationTexGetStereoViewIndex()
{
int l9_0;
#if (reflectionModulationTexHasSwappedViews)
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
float ssPow(float A,float B)
{
float l9_0;
if (A<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(A,B);
}
return l9_0;
}
vec3 N7_vec3srgbToLinear(vec3 color)
{
return vec3(ssPow(color.x,2.2),ssPow(color.y,2.2),ssPow(color.z,2.2));
}
int rimColorTexGetStereoViewIndex()
{
int l9_0;
#if (rimColorTexHasSwappedViews)
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
int materialParamsTexGetStereoViewIndex()
{
int l9_0;
#if (materialParamsTexHasSwappedViews)
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
float Dggx(float NdotH,float roughness_1)
{
float l9_0=roughness_1;
float l9_1=roughness_1;
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
vec3 getSpecularDominantDir(vec3 N,vec3 R,float roughness_1)
{
#if (SC_DEVICE_CLASS>=2)
{
return normalize(mix(R,N,vec3((roughness_1*roughness_1)*roughness_1)));
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
vec4 ngsCalculateLighting(vec3 albedo,float opacity,vec3 normal,vec3 position,vec3 viewDir,vec3 emissive,float metallic_1,float roughness_1,vec3 ao,vec3 specularAO)
{
float l9_0=opacity;
vec3 l9_1=ssSRGB_to_Linear(albedo);
vec3 l9_2=normal;
vec3 l9_3=normalize(l9_2);
vec3 l9_4=position;
vec3 l9_5=viewDir;
vec3 l9_6=ssSRGB_to_Linear(emissive);
float l9_7=metallic_1;
float l9_8=roughness_1;
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
vec3 l9_13=mix(vec3(0.039999999),l9_1*l9_7,l9_12);
vec3 l9_14=mix(l9_1*(1.0-l9_7),vec3(0.0),l9_12);
SurfaceProperties l9_15=SurfaceProperties(l9_14,l9_0,l9_3,l9_4,l9_5,l9_7,l9_8,l9_6,l9_11,l9_10,vec3(1.0),l9_13);
vec4 l9_16=vec4(1.0);
vec3 l9_17;
vec3 l9_18;
vec3 l9_19;
vec3 l9_20;
int l9_21;
vec3 l9_22;
vec3 l9_23;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_24;
vec3 l9_25;
vec3 l9_26;
vec3 l9_27;
int l9_28;
vec3 l9_29;
vec3 l9_30;
l9_30=vec3(1.0);
l9_29=vec3(0.0);
l9_28=0;
l9_27=vec3(0.0);
l9_26=vec3(0.0);
l9_25=vec3(0.0);
l9_24=vec3(0.0);
LightingComponents l9_31;
LightProperties l9_32;
SurfaceProperties l9_33;
vec3 l9_34;
int l9_35=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_35<sc_DirectionalLightsCount)
{
LightingComponents l9_36=accumulateLight(LightingComponents(l9_24,l9_25,l9_30,l9_29,l9_27,l9_26),LightProperties(sc_DirectionalLights[l9_35].direction,sc_DirectionalLights[l9_35].color.xyz,sc_DirectionalLights[l9_35].color.w*l9_16[(l9_28<3) ? l9_28 : 3]),l9_15,l9_5);
l9_30=l9_36.indirectDiffuse;
l9_29=l9_36.indirectSpecular;
l9_28++;
l9_27=l9_36.emitted;
l9_26=l9_36.transmitted;
l9_25=l9_36.directSpecular;
l9_24=l9_36.directDiffuse;
l9_35++;
continue;
}
else
{
break;
}
}
l9_23=l9_30;
l9_22=l9_29;
l9_21=l9_28;
l9_20=l9_27;
l9_19=l9_26;
l9_18=l9_25;
l9_17=l9_24;
}
#else
{
l9_23=vec3(1.0);
l9_22=vec3(0.0);
l9_21=0;
l9_20=vec3(0.0);
l9_19=vec3(0.0);
l9_18=vec3(0.0);
l9_17=vec3(0.0);
}
#endif
vec3 l9_37;
vec3 l9_38;
vec3 l9_39;
#if (sc_PointLightsCount>0)
{
vec3 l9_40;
vec3 l9_41;
vec3 l9_42;
vec3 l9_43;
vec3 l9_44;
vec3 l9_45;
l9_45=l9_23;
l9_44=l9_22;
l9_43=l9_20;
l9_42=l9_19;
l9_41=l9_18;
l9_40=l9_17;
int l9_46;
vec3 l9_47;
vec3 l9_48;
vec3 l9_49;
vec3 l9_50;
vec3 l9_51;
vec3 l9_52;
int l9_53=0;
int l9_54=l9_21;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_53<sc_PointLightsCount)
{
vec3 l9_55=sc_PointLights[l9_53].position-l9_4;
vec3 l9_56=normalize(l9_55);
float l9_57=l9_16[(l9_54<3) ? l9_54 : 3];
float l9_58=clamp((dot(l9_56,sc_PointLights[l9_53].direction)*sc_PointLights[l9_53].angleScale)+sc_PointLights[l9_53].angleOffset,0.0,1.0);
float l9_59=(sc_PointLights[l9_53].color.w*l9_57)*(l9_58*l9_58);
float l9_60;
if (sc_PointLights[l9_53].falloffEnabled)
{
l9_60=l9_59*computeDistanceAttenuation(length(l9_55),sc_PointLights[l9_53].falloffEndDistance);
}
else
{
l9_60=l9_59;
}
l9_46=l9_54+1;
LightingComponents l9_61=accumulateLight(LightingComponents(l9_40,l9_41,l9_45,l9_44,l9_43,l9_42),LightProperties(l9_56,sc_PointLights[l9_53].color.xyz,l9_60),l9_15,l9_5);
l9_47=l9_61.directDiffuse;
l9_48=l9_61.directSpecular;
l9_49=l9_61.indirectDiffuse;
l9_50=l9_61.indirectSpecular;
l9_51=l9_61.emitted;
l9_52=l9_61.transmitted;
l9_45=l9_49;
l9_44=l9_50;
l9_54=l9_46;
l9_43=l9_51;
l9_42=l9_52;
l9_41=l9_48;
l9_40=l9_47;
l9_53++;
continue;
}
else
{
break;
}
}
l9_39=l9_42;
l9_38=l9_41;
l9_37=l9_40;
}
#else
{
l9_39=l9_19;
l9_38=l9_18;
l9_37=l9_17;
}
#endif
vec3 l9_62;
vec3 l9_63;
#if (sc_ProjectiveShadowsReceiver)
{
vec3 l9_64;
#if (sc_ProjectiveShadowsReceiver)
{
vec2 l9_65=abs(varShadowTex-vec2(0.5));
vec4 l9_66=texture(sc_ShadowTexture,varShadowTex)*step(max(l9_65.x,l9_65.y),0.5);
l9_64=mix(vec3(1.0),mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_66.xyz,vec3(sc_ShadowColor.w)),vec3(l9_66.w*sc_ShadowDensity));
}
#else
{
l9_64=vec3(1.0);
}
#endif
l9_63=l9_38*l9_64;
l9_62=l9_37*l9_64;
}
#else
{
l9_63=l9_38;
l9_62=l9_37;
}
#endif
vec3 l9_67;
vec3 l9_68;
if ((sc_RayTracingReceiverEffectsMask&4)!=0)
{
vec2 l9_69=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec4 l9_70;
#if (sc_RayTracingShadowsLayout==2)
{
l9_70=texture(sc_RayTracingShadowsArrSC,sc_SamplingCoordsViewToGlobal(l9_69,sc_RayTracingShadowsLayout,sc_RayTracingShadowsGetStereoViewIndex()),0.0);
}
#else
{
l9_70=texture(sc_RayTracingShadows,sc_SamplingCoordsViewToGlobal(l9_69,sc_RayTracingShadowsLayout,sc_RayTracingShadowsGetStereoViewIndex()).xy,0.0);
}
#endif
float l9_71=1.0-l9_70.x;
l9_68=l9_62*l9_71;
l9_67=l9_63*l9_71;
}
else
{
l9_68=l9_62;
l9_67=l9_63;
}
vec3 l9_72;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
vec2 l9_73=calcPanoramicTexCoordsFromDir(l9_3,sc_EnvmapRotation.y);
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
l9_72=(l9_74.xyz*(1.0/l9_74.w))*sc_EnvmapExposure;
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
l9_72=l9_81;
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
l9_86=mix(l9_72,l9_88.xyz,vec3(l9_88.w));
}
else
{
l9_86=l9_72;
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
vec3 l9_112;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
float l9_113=clamp(pow(l9_8,0.66666669),0.0,1.0)*5.0;
vec2 l9_114=calcPanoramicTexCoordsFromDir(getSpecularDominantDir(l9_3,reflect(-l9_5,l9_3),l9_8),sc_EnvmapRotation.y);
vec4 l9_115;
#if (SC_DEVICE_CLASS>=2)
{
float l9_116=floor(l9_113);
float l9_117=ceil(l9_113);
l9_115=mix(sc_EnvmapSpecularSampleViewLevel(calcSeamlessPanoramicUvsForSampling(l9_114,sc_EnvmapSpecularSize.xy,l9_116),l9_116),sc_EnvmapSpecularSampleViewLevel(calcSeamlessPanoramicUvsForSampling(l9_114,sc_EnvmapSpecularSize.xy,l9_117),l9_117),vec4(l9_113-l9_116));
}
#else
{
l9_115=sc_EnvmapSpecularSampleViewLevel(l9_114,l9_113);
}
#endif
vec3 l9_118=((l9_115.xyz*(1.0/l9_115.w))*sc_EnvmapExposure)+vec3(1e-06);
vec3 l9_119;
if ((sc_RayTracingReceiverEffectsMask&1)!=0)
{
vec2 l9_120=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec4 l9_121;
#if (sc_RayTracingReflectionsLayout==2)
{
l9_121=texture(sc_RayTracingReflectionsArrSC,sc_SamplingCoordsViewToGlobal(l9_120,sc_RayTracingReflectionsLayout,sc_RayTracingReflectionsGetStereoViewIndex()),0.0);
}
#else
{
l9_121=texture(sc_RayTracingReflections,sc_SamplingCoordsViewToGlobal(l9_120,sc_RayTracingReflectionsLayout,sc_RayTracingReflectionsGetStereoViewIndex()).xy,0.0);
}
#endif
l9_119=mix(l9_118,l9_121.xyz,vec3(l9_121.w));
}
else
{
l9_119=l9_118;
}
l9_112=vec3(0.0)+(l9_119*envBRDFApprox(l9_15,abs(dot(l9_3,l9_5))));
}
#else
{
l9_112=vec3(0.0);
}
#endif
vec3 l9_122;
#if (sc_LightEstimation)
{
float l9_123=clamp(l9_8*l9_8,0.0099999998,1.0);
vec3 l9_124;
l9_124=sc_LightEstimationData.ambientLight*l9_13;
int l9_125=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_125<sc_LightEstimationSGCount)
{
float l9_126=l9_123*l9_123;
vec3 l9_127=reflect(-l9_5,l9_3);
float l9_128=dot(l9_3,l9_5);
float l9_129=(2.0/l9_126)/(4.0*max(l9_128,9.9999997e-05));
float l9_130=length((l9_127*l9_129)+(sc_LightEstimationData.sg[l9_125].axis*sc_LightEstimationData.sg[l9_125].sharpness));
float l9_131=clamp(dot(l9_3,l9_127),0.0,1.0);
float l9_132=clamp(l9_128,0.0,1.0);
float l9_133=1.0-l9_126;
l9_124+=((((((((vec3(1.0/(3.1415927*l9_126))*exp((l9_130-l9_129)-sc_LightEstimationData.sg[l9_125].sharpness))*sc_LightEstimationData.sg[l9_125].color)*6.2831855)*(1.0-exp((-2.0)*l9_130)))/vec3(l9_130))*((1.0/(l9_131+sqrt(l9_126+((l9_133*l9_131)*l9_131))))*(1.0/(l9_132+sqrt(l9_126+((l9_133*l9_132)*l9_132))))))*(l9_13+((vec3(1.0)-l9_13)*pow(1.0-clamp(dot(l9_127,normalize(l9_127+l9_5)),0.0,1.0),5.0))))*l9_131);
l9_125++;
continue;
}
else
{
break;
}
}
l9_122=l9_112+l9_124;
}
#else
{
l9_122=l9_112;
}
#endif
float l9_134;
vec3 l9_135;
vec3 l9_136;
vec3 l9_137;
#if (sc_BlendMode_ColoredGlass)
{
l9_137=vec3(0.0);
l9_136=vec3(0.0);
l9_135=ssSRGB_to_Linear(sc_GetFramebufferColor().xyz)*mix(vec3(1.0),l9_14,vec3(l9_0));
l9_134=1.0;
}
#else
{
l9_137=l9_68;
l9_136=l9_98;
l9_135=l9_39;
l9_134=l9_0;
}
#endif
bool l9_138;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_138=true;
}
#else
{
l9_138=false;
}
#endif
vec3 l9_139=l9_136*l9_11;
vec3 l9_140=l9_137+l9_139;
vec3 l9_141=l9_14*l9_140;
vec3 l9_142=l9_122*l9_10;
vec3 l9_143=l9_67+l9_142;
vec3 l9_144;
if (l9_138)
{
l9_144=l9_141*srgbToLinear(l9_134);
}
else
{
l9_144=l9_141;
}
vec3 l9_145=l9_144+l9_143;
vec3 l9_146=(l9_145+l9_6)+l9_135;
float l9_147=l9_146.x;
vec4 l9_148=vec4(l9_147,l9_146.yz,l9_134);
vec4 l9_149;
#if (sc_IsEditor)
{
vec4 l9_150=l9_148;
l9_150.x=l9_147+((l9_11.x*l9_10.x)*9.9999997e-06);
l9_149=l9_150;
}
#else
{
l9_149=l9_148;
}
#endif
if (sc_RayTracingCasterConfiguration.x!=0u)
{
return l9_149;
}
vec4 l9_151;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_152=l9_149.xyz*1.8;
vec3 l9_153=(l9_149.xyz*(l9_152+vec3(1.4)))/((l9_149.xyz*(l9_152+vec3(0.5)))+vec3(1.5));
l9_151=vec4(l9_153.x,l9_153.y,l9_153.z,l9_149.w);
}
#else
{
l9_151=l9_149;
}
#endif
vec3 l9_154=vec3(linearToSrgb(l9_151.x),linearToSrgb(l9_151.y),linearToSrgb(l9_151.z));
return vec4(l9_154.x,l9_154.y,l9_154.z,l9_151.w);
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
N7_EnableUV2=false;
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
vec4 l9_2;
vec2 l9_3;
vec2 l9_4;
vec3 l9_5;
vec3 l9_6;
vec3 l9_7;
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
vec3 l9_14=l9_13.xyz;
vec4 l9_15=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(l9_11,1.0);
l9_9=l9_10.viewDirWS;
l9_8=l9_11;
l9_7=l9_12;
l9_6=l9_14;
l9_5=cross(l9_12,l9_14)*l9_13.w;
l9_4=l9_10.uv0;
l9_3=l9_10.uv1;
l9_2=l9_10.color;
l9_1=((l9_15.xy/vec2(l9_15.w))*0.5)+vec2(0.5);
}
else
{
vec3 l9_16=normalize(varNormal);
vec3 l9_17=normalize(varTangent.xyz);
l9_9=normalize(sc_Camera.position-varPos);
l9_8=varPos;
l9_7=l9_16;
l9_6=l9_17;
l9_5=cross(l9_16,l9_17)*varTangent.w;
l9_4=varPackedTex.xy;
l9_3=varPackedTex.zw;
l9_2=varColor;
l9_1=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
}
tempGlobals=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec2(0.0),vec2(0.0),vec3(0.0),l9_9,l9_8,l9_7,l9_6,l9_5,l9_4,l9_3,l9_2,l9_1,l9_8);
N7_EnableUV2=(int(ENABLE_UV2)!=0);
tempGlobals.N7_TransformedUV2=N7_gettransformUV(NODE_13_DROPLIST_ITEM,uv2Scale,uv2Offset,(int(uv2EnableAnimation)!=0),N7_EnableUV2);
tempGlobals.N7_TransformedUV3=N7_gettransformUV(NODE_49_DROPLIST_ITEM,uv3Scale,uv3Offset,(int(uv3EnableAnimation)!=0),(int(ENABLE_UV3)!=0));
vec4 l9_18;
#if (ENABLE_BASE_TEX)
{
vec2 l9_19=N7_getUV(NODE_27_DROPLIST_ITEM);
vec4 l9_20;
#if (baseTexLayout==2)
{
bool l9_21=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_22=l9_19.x;
sc_SoftwareWrapEarly(l9_22,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_23=l9_22;
float l9_24=l9_19.y;
sc_SoftwareWrapEarly(l9_24,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_25=l9_24;
vec2 l9_26;
float l9_27;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_28;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_28=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_28=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_29=l9_23;
float l9_30=1.0;
sc_ClampUV(l9_29,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_28,l9_30);
float l9_31=l9_29;
float l9_32=l9_30;
bool l9_33;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_33=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_33=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_34=l9_25;
float l9_35=l9_32;
sc_ClampUV(l9_34,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_33,l9_35);
l9_27=l9_35;
l9_26=vec2(l9_31,l9_34);
}
#else
{
l9_27=1.0;
l9_26=vec2(l9_23,l9_25);
}
#endif
vec2 l9_36=sc_TransformUV(l9_26,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_37=l9_36.x;
float l9_38=l9_27;
sc_SoftwareWrapLate(l9_37,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_21,l9_38);
float l9_39=l9_36.y;
float l9_40=l9_38;
sc_SoftwareWrapLate(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_21,l9_40);
float l9_41=l9_40;
vec3 l9_42=sc_SamplingCoordsViewToGlobal(vec2(l9_37,l9_39),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_43=texture(baseTexArrSC,l9_42,0.0);
vec4 l9_44;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_44=mix(baseTexBorderColor,l9_43,vec4(l9_41));
}
#else
{
l9_44=l9_43;
}
#endif
l9_20=l9_44;
}
#else
{
bool l9_45=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_46=l9_19.x;
sc_SoftwareWrapEarly(l9_46,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_47=l9_46;
float l9_48=l9_19.y;
sc_SoftwareWrapEarly(l9_48,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_49=l9_48;
vec2 l9_50;
float l9_51;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_52;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_52=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_52=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_53=l9_47;
float l9_54=1.0;
sc_ClampUV(l9_53,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_52,l9_54);
float l9_55=l9_53;
float l9_56=l9_54;
bool l9_57;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_57=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_57=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_58=l9_49;
float l9_59=l9_56;
sc_ClampUV(l9_58,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_57,l9_59);
l9_51=l9_59;
l9_50=vec2(l9_55,l9_58);
}
#else
{
l9_51=1.0;
l9_50=vec2(l9_47,l9_49);
}
#endif
vec2 l9_60=sc_TransformUV(l9_50,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_61=l9_60.x;
float l9_62=l9_51;
sc_SoftwareWrapLate(l9_61,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_45,l9_62);
float l9_63=l9_60.y;
float l9_64=l9_62;
sc_SoftwareWrapLate(l9_63,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_45,l9_64);
float l9_65=l9_64;
vec3 l9_66=sc_SamplingCoordsViewToGlobal(vec2(l9_61,l9_63),baseTexLayout,baseTexGetStereoViewIndex());
vec4 l9_67=texture(baseTex,l9_66.xy,0.0);
vec4 l9_68;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_68=mix(baseTexBorderColor,l9_67,vec4(l9_65));
}
#else
{
l9_68=l9_67;
}
#endif
l9_20=l9_68;
}
#endif
l9_18=baseColor*l9_20;
}
#else
{
l9_18=baseColor;
}
#endif
vec4 l9_69;
#if (ENABLE_RECOLOR)
{
vec3 l9_70=((recolorRed*l9_18.x)+(recolorGreen*l9_18.y))+(recolorBlue*l9_18.z);
l9_69=vec4(l9_70.x,l9_70.y,l9_70.z,l9_18.w);
}
#else
{
l9_69=l9_18;
}
#endif
float l9_71;
#if (ENABLE_OPACITY_TEX)
{
vec2 l9_72=N7_getUV(NODE_69_DROPLIST_ITEM);
vec4 l9_73;
#if (opacityTexLayout==2)
{
bool l9_74=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_75=l9_72.x;
sc_SoftwareWrapEarly(l9_75,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_76=l9_75;
float l9_77=l9_72.y;
sc_SoftwareWrapEarly(l9_77,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_78=l9_77;
vec2 l9_79;
float l9_80;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_81;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_81=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_81=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_82=l9_76;
float l9_83=1.0;
sc_ClampUV(l9_82,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_81,l9_83);
float l9_84=l9_82;
float l9_85=l9_83;
bool l9_86;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_86=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_86=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_87=l9_78;
float l9_88=l9_85;
sc_ClampUV(l9_87,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_86,l9_88);
l9_80=l9_88;
l9_79=vec2(l9_84,l9_87);
}
#else
{
l9_80=1.0;
l9_79=vec2(l9_76,l9_78);
}
#endif
vec2 l9_89=sc_TransformUV(l9_79,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_90=l9_89.x;
float l9_91=l9_80;
sc_SoftwareWrapLate(l9_90,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_74,l9_91);
float l9_92=l9_89.y;
float l9_93=l9_91;
sc_SoftwareWrapLate(l9_92,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_74,l9_93);
float l9_94=l9_93;
vec3 l9_95=sc_SamplingCoordsViewToGlobal(vec2(l9_90,l9_92),opacityTexLayout,opacityTexGetStereoViewIndex());
vec4 l9_96=texture(opacityTexArrSC,l9_95,0.0);
vec4 l9_97;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_97=mix(opacityTexBorderColor,l9_96,vec4(l9_94));
}
#else
{
l9_97=l9_96;
}
#endif
l9_73=l9_97;
}
#else
{
bool l9_98=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_99=l9_72.x;
sc_SoftwareWrapEarly(l9_99,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_100=l9_99;
float l9_101=l9_72.y;
sc_SoftwareWrapEarly(l9_101,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_102=l9_101;
vec2 l9_103;
float l9_104;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_105;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_105=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_105=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_106=l9_100;
float l9_107=1.0;
sc_ClampUV(l9_106,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_105,l9_107);
float l9_108=l9_106;
float l9_109=l9_107;
bool l9_110;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_110=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_110=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_111=l9_102;
float l9_112=l9_109;
sc_ClampUV(l9_111,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_110,l9_112);
l9_104=l9_112;
l9_103=vec2(l9_108,l9_111);
}
#else
{
l9_104=1.0;
l9_103=vec2(l9_100,l9_102);
}
#endif
vec2 l9_113=sc_TransformUV(l9_103,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_114=l9_113.x;
float l9_115=l9_104;
sc_SoftwareWrapLate(l9_114,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_98,l9_115);
float l9_116=l9_113.y;
float l9_117=l9_115;
sc_SoftwareWrapLate(l9_116,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_98,l9_117);
float l9_118=l9_117;
vec3 l9_119=sc_SamplingCoordsViewToGlobal(vec2(l9_114,l9_116),opacityTexLayout,opacityTexGetStereoViewIndex());
vec4 l9_120=texture(opacityTex,l9_119.xy,0.0);
vec4 l9_121;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_121=mix(opacityTexBorderColor,l9_120,vec4(l9_118));
}
#else
{
l9_121=l9_120;
}
#endif
l9_73=l9_121;
}
#endif
l9_71=l9_73.x;
}
#else
{
l9_71=1.0;
}
#endif
float l9_122=l9_71*l9_69.w;
vec4 l9_123;
float l9_124;
if (NODE_38_DROPLIST_ITEM==1)
{
l9_124=l9_122*tempGlobals.VertexColor.w;
l9_123=l9_69*tempGlobals.VertexColor;
}
else
{
l9_124=l9_122;
l9_123=l9_69;
}
vec3 l9_125;
#if (ENABLE_NORMALMAP)
{
vec2 l9_126=N7_getUV(NODE_181_DROPLIST_ITEM);
vec4 l9_127;
#if (normalTexLayout==2)
{
bool l9_128=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_129=l9_126.x;
sc_SoftwareWrapEarly(l9_129,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_130=l9_129;
float l9_131=l9_126.y;
sc_SoftwareWrapEarly(l9_131,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_132=l9_131;
vec2 l9_133;
float l9_134;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_135;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_135=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_135=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_136=l9_130;
float l9_137=1.0;
sc_ClampUV(l9_136,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_135,l9_137);
float l9_138=l9_136;
float l9_139=l9_137;
bool l9_140;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_140=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_140=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_141=l9_132;
float l9_142=l9_139;
sc_ClampUV(l9_141,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_140,l9_142);
l9_134=l9_142;
l9_133=vec2(l9_138,l9_141);
}
#else
{
l9_134=1.0;
l9_133=vec2(l9_130,l9_132);
}
#endif
vec2 l9_143=sc_TransformUV(l9_133,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_144=l9_143.x;
float l9_145=l9_134;
sc_SoftwareWrapLate(l9_144,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_128,l9_145);
float l9_146=l9_143.y;
float l9_147=l9_145;
sc_SoftwareWrapLate(l9_146,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_128,l9_147);
float l9_148=l9_147;
vec3 l9_149=sc_SamplingCoordsViewToGlobal(vec2(l9_144,l9_146),normalTexLayout,normalTexGetStereoViewIndex());
vec4 l9_150=texture(normalTexArrSC,l9_149,0.0);
vec4 l9_151;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_151=mix(normalTexBorderColor,l9_150,vec4(l9_148));
}
#else
{
l9_151=l9_150;
}
#endif
l9_127=l9_151;
}
#else
{
bool l9_152=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_153=l9_126.x;
sc_SoftwareWrapEarly(l9_153,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_154=l9_153;
float l9_155=l9_126.y;
sc_SoftwareWrapEarly(l9_155,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_156=l9_155;
vec2 l9_157;
float l9_158;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_159;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_159=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_159=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_160=l9_154;
float l9_161=1.0;
sc_ClampUV(l9_160,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_159,l9_161);
float l9_162=l9_160;
float l9_163=l9_161;
bool l9_164;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_164=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_164=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_165=l9_156;
float l9_166=l9_163;
sc_ClampUV(l9_165,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_164,l9_166);
l9_158=l9_166;
l9_157=vec2(l9_162,l9_165);
}
#else
{
l9_158=1.0;
l9_157=vec2(l9_154,l9_156);
}
#endif
vec2 l9_167=sc_TransformUV(l9_157,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_168=l9_167.x;
float l9_169=l9_158;
sc_SoftwareWrapLate(l9_168,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_152,l9_169);
float l9_170=l9_167.y;
float l9_171=l9_169;
sc_SoftwareWrapLate(l9_170,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_152,l9_171);
float l9_172=l9_171;
vec3 l9_173=sc_SamplingCoordsViewToGlobal(vec2(l9_168,l9_170),normalTexLayout,normalTexGetStereoViewIndex());
vec4 l9_174=texture(normalTex,l9_173.xy,0.0);
vec4 l9_175;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_175=mix(normalTexBorderColor,l9_174,vec4(l9_172));
}
#else
{
l9_175=l9_174;
}
#endif
l9_127=l9_175;
}
#endif
vec3 l9_176;
#if (ENABLE_DETAIL_NORMAL)
{
vec2 l9_177=N7_getUV(NODE_184_DROPLIST_ITEM);
vec4 l9_178;
#if (detailNormalTexLayout==2)
{
bool l9_179=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_180=l9_177.x;
sc_SoftwareWrapEarly(l9_180,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_181=l9_180;
float l9_182=l9_177.y;
sc_SoftwareWrapEarly(l9_182,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_183=l9_182;
vec2 l9_184;
float l9_185;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_186;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_186=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_186=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_187=l9_181;
float l9_188=1.0;
sc_ClampUV(l9_187,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_186,l9_188);
float l9_189=l9_187;
float l9_190=l9_188;
bool l9_191;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_191=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_191=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_192=l9_183;
float l9_193=l9_190;
sc_ClampUV(l9_192,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_191,l9_193);
l9_185=l9_193;
l9_184=vec2(l9_189,l9_192);
}
#else
{
l9_185=1.0;
l9_184=vec2(l9_181,l9_183);
}
#endif
vec2 l9_194=sc_TransformUV(l9_184,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_195=l9_194.x;
float l9_196=l9_185;
sc_SoftwareWrapLate(l9_195,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_179,l9_196);
float l9_197=l9_194.y;
float l9_198=l9_196;
sc_SoftwareWrapLate(l9_197,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_179,l9_198);
float l9_199=l9_198;
vec3 l9_200=sc_SamplingCoordsViewToGlobal(vec2(l9_195,l9_197),detailNormalTexLayout,detailNormalTexGetStereoViewIndex());
vec4 l9_201=texture(detailNormalTexArrSC,l9_200,0.0);
vec4 l9_202;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_202=mix(detailNormalTexBorderColor,l9_201,vec4(l9_199));
}
#else
{
l9_202=l9_201;
}
#endif
l9_178=l9_202;
}
#else
{
bool l9_203=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_204=l9_177.x;
sc_SoftwareWrapEarly(l9_204,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_205=l9_204;
float l9_206=l9_177.y;
sc_SoftwareWrapEarly(l9_206,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_207=l9_206;
vec2 l9_208;
float l9_209;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_210;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_210=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_210=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_211=l9_205;
float l9_212=1.0;
sc_ClampUV(l9_211,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_210,l9_212);
float l9_213=l9_211;
float l9_214=l9_212;
bool l9_215;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_215=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_215=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_216=l9_207;
float l9_217=l9_214;
sc_ClampUV(l9_216,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_215,l9_217);
l9_209=l9_217;
l9_208=vec2(l9_213,l9_216);
}
#else
{
l9_209=1.0;
l9_208=vec2(l9_205,l9_207);
}
#endif
vec2 l9_218=sc_TransformUV(l9_208,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_219=l9_218.x;
float l9_220=l9_209;
sc_SoftwareWrapLate(l9_219,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_203,l9_220);
float l9_221=l9_218.y;
float l9_222=l9_220;
sc_SoftwareWrapLate(l9_221,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_203,l9_222);
float l9_223=l9_222;
vec3 l9_224=sc_SamplingCoordsViewToGlobal(vec2(l9_219,l9_221),detailNormalTexLayout,detailNormalTexGetStereoViewIndex());
vec4 l9_225=texture(detailNormalTex,l9_224.xy,0.0);
vec4 l9_226;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_226=mix(detailNormalTexBorderColor,l9_225,vec4(l9_223));
}
#else
{
l9_226=l9_225;
}
#endif
l9_178=l9_226;
}
#endif
l9_176=(l9_178.xyz*1.9921875)-vec3(1.0);
}
#else
{
l9_176=vec3(0.0,0.0,1.0);
}
#endif
vec3 l9_227=((l9_127.xyz*1.9921875)-vec3(1.0))+vec3(0.0,0.0,1.0);
vec3 l9_228=l9_176*vec3(-1.0,-1.0,1.0);
l9_125=normalize(mat3(tempGlobals.VertexTangent_WorldSpace,tempGlobals.VertexBinormal_WorldSpace,tempGlobals.VertexNormal_WorldSpace)*normalize((l9_227*dot(l9_227,l9_228))-(l9_228*l9_227.z)));
}
#else
{
l9_125=normalize(tempGlobals.VertexNormal_WorldSpace);
}
#endif
vec3 l9_229;
#if (ENABLE_EMISSIVE)
{
vec2 l9_230=N7_getUV(NODE_76_DROPLIST_ITEM);
vec4 l9_231;
#if (emissiveTexLayout==2)
{
bool l9_232=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTex)!=0));
float l9_233=l9_230.x;
sc_SoftwareWrapEarly(l9_233,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x);
float l9_234=l9_233;
float l9_235=l9_230.y;
sc_SoftwareWrapEarly(l9_235,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y);
float l9_236=l9_235;
vec2 l9_237;
float l9_238;
#if (SC_USE_UV_MIN_MAX_emissiveTex)
{
bool l9_239;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_239=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x==3;
}
#else
{
l9_239=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_240=l9_234;
float l9_241=1.0;
sc_ClampUV(l9_240,emissiveTexUvMinMax.x,emissiveTexUvMinMax.z,l9_239,l9_241);
float l9_242=l9_240;
float l9_243=l9_241;
bool l9_244;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_244=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y==3;
}
#else
{
l9_244=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_245=l9_236;
float l9_246=l9_243;
sc_ClampUV(l9_245,emissiveTexUvMinMax.y,emissiveTexUvMinMax.w,l9_244,l9_246);
l9_238=l9_246;
l9_237=vec2(l9_242,l9_245);
}
#else
{
l9_238=1.0;
l9_237=vec2(l9_234,l9_236);
}
#endif
vec2 l9_247=sc_TransformUV(l9_237,(int(SC_USE_UV_TRANSFORM_emissiveTex)!=0),emissiveTexTransform);
float l9_248=l9_247.x;
float l9_249=l9_238;
sc_SoftwareWrapLate(l9_248,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x,l9_232,l9_249);
float l9_250=l9_247.y;
float l9_251=l9_249;
sc_SoftwareWrapLate(l9_250,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y,l9_232,l9_251);
float l9_252=l9_251;
vec3 l9_253=sc_SamplingCoordsViewToGlobal(vec2(l9_248,l9_250),emissiveTexLayout,emissiveTexGetStereoViewIndex());
vec4 l9_254=texture(emissiveTexArrSC,l9_253,0.0);
vec4 l9_255;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_255=mix(emissiveTexBorderColor,l9_254,vec4(l9_252));
}
#else
{
l9_255=l9_254;
}
#endif
l9_231=l9_255;
}
#else
{
bool l9_256=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTex)!=0));
float l9_257=l9_230.x;
sc_SoftwareWrapEarly(l9_257,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x);
float l9_258=l9_257;
float l9_259=l9_230.y;
sc_SoftwareWrapEarly(l9_259,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y);
float l9_260=l9_259;
vec2 l9_261;
float l9_262;
#if (SC_USE_UV_MIN_MAX_emissiveTex)
{
bool l9_263;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_263=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x==3;
}
#else
{
l9_263=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_264=l9_258;
float l9_265=1.0;
sc_ClampUV(l9_264,emissiveTexUvMinMax.x,emissiveTexUvMinMax.z,l9_263,l9_265);
float l9_266=l9_264;
float l9_267=l9_265;
bool l9_268;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_268=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y==3;
}
#else
{
l9_268=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_269=l9_260;
float l9_270=l9_267;
sc_ClampUV(l9_269,emissiveTexUvMinMax.y,emissiveTexUvMinMax.w,l9_268,l9_270);
l9_262=l9_270;
l9_261=vec2(l9_266,l9_269);
}
#else
{
l9_262=1.0;
l9_261=vec2(l9_258,l9_260);
}
#endif
vec2 l9_271=sc_TransformUV(l9_261,(int(SC_USE_UV_TRANSFORM_emissiveTex)!=0),emissiveTexTransform);
float l9_272=l9_271.x;
float l9_273=l9_262;
sc_SoftwareWrapLate(l9_272,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x,l9_256,l9_273);
float l9_274=l9_271.y;
float l9_275=l9_273;
sc_SoftwareWrapLate(l9_274,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y,l9_256,l9_275);
float l9_276=l9_275;
vec3 l9_277=sc_SamplingCoordsViewToGlobal(vec2(l9_272,l9_274),emissiveTexLayout,emissiveTexGetStereoViewIndex());
vec4 l9_278=texture(emissiveTex,l9_277.xy,0.0);
vec4 l9_279;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_279=mix(emissiveTexBorderColor,l9_278,vec4(l9_276));
}
#else
{
l9_279=l9_278;
}
#endif
l9_231=l9_279;
}
#endif
l9_229=l9_231.xyz;
}
#else
{
l9_229=vec3(0.0);
}
#endif
bool l9_280=NODE_38_DROPLIST_ITEM==2;
vec3 l9_281;
if (l9_280)
{
l9_281=l9_229+tempGlobals.VertexColor.xyz;
}
else
{
l9_281=l9_229;
}
vec3 l9_282;
if (l9_280||(int(ENABLE_EMISSIVE)!=0))
{
l9_282=ssPow((l9_281*emissiveColor)*vec3(emissiveIntensity),vec3(2.2));
}
else
{
l9_282=l9_281;
}
vec3 l9_283;
#if (ENABLE_SIMPLE_REFLECTION)
{
vec3 l9_284=tempGlobals.ViewDirWS;
vec3 l9_285=reflect(l9_284,l9_125);
float l9_286=l9_285.x;
float l9_287=l9_285.y;
float l9_288=(-l9_285.z)+1.0;
float l9_289=((l9_286*l9_286)+(l9_287*l9_287))+(l9_288*l9_288);
float l9_290;
if (l9_289<=0.0)
{
l9_290=0.0;
}
else
{
l9_290=sqrt(l9_289);
}
float l9_291=2.0*l9_290;
vec2 l9_292=vec2(1.0)-((l9_285.xy/vec2(l9_291))+vec2(0.5));
vec4 l9_293;
#if (reflectionTexLayout==2)
{
bool l9_294=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionTex)!=0));
float l9_295=l9_292.x;
sc_SoftwareWrapEarly(l9_295,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x);
float l9_296=l9_295;
float l9_297=l9_292.y;
sc_SoftwareWrapEarly(l9_297,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y);
float l9_298=l9_297;
vec2 l9_299;
float l9_300;
#if (SC_USE_UV_MIN_MAX_reflectionTex)
{
bool l9_301;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_301=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x==3;
}
#else
{
l9_301=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_302=l9_296;
float l9_303=1.0;
sc_ClampUV(l9_302,reflectionTexUvMinMax.x,reflectionTexUvMinMax.z,l9_301,l9_303);
float l9_304=l9_302;
float l9_305=l9_303;
bool l9_306;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_306=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y==3;
}
#else
{
l9_306=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_307=l9_298;
float l9_308=l9_305;
sc_ClampUV(l9_307,reflectionTexUvMinMax.y,reflectionTexUvMinMax.w,l9_306,l9_308);
l9_300=l9_308;
l9_299=vec2(l9_304,l9_307);
}
#else
{
l9_300=1.0;
l9_299=vec2(l9_296,l9_298);
}
#endif
vec2 l9_309=sc_TransformUV(l9_299,(int(SC_USE_UV_TRANSFORM_reflectionTex)!=0),reflectionTexTransform);
float l9_310=l9_309.x;
float l9_311=l9_300;
sc_SoftwareWrapLate(l9_310,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x,l9_294,l9_311);
float l9_312=l9_309.y;
float l9_313=l9_311;
sc_SoftwareWrapLate(l9_312,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y,l9_294,l9_313);
float l9_314=l9_313;
vec3 l9_315=sc_SamplingCoordsViewToGlobal(vec2(l9_310,l9_312),reflectionTexLayout,reflectionTexGetStereoViewIndex());
vec4 l9_316=texture(reflectionTexArrSC,l9_315,0.0);
vec4 l9_317;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_317=mix(reflectionTexBorderColor,l9_316,vec4(l9_314));
}
#else
{
l9_317=l9_316;
}
#endif
l9_293=l9_317;
}
#else
{
bool l9_318=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionTex)!=0));
float l9_319=l9_292.x;
sc_SoftwareWrapEarly(l9_319,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x);
float l9_320=l9_319;
float l9_321=l9_292.y;
sc_SoftwareWrapEarly(l9_321,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y);
float l9_322=l9_321;
vec2 l9_323;
float l9_324;
#if (SC_USE_UV_MIN_MAX_reflectionTex)
{
bool l9_325;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_325=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x==3;
}
#else
{
l9_325=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_326=l9_320;
float l9_327=1.0;
sc_ClampUV(l9_326,reflectionTexUvMinMax.x,reflectionTexUvMinMax.z,l9_325,l9_327);
float l9_328=l9_326;
float l9_329=l9_327;
bool l9_330;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_330=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y==3;
}
#else
{
l9_330=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_331=l9_322;
float l9_332=l9_329;
sc_ClampUV(l9_331,reflectionTexUvMinMax.y,reflectionTexUvMinMax.w,l9_330,l9_332);
l9_324=l9_332;
l9_323=vec2(l9_328,l9_331);
}
#else
{
l9_324=1.0;
l9_323=vec2(l9_320,l9_322);
}
#endif
vec2 l9_333=sc_TransformUV(l9_323,(int(SC_USE_UV_TRANSFORM_reflectionTex)!=0),reflectionTexTransform);
float l9_334=l9_333.x;
float l9_335=l9_324;
sc_SoftwareWrapLate(l9_334,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x,l9_318,l9_335);
float l9_336=l9_333.y;
float l9_337=l9_335;
sc_SoftwareWrapLate(l9_336,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y,l9_318,l9_337);
float l9_338=l9_337;
vec3 l9_339=sc_SamplingCoordsViewToGlobal(vec2(l9_334,l9_336),reflectionTexLayout,reflectionTexGetStereoViewIndex());
vec4 l9_340=texture(reflectionTex,l9_339.xy,0.0);
vec4 l9_341;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_341=mix(reflectionTexBorderColor,l9_340,vec4(l9_338));
}
#else
{
l9_341=l9_340;
}
#endif
l9_293=l9_341;
}
#endif
vec3 l9_342;
#if (Tweak_N177)
{
vec2 l9_343=N7_getUV(NODE_228_DROPLIST_ITEM);
vec4 l9_344;
#if (reflectionModulationTexLayout==2)
{
bool l9_345=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionModulationTex)!=0));
float l9_346=l9_343.x;
sc_SoftwareWrapEarly(l9_346,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x);
float l9_347=l9_346;
float l9_348=l9_343.y;
sc_SoftwareWrapEarly(l9_348,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y);
float l9_349=l9_348;
vec2 l9_350;
float l9_351;
#if (SC_USE_UV_MIN_MAX_reflectionModulationTex)
{
bool l9_352;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_352=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x==3;
}
#else
{
l9_352=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_353=l9_347;
float l9_354=1.0;
sc_ClampUV(l9_353,reflectionModulationTexUvMinMax.x,reflectionModulationTexUvMinMax.z,l9_352,l9_354);
float l9_355=l9_353;
float l9_356=l9_354;
bool l9_357;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_357=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y==3;
}
#else
{
l9_357=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_358=l9_349;
float l9_359=l9_356;
sc_ClampUV(l9_358,reflectionModulationTexUvMinMax.y,reflectionModulationTexUvMinMax.w,l9_357,l9_359);
l9_351=l9_359;
l9_350=vec2(l9_355,l9_358);
}
#else
{
l9_351=1.0;
l9_350=vec2(l9_347,l9_349);
}
#endif
vec2 l9_360=sc_TransformUV(l9_350,(int(SC_USE_UV_TRANSFORM_reflectionModulationTex)!=0),reflectionModulationTexTransform);
float l9_361=l9_360.x;
float l9_362=l9_351;
sc_SoftwareWrapLate(l9_361,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x,l9_345,l9_362);
float l9_363=l9_360.y;
float l9_364=l9_362;
sc_SoftwareWrapLate(l9_363,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y,l9_345,l9_364);
float l9_365=l9_364;
vec3 l9_366=sc_SamplingCoordsViewToGlobal(vec2(l9_361,l9_363),reflectionModulationTexLayout,reflectionModulationTexGetStereoViewIndex());
vec4 l9_367=texture(reflectionModulationTexArrSC,l9_366,0.0);
vec4 l9_368;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_368=mix(reflectionModulationTexBorderColor,l9_367,vec4(l9_365));
}
#else
{
l9_368=l9_367;
}
#endif
l9_344=l9_368;
}
#else
{
bool l9_369=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionModulationTex)!=0));
float l9_370=l9_343.x;
sc_SoftwareWrapEarly(l9_370,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x);
float l9_371=l9_370;
float l9_372=l9_343.y;
sc_SoftwareWrapEarly(l9_372,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y);
float l9_373=l9_372;
vec2 l9_374;
float l9_375;
#if (SC_USE_UV_MIN_MAX_reflectionModulationTex)
{
bool l9_376;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_376=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x==3;
}
#else
{
l9_376=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_377=l9_371;
float l9_378=1.0;
sc_ClampUV(l9_377,reflectionModulationTexUvMinMax.x,reflectionModulationTexUvMinMax.z,l9_376,l9_378);
float l9_379=l9_377;
float l9_380=l9_378;
bool l9_381;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_381=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y==3;
}
#else
{
l9_381=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_382=l9_373;
float l9_383=l9_380;
sc_ClampUV(l9_382,reflectionModulationTexUvMinMax.y,reflectionModulationTexUvMinMax.w,l9_381,l9_383);
l9_375=l9_383;
l9_374=vec2(l9_379,l9_382);
}
#else
{
l9_375=1.0;
l9_374=vec2(l9_371,l9_373);
}
#endif
vec2 l9_384=sc_TransformUV(l9_374,(int(SC_USE_UV_TRANSFORM_reflectionModulationTex)!=0),reflectionModulationTexTransform);
float l9_385=l9_384.x;
float l9_386=l9_375;
sc_SoftwareWrapLate(l9_385,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x,l9_369,l9_386);
float l9_387=l9_384.y;
float l9_388=l9_386;
sc_SoftwareWrapLate(l9_387,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y,l9_369,l9_388);
float l9_389=l9_388;
vec3 l9_390=sc_SamplingCoordsViewToGlobal(vec2(l9_385,l9_387),reflectionModulationTexLayout,reflectionModulationTexGetStereoViewIndex());
vec4 l9_391=texture(reflectionModulationTex,l9_390.xy,0.0);
vec4 l9_392;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_392=mix(reflectionModulationTexBorderColor,l9_391,vec4(l9_389));
}
#else
{
l9_392=l9_391;
}
#endif
l9_344=l9_392;
}
#endif
l9_342=l9_293.xyz*l9_344.xyz;
}
#else
{
l9_342=l9_293.xyz;
}
#endif
l9_283=N7_vec3srgbToLinear(l9_342)*reflectionIntensity;
}
#else
{
l9_283=vec3(0.0);
}
#endif
vec3 l9_393;
#if (ENABLE_RIM_HIGHLIGHT)
{
vec3 l9_394=rimColor*rimIntensity;
vec3 l9_395;
#if (Tweak_N216)
{
vec2 l9_396=N7_getUV(NODE_315_DROPLIST_ITEM);
vec4 l9_397;
#if (rimColorTexLayout==2)
{
bool l9_398=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_rimColorTex)!=0));
float l9_399=l9_396.x;
sc_SoftwareWrapEarly(l9_399,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x);
float l9_400=l9_399;
float l9_401=l9_396.y;
sc_SoftwareWrapEarly(l9_401,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y);
float l9_402=l9_401;
vec2 l9_403;
float l9_404;
#if (SC_USE_UV_MIN_MAX_rimColorTex)
{
bool l9_405;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_405=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x==3;
}
#else
{
l9_405=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_406=l9_400;
float l9_407=1.0;
sc_ClampUV(l9_406,rimColorTexUvMinMax.x,rimColorTexUvMinMax.z,l9_405,l9_407);
float l9_408=l9_406;
float l9_409=l9_407;
bool l9_410;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_410=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y==3;
}
#else
{
l9_410=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_411=l9_402;
float l9_412=l9_409;
sc_ClampUV(l9_411,rimColorTexUvMinMax.y,rimColorTexUvMinMax.w,l9_410,l9_412);
l9_404=l9_412;
l9_403=vec2(l9_408,l9_411);
}
#else
{
l9_404=1.0;
l9_403=vec2(l9_400,l9_402);
}
#endif
vec2 l9_413=sc_TransformUV(l9_403,(int(SC_USE_UV_TRANSFORM_rimColorTex)!=0),rimColorTexTransform);
float l9_414=l9_413.x;
float l9_415=l9_404;
sc_SoftwareWrapLate(l9_414,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x,l9_398,l9_415);
float l9_416=l9_413.y;
float l9_417=l9_415;
sc_SoftwareWrapLate(l9_416,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y,l9_398,l9_417);
float l9_418=l9_417;
vec3 l9_419=sc_SamplingCoordsViewToGlobal(vec2(l9_414,l9_416),rimColorTexLayout,rimColorTexGetStereoViewIndex());
vec4 l9_420=texture(rimColorTexArrSC,l9_419,0.0);
vec4 l9_421;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_421=mix(rimColorTexBorderColor,l9_420,vec4(l9_418));
}
#else
{
l9_421=l9_420;
}
#endif
l9_397=l9_421;
}
#else
{
bool l9_422=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_rimColorTex)!=0));
float l9_423=l9_396.x;
sc_SoftwareWrapEarly(l9_423,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x);
float l9_424=l9_423;
float l9_425=l9_396.y;
sc_SoftwareWrapEarly(l9_425,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y);
float l9_426=l9_425;
vec2 l9_427;
float l9_428;
#if (SC_USE_UV_MIN_MAX_rimColorTex)
{
bool l9_429;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_429=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x==3;
}
#else
{
l9_429=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_430=l9_424;
float l9_431=1.0;
sc_ClampUV(l9_430,rimColorTexUvMinMax.x,rimColorTexUvMinMax.z,l9_429,l9_431);
float l9_432=l9_430;
float l9_433=l9_431;
bool l9_434;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_434=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y==3;
}
#else
{
l9_434=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_435=l9_426;
float l9_436=l9_433;
sc_ClampUV(l9_435,rimColorTexUvMinMax.y,rimColorTexUvMinMax.w,l9_434,l9_436);
l9_428=l9_436;
l9_427=vec2(l9_432,l9_435);
}
#else
{
l9_428=1.0;
l9_427=vec2(l9_424,l9_426);
}
#endif
vec2 l9_437=sc_TransformUV(l9_427,(int(SC_USE_UV_TRANSFORM_rimColorTex)!=0),rimColorTexTransform);
float l9_438=l9_437.x;
float l9_439=l9_428;
sc_SoftwareWrapLate(l9_438,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x,l9_422,l9_439);
float l9_440=l9_437.y;
float l9_441=l9_439;
sc_SoftwareWrapLate(l9_440,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y,l9_422,l9_441);
float l9_442=l9_441;
vec3 l9_443=sc_SamplingCoordsViewToGlobal(vec2(l9_438,l9_440),rimColorTexLayout,rimColorTexGetStereoViewIndex());
vec4 l9_444=texture(rimColorTex,l9_443.xy,0.0);
vec4 l9_445;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_445=mix(rimColorTexBorderColor,l9_444,vec4(l9_442));
}
#else
{
l9_445=l9_444;
}
#endif
l9_397=l9_445;
}
#endif
l9_395=l9_394*l9_397.xyz;
}
#else
{
l9_395=l9_394;
}
#endif
vec3 l9_446=tempGlobals.ViewDirWS;
float l9_447=dot(l9_125,l9_446);
float l9_448=abs(l9_447);
float l9_449;
if (!(int(ENABLE_RIM_INVERT)!=0))
{
l9_449=1.0-l9_448;
}
else
{
l9_449=l9_448;
}
l9_393=vec3(0.0)+(N7_vec3srgbToLinear(l9_395)*ssPow(l9_449,rimExponent));
}
#else
{
l9_393=vec3(0.0);
}
#endif
vec3 l9_450=ssPow((l9_282+l9_283)+l9_393,vec3(0.45454547));
vec2 l9_451=N7_getUV(NODE_221_DROPLIST_ITEM);
vec4 l9_452;
#if (materialParamsTexLayout==2)
{
bool l9_453=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_materialParamsTex)!=0));
float l9_454=l9_451.x;
sc_SoftwareWrapEarly(l9_454,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x);
float l9_455=l9_454;
float l9_456=l9_451.y;
sc_SoftwareWrapEarly(l9_456,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y);
float l9_457=l9_456;
vec2 l9_458;
float l9_459;
#if (SC_USE_UV_MIN_MAX_materialParamsTex)
{
bool l9_460;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_460=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x==3;
}
#else
{
l9_460=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_461=l9_455;
float l9_462=1.0;
sc_ClampUV(l9_461,materialParamsTexUvMinMax.x,materialParamsTexUvMinMax.z,l9_460,l9_462);
float l9_463=l9_461;
float l9_464=l9_462;
bool l9_465;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_465=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y==3;
}
#else
{
l9_465=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_466=l9_457;
float l9_467=l9_464;
sc_ClampUV(l9_466,materialParamsTexUvMinMax.y,materialParamsTexUvMinMax.w,l9_465,l9_467);
l9_459=l9_467;
l9_458=vec2(l9_463,l9_466);
}
#else
{
l9_459=1.0;
l9_458=vec2(l9_455,l9_457);
}
#endif
vec2 l9_468=sc_TransformUV(l9_458,(int(SC_USE_UV_TRANSFORM_materialParamsTex)!=0),materialParamsTexTransform);
float l9_469=l9_468.x;
float l9_470=l9_459;
sc_SoftwareWrapLate(l9_469,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x,l9_453,l9_470);
float l9_471=l9_468.y;
float l9_472=l9_470;
sc_SoftwareWrapLate(l9_471,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y,l9_453,l9_472);
float l9_473=l9_472;
vec3 l9_474=sc_SamplingCoordsViewToGlobal(vec2(l9_469,l9_471),materialParamsTexLayout,materialParamsTexGetStereoViewIndex());
vec4 l9_475=texture(materialParamsTexArrSC,l9_474,0.0);
vec4 l9_476;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_476=mix(materialParamsTexBorderColor,l9_475,vec4(l9_473));
}
#else
{
l9_476=l9_475;
}
#endif
l9_452=l9_476;
}
#else
{
bool l9_477=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_materialParamsTex)!=0));
float l9_478=l9_451.x;
sc_SoftwareWrapEarly(l9_478,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x);
float l9_479=l9_478;
float l9_480=l9_451.y;
sc_SoftwareWrapEarly(l9_480,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y);
float l9_481=l9_480;
vec2 l9_482;
float l9_483;
#if (SC_USE_UV_MIN_MAX_materialParamsTex)
{
bool l9_484;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_484=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x==3;
}
#else
{
l9_484=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_485=l9_479;
float l9_486=1.0;
sc_ClampUV(l9_485,materialParamsTexUvMinMax.x,materialParamsTexUvMinMax.z,l9_484,l9_486);
float l9_487=l9_485;
float l9_488=l9_486;
bool l9_489;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_489=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y==3;
}
#else
{
l9_489=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_490=l9_481;
float l9_491=l9_488;
sc_ClampUV(l9_490,materialParamsTexUvMinMax.y,materialParamsTexUvMinMax.w,l9_489,l9_491);
l9_483=l9_491;
l9_482=vec2(l9_487,l9_490);
}
#else
{
l9_483=1.0;
l9_482=vec2(l9_479,l9_481);
}
#endif
vec2 l9_492=sc_TransformUV(l9_482,(int(SC_USE_UV_TRANSFORM_materialParamsTex)!=0),materialParamsTexTransform);
float l9_493=l9_492.x;
float l9_494=l9_483;
sc_SoftwareWrapLate(l9_493,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x,l9_477,l9_494);
float l9_495=l9_492.y;
float l9_496=l9_494;
sc_SoftwareWrapLate(l9_495,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y,l9_477,l9_496);
float l9_497=l9_496;
vec3 l9_498=sc_SamplingCoordsViewToGlobal(vec2(l9_493,l9_495),materialParamsTexLayout,materialParamsTexGetStereoViewIndex());
vec4 l9_499=texture(materialParamsTex,l9_498.xy,0.0);
vec4 l9_500;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_500=mix(materialParamsTexBorderColor,l9_499,vec4(l9_497));
}
#else
{
l9_500=l9_499;
}
#endif
l9_452=l9_500;
}
#endif
float l9_501=l9_452.x*metallic;
vec3 l9_502;
if (NODE_38_DROPLIST_ITEM==3)
{
l9_502=vec3(l9_452.z)*tempGlobals.VertexColor.xyz;
}
else
{
l9_502=vec3(l9_452.z);
}
vec3 l9_503;
#if (ENABLE_SPECULAR_AO)
{
vec3 l9_504=mix(vec3(0.039999999),l9_123.xyz*l9_501,vec3(l9_501));
l9_503=mix(vec3(1.0),mix((l9_504*(1.0-specularAoDarkening))*l9_504,vec3(1.0),vec3(l9_502.x)),vec3(specularAoIntensity));
}
#else
{
l9_503=vec3(1.0);
}
#endif
vec3 l9_505;
#if (ENABLE_SIMPLE_REFLECTION)
{
l9_505=vec3(0.0);
}
#else
{
l9_505=l9_503;
}
#endif
vec3 l9_506;
#if (!sc_ProjectiveShadowsCaster)
{
l9_506=l9_125;
}
#else
{
l9_506=vec3(0.0);
}
#endif
float l9_507=clamp(l9_124,0.0,1.0);
#if (sc_BlendMode_AlphaTest)
{
if (l9_507<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_507<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec3 l9_508=max(l9_123.xyz,vec3(0.0));
vec4 l9_509;
#if (sc_ProjectiveShadowsCaster)
{
l9_509=vec4(l9_508,l9_507);
}
#else
{
l9_509=ngsCalculateLighting(l9_508,l9_507,l9_506,l9_8,l9_9,max(l9_450,vec3(0.0)),clamp(l9_501,0.0,1.0),clamp(l9_452.y*roughness,0.0,1.0),clamp(l9_502,vec3(0.0),vec3(1.0)),clamp(l9_505,vec3(0.0),vec3(1.0)));
}
#endif
vec4 l9_510=max(l9_509,vec4(0.0));
if (l9_0)
{
vec4 l9_511;
#if (sc_RayTracingCasterForceOpaque)
{
vec4 l9_512=l9_510;
l9_512.w=1.0;
l9_511=l9_512;
}
#else
{
l9_511=l9_510;
}
#endif
sc_writeFragData0Internal(max(l9_511,vec4(0.0)),sc_UniformConstants.x,sc_ShaderCacheConstant);
return;
}
vec4 l9_513;
#if (sc_ProjectiveShadowsCaster)
{
float l9_514;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_514=l9_510.w;
}
#else
{
float l9_515;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_515=clamp(l9_510.w*2.0,0.0,1.0);
}
#else
{
float l9_516;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_516=clamp(dot(l9_510.xyz,vec3(l9_510.w)),0.0,1.0);
}
#else
{
float l9_517;
#if (sc_BlendMode_AlphaTest)
{
l9_517=1.0;
}
#else
{
float l9_518;
#if (sc_BlendMode_Multiply)
{
l9_518=(1.0-dot(l9_510.xyz,vec3(0.33333001)))*l9_510.w;
}
#else
{
float l9_519;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_519=(1.0-clamp(dot(l9_510.xyz,vec3(1.0)),0.0,1.0))*l9_510.w;
}
#else
{
float l9_520;
#if (sc_BlendMode_ColoredGlass)
{
l9_520=clamp(dot(l9_510.xyz,vec3(1.0)),0.0,1.0)*l9_510.w;
}
#else
{
float l9_521;
#if (sc_BlendMode_Add)
{
l9_521=clamp(dot(l9_510.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_522;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_522=clamp(dot(l9_510.xyz,vec3(1.0)),0.0,1.0)*l9_510.w;
}
#else
{
float l9_523;
#if (sc_BlendMode_Screen)
{
l9_523=dot(l9_510.xyz,vec3(0.33333001))*l9_510.w;
}
#else
{
float l9_524;
#if (sc_BlendMode_Min)
{
l9_524=1.0-clamp(dot(l9_510.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_525;
#if (sc_BlendMode_Max)
{
l9_525=clamp(dot(l9_510.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_525=1.0;
}
#endif
l9_524=l9_525;
}
#endif
l9_523=l9_524;
}
#endif
l9_522=l9_523;
}
#endif
l9_521=l9_522;
}
#endif
l9_520=l9_521;
}
#endif
l9_519=l9_520;
}
#endif
l9_518=l9_519;
}
#endif
l9_517=l9_518;
}
#endif
l9_516=l9_517;
}
#endif
l9_515=l9_516;
}
#endif
l9_514=l9_515;
}
#endif
l9_513=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_510.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_514);
}
#else
{
vec4 l9_526;
#if (sc_RenderAlphaToColor)
{
l9_526=vec4(l9_510.w);
}
#else
{
vec4 l9_527;
#if (sc_BlendMode_Custom)
{
vec3 l9_528=sc_GetFramebufferColor().xyz;
vec3 l9_529=mix(l9_528,definedBlend(l9_528,l9_510.xyz).xyz,vec3(l9_510.w));
vec4 l9_530=vec4(l9_529.x,l9_529.y,l9_529.z,vec4(0.0).w);
l9_530.w=1.0;
l9_527=l9_530;
}
#else
{
vec4 l9_531;
#if (sc_Voxelization)
{
l9_531=vec4(varScreenPos.xyz,1.0);
}
#else
{
vec4 l9_532;
#if (sc_OutputBounds)
{
float l9_533=clamp(abs(gl_FragCoord.z),0.0,1.0);
l9_532=vec4(l9_533,1.0-l9_533,1.0,1.0);
}
#else
{
vec4 l9_534;
#if (sc_BlendMode_MultiplyOriginal)
{
float l9_535=l9_510.w;
l9_534=vec4(mix(vec3(1.0),l9_510.xyz,vec3(l9_535)),l9_535);
}
#else
{
vec4 l9_536;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_537=l9_510.w;
float l9_538;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_538=clamp(l9_537,0.0,1.0);
}
#else
{
l9_538=l9_537;
}
#endif
l9_536=vec4(l9_510.xyz*l9_538,l9_538);
}
#else
{
l9_536=l9_510;
}
#endif
l9_534=l9_536;
}
#endif
l9_532=l9_534;
}
#endif
l9_531=l9_532;
}
#endif
l9_527=l9_531;
}
#endif
l9_526=l9_527;
}
#endif
l9_513=l9_526;
}
#endif
vec4 l9_539;
if (PreviewEnabled==1)
{
vec4 l9_540;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_540=PreviewVertexColor;
}
else
{
l9_540=vec4(0.0);
}
l9_539=l9_540;
}
else
{
l9_539=l9_513;
}
vec4 l9_541=sc_OutputMotionVectorsIfNeeded(varPos,max(l9_539,vec4(0.0)));
vec4 l9_542=clamp(l9_541,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_543=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_543-0.0039215689)),min(1.0,l9_543+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_544=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_544).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_545=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_544).xy);
float l9_546=packValue(l9_545);
int l9_553=int(l9_542.w*255.0);
float l9_554=packValue(l9_553);
sc_writeFragData0Internal(vec4(packValue(l9_545),packValue(l9_545),packValue(l9_545),packValue(l9_545)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_546,packValue(l9_545),packValue(l9_545),packValue(l9_545)));
sc_writeFragData2(vec4(l9_554,packValue(l9_553),packValue(l9_553),packValue(l9_553)));
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
vec2 l9_557=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_557).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_558[8];
int l9_559[8];
int l9_560=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_560<8)
{
l9_558[l9_560]=0;
l9_559[l9_560]=0;
l9_560++;
continue;
}
else
{
break;
}
}
int l9_561;
#if (sc_OITMaxLayers8)
{
l9_561=2;
}
#else
{
l9_561=1;
}
#endif
int l9_562=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_562<l9_561)
{
vec4 l9_563;
vec4 l9_564;
vec4 l9_565;
if (l9_562==0)
{
l9_565=texture(sc_OITAlpha0,l9_557);
l9_564=texture(sc_OITDepthLow0,l9_557);
l9_563=texture(sc_OITDepthHigh0,l9_557);
}
else
{
l9_565=vec4(0.0);
l9_564=vec4(0.0);
l9_563=vec4(0.0);
}
vec4 l9_566;
vec4 l9_567;
vec4 l9_568;
if (l9_562==1)
{
l9_568=texture(sc_OITAlpha1,l9_557);
l9_567=texture(sc_OITDepthLow1,l9_557);
l9_566=texture(sc_OITDepthHigh1,l9_557);
}
else
{
l9_568=l9_565;
l9_567=l9_564;
l9_566=l9_563;
}
if (any(notEqual(l9_566,vec4(0.0)))||any(notEqual(l9_567,vec4(0.0))))
{
int l9_569[8]=l9_558;
unpackValues(l9_566.w,l9_562,l9_569);
unpackValues(l9_566.z,l9_562,l9_569);
unpackValues(l9_566.y,l9_562,l9_569);
unpackValues(l9_566.x,l9_562,l9_569);
unpackValues(l9_567.w,l9_562,l9_569);
unpackValues(l9_567.z,l9_562,l9_569);
unpackValues(l9_567.y,l9_562,l9_569);
unpackValues(l9_567.x,l9_562,l9_569);
int l9_578[8]=l9_559;
unpackValues(l9_568.w,l9_562,l9_578);
unpackValues(l9_568.z,l9_562,l9_578);
unpackValues(l9_568.y,l9_562,l9_578);
unpackValues(l9_568.x,l9_562,l9_578);
}
l9_562++;
continue;
}
else
{
break;
}
}
vec4 l9_583=texture(sc_OITFilteredDepthBoundsTexture,l9_557);
vec2 l9_584=l9_583.xy;
int l9_585;
#if (sc_SkinBonesCount>0)
{
l9_585=encodeDepth(((1.0-l9_583.x)*1000.0)+getDepthOrderingEpsilon(),l9_584);
}
#else
{
l9_585=0;
}
#endif
int l9_586=encodeDepth(viewSpaceDepth(),l9_584);
vec4 l9_587;
l9_587=l9_542*l9_542.w;
vec4 l9_588;
int l9_589=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_589<8)
{
int l9_590=l9_558[l9_589];
int l9_591=l9_586-l9_585;
bool l9_592=l9_590<l9_591;
bool l9_593;
if (l9_592)
{
l9_593=l9_558[l9_589]>0;
}
else
{
l9_593=l9_592;
}
if (l9_593)
{
vec3 l9_594=l9_587.xyz*(1.0-(float(l9_559[l9_589])/255.0));
l9_588=vec4(l9_594.x,l9_594.y,l9_594.z,l9_587.w);
}
else
{
l9_588=l9_587;
}
l9_587=l9_588;
l9_589++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_587,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
sc_writeFragData0Internal(l9_542,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_541,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
