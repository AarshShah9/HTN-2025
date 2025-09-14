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
//sampler sampler baseColorTextureSmpSC 0:34
//sampler sampler clearcoatNormalTextureSmpSC 0:35
//sampler sampler clearcoatRoughnessTextureSmpSC 0:36
//sampler sampler clearcoatTextureSmpSC 0:37
//sampler sampler emissiveTextureSmpSC 0:38
//sampler sampler intensityTextureSmpSC 0:39
//sampler sampler metallicRoughnessTextureSmpSC 0:40
//sampler sampler normalTextureSmpSC 0:41
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
//sampler sampler screenTextureSmpSC 0:54
//sampler sampler sheenColorTextureSmpSC 0:55
//sampler sampler sheenRoughnessTextureSmpSC 0:56
//sampler sampler transmissionTextureSmpSC 0:57
//texture texture2D baseColorTexture 0:3:0:34
//texture texture2D clearcoatNormalTexture 0:4:0:35
//texture texture2D clearcoatRoughnessTexture 0:5:0:36
//texture texture2D clearcoatTexture 0:6:0:37
//texture texture2D emissiveTexture 0:7:0:38
//texture texture2D intensityTexture 0:8:0:39
//texture texture2D metallicRoughnessTexture 0:9:0:40
//texture texture2D normalTexture 0:10:0:41
//texture texture2D sc_EnvmapDiffuse 0:11:0:42
//texture texture2D sc_EnvmapSpecular 0:12:0:43
//texture texture2D sc_OITAlpha0 0:13:0:44
//texture texture2D sc_OITAlpha1 0:14:0:44
//texture texture2D sc_OITDepthHigh0 0:15:0:44
//texture texture2D sc_OITDepthHigh1 0:16:0:44
//texture texture2D sc_OITDepthLow0 0:17:0:44
//texture texture2D sc_OITDepthLow1 0:18:0:44
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:19:0:44
//texture texture2D sc_OITFrontDepthTexture 0:20:0:44
//texture texture2D sc_RayTracingGlobalIllumination 0:21:0:45
//texture utexture2D sc_RayTracingHitCasterIdAndBarycentric 0:22:0:46
//texture texture2D sc_RayTracingRayDirection 0:23:0:47
//texture texture2D sc_RayTracingReflections 0:24:0:48
//texture texture2D sc_RayTracingShadows 0:25:0:49
//texture texture2D sc_SSAOTexture 0:26:0:50
//texture texture2D sc_ScreenTexture 0:27:0:51
//texture texture2D sc_ShadowTexture 0:28:0:52
//texture texture2D screenTexture 0:30:0:54
//texture texture2D sheenColorTexture 0:31:0:55
//texture texture2D sheenRoughnessTexture 0:32:0:56
//texture texture2D transmissionTexture 0:33:0:57
//texture texture2DArray baseColorTextureArrSC 0:58:0:34
//texture texture2DArray clearcoatNormalTextureArrSC 0:59:0:35
//texture texture2DArray clearcoatRoughnessTextureArrSC 0:60:0:36
//texture texture2DArray clearcoatTextureArrSC 0:61:0:37
//texture texture2DArray emissiveTextureArrSC 0:62:0:38
//texture texture2DArray intensityTextureArrSC 0:63:0:39
//texture texture2DArray metallicRoughnessTextureArrSC 0:64:0:40
//texture texture2DArray normalTextureArrSC 0:65:0:41
//texture texture2DArray sc_EnvmapDiffuseArrSC 0:66:0:42
//texture texture2DArray sc_EnvmapSpecularArrSC 0:67:0:43
//texture texture2DArray sc_RayTracingGlobalIlluminationArrSC 0:68:0:45
//texture texture2DArray sc_RayTracingReflectionsArrSC 0:70:0:48
//texture texture2DArray sc_RayTracingShadowsArrSC 0:71:0:49
//texture texture2DArray sc_ScreenTextureArrSC 0:72:0:51
//texture texture2DArray screenTextureArrSC 0:73:0:54
//texture texture2DArray sheenColorTextureArrSC 0:74:0:55
//texture texture2DArray sheenRoughnessTextureArrSC 0:75:0:56
//texture texture2DArray transmissionTextureArrSC 0:76:0:57
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
//spec_const bool ENABLE_BASE_TEXTURE_TRANSFORM 31 0
//spec_const bool ENABLE_CLEARCOAT 32 0
//spec_const bool ENABLE_CLEARCOAT_NORMAL_TEX 33 0
//spec_const bool ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM 34 0
//spec_const bool ENABLE_CLEARCOAT_ROUGHNESS_TEX 35 0
//spec_const bool ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM 36 0
//spec_const bool ENABLE_CLEARCOAT_TEX 37 0
//spec_const bool ENABLE_CLEARCOAT_TEXTURE_TRANSFORM 38 0
//spec_const bool ENABLE_EMISSIVE 39 0
//spec_const bool ENABLE_EMISSIVE_TEXTURE_TRANSFORM 40 0
//spec_const bool ENABLE_GLTF_LIGHTING 41 0
//spec_const bool ENABLE_METALLIC_ROUGHNESS_TEX 42 0
//spec_const bool ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM 43 0
//spec_const bool ENABLE_NORMALMAP 44 0
//spec_const bool ENABLE_NORMAL_TEXTURE_TRANSFORM 45 0
//spec_const bool ENABLE_SHEEN 46 0
//spec_const bool ENABLE_SHEEN_COLOR_TEX 47 0
//spec_const bool ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM 48 0
//spec_const bool ENABLE_SHEEN_ROUGHNESS_TEX 49 0
//spec_const bool ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM 50 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 51 0
//spec_const bool ENABLE_TEXTURE_TRANSFORM 52 0
//spec_const bool ENABLE_TRANSMISSION 53 0
//spec_const bool ENABLE_TRANSMISSION_TEX 54 0
//spec_const bool ENABLE_TRANSMISSION_TEXTURE_TRANSFORM 55 0
//spec_const bool ENABLE_VERTEX_COLOR_BASE 56 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseColorTexture 57 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture 58 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture 59 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_clearcoatTexture 60 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTexture 61 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 62 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture 63 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTexture 64 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTexture 65 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sheenColorTexture 66 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture 67 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_transmissionTexture 68 0
//spec_const bool SC_USE_UV_MIN_MAX_baseColorTexture 69 0
//spec_const bool SC_USE_UV_MIN_MAX_clearcoatNormalTexture 70 0
//spec_const bool SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture 71 0
//spec_const bool SC_USE_UV_MIN_MAX_clearcoatTexture 72 0
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTexture 73 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 74 0
//spec_const bool SC_USE_UV_MIN_MAX_metallicRoughnessTexture 75 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTexture 76 0
//spec_const bool SC_USE_UV_MIN_MAX_screenTexture 77 0
//spec_const bool SC_USE_UV_MIN_MAX_sheenColorTexture 78 0
//spec_const bool SC_USE_UV_MIN_MAX_sheenRoughnessTexture 79 0
//spec_const bool SC_USE_UV_MIN_MAX_transmissionTexture 80 0
//spec_const bool SC_USE_UV_TRANSFORM_baseColorTexture 81 0
//spec_const bool SC_USE_UV_TRANSFORM_clearcoatNormalTexture 82 0
//spec_const bool SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture 83 0
//spec_const bool SC_USE_UV_TRANSFORM_clearcoatTexture 84 0
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTexture 85 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 86 0
//spec_const bool SC_USE_UV_TRANSFORM_metallicRoughnessTexture 87 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTexture 88 0
//spec_const bool SC_USE_UV_TRANSFORM_screenTexture 89 0
//spec_const bool SC_USE_UV_TRANSFORM_sheenColorTexture 90 0
//spec_const bool SC_USE_UV_TRANSFORM_sheenRoughnessTexture 91 0
//spec_const bool SC_USE_UV_TRANSFORM_transmissionTexture 92 0
//spec_const bool UseViewSpaceDepthVariant 93 1
//spec_const bool baseColorTextureHasSwappedViews 94 0
//spec_const bool clearcoatNormalTextureHasSwappedViews 95 0
//spec_const bool clearcoatRoughnessTextureHasSwappedViews 96 0
//spec_const bool clearcoatTextureHasSwappedViews 97 0
//spec_const bool emissiveTextureHasSwappedViews 98 0
//spec_const bool intensityTextureHasSwappedViews 99 0
//spec_const bool metallicRoughnessTextureHasSwappedViews 100 0
//spec_const bool normalTextureHasSwappedViews 101 0
//spec_const bool sc_BlendMode_Add 102 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 103 0
//spec_const bool sc_BlendMode_AlphaTest 104 0
//spec_const bool sc_BlendMode_AlphaToCoverage 105 0
//spec_const bool sc_BlendMode_ColoredGlass 106 0
//spec_const bool sc_BlendMode_Custom 107 0
//spec_const bool sc_BlendMode_Max 108 0
//spec_const bool sc_BlendMode_Min 109 0
//spec_const bool sc_BlendMode_Multiply 110 0
//spec_const bool sc_BlendMode_MultiplyOriginal 111 0
//spec_const bool sc_BlendMode_Normal 112 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 113 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 114 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 115 0
//spec_const bool sc_BlendMode_Screen 116 0
//spec_const bool sc_DepthOnly 117 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 118 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 119 0
//spec_const bool sc_FramebufferFetch 120 0
//spec_const bool sc_HasDiffuseEnvmap 121 0
//spec_const bool sc_IsEditor 122 0
//spec_const bool sc_LightEstimation 123 0
//spec_const bool sc_MotionVectorsPass 124 0
//spec_const bool sc_OITCompositingPass 125 0
//spec_const bool sc_OITDepthBoundsPass 126 0
//spec_const bool sc_OITDepthGatherPass 127 0
//spec_const bool sc_OITDepthPrepass 128 0
//spec_const bool sc_OITFrontLayerPass 129 0
//spec_const bool sc_OITMaxLayers4Plus1 130 0
//spec_const bool sc_OITMaxLayers8 131 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 132 0
//spec_const bool sc_OutputBounds 133 0
//spec_const bool sc_ProjectiveShadowsCaster 134 0
//spec_const bool sc_ProjectiveShadowsReceiver 135 0
//spec_const bool sc_RayTracingCasterForceOpaque 136 0
//spec_const bool sc_RayTracingGlobalIlluminationHasSwappedViews 137 0
//spec_const bool sc_RayTracingReflectionsHasSwappedViews 138 0
//spec_const bool sc_RayTracingShadowsHasSwappedViews 139 0
//spec_const bool sc_RenderAlphaToColor 140 0
//spec_const bool sc_SSAOEnabled 141 0
//spec_const bool sc_ScreenTextureHasSwappedViews 142 0
//spec_const bool sc_TAAEnabled 143 0
//spec_const bool sc_VertexBlending 144 0
//spec_const bool sc_VertexBlendingUseNormals 145 0
//spec_const bool sc_Voxelization 146 0
//spec_const bool screenTextureHasSwappedViews 147 0
//spec_const bool sheenColorTextureHasSwappedViews 148 0
//spec_const bool sheenRoughnessTextureHasSwappedViews 149 0
//spec_const bool transmissionTextureHasSwappedViews 150 0
//spec_const int NODE_10_DROPLIST_ITEM 151 0
//spec_const int NODE_11_DROPLIST_ITEM 152 0
//spec_const int NODE_7_DROPLIST_ITEM 153 0
//spec_const int NODE_8_DROPLIST_ITEM 154 0
//spec_const int SC_DEVICE_CLASS 155 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseColorTexture 156 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture 157 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture 158 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture 159 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTexture 160 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 161 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture 162 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTexture 163 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTexture 164 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture 165 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture 166 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_transmissionTexture 167 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseColorTexture 168 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture 169 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture 170 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture 171 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTexture 172 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 173 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture 174 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTexture 175 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTexture 176 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture 177 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture 178 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_transmissionTexture 179 -1
//spec_const int Tweak_N30 180 0
//spec_const int Tweak_N32 181 0
//spec_const int Tweak_N37 182 0
//spec_const int Tweak_N44 183 0
//spec_const int Tweak_N47 184 0
//spec_const int Tweak_N60 185 0
//spec_const int baseColorTextureLayout 186 0
//spec_const int clearcoatNormalTextureLayout 187 0
//spec_const int clearcoatRoughnessTextureLayout 188 0
//spec_const int clearcoatTextureLayout 189 0
//spec_const int emissiveTextureLayout 190 0
//spec_const int intensityTextureLayout 191 0
//spec_const int metallicRoughnessTextureLayout 192 0
//spec_const int normalTextureLayout 193 0
//spec_const int sc_AmbientLightMode0 194 0
//spec_const int sc_AmbientLightMode1 195 0
//spec_const int sc_AmbientLightMode2 196 0
//spec_const int sc_AmbientLightMode_Constant 197 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 198 0
//spec_const int sc_AmbientLightMode_FromCamera 199 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 200 0
//spec_const int sc_AmbientLightsCount 201 0
//spec_const int sc_DepthBufferMode 202 0
//spec_const int sc_DirectionalLightsCount 203 0
//spec_const int sc_EnvLightMode 204 0
//spec_const int sc_EnvmapDiffuseLayout 205 0
//spec_const int sc_EnvmapSpecularLayout 206 0
//spec_const int sc_LightEstimationSGCount 207 0
//spec_const int sc_PointLightsCount 208 0
//spec_const int sc_RayTracingGlobalIlluminationLayout 209 0
//spec_const int sc_RayTracingReflectionsLayout 210 0
//spec_const int sc_RayTracingShadowsLayout 211 0
//spec_const int sc_RenderingSpace 212 -1
//spec_const int sc_ScreenTextureLayout 213 0
//spec_const int sc_ShaderCacheConstant 214 0
//spec_const int sc_SkinBonesCount 215 0
//spec_const int sc_StereoRenderingMode 216 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 217 0
//spec_const int sc_StereoViewID 218 0
//spec_const int screenTextureLayout 219 0
//spec_const int sheenColorTextureLayout 220 0
//spec_const int sheenRoughnessTextureLayout 221 0
//spec_const int transmissionTextureLayout 222 0
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
vec3 SurfacePosition_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexTangent_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
vec2 Surface_UVCoord1;
vec2 gScreenCoord;
vec4 VertexColor;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
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
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
#endif
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef emissiveTextureHasSwappedViews
#define emissiveTextureHasSwappedViews 0
#elif emissiveTextureHasSwappedViews==1
#undef emissiveTextureHasSwappedViews
#define emissiveTextureHasSwappedViews 1
#endif
#ifndef emissiveTextureLayout
#define emissiveTextureLayout 0
#endif
#ifndef normalTextureHasSwappedViews
#define normalTextureHasSwappedViews 0
#elif normalTextureHasSwappedViews==1
#undef normalTextureHasSwappedViews
#define normalTextureHasSwappedViews 1
#endif
#ifndef normalTextureLayout
#define normalTextureLayout 0
#endif
#ifndef metallicRoughnessTextureHasSwappedViews
#define metallicRoughnessTextureHasSwappedViews 0
#elif metallicRoughnessTextureHasSwappedViews==1
#undef metallicRoughnessTextureHasSwappedViews
#define metallicRoughnessTextureHasSwappedViews 1
#endif
#ifndef metallicRoughnessTextureLayout
#define metallicRoughnessTextureLayout 0
#endif
#ifndef transmissionTextureHasSwappedViews
#define transmissionTextureHasSwappedViews 0
#elif transmissionTextureHasSwappedViews==1
#undef transmissionTextureHasSwappedViews
#define transmissionTextureHasSwappedViews 1
#endif
#ifndef transmissionTextureLayout
#define transmissionTextureLayout 0
#endif
#ifndef screenTextureHasSwappedViews
#define screenTextureHasSwappedViews 0
#elif screenTextureHasSwappedViews==1
#undef screenTextureHasSwappedViews
#define screenTextureHasSwappedViews 1
#endif
#ifndef screenTextureLayout
#define screenTextureLayout 0
#endif
#ifndef sheenColorTextureHasSwappedViews
#define sheenColorTextureHasSwappedViews 0
#elif sheenColorTextureHasSwappedViews==1
#undef sheenColorTextureHasSwappedViews
#define sheenColorTextureHasSwappedViews 1
#endif
#ifndef sheenColorTextureLayout
#define sheenColorTextureLayout 0
#endif
#ifndef sheenRoughnessTextureHasSwappedViews
#define sheenRoughnessTextureHasSwappedViews 0
#elif sheenRoughnessTextureHasSwappedViews==1
#undef sheenRoughnessTextureHasSwappedViews
#define sheenRoughnessTextureHasSwappedViews 1
#endif
#ifndef sheenRoughnessTextureLayout
#define sheenRoughnessTextureLayout 0
#endif
#ifndef clearcoatTextureHasSwappedViews
#define clearcoatTextureHasSwappedViews 0
#elif clearcoatTextureHasSwappedViews==1
#undef clearcoatTextureHasSwappedViews
#define clearcoatTextureHasSwappedViews 1
#endif
#ifndef clearcoatTextureLayout
#define clearcoatTextureLayout 0
#endif
#ifndef clearcoatRoughnessTextureHasSwappedViews
#define clearcoatRoughnessTextureHasSwappedViews 0
#elif clearcoatRoughnessTextureHasSwappedViews==1
#undef clearcoatRoughnessTextureHasSwappedViews
#define clearcoatRoughnessTextureHasSwappedViews 1
#endif
#ifndef clearcoatRoughnessTextureLayout
#define clearcoatRoughnessTextureLayout 0
#endif
#ifndef clearcoatNormalTextureHasSwappedViews
#define clearcoatNormalTextureHasSwappedViews 0
#elif clearcoatNormalTextureHasSwappedViews==1
#undef clearcoatNormalTextureHasSwappedViews
#define clearcoatNormalTextureHasSwappedViews 1
#endif
#ifndef clearcoatNormalTextureLayout
#define clearcoatNormalTextureLayout 0
#endif
#ifndef baseColorTextureHasSwappedViews
#define baseColorTextureHasSwappedViews 0
#elif baseColorTextureHasSwappedViews==1
#undef baseColorTextureHasSwappedViews
#define baseColorTextureHasSwappedViews 1
#endif
#ifndef baseColorTextureLayout
#define baseColorTextureLayout 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
#endif
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
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
#ifndef ENABLE_GLTF_LIGHTING
#define ENABLE_GLTF_LIGHTING 0
#elif ENABLE_GLTF_LIGHTING==1
#undef ENABLE_GLTF_LIGHTING
#define ENABLE_GLTF_LIGHTING 1
#endif
#ifndef ENABLE_TRANSMISSION
#define ENABLE_TRANSMISSION 0
#elif ENABLE_TRANSMISSION==1
#undef ENABLE_TRANSMISSION
#define ENABLE_TRANSMISSION 1
#endif
#ifndef ENABLE_SHEEN
#define ENABLE_SHEEN 0
#elif ENABLE_SHEEN==1
#undef ENABLE_SHEEN
#define ENABLE_SHEEN 1
#endif
#ifndef ENABLE_CLEARCOAT
#define ENABLE_CLEARCOAT 0
#elif ENABLE_CLEARCOAT==1
#undef ENABLE_CLEARCOAT
#define ENABLE_CLEARCOAT 1
#endif
#ifndef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 0
#elif ENABLE_EMISSIVE==1
#undef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_emissiveTexture
#define SC_USE_UV_TRANSFORM_emissiveTexture 0
#elif SC_USE_UV_TRANSFORM_emissiveTexture==1
#undef SC_USE_UV_TRANSFORM_emissiveTexture
#define SC_USE_UV_TRANSFORM_emissiveTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_emissiveTexture
#define SC_SOFTWARE_WRAP_MODE_U_emissiveTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_emissiveTexture
#define SC_SOFTWARE_WRAP_MODE_V_emissiveTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_emissiveTexture
#define SC_USE_UV_MIN_MAX_emissiveTexture 0
#elif SC_USE_UV_MIN_MAX_emissiveTexture==1
#undef SC_USE_UV_MIN_MAX_emissiveTexture
#define SC_USE_UV_MIN_MAX_emissiveTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_emissiveTexture
#define SC_USE_CLAMP_TO_BORDER_emissiveTexture 0
#elif SC_USE_CLAMP_TO_BORDER_emissiveTexture==1
#undef SC_USE_CLAMP_TO_BORDER_emissiveTexture
#define SC_USE_CLAMP_TO_BORDER_emissiveTexture 1
#endif
#ifndef NODE_10_DROPLIST_ITEM
#define NODE_10_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 0
#elif ENABLE_NORMALMAP==1
#undef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 1
#endif
#ifndef SC_USE_UV_TRANSFORM_normalTexture
#define SC_USE_UV_TRANSFORM_normalTexture 0
#elif SC_USE_UV_TRANSFORM_normalTexture==1
#undef SC_USE_UV_TRANSFORM_normalTexture
#define SC_USE_UV_TRANSFORM_normalTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_normalTexture
#define SC_SOFTWARE_WRAP_MODE_U_normalTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_normalTexture
#define SC_SOFTWARE_WRAP_MODE_V_normalTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_normalTexture
#define SC_USE_UV_MIN_MAX_normalTexture 0
#elif SC_USE_UV_MIN_MAX_normalTexture==1
#undef SC_USE_UV_MIN_MAX_normalTexture
#define SC_USE_UV_MIN_MAX_normalTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_normalTexture
#define SC_USE_CLAMP_TO_BORDER_normalTexture 0
#elif SC_USE_CLAMP_TO_BORDER_normalTexture==1
#undef SC_USE_CLAMP_TO_BORDER_normalTexture
#define SC_USE_CLAMP_TO_BORDER_normalTexture 1
#endif
#ifndef NODE_8_DROPLIST_ITEM
#define NODE_8_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_METALLIC_ROUGHNESS_TEX
#define ENABLE_METALLIC_ROUGHNESS_TEX 0
#elif ENABLE_METALLIC_ROUGHNESS_TEX==1
#undef ENABLE_METALLIC_ROUGHNESS_TEX
#define ENABLE_METALLIC_ROUGHNESS_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_metallicRoughnessTexture
#define SC_USE_UV_TRANSFORM_metallicRoughnessTexture 0
#elif SC_USE_UV_TRANSFORM_metallicRoughnessTexture==1
#undef SC_USE_UV_TRANSFORM_metallicRoughnessTexture
#define SC_USE_UV_TRANSFORM_metallicRoughnessTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_metallicRoughnessTexture
#define SC_USE_UV_MIN_MAX_metallicRoughnessTexture 0
#elif SC_USE_UV_MIN_MAX_metallicRoughnessTexture==1
#undef SC_USE_UV_MIN_MAX_metallicRoughnessTexture
#define SC_USE_UV_MIN_MAX_metallicRoughnessTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture 0
#elif SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture==1
#undef SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture 1
#endif
#ifndef NODE_11_DROPLIST_ITEM
#define NODE_11_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_TRANSMISSION_TEX
#define ENABLE_TRANSMISSION_TEX 0
#elif ENABLE_TRANSMISSION_TEX==1
#undef ENABLE_TRANSMISSION_TEX
#define ENABLE_TRANSMISSION_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_transmissionTexture
#define SC_USE_UV_TRANSFORM_transmissionTexture 0
#elif SC_USE_UV_TRANSFORM_transmissionTexture==1
#undef SC_USE_UV_TRANSFORM_transmissionTexture
#define SC_USE_UV_TRANSFORM_transmissionTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_transmissionTexture
#define SC_SOFTWARE_WRAP_MODE_U_transmissionTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_transmissionTexture
#define SC_SOFTWARE_WRAP_MODE_V_transmissionTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_transmissionTexture
#define SC_USE_UV_MIN_MAX_transmissionTexture 0
#elif SC_USE_UV_MIN_MAX_transmissionTexture==1
#undef SC_USE_UV_MIN_MAX_transmissionTexture
#define SC_USE_UV_MIN_MAX_transmissionTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_transmissionTexture
#define SC_USE_CLAMP_TO_BORDER_transmissionTexture 0
#elif SC_USE_CLAMP_TO_BORDER_transmissionTexture==1
#undef SC_USE_CLAMP_TO_BORDER_transmissionTexture
#define SC_USE_CLAMP_TO_BORDER_transmissionTexture 1
#endif
#ifndef Tweak_N30
#define Tweak_N30 0
#endif
#ifndef SC_USE_UV_TRANSFORM_screenTexture
#define SC_USE_UV_TRANSFORM_screenTexture 0
#elif SC_USE_UV_TRANSFORM_screenTexture==1
#undef SC_USE_UV_TRANSFORM_screenTexture
#define SC_USE_UV_TRANSFORM_screenTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_screenTexture
#define SC_SOFTWARE_WRAP_MODE_U_screenTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_screenTexture
#define SC_SOFTWARE_WRAP_MODE_V_screenTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_screenTexture
#define SC_USE_UV_MIN_MAX_screenTexture 0
#elif SC_USE_UV_MIN_MAX_screenTexture==1
#undef SC_USE_UV_MIN_MAX_screenTexture
#define SC_USE_UV_MIN_MAX_screenTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_screenTexture
#define SC_USE_CLAMP_TO_BORDER_screenTexture 0
#elif SC_USE_CLAMP_TO_BORDER_screenTexture==1
#undef SC_USE_CLAMP_TO_BORDER_screenTexture
#define SC_USE_CLAMP_TO_BORDER_screenTexture 1
#endif
#ifndef ENABLE_SHEEN_COLOR_TEX
#define ENABLE_SHEEN_COLOR_TEX 0
#elif ENABLE_SHEEN_COLOR_TEX==1
#undef ENABLE_SHEEN_COLOR_TEX
#define ENABLE_SHEEN_COLOR_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sheenColorTexture
#define SC_USE_UV_TRANSFORM_sheenColorTexture 0
#elif SC_USE_UV_TRANSFORM_sheenColorTexture==1
#undef SC_USE_UV_TRANSFORM_sheenColorTexture
#define SC_USE_UV_TRANSFORM_sheenColorTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture
#define SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture
#define SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sheenColorTexture
#define SC_USE_UV_MIN_MAX_sheenColorTexture 0
#elif SC_USE_UV_MIN_MAX_sheenColorTexture==1
#undef SC_USE_UV_MIN_MAX_sheenColorTexture
#define SC_USE_UV_MIN_MAX_sheenColorTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sheenColorTexture
#define SC_USE_CLAMP_TO_BORDER_sheenColorTexture 0
#elif SC_USE_CLAMP_TO_BORDER_sheenColorTexture==1
#undef SC_USE_CLAMP_TO_BORDER_sheenColorTexture
#define SC_USE_CLAMP_TO_BORDER_sheenColorTexture 1
#endif
#ifndef Tweak_N32
#define Tweak_N32 0
#endif
#ifndef ENABLE_SHEEN_ROUGHNESS_TEX
#define ENABLE_SHEEN_ROUGHNESS_TEX 0
#elif ENABLE_SHEEN_ROUGHNESS_TEX==1
#undef ENABLE_SHEEN_ROUGHNESS_TEX
#define ENABLE_SHEEN_ROUGHNESS_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sheenRoughnessTexture
#define SC_USE_UV_TRANSFORM_sheenRoughnessTexture 0
#elif SC_USE_UV_TRANSFORM_sheenRoughnessTexture==1
#undef SC_USE_UV_TRANSFORM_sheenRoughnessTexture
#define SC_USE_UV_TRANSFORM_sheenRoughnessTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sheenRoughnessTexture
#define SC_USE_UV_MIN_MAX_sheenRoughnessTexture 0
#elif SC_USE_UV_MIN_MAX_sheenRoughnessTexture==1
#undef SC_USE_UV_MIN_MAX_sheenRoughnessTexture
#define SC_USE_UV_MIN_MAX_sheenRoughnessTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture 0
#elif SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture==1
#undef SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture 1
#endif
#ifndef Tweak_N37
#define Tweak_N37 0
#endif
#ifndef ENABLE_CLEARCOAT_TEX
#define ENABLE_CLEARCOAT_TEX 0
#elif ENABLE_CLEARCOAT_TEX==1
#undef ENABLE_CLEARCOAT_TEX
#define ENABLE_CLEARCOAT_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_clearcoatTexture
#define SC_USE_UV_TRANSFORM_clearcoatTexture 0
#elif SC_USE_UV_TRANSFORM_clearcoatTexture==1
#undef SC_USE_UV_TRANSFORM_clearcoatTexture
#define SC_USE_UV_TRANSFORM_clearcoatTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture
#define SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture
#define SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_clearcoatTexture
#define SC_USE_UV_MIN_MAX_clearcoatTexture 0
#elif SC_USE_UV_MIN_MAX_clearcoatTexture==1
#undef SC_USE_UV_MIN_MAX_clearcoatTexture
#define SC_USE_UV_MIN_MAX_clearcoatTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_clearcoatTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatTexture 0
#elif SC_USE_CLAMP_TO_BORDER_clearcoatTexture==1
#undef SC_USE_CLAMP_TO_BORDER_clearcoatTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatTexture 1
#endif
#ifndef Tweak_N44
#define Tweak_N44 0
#endif
#ifndef ENABLE_CLEARCOAT_ROUGHNESS_TEX
#define ENABLE_CLEARCOAT_ROUGHNESS_TEX 0
#elif ENABLE_CLEARCOAT_ROUGHNESS_TEX==1
#undef ENABLE_CLEARCOAT_ROUGHNESS_TEX
#define ENABLE_CLEARCOAT_ROUGHNESS_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture
#define SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture 0
#elif SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture==1
#undef SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture
#define SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture
#define SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture 0
#elif SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture==1
#undef SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture
#define SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture 0
#elif SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture==1
#undef SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture 1
#endif
#ifndef Tweak_N60
#define Tweak_N60 0
#endif
#ifndef ENABLE_CLEARCOAT_NORMAL_TEX
#define ENABLE_CLEARCOAT_NORMAL_TEX 0
#elif ENABLE_CLEARCOAT_NORMAL_TEX==1
#undef ENABLE_CLEARCOAT_NORMAL_TEX
#define ENABLE_CLEARCOAT_NORMAL_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_clearcoatNormalTexture
#define SC_USE_UV_TRANSFORM_clearcoatNormalTexture 0
#elif SC_USE_UV_TRANSFORM_clearcoatNormalTexture==1
#undef SC_USE_UV_TRANSFORM_clearcoatNormalTexture
#define SC_USE_UV_TRANSFORM_clearcoatNormalTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture
#define SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture
#define SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_clearcoatNormalTexture
#define SC_USE_UV_MIN_MAX_clearcoatNormalTexture 0
#elif SC_USE_UV_MIN_MAX_clearcoatNormalTexture==1
#undef SC_USE_UV_MIN_MAX_clearcoatNormalTexture
#define SC_USE_UV_MIN_MAX_clearcoatNormalTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture 0
#elif SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture==1
#undef SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture 1
#endif
#ifndef Tweak_N47
#define Tweak_N47 0
#endif
#ifndef ENABLE_TEXTURE_TRANSFORM
#define ENABLE_TEXTURE_TRANSFORM 0
#elif ENABLE_TEXTURE_TRANSFORM==1
#undef ENABLE_TEXTURE_TRANSFORM
#define ENABLE_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_EMISSIVE_TEXTURE_TRANSFORM
#define ENABLE_EMISSIVE_TEXTURE_TRANSFORM 0
#elif ENABLE_EMISSIVE_TEXTURE_TRANSFORM==1
#undef ENABLE_EMISSIVE_TEXTURE_TRANSFORM
#define ENABLE_EMISSIVE_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_NORMAL_TEXTURE_TRANSFORM
#define ENABLE_NORMAL_TEXTURE_TRANSFORM 0
#elif ENABLE_NORMAL_TEXTURE_TRANSFORM==1
#undef ENABLE_NORMAL_TEXTURE_TRANSFORM
#define ENABLE_NORMAL_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM 0
#elif ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM==1
#undef ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_TRANSMISSION_TEXTURE_TRANSFORM
#define ENABLE_TRANSMISSION_TEXTURE_TRANSFORM 0
#elif ENABLE_TRANSMISSION_TEXTURE_TRANSFORM==1
#undef ENABLE_TRANSMISSION_TEXTURE_TRANSFORM
#define ENABLE_TRANSMISSION_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM
#define ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM 0
#elif ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM==1
#undef ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM
#define ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM 0
#elif ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM==1
#undef ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_CLEARCOAT_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_TEXTURE_TRANSFORM 0
#elif ENABLE_CLEARCOAT_TEXTURE_TRANSFORM==1
#undef ENABLE_CLEARCOAT_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM 0
#elif ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM==1
#undef ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM 0
#elif ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM==1
#undef ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_VERTEX_COLOR_BASE
#define ENABLE_VERTEX_COLOR_BASE 0
#elif ENABLE_VERTEX_COLOR_BASE==1
#undef ENABLE_VERTEX_COLOR_BASE
#define ENABLE_VERTEX_COLOR_BASE 1
#endif
#ifndef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 0
#elif ENABLE_BASE_TEX==1
#undef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_baseColorTexture
#define SC_USE_UV_TRANSFORM_baseColorTexture 0
#elif SC_USE_UV_TRANSFORM_baseColorTexture==1
#undef SC_USE_UV_TRANSFORM_baseColorTexture
#define SC_USE_UV_TRANSFORM_baseColorTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_baseColorTexture
#define SC_SOFTWARE_WRAP_MODE_U_baseColorTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_baseColorTexture
#define SC_SOFTWARE_WRAP_MODE_V_baseColorTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_baseColorTexture
#define SC_USE_UV_MIN_MAX_baseColorTexture 0
#elif SC_USE_UV_MIN_MAX_baseColorTexture==1
#undef SC_USE_UV_MIN_MAX_baseColorTexture
#define SC_USE_UV_MIN_MAX_baseColorTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_baseColorTexture
#define SC_USE_CLAMP_TO_BORDER_baseColorTexture 0
#elif SC_USE_CLAMP_TO_BORDER_baseColorTexture==1
#undef SC_USE_CLAMP_TO_BORDER_baseColorTexture
#define SC_USE_CLAMP_TO_BORDER_baseColorTexture 1
#endif
#ifndef NODE_7_DROPLIST_ITEM
#define NODE_7_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_BASE_TEXTURE_TRANSFORM
#define ENABLE_BASE_TEXTURE_TRANSFORM 0
#elif ENABLE_BASE_TEXTURE_TRANSFORM==1
#undef ENABLE_BASE_TEXTURE_TRANSFORM
#define ENABLE_BASE_TEXTURE_TRANSFORM 1
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
uniform vec3 sc_EnvmapRotation;
uniform vec4 sc_EnvmapSpecularSize;
uniform float sc_EnvmapExposure;
uniform sc_AmbientLight_t sc_AmbientLights[sc_AmbientLightsCount+1];
uniform sc_DirectionalLight_t sc_DirectionalLights[sc_DirectionalLightsCount+1];
uniform sc_PointLight_t sc_PointLights[sc_PointLightsCount+1];
uniform mat3 emissiveTextureTransform;
uniform vec4 emissiveTextureUvMinMax;
uniform vec4 emissiveTextureBorderColor;
uniform mat3 normalTextureTransform;
uniform vec4 normalTextureUvMinMax;
uniform vec4 normalTextureBorderColor;
uniform mat3 metallicRoughnessTextureTransform;
uniform vec4 metallicRoughnessTextureUvMinMax;
uniform vec4 metallicRoughnessTextureBorderColor;
uniform mat3 transmissionTextureTransform;
uniform vec4 transmissionTextureUvMinMax;
uniform vec4 transmissionTextureBorderColor;
uniform mat3 screenTextureTransform;
uniform vec4 screenTextureUvMinMax;
uniform vec4 screenTextureBorderColor;
uniform mat3 sheenColorTextureTransform;
uniform vec4 sheenColorTextureUvMinMax;
uniform vec4 sheenColorTextureBorderColor;
uniform mat3 sheenRoughnessTextureTransform;
uniform vec4 sheenRoughnessTextureUvMinMax;
uniform vec4 sheenRoughnessTextureBorderColor;
uniform mat3 clearcoatTextureTransform;
uniform vec4 clearcoatTextureUvMinMax;
uniform vec4 clearcoatTextureBorderColor;
uniform mat3 clearcoatRoughnessTextureTransform;
uniform vec4 clearcoatRoughnessTextureUvMinMax;
uniform vec4 clearcoatRoughnessTextureBorderColor;
uniform mat3 clearcoatNormalTextureTransform;
uniform vec4 clearcoatNormalTextureUvMinMax;
uniform vec4 clearcoatNormalTextureBorderColor;
uniform vec3 emissiveFactor;
uniform float normalTextureScale;
uniform float metallicFactor;
uniform float roughnessFactor;
uniform float occlusionTextureStrength;
uniform float transmissionFactor;
uniform vec3 sheenColorFactor;
uniform float sheenRoughnessFactor;
uniform float clearcoatFactor;
uniform float clearcoatRoughnessFactor;
uniform mat3 baseColorTextureTransform;
uniform vec4 baseColorTextureUvMinMax;
uniform vec4 baseColorTextureBorderColor;
uniform vec4 baseColorFactor;
uniform vec2 baseColorTexture_offset;
uniform vec2 baseColorTexture_scale;
uniform float baseColorTexture_rotation;
uniform vec2 emissiveTexture_offset;
uniform vec2 emissiveTexture_scale;
uniform float emissiveTexture_rotation;
uniform vec2 normalTexture_offset;
uniform vec2 normalTexture_scale;
uniform float normalTexture_rotation;
uniform vec2 metallicRoughnessTexture_offset;
uniform vec2 metallicRoughnessTexture_scale;
uniform float metallicRoughnessTexture_rotation;
uniform vec2 transmissionTexture_offset;
uniform vec2 transmissionTexture_scale;
uniform float transmissionTexture_rotation;
uniform vec2 sheenColorTexture_offset;
uniform vec2 sheenColorTexture_scale;
uniform float sheenColorTexture_rotation;
uniform vec2 sheenRoughnessTexture_offset;
uniform vec2 sheenRoughnessTexture_scale;
uniform float sheenRoughnessTexture_rotation;
uniform vec2 clearcoatTexture_offset;
uniform vec2 clearcoatTexture_scale;
uniform float clearcoatTexture_rotation;
uniform vec2 clearcoatNormalTexture_offset;
uniform vec2 clearcoatNormalTexture_scale;
uniform float clearcoatNormalTexture_rotation;
uniform vec2 clearcoatRoughnessTexture_offset;
uniform vec2 clearcoatRoughnessTexture_scale;
uniform float clearcoatRoughnessTexture_rotation;
uniform float Port_Input2_N043;
uniform float Port_Input2_N062;
uniform float Port_Opacity_N405;
uniform vec4 sc_Time;
uniform sampler2D baseColorTexture;
uniform sampler2DArray baseColorTextureArrSC;
uniform sampler2D emissiveTexture;
uniform sampler2DArray emissiveTextureArrSC;
uniform sampler2D normalTexture;
uniform sampler2DArray normalTextureArrSC;
uniform sampler2D metallicRoughnessTexture;
uniform sampler2DArray metallicRoughnessTextureArrSC;
uniform sampler2D screenTexture;
uniform sampler2DArray screenTextureArrSC;
uniform sampler2D transmissionTexture;
uniform sampler2DArray transmissionTextureArrSC;
uniform sampler2D sheenColorTexture;
uniform sampler2DArray sheenColorTextureArrSC;
uniform sampler2D sheenRoughnessTexture;
uniform sampler2DArray sheenRoughnessTextureArrSC;
uniform sampler2D sc_EnvmapSpecular;
uniform sampler2DArray sc_EnvmapSpecularArrSC;
uniform sampler2D clearcoatTexture;
uniform sampler2DArray clearcoatTextureArrSC;
uniform sampler2D clearcoatRoughnessTexture;
uniform sampler2DArray clearcoatRoughnessTextureArrSC;
uniform sampler2D clearcoatNormalTexture;
uniform sampler2DArray clearcoatNormalTextureArrSC;
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
void Node40_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (ENABLE_VERTEX_COLOR_BASE)
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
void Node121_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (ENABLE_BASE_TEX)
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
void Node48_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (ENABLE_TEXTURE_TRANSFORM)
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
void Node88_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (ENABLE_BASE_TEXTURE_TRANSFORM)
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
vec2 N35_getUV(int pickUV)
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
return l9_2;
}
vec2 N35_uvTransform(vec2 uvIn,vec2 offset,vec2 scale,float rotation)
{
return (((mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(offset.x,offset.y,1.0))*mat3(vec3(cos(rotation),sin(rotation),0.0),vec3(-sin(rotation),cos(rotation),0.0),vec3(0.0,0.0,1.0)))*mat3(vec3(scale.x,0.0,0.0),vec3(0.0,scale.y,0.0),vec3(0.0,0.0,1.0)))*vec3(uvIn,1.0)).xy;
}
int baseColorTextureGetStereoViewIndex()
{
int l9_0;
#if (baseColorTextureHasSwappedViews)
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
vec4 N35_BaseTexture_sample(vec2 coords)
{
vec4 l9_0;
#if (baseColorTextureLayout==2)
{
bool l9_1=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseColorTexture)!=0));
float l9_2=coords.x;
sc_SoftwareWrapEarly(l9_2,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x);
float l9_3=l9_2;
float l9_4=coords.y;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y);
float l9_5=l9_4;
vec2 l9_6;
float l9_7;
#if (SC_USE_UV_MIN_MAX_baseColorTexture)
{
bool l9_8;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_8=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x==3;
}
#else
{
l9_8=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0);
}
#endif
float l9_9=l9_3;
float l9_10=1.0;
sc_ClampUV(l9_9,baseColorTextureUvMinMax.x,baseColorTextureUvMinMax.z,l9_8,l9_10);
float l9_11=l9_9;
float l9_12=l9_10;
bool l9_13;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_13=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y==3;
}
#else
{
l9_13=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0);
}
#endif
float l9_14=l9_5;
float l9_15=l9_12;
sc_ClampUV(l9_14,baseColorTextureUvMinMax.y,baseColorTextureUvMinMax.w,l9_13,l9_15);
l9_7=l9_15;
l9_6=vec2(l9_11,l9_14);
}
#else
{
l9_7=1.0;
l9_6=vec2(l9_3,l9_5);
}
#endif
vec2 l9_16=sc_TransformUV(l9_6,(int(SC_USE_UV_TRANSFORM_baseColorTexture)!=0),baseColorTextureTransform);
float l9_17=l9_16.x;
float l9_18=l9_7;
sc_SoftwareWrapLate(l9_17,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x,l9_1,l9_18);
float l9_19=l9_16.y;
float l9_20=l9_18;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y,l9_1,l9_20);
float l9_21=l9_20;
vec3 l9_22=sc_SamplingCoordsViewToGlobal(vec2(l9_17,l9_19),baseColorTextureLayout,baseColorTextureGetStereoViewIndex());
vec4 l9_23=texture(baseColorTextureArrSC,l9_22,0.0);
vec4 l9_24;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_24=mix(baseColorTextureBorderColor,l9_23,vec4(l9_21));
}
#else
{
l9_24=l9_23;
}
#endif
l9_0=l9_24;
}
#else
{
bool l9_25=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseColorTexture)!=0));
float l9_26=coords.x;
sc_SoftwareWrapEarly(l9_26,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x);
float l9_27=l9_26;
float l9_28=coords.y;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y);
float l9_29=l9_28;
vec2 l9_30;
float l9_31;
#if (SC_USE_UV_MIN_MAX_baseColorTexture)
{
bool l9_32;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_32=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x==3;
}
#else
{
l9_32=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0);
}
#endif
float l9_33=l9_27;
float l9_34=1.0;
sc_ClampUV(l9_33,baseColorTextureUvMinMax.x,baseColorTextureUvMinMax.z,l9_32,l9_34);
float l9_35=l9_33;
float l9_36=l9_34;
bool l9_37;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_37=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y==3;
}
#else
{
l9_37=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0);
}
#endif
float l9_38=l9_29;
float l9_39=l9_36;
sc_ClampUV(l9_38,baseColorTextureUvMinMax.y,baseColorTextureUvMinMax.w,l9_37,l9_39);
l9_31=l9_39;
l9_30=vec2(l9_35,l9_38);
}
#else
{
l9_31=1.0;
l9_30=vec2(l9_27,l9_29);
}
#endif
vec2 l9_40=sc_TransformUV(l9_30,(int(SC_USE_UV_TRANSFORM_baseColorTexture)!=0),baseColorTextureTransform);
float l9_41=l9_40.x;
float l9_42=l9_31;
sc_SoftwareWrapLate(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x,l9_25,l9_42);
float l9_43=l9_40.y;
float l9_44=l9_42;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y,l9_25,l9_44);
float l9_45=l9_44;
vec3 l9_46=sc_SamplingCoordsViewToGlobal(vec2(l9_41,l9_43),baseColorTextureLayout,baseColorTextureGetStereoViewIndex());
vec4 l9_47=texture(baseColorTexture,l9_46.xy,0.0);
vec4 l9_48;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_48=mix(baseColorTextureBorderColor,l9_47,vec4(l9_45));
}
#else
{
l9_48=l9_47;
}
#endif
l9_0=l9_48;
}
#endif
return l9_0;
}
vec4 ssSRGB_to_Linear(vec4 value)
{
vec4 l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=vec4(pow(value.x,2.2),pow(value.y,2.2),pow(value.z,2.2),pow(value.w,2.2));
}
#else
{
l9_0=value*value;
}
#endif
return l9_0;
}
vec4 ssLinear_to_SRGB(vec4 value)
{
vec4 l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=vec4(pow(value.x,0.45454544),pow(value.y,0.45454544),pow(value.z,0.45454544),pow(value.w,0.45454544));
}
#else
{
l9_0=sqrt(value);
}
#endif
return l9_0;
}
vec2 N3_getUV(int pickUV)
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
return l9_2;
}
vec2 N3_uvTransform(vec2 uvIn,vec2 offset,vec2 scale,float rotationAngle)
{
float l9_0=radians(rotationAngle);
float l9_1=cos(l9_0);
float l9_2=sin(l9_0);
return (((mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(offset.x,offset.y,1.0))*mat3(vec3(l9_1,l9_2,0.0),vec3(-l9_2,l9_1,0.0),vec3(0.0,0.0,1.0)))*mat3(vec3(scale.x,0.0,0.0),vec3(0.0,scale.y,0.0),vec3(0.0,0.0,1.0)))*vec3(uvIn,1.0)).xy;
}
int emissiveTextureGetStereoViewIndex()
{
int l9_0;
#if (emissiveTextureHasSwappedViews)
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
int normalTextureGetStereoViewIndex()
{
int l9_0;
#if (normalTextureHasSwappedViews)
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
int metallicRoughnessTextureGetStereoViewIndex()
{
int l9_0;
#if (metallicRoughnessTextureHasSwappedViews)
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
int screenTextureGetStereoViewIndex()
{
int l9_0;
#if (screenTextureHasSwappedViews)
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
int transmissionTextureGetStereoViewIndex()
{
int l9_0;
#if (transmissionTextureHasSwappedViews)
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
vec3 ssLinear_to_SRGB(vec3 value)
{
vec3 l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=vec3(pow(value.x,0.45454544),pow(value.y,0.45454544),pow(value.z,0.45454544));
}
#else
{
l9_0=sqrt(value);
}
#endif
return l9_0;
}
int sheenColorTextureGetStereoViewIndex()
{
int l9_0;
#if (sheenColorTextureHasSwappedViews)
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
int sheenRoughnessTextureGetStereoViewIndex()
{
int l9_0;
#if (sheenRoughnessTextureHasSwappedViews)
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
float ssSRGB_to_Linear(float value)
{
float l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=pow(value,2.2);
}
#else
{
l9_0=value*value;
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
float N3_charlieD(float roughness,float NdotH)
{
float l9_0=1.0/roughness;
return ((2.0+l9_0)*ssPow(1.0-(NdotH*NdotH),l9_0*0.5))/(2.0*3.1415927);
}
int clearcoatTextureGetStereoViewIndex()
{
int l9_0;
#if (clearcoatTextureHasSwappedViews)
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
int clearcoatRoughnessTextureGetStereoViewIndex()
{
int l9_0;
#if (clearcoatRoughnessTextureHasSwappedViews)
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
int clearcoatNormalTextureGetStereoViewIndex()
{
int l9_0;
#if (clearcoatNormalTextureHasSwappedViews)
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
void main()
{
#if (sc_DepthOnly)
{
return;
}
#endif
vec3 l9_0=normalize(varNormal);
vec3 l9_1=normalize(varTangent.xyz);
vec3 l9_2=cross(l9_0,l9_1)*varTangent.w;
vec2 l9_3=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec2 l9_4;
#if (sc_StereoRenderingMode==1)
{
vec3 l9_5=vec3(l9_3,0.0);
l9_5.y=((2.0*l9_3.y)+float(sc_GetStereoViewIndex()))-1.0;
l9_4=l9_5.xy;
}
#else
{
l9_4=l9_3;
}
#endif
ssGlobals l9_6=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec3(0.0),normalize(sc_Camera.position-varPos),varPos,varPos,l9_0,l9_1,l9_2,varPackedTex.xy,varPackedTex.zw,l9_4,varColor);
#if (ENABLE_GLTF_LIGHTING)
{
float l9_7;
#if (ENABLE_NORMALMAP)
{
l9_7=normalTextureScale;
}
#else
{
l9_7=Port_Input2_N043;
}
#endif
float l9_8;
#if (ENABLE_METALLIC_ROUGHNESS_TEX)
{
l9_8=occlusionTextureStrength;
}
#else
{
l9_8=Port_Input2_N062;
}
#endif
float l9_9;
Node40_Bool_Parameter(l9_9,l9_6);
float l9_10;
Node121_Bool_Parameter(l9_10,l9_6);
float l9_11;
Node48_Bool_Parameter(l9_11,l9_6);
float l9_12;
Node88_Bool_Parameter(l9_12,l9_6);
tempGlobals=l9_6;
vec4 l9_13;
#if (ENABLE_BASE_TEX)
{
vec2 l9_14=N35_getUV(NODE_7_DROPLIST_ITEM);
vec2 l9_15;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_BASE_TEXTURE_TRANSFORM)!=0))
{
l9_15=N35_uvTransform(l9_14,baseColorTexture_offset,baseColorTexture_scale,baseColorTexture_rotation);
}
else
{
l9_15=l9_14;
}
l9_13=baseColorFactor*ssSRGB_to_Linear(N35_BaseTexture_sample(l9_15));
}
#else
{
l9_13=baseColorFactor;
}
#endif
vec4 l9_16;
#if (ENABLE_VERTEX_COLOR_BASE)
{
l9_16=l9_13*tempGlobals.VertexColor;
}
#else
{
l9_16=l9_13;
}
#endif
tempGlobals=l9_6;
vec3 l9_17;
#if (ENABLE_EMISSIVE)
{
vec2 l9_18=N3_getUV(NODE_10_DROPLIST_ITEM);
vec2 l9_19;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_EMISSIVE_TEXTURE_TRANSFORM)!=0))
{
l9_19=N3_uvTransform(l9_18,emissiveTexture_offset,emissiveTexture_scale,emissiveTexture_rotation);
}
else
{
l9_19=l9_18;
}
vec4 l9_20;
#if (emissiveTextureLayout==2)
{
bool l9_21=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTexture)!=0));
float l9_22=l9_19.x;
sc_SoftwareWrapEarly(l9_22,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x);
float l9_23=l9_22;
float l9_24=l9_19.y;
sc_SoftwareWrapEarly(l9_24,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y);
float l9_25=l9_24;
vec2 l9_26;
float l9_27;
#if (SC_USE_UV_MIN_MAX_emissiveTexture)
{
bool l9_28;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_28=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x==3;
}
#else
{
l9_28=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0);
}
#endif
float l9_29=l9_23;
float l9_30=1.0;
sc_ClampUV(l9_29,emissiveTextureUvMinMax.x,emissiveTextureUvMinMax.z,l9_28,l9_30);
float l9_31=l9_29;
float l9_32=l9_30;
bool l9_33;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_33=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y==3;
}
#else
{
l9_33=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0);
}
#endif
float l9_34=l9_25;
float l9_35=l9_32;
sc_ClampUV(l9_34,emissiveTextureUvMinMax.y,emissiveTextureUvMinMax.w,l9_33,l9_35);
l9_27=l9_35;
l9_26=vec2(l9_31,l9_34);
}
#else
{
l9_27=1.0;
l9_26=vec2(l9_23,l9_25);
}
#endif
vec2 l9_36=sc_TransformUV(l9_26,(int(SC_USE_UV_TRANSFORM_emissiveTexture)!=0),emissiveTextureTransform);
float l9_37=l9_36.x;
float l9_38=l9_27;
sc_SoftwareWrapLate(l9_37,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x,l9_21,l9_38);
float l9_39=l9_36.y;
float l9_40=l9_38;
sc_SoftwareWrapLate(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y,l9_21,l9_40);
float l9_41=l9_40;
vec3 l9_42=sc_SamplingCoordsViewToGlobal(vec2(l9_37,l9_39),emissiveTextureLayout,emissiveTextureGetStereoViewIndex());
vec4 l9_43=texture(emissiveTextureArrSC,l9_42,0.0);
vec4 l9_44;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_44=mix(emissiveTextureBorderColor,l9_43,vec4(l9_41));
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
bool l9_45=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTexture)!=0));
float l9_46=l9_19.x;
sc_SoftwareWrapEarly(l9_46,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x);
float l9_47=l9_46;
float l9_48=l9_19.y;
sc_SoftwareWrapEarly(l9_48,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y);
float l9_49=l9_48;
vec2 l9_50;
float l9_51;
#if (SC_USE_UV_MIN_MAX_emissiveTexture)
{
bool l9_52;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_52=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x==3;
}
#else
{
l9_52=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0);
}
#endif
float l9_53=l9_47;
float l9_54=1.0;
sc_ClampUV(l9_53,emissiveTextureUvMinMax.x,emissiveTextureUvMinMax.z,l9_52,l9_54);
float l9_55=l9_53;
float l9_56=l9_54;
bool l9_57;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_57=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y==3;
}
#else
{
l9_57=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0);
}
#endif
float l9_58=l9_49;
float l9_59=l9_56;
sc_ClampUV(l9_58,emissiveTextureUvMinMax.y,emissiveTextureUvMinMax.w,l9_57,l9_59);
l9_51=l9_59;
l9_50=vec2(l9_55,l9_58);
}
#else
{
l9_51=1.0;
l9_50=vec2(l9_47,l9_49);
}
#endif
vec2 l9_60=sc_TransformUV(l9_50,(int(SC_USE_UV_TRANSFORM_emissiveTexture)!=0),emissiveTextureTransform);
float l9_61=l9_60.x;
float l9_62=l9_51;
sc_SoftwareWrapLate(l9_61,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x,l9_45,l9_62);
float l9_63=l9_60.y;
float l9_64=l9_62;
sc_SoftwareWrapLate(l9_63,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y,l9_45,l9_64);
float l9_65=l9_64;
vec3 l9_66=sc_SamplingCoordsViewToGlobal(vec2(l9_61,l9_63),emissiveTextureLayout,emissiveTextureGetStereoViewIndex());
vec4 l9_67=texture(emissiveTexture,l9_66.xy,0.0);
vec4 l9_68;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_68=mix(emissiveTextureBorderColor,l9_67,vec4(l9_65));
}
#else
{
l9_68=l9_67;
}
#endif
l9_20=l9_68;
}
#endif
l9_17=ssSRGB_to_Linear(l9_20.xyz)*ssSRGB_to_Linear(emissiveFactor);
}
#else
{
l9_17=emissiveFactor;
}
#endif
vec3 l9_69=tempGlobals.VertexNormal_WorldSpace;
vec3 l9_70=normalize(l9_69);
vec3 l9_71;
#if (ENABLE_NORMALMAP)
{
vec2 l9_72=N3_getUV(NODE_8_DROPLIST_ITEM);
vec2 l9_73;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_NORMAL_TEXTURE_TRANSFORM)!=0))
{
l9_73=N3_uvTransform(l9_72,normalTexture_offset,normalTexture_scale,normalTexture_rotation);
}
else
{
l9_73=l9_72;
}
vec4 l9_74;
#if (normalTextureLayout==2)
{
bool l9_75=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTexture)!=0));
float l9_76=l9_73.x;
sc_SoftwareWrapEarly(l9_76,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x);
float l9_77=l9_76;
float l9_78=l9_73.y;
sc_SoftwareWrapEarly(l9_78,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y);
float l9_79=l9_78;
vec2 l9_80;
float l9_81;
#if (SC_USE_UV_MIN_MAX_normalTexture)
{
bool l9_82;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_82=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x==3;
}
#else
{
l9_82=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0);
}
#endif
float l9_83=l9_77;
float l9_84=1.0;
sc_ClampUV(l9_83,normalTextureUvMinMax.x,normalTextureUvMinMax.z,l9_82,l9_84);
float l9_85=l9_83;
float l9_86=l9_84;
bool l9_87;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_87=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y==3;
}
#else
{
l9_87=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0);
}
#endif
float l9_88=l9_79;
float l9_89=l9_86;
sc_ClampUV(l9_88,normalTextureUvMinMax.y,normalTextureUvMinMax.w,l9_87,l9_89);
l9_81=l9_89;
l9_80=vec2(l9_85,l9_88);
}
#else
{
l9_81=1.0;
l9_80=vec2(l9_77,l9_79);
}
#endif
vec2 l9_90=sc_TransformUV(l9_80,(int(SC_USE_UV_TRANSFORM_normalTexture)!=0),normalTextureTransform);
float l9_91=l9_90.x;
float l9_92=l9_81;
sc_SoftwareWrapLate(l9_91,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x,l9_75,l9_92);
float l9_93=l9_90.y;
float l9_94=l9_92;
sc_SoftwareWrapLate(l9_93,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y,l9_75,l9_94);
float l9_95=l9_94;
vec3 l9_96=sc_SamplingCoordsViewToGlobal(vec2(l9_91,l9_93),normalTextureLayout,normalTextureGetStereoViewIndex());
vec4 l9_97=texture(normalTextureArrSC,l9_96,0.0);
vec4 l9_98;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_98=mix(normalTextureBorderColor,l9_97,vec4(l9_95));
}
#else
{
l9_98=l9_97;
}
#endif
l9_74=l9_98;
}
#else
{
bool l9_99=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTexture)!=0));
float l9_100=l9_73.x;
sc_SoftwareWrapEarly(l9_100,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x);
float l9_101=l9_100;
float l9_102=l9_73.y;
sc_SoftwareWrapEarly(l9_102,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y);
float l9_103=l9_102;
vec2 l9_104;
float l9_105;
#if (SC_USE_UV_MIN_MAX_normalTexture)
{
bool l9_106;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_106=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x==3;
}
#else
{
l9_106=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0);
}
#endif
float l9_107=l9_101;
float l9_108=1.0;
sc_ClampUV(l9_107,normalTextureUvMinMax.x,normalTextureUvMinMax.z,l9_106,l9_108);
float l9_109=l9_107;
float l9_110=l9_108;
bool l9_111;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_111=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y==3;
}
#else
{
l9_111=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0);
}
#endif
float l9_112=l9_103;
float l9_113=l9_110;
sc_ClampUV(l9_112,normalTextureUvMinMax.y,normalTextureUvMinMax.w,l9_111,l9_113);
l9_105=l9_113;
l9_104=vec2(l9_109,l9_112);
}
#else
{
l9_105=1.0;
l9_104=vec2(l9_101,l9_103);
}
#endif
vec2 l9_114=sc_TransformUV(l9_104,(int(SC_USE_UV_TRANSFORM_normalTexture)!=0),normalTextureTransform);
float l9_115=l9_114.x;
float l9_116=l9_105;
sc_SoftwareWrapLate(l9_115,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x,l9_99,l9_116);
float l9_117=l9_114.y;
float l9_118=l9_116;
sc_SoftwareWrapLate(l9_117,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y,l9_99,l9_118);
float l9_119=l9_118;
vec3 l9_120=sc_SamplingCoordsViewToGlobal(vec2(l9_115,l9_117),normalTextureLayout,normalTextureGetStereoViewIndex());
vec4 l9_121=texture(normalTexture,l9_120.xy,0.0);
vec4 l9_122;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_122=mix(normalTextureBorderColor,l9_121,vec4(l9_119));
}
#else
{
l9_122=l9_121;
}
#endif
l9_74=l9_122;
}
#endif
l9_71=normalize(mat3(tempGlobals.VertexTangent_WorldSpace,tempGlobals.VertexBinormal_WorldSpace,l9_70)*mix(vec3(0.0,0.0,1.0),(l9_74.xyz*1.9921875)-vec3(1.0),vec3(l9_7)));
}
#else
{
l9_71=l9_70;
}
#endif
float l9_123;
vec4 l9_124;
float l9_125;
#if (ENABLE_METALLIC_ROUGHNESS_TEX)
{
vec2 l9_126=N3_getUV(NODE_11_DROPLIST_ITEM);
vec2 l9_127;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM)!=0))
{
l9_127=N3_uvTransform(l9_126,metallicRoughnessTexture_offset,metallicRoughnessTexture_scale,metallicRoughnessTexture_rotation);
}
else
{
l9_127=l9_126;
}
vec4 l9_128;
#if (metallicRoughnessTextureLayout==2)
{
bool l9_129=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_metallicRoughnessTexture)!=0));
float l9_130=l9_127.x;
sc_SoftwareWrapEarly(l9_130,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x);
float l9_131=l9_130;
float l9_132=l9_127.y;
sc_SoftwareWrapEarly(l9_132,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y);
float l9_133=l9_132;
vec2 l9_134;
float l9_135;
#if (SC_USE_UV_MIN_MAX_metallicRoughnessTexture)
{
bool l9_136;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_136=ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x==3;
}
#else
{
l9_136=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0);
}
#endif
float l9_137=l9_131;
float l9_138=1.0;
sc_ClampUV(l9_137,metallicRoughnessTextureUvMinMax.x,metallicRoughnessTextureUvMinMax.z,l9_136,l9_138);
float l9_139=l9_137;
float l9_140=l9_138;
bool l9_141;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_141=ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y==3;
}
#else
{
l9_141=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0);
}
#endif
float l9_142=l9_133;
float l9_143=l9_140;
sc_ClampUV(l9_142,metallicRoughnessTextureUvMinMax.y,metallicRoughnessTextureUvMinMax.w,l9_141,l9_143);
l9_135=l9_143;
l9_134=vec2(l9_139,l9_142);
}
#else
{
l9_135=1.0;
l9_134=vec2(l9_131,l9_133);
}
#endif
vec2 l9_144=sc_TransformUV(l9_134,(int(SC_USE_UV_TRANSFORM_metallicRoughnessTexture)!=0),metallicRoughnessTextureTransform);
float l9_145=l9_144.x;
float l9_146=l9_135;
sc_SoftwareWrapLate(l9_145,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x,l9_129,l9_146);
float l9_147=l9_144.y;
float l9_148=l9_146;
sc_SoftwareWrapLate(l9_147,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y,l9_129,l9_148);
float l9_149=l9_148;
vec3 l9_150=sc_SamplingCoordsViewToGlobal(vec2(l9_145,l9_147),metallicRoughnessTextureLayout,metallicRoughnessTextureGetStereoViewIndex());
vec4 l9_151=texture(metallicRoughnessTextureArrSC,l9_150,0.0);
vec4 l9_152;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_152=mix(metallicRoughnessTextureBorderColor,l9_151,vec4(l9_149));
}
#else
{
l9_152=l9_151;
}
#endif
l9_128=l9_152;
}
#else
{
bool l9_153=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_metallicRoughnessTexture)!=0));
float l9_154=l9_127.x;
sc_SoftwareWrapEarly(l9_154,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x);
float l9_155=l9_154;
float l9_156=l9_127.y;
sc_SoftwareWrapEarly(l9_156,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y);
float l9_157=l9_156;
vec2 l9_158;
float l9_159;
#if (SC_USE_UV_MIN_MAX_metallicRoughnessTexture)
{
bool l9_160;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_160=ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x==3;
}
#else
{
l9_160=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0);
}
#endif
float l9_161=l9_155;
float l9_162=1.0;
sc_ClampUV(l9_161,metallicRoughnessTextureUvMinMax.x,metallicRoughnessTextureUvMinMax.z,l9_160,l9_162);
float l9_163=l9_161;
float l9_164=l9_162;
bool l9_165;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_165=ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y==3;
}
#else
{
l9_165=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0);
}
#endif
float l9_166=l9_157;
float l9_167=l9_164;
sc_ClampUV(l9_166,metallicRoughnessTextureUvMinMax.y,metallicRoughnessTextureUvMinMax.w,l9_165,l9_167);
l9_159=l9_167;
l9_158=vec2(l9_163,l9_166);
}
#else
{
l9_159=1.0;
l9_158=vec2(l9_155,l9_157);
}
#endif
vec2 l9_168=sc_TransformUV(l9_158,(int(SC_USE_UV_TRANSFORM_metallicRoughnessTexture)!=0),metallicRoughnessTextureTransform);
float l9_169=l9_168.x;
float l9_170=l9_159;
sc_SoftwareWrapLate(l9_169,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x,l9_153,l9_170);
float l9_171=l9_168.y;
float l9_172=l9_170;
sc_SoftwareWrapLate(l9_171,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y,l9_153,l9_172);
float l9_173=l9_172;
vec3 l9_174=sc_SamplingCoordsViewToGlobal(vec2(l9_169,l9_171),metallicRoughnessTextureLayout,metallicRoughnessTextureGetStereoViewIndex());
vec4 l9_175=texture(metallicRoughnessTexture,l9_174.xy,0.0);
vec4 l9_176;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_176=mix(metallicRoughnessTextureBorderColor,l9_175,vec4(l9_173));
}
#else
{
l9_176=l9_175;
}
#endif
l9_128=l9_176;
}
#endif
vec4 l9_177=vec4(0.0);
l9_177.w=l9_8;
vec3 l9_178=vec3(1.0+(l9_8*(l9_128.z-1.0)));
l9_125=roughnessFactor*l9_128.y;
l9_124=vec4(l9_178.x,l9_178.y,l9_178.z,l9_177.w);
l9_123=metallicFactor*l9_128.x;
}
#else
{
l9_125=roughnessFactor;
l9_124=vec4(1.0,1.0,1.0,0.0);
l9_123=metallicFactor;
}
#endif
vec3 l9_179;
vec3 l9_180;
vec3 l9_181;
#if (ENABLE_TRANSMISSION)
{
vec2 l9_182=tempGlobals.gScreenCoord;
vec4 l9_183;
#if (screenTextureLayout==2)
{
bool l9_184=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenTexture)!=0));
float l9_185=l9_182.x;
sc_SoftwareWrapEarly(l9_185,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x);
float l9_186=l9_185;
float l9_187=l9_182.y;
sc_SoftwareWrapEarly(l9_187,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y);
float l9_188=l9_187;
vec2 l9_189;
float l9_190;
#if (SC_USE_UV_MIN_MAX_screenTexture)
{
bool l9_191;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_191=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x==3;
}
#else
{
l9_191=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0);
}
#endif
float l9_192=l9_186;
float l9_193=1.0;
sc_ClampUV(l9_192,screenTextureUvMinMax.x,screenTextureUvMinMax.z,l9_191,l9_193);
float l9_194=l9_192;
float l9_195=l9_193;
bool l9_196;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_196=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y==3;
}
#else
{
l9_196=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0);
}
#endif
float l9_197=l9_188;
float l9_198=l9_195;
sc_ClampUV(l9_197,screenTextureUvMinMax.y,screenTextureUvMinMax.w,l9_196,l9_198);
l9_190=l9_198;
l9_189=vec2(l9_194,l9_197);
}
#else
{
l9_190=1.0;
l9_189=vec2(l9_186,l9_188);
}
#endif
vec2 l9_199=sc_TransformUV(l9_189,(int(SC_USE_UV_TRANSFORM_screenTexture)!=0),screenTextureTransform);
float l9_200=l9_199.x;
float l9_201=l9_190;
sc_SoftwareWrapLate(l9_200,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x,l9_184,l9_201);
float l9_202=l9_199.y;
float l9_203=l9_201;
sc_SoftwareWrapLate(l9_202,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y,l9_184,l9_203);
float l9_204=l9_203;
vec3 l9_205=sc_SamplingCoordsViewToGlobal(vec2(l9_200,l9_202),screenTextureLayout,screenTextureGetStereoViewIndex());
vec4 l9_206=texture(screenTextureArrSC,l9_205,0.0);
vec4 l9_207;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_207=mix(screenTextureBorderColor,l9_206,vec4(l9_204));
}
#else
{
l9_207=l9_206;
}
#endif
l9_183=l9_207;
}
#else
{
bool l9_208=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenTexture)!=0));
float l9_209=l9_182.x;
sc_SoftwareWrapEarly(l9_209,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x);
float l9_210=l9_209;
float l9_211=l9_182.y;
sc_SoftwareWrapEarly(l9_211,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y);
float l9_212=l9_211;
vec2 l9_213;
float l9_214;
#if (SC_USE_UV_MIN_MAX_screenTexture)
{
bool l9_215;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_215=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x==3;
}
#else
{
l9_215=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0);
}
#endif
float l9_216=l9_210;
float l9_217=1.0;
sc_ClampUV(l9_216,screenTextureUvMinMax.x,screenTextureUvMinMax.z,l9_215,l9_217);
float l9_218=l9_216;
float l9_219=l9_217;
bool l9_220;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_220=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y==3;
}
#else
{
l9_220=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0);
}
#endif
float l9_221=l9_212;
float l9_222=l9_219;
sc_ClampUV(l9_221,screenTextureUvMinMax.y,screenTextureUvMinMax.w,l9_220,l9_222);
l9_214=l9_222;
l9_213=vec2(l9_218,l9_221);
}
#else
{
l9_214=1.0;
l9_213=vec2(l9_210,l9_212);
}
#endif
vec2 l9_223=sc_TransformUV(l9_213,(int(SC_USE_UV_TRANSFORM_screenTexture)!=0),screenTextureTransform);
float l9_224=l9_223.x;
float l9_225=l9_214;
sc_SoftwareWrapLate(l9_224,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x,l9_208,l9_225);
float l9_226=l9_223.y;
float l9_227=l9_225;
sc_SoftwareWrapLate(l9_226,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y,l9_208,l9_227);
float l9_228=l9_227;
vec3 l9_229=sc_SamplingCoordsViewToGlobal(vec2(l9_224,l9_226),screenTextureLayout,screenTextureGetStereoViewIndex());
vec4 l9_230=texture(screenTexture,l9_229.xy,0.0);
vec4 l9_231;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_231=mix(screenTextureBorderColor,l9_230,vec4(l9_228));
}
#else
{
l9_231=l9_230;
}
#endif
l9_183=l9_231;
}
#endif
vec3 l9_232=ssSRGB_to_Linear(l9_183.xyz);
float l9_233;
#if (ENABLE_TRANSMISSION_TEX)
{
vec2 l9_234=N3_getUV(Tweak_N30);
vec2 l9_235;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_TRANSMISSION_TEXTURE_TRANSFORM)!=0))
{
l9_235=N3_uvTransform(l9_234,transmissionTexture_offset,transmissionTexture_scale,transmissionTexture_rotation);
}
else
{
l9_235=l9_234;
}
vec4 l9_236;
#if (transmissionTextureLayout==2)
{
bool l9_237=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_transmissionTexture)!=0));
float l9_238=l9_235.x;
sc_SoftwareWrapEarly(l9_238,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x);
float l9_239=l9_238;
float l9_240=l9_235.y;
sc_SoftwareWrapEarly(l9_240,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y);
float l9_241=l9_240;
vec2 l9_242;
float l9_243;
#if (SC_USE_UV_MIN_MAX_transmissionTexture)
{
bool l9_244;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_244=ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x==3;
}
#else
{
l9_244=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0);
}
#endif
float l9_245=l9_239;
float l9_246=1.0;
sc_ClampUV(l9_245,transmissionTextureUvMinMax.x,transmissionTextureUvMinMax.z,l9_244,l9_246);
float l9_247=l9_245;
float l9_248=l9_246;
bool l9_249;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_249=ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y==3;
}
#else
{
l9_249=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0);
}
#endif
float l9_250=l9_241;
float l9_251=l9_248;
sc_ClampUV(l9_250,transmissionTextureUvMinMax.y,transmissionTextureUvMinMax.w,l9_249,l9_251);
l9_243=l9_251;
l9_242=vec2(l9_247,l9_250);
}
#else
{
l9_243=1.0;
l9_242=vec2(l9_239,l9_241);
}
#endif
vec2 l9_252=sc_TransformUV(l9_242,(int(SC_USE_UV_TRANSFORM_transmissionTexture)!=0),transmissionTextureTransform);
float l9_253=l9_252.x;
float l9_254=l9_243;
sc_SoftwareWrapLate(l9_253,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x,l9_237,l9_254);
float l9_255=l9_252.y;
float l9_256=l9_254;
sc_SoftwareWrapLate(l9_255,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y,l9_237,l9_256);
float l9_257=l9_256;
vec3 l9_258=sc_SamplingCoordsViewToGlobal(vec2(l9_253,l9_255),transmissionTextureLayout,transmissionTextureGetStereoViewIndex());
vec4 l9_259=texture(transmissionTextureArrSC,l9_258,0.0);
vec4 l9_260;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_260=mix(transmissionTextureBorderColor,l9_259,vec4(l9_257));
}
#else
{
l9_260=l9_259;
}
#endif
l9_236=l9_260;
}
#else
{
bool l9_261=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_transmissionTexture)!=0));
float l9_262=l9_235.x;
sc_SoftwareWrapEarly(l9_262,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x);
float l9_263=l9_262;
float l9_264=l9_235.y;
sc_SoftwareWrapEarly(l9_264,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y);
float l9_265=l9_264;
vec2 l9_266;
float l9_267;
#if (SC_USE_UV_MIN_MAX_transmissionTexture)
{
bool l9_268;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_268=ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x==3;
}
#else
{
l9_268=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0);
}
#endif
float l9_269=l9_263;
float l9_270=1.0;
sc_ClampUV(l9_269,transmissionTextureUvMinMax.x,transmissionTextureUvMinMax.z,l9_268,l9_270);
float l9_271=l9_269;
float l9_272=l9_270;
bool l9_273;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_273=ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y==3;
}
#else
{
l9_273=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0);
}
#endif
float l9_274=l9_265;
float l9_275=l9_272;
sc_ClampUV(l9_274,transmissionTextureUvMinMax.y,transmissionTextureUvMinMax.w,l9_273,l9_275);
l9_267=l9_275;
l9_266=vec2(l9_271,l9_274);
}
#else
{
l9_267=1.0;
l9_266=vec2(l9_263,l9_265);
}
#endif
vec2 l9_276=sc_TransformUV(l9_266,(int(SC_USE_UV_TRANSFORM_transmissionTexture)!=0),transmissionTextureTransform);
float l9_277=l9_276.x;
float l9_278=l9_267;
sc_SoftwareWrapLate(l9_277,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x,l9_261,l9_278);
float l9_279=l9_276.y;
float l9_280=l9_278;
sc_SoftwareWrapLate(l9_279,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y,l9_261,l9_280);
float l9_281=l9_280;
vec3 l9_282=sc_SamplingCoordsViewToGlobal(vec2(l9_277,l9_279),transmissionTextureLayout,transmissionTextureGetStereoViewIndex());
vec4 l9_283=texture(transmissionTexture,l9_282.xy,0.0);
vec4 l9_284;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_284=mix(transmissionTextureBorderColor,l9_283,vec4(l9_281));
}
#else
{
l9_284=l9_283;
}
#endif
l9_236=l9_284;
}
#endif
l9_233=l9_236.x;
}
#else
{
l9_233=1.0;
}
#endif
vec3 l9_285=vec3(l9_233*transmissionFactor);
vec3 l9_286=vec3(l9_123);
l9_181=l9_232;
l9_180=mix(mix(vec3(0.0),l9_16.xyz,l9_285)*l9_232,vec3(0.0),l9_286)+l9_17;
l9_179=mix(mix(l9_16.xyz,vec3(0.0),l9_285),l9_16.xyz,l9_286);
}
#else
{
l9_181=vec3(0.0);
l9_180=l9_17;
l9_179=l9_16.xyz;
}
#endif
float l9_287;
#if (SC_DEVICE_CLASS>=2)
{
l9_287=pow(l9_16.w,0.45454544);
}
#else
{
l9_287=sqrt(l9_16.w);
}
#endif
vec4 l9_288;
#if (ENABLE_SHEEN)
{
vec3 l9_289;
#if (ENABLE_SHEEN_COLOR_TEX)
{
vec2 l9_290=N3_getUV(Tweak_N32);
vec2 l9_291;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM)!=0))
{
l9_291=N3_uvTransform(l9_290,sheenColorTexture_offset,sheenColorTexture_scale,sheenColorTexture_rotation);
}
else
{
l9_291=l9_290;
}
vec4 l9_292;
#if (sheenColorTextureLayout==2)
{
bool l9_293=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sheenColorTexture)!=0));
float l9_294=l9_291.x;
sc_SoftwareWrapEarly(l9_294,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x);
float l9_295=l9_294;
float l9_296=l9_291.y;
sc_SoftwareWrapEarly(l9_296,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y);
float l9_297=l9_296;
vec2 l9_298;
float l9_299;
#if (SC_USE_UV_MIN_MAX_sheenColorTexture)
{
bool l9_300;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_300=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x==3;
}
#else
{
l9_300=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0);
}
#endif
float l9_301=l9_295;
float l9_302=1.0;
sc_ClampUV(l9_301,sheenColorTextureUvMinMax.x,sheenColorTextureUvMinMax.z,l9_300,l9_302);
float l9_303=l9_301;
float l9_304=l9_302;
bool l9_305;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_305=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y==3;
}
#else
{
l9_305=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0);
}
#endif
float l9_306=l9_297;
float l9_307=l9_304;
sc_ClampUV(l9_306,sheenColorTextureUvMinMax.y,sheenColorTextureUvMinMax.w,l9_305,l9_307);
l9_299=l9_307;
l9_298=vec2(l9_303,l9_306);
}
#else
{
l9_299=1.0;
l9_298=vec2(l9_295,l9_297);
}
#endif
vec2 l9_308=sc_TransformUV(l9_298,(int(SC_USE_UV_TRANSFORM_sheenColorTexture)!=0),sheenColorTextureTransform);
float l9_309=l9_308.x;
float l9_310=l9_299;
sc_SoftwareWrapLate(l9_309,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x,l9_293,l9_310);
float l9_311=l9_308.y;
float l9_312=l9_310;
sc_SoftwareWrapLate(l9_311,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y,l9_293,l9_312);
float l9_313=l9_312;
vec3 l9_314=sc_SamplingCoordsViewToGlobal(vec2(l9_309,l9_311),sheenColorTextureLayout,sheenColorTextureGetStereoViewIndex());
vec4 l9_315=texture(sheenColorTextureArrSC,l9_314,0.0);
vec4 l9_316;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_316=mix(sheenColorTextureBorderColor,l9_315,vec4(l9_313));
}
#else
{
l9_316=l9_315;
}
#endif
l9_292=l9_316;
}
#else
{
bool l9_317=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sheenColorTexture)!=0));
float l9_318=l9_291.x;
sc_SoftwareWrapEarly(l9_318,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x);
float l9_319=l9_318;
float l9_320=l9_291.y;
sc_SoftwareWrapEarly(l9_320,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y);
float l9_321=l9_320;
vec2 l9_322;
float l9_323;
#if (SC_USE_UV_MIN_MAX_sheenColorTexture)
{
bool l9_324;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_324=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x==3;
}
#else
{
l9_324=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0);
}
#endif
float l9_325=l9_319;
float l9_326=1.0;
sc_ClampUV(l9_325,sheenColorTextureUvMinMax.x,sheenColorTextureUvMinMax.z,l9_324,l9_326);
float l9_327=l9_325;
float l9_328=l9_326;
bool l9_329;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_329=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y==3;
}
#else
{
l9_329=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0);
}
#endif
float l9_330=l9_321;
float l9_331=l9_328;
sc_ClampUV(l9_330,sheenColorTextureUvMinMax.y,sheenColorTextureUvMinMax.w,l9_329,l9_331);
l9_323=l9_331;
l9_322=vec2(l9_327,l9_330);
}
#else
{
l9_323=1.0;
l9_322=vec2(l9_319,l9_321);
}
#endif
vec2 l9_332=sc_TransformUV(l9_322,(int(SC_USE_UV_TRANSFORM_sheenColorTexture)!=0),sheenColorTextureTransform);
float l9_333=l9_332.x;
float l9_334=l9_323;
sc_SoftwareWrapLate(l9_333,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x,l9_317,l9_334);
float l9_335=l9_332.y;
float l9_336=l9_334;
sc_SoftwareWrapLate(l9_335,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y,l9_317,l9_336);
float l9_337=l9_336;
vec3 l9_338=sc_SamplingCoordsViewToGlobal(vec2(l9_333,l9_335),sheenColorTextureLayout,sheenColorTextureGetStereoViewIndex());
vec4 l9_339=texture(sheenColorTexture,l9_338.xy,0.0);
vec4 l9_340;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_340=mix(sheenColorTextureBorderColor,l9_339,vec4(l9_337));
}
#else
{
l9_340=l9_339;
}
#endif
l9_292=l9_340;
}
#endif
l9_289=sheenColorFactor*ssSRGB_to_Linear(l9_292.xyz);
}
#else
{
l9_289=sheenColorFactor;
}
#endif
float l9_341;
#if (ENABLE_SHEEN_ROUGHNESS_TEX)
{
vec2 l9_342=N3_getUV(Tweak_N37);
vec2 l9_343;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM)!=0))
{
l9_343=N3_uvTransform(l9_342,sheenRoughnessTexture_offset,sheenRoughnessTexture_scale,sheenRoughnessTexture_rotation);
}
else
{
l9_343=l9_342;
}
vec4 l9_344;
#if (sheenRoughnessTextureLayout==2)
{
bool l9_345=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sheenRoughnessTexture)!=0));
float l9_346=l9_343.x;
sc_SoftwareWrapEarly(l9_346,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x);
float l9_347=l9_346;
float l9_348=l9_343.y;
sc_SoftwareWrapEarly(l9_348,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y);
float l9_349=l9_348;
vec2 l9_350;
float l9_351;
#if (SC_USE_UV_MIN_MAX_sheenRoughnessTexture)
{
bool l9_352;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_352=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x==3;
}
#else
{
l9_352=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0);
}
#endif
float l9_353=l9_347;
float l9_354=1.0;
sc_ClampUV(l9_353,sheenRoughnessTextureUvMinMax.x,sheenRoughnessTextureUvMinMax.z,l9_352,l9_354);
float l9_355=l9_353;
float l9_356=l9_354;
bool l9_357;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_357=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y==3;
}
#else
{
l9_357=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0);
}
#endif
float l9_358=l9_349;
float l9_359=l9_356;
sc_ClampUV(l9_358,sheenRoughnessTextureUvMinMax.y,sheenRoughnessTextureUvMinMax.w,l9_357,l9_359);
l9_351=l9_359;
l9_350=vec2(l9_355,l9_358);
}
#else
{
l9_351=1.0;
l9_350=vec2(l9_347,l9_349);
}
#endif
vec2 l9_360=sc_TransformUV(l9_350,(int(SC_USE_UV_TRANSFORM_sheenRoughnessTexture)!=0),sheenRoughnessTextureTransform);
float l9_361=l9_360.x;
float l9_362=l9_351;
sc_SoftwareWrapLate(l9_361,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x,l9_345,l9_362);
float l9_363=l9_360.y;
float l9_364=l9_362;
sc_SoftwareWrapLate(l9_363,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y,l9_345,l9_364);
float l9_365=l9_364;
vec3 l9_366=sc_SamplingCoordsViewToGlobal(vec2(l9_361,l9_363),sheenRoughnessTextureLayout,sheenRoughnessTextureGetStereoViewIndex());
vec4 l9_367=texture(sheenRoughnessTextureArrSC,l9_366,0.0);
vec4 l9_368;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_368=mix(sheenRoughnessTextureBorderColor,l9_367,vec4(l9_365));
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
bool l9_369=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sheenRoughnessTexture)!=0));
float l9_370=l9_343.x;
sc_SoftwareWrapEarly(l9_370,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x);
float l9_371=l9_370;
float l9_372=l9_343.y;
sc_SoftwareWrapEarly(l9_372,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y);
float l9_373=l9_372;
vec2 l9_374;
float l9_375;
#if (SC_USE_UV_MIN_MAX_sheenRoughnessTexture)
{
bool l9_376;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_376=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x==3;
}
#else
{
l9_376=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0);
}
#endif
float l9_377=l9_371;
float l9_378=1.0;
sc_ClampUV(l9_377,sheenRoughnessTextureUvMinMax.x,sheenRoughnessTextureUvMinMax.z,l9_376,l9_378);
float l9_379=l9_377;
float l9_380=l9_378;
bool l9_381;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_381=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y==3;
}
#else
{
l9_381=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0);
}
#endif
float l9_382=l9_373;
float l9_383=l9_380;
sc_ClampUV(l9_382,sheenRoughnessTextureUvMinMax.y,sheenRoughnessTextureUvMinMax.w,l9_381,l9_383);
l9_375=l9_383;
l9_374=vec2(l9_379,l9_382);
}
#else
{
l9_375=1.0;
l9_374=vec2(l9_371,l9_373);
}
#endif
vec2 l9_384=sc_TransformUV(l9_374,(int(SC_USE_UV_TRANSFORM_sheenRoughnessTexture)!=0),sheenRoughnessTextureTransform);
float l9_385=l9_384.x;
float l9_386=l9_375;
sc_SoftwareWrapLate(l9_385,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x,l9_369,l9_386);
float l9_387=l9_384.y;
float l9_388=l9_386;
sc_SoftwareWrapLate(l9_387,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y,l9_369,l9_388);
float l9_389=l9_388;
vec3 l9_390=sc_SamplingCoordsViewToGlobal(vec2(l9_385,l9_387),sheenRoughnessTextureLayout,sheenRoughnessTextureGetStereoViewIndex());
vec4 l9_391=texture(sheenRoughnessTexture,l9_390.xy,0.0);
vec4 l9_392;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_392=mix(sheenRoughnessTextureBorderColor,l9_391,vec4(l9_389));
}
#else
{
l9_392=l9_391;
}
#endif
l9_344=l9_392;
}
#endif
l9_341=sheenRoughnessFactor*ssSRGB_to_Linear(l9_344.w);
}
#else
{
l9_341=sheenRoughnessFactor;
}
#endif
float l9_393=max(l9_341,9.9999997e-05);
vec3 l9_394=tempGlobals.SurfacePosition_WorldSpace;
vec3 l9_395=normalize(sc_Camera.position-l9_394);
float l9_396=dot(l9_71,l9_395);
float l9_397=max(clamp(l9_396,0.0,1.0),9.9999997e-05);
float l9_398=l9_393*l9_393;
vec3 l9_399=reflect(-l9_395,l9_71);
vec3 l9_400=normalize(l9_399);
float l9_401=3.0+((((l9_393*4.0)-0.0)*2.0)/5.000001);
bool l9_402=l9_393<0.25;
float l9_403;
if (l9_402)
{
l9_403=(((-339.20001)*l9_398)+(161.39999*l9_393))-25.9;
}
else
{
l9_403=(((-8.4799995)*l9_398)+(14.3*l9_393))-9.9499998;
}
float l9_404;
if (l9_402)
{
l9_404=((44.0*l9_398)-(23.700001*l9_393))+3.26;
}
else
{
l9_404=((1.97*l9_398)-(3.27*l9_393))+0.72000003;
}
float l9_405=l9_403*l9_397;
float l9_406=l9_405+l9_404;
float l9_407;
if (l9_402)
{
l9_407=0.0;
}
else
{
l9_407=0.1*(l9_393-0.25);
}
float l9_408=exp(l9_406)+l9_407;
float l9_409=-l9_400.z;
float l9_410=l9_400.x;
vec2 l9_411=vec2((((l9_410<0.0) ? (-1.0) : 1.0)*acos(clamp(l9_409/length(vec2(l9_410,l9_409)),-1.0,1.0)))-1.5707964,acos(l9_400.y))/vec2(6.2831855,3.1415927);
float l9_412=l9_411.x+(sc_EnvmapRotation.y/360.0);
vec2 l9_413=vec2(l9_412,1.0-l9_411.y);
l9_413.x=fract((l9_412+floor(l9_412))+1.0);
vec4 l9_414;
#if (SC_DEVICE_CLASS>=2)
{
float l9_415=floor(l9_401);
float l9_416=ceil(l9_401);
l9_414=mix(sc_EnvmapSpecularSampleViewLevel(calcSeamlessPanoramicUvsForSampling(l9_413,sc_EnvmapSpecularSize.xy,l9_415),l9_415),sc_EnvmapSpecularSampleViewLevel(calcSeamlessPanoramicUvsForSampling(l9_413,sc_EnvmapSpecularSize.xy,l9_416),l9_416),vec4(l9_401-l9_415));
}
#else
{
l9_414=sc_EnvmapSpecularSampleViewLevel(l9_413,l9_401);
}
#endif
vec3 l9_417=(((l9_414.xyz*(1.0/l9_414.w))*sc_EnvmapExposure)+vec3(1e-06))*l9_289;
vec3 l9_418=(vec3(0.0)+(l9_417*clamp(l9_408*3.1415927,0.0,1.0))).xyz;
vec3 l9_419;
if (sc_DirectionalLightsCount>0)
{
vec3 l9_420;
l9_420=vec3(0.0);
vec3 l9_421;
int l9_422=0;
bool l9_423;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
l9_423=l9_422<sc_DirectionalLightsCount;
if (l9_423)
{
vec3 l9_424;
if (l9_423)
{
l9_424=sc_DirectionalLights[l9_422].color.xyz;
}
else
{
l9_424=vec3(0.0);
}
float l9_425;
if (l9_423)
{
l9_425=sc_DirectionalLights[l9_422].color.w;
}
else
{
l9_425=0.0;
}
vec3 l9_426=l9_424*l9_425;
vec3 l9_427;
if (l9_423)
{
l9_427=-sc_DirectionalLights[l9_422].direction;
}
else
{
l9_427=vec3(0.0);
}
vec3 l9_428=normalize(-l9_427);
float l9_429=clamp(dot(l9_71,l9_428),0.0,1.0);
l9_421=l9_420+(((((l9_426*3.1415901)*l9_289)*N3_charlieD(l9_398,clamp(dot(l9_71,normalize(l9_428+l9_395)),0.0,1.0)))*(1.0/(4.0*((l9_429+l9_397)-(l9_429*l9_397)))))*l9_429);
l9_420=l9_421;
l9_422++;
continue;
}
else
{
break;
}
}
l9_419=l9_420;
}
else
{
l9_419=vec3(0.0);
}
vec3 l9_430;
if (sc_PointLightsCount>0)
{
vec3 l9_431;
l9_431=l9_419;
vec3 l9_432;
int l9_433=0;
bool l9_434;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
l9_434=l9_433<sc_PointLightsCount;
if (l9_434)
{
vec3 l9_435;
if (l9_434)
{
l9_435=sc_PointLights[l9_433].color.xyz;
}
else
{
l9_435=vec3(0.0);
}
float l9_436;
if (l9_434)
{
l9_436=sc_PointLights[l9_433].color.w;
}
else
{
l9_436=0.0;
}
vec3 l9_437=l9_435*l9_436;
vec3 l9_438;
if (l9_434)
{
l9_438=sc_PointLights[l9_433].position;
}
else
{
l9_438=vec3(0.0);
}
vec3 l9_439=normalize(l9_438-tempGlobals.SurfacePosition_WorldSpace);
float l9_440=clamp(dot(l9_71,l9_439),0.0,1.0);
l9_432=l9_431+(((((l9_437*3.1415901)*l9_289)*N3_charlieD(l9_398,clamp(dot(l9_71,normalize(l9_439+l9_395)),0.0,1.0)))*(1.0/(4.0*((l9_440+l9_397)-(l9_440*l9_397)))))*l9_440);
l9_431=l9_432;
l9_433++;
continue;
}
else
{
break;
}
}
l9_430=l9_431;
}
else
{
l9_430=l9_419;
}
vec3 l9_441;
if (sc_AmbientLightsCount>0)
{
vec3 l9_442;
l9_442=l9_430;
vec3 l9_443;
int l9_444=0;
bool l9_445;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
l9_445=l9_444<sc_AmbientLightsCount;
if (l9_445)
{
vec3 l9_446;
if (l9_445)
{
l9_446=sc_AmbientLights[l9_444].color;
}
else
{
l9_446=vec3(0.0);
}
float l9_447;
if (l9_445)
{
l9_447=sc_AmbientLights[l9_444].intensity;
}
else
{
l9_447=0.0;
}
l9_443=l9_442+(((l9_446*l9_447)/vec3(3.1415901))*l9_289);
l9_442=l9_443;
l9_444++;
continue;
}
else
{
break;
}
}
l9_441=l9_442;
}
else
{
l9_441=l9_430;
}
vec3 l9_448=mix(l9_418,l9_418*l9_124.xyz,vec3(l9_124.w)).xyz+l9_441;
vec4 l9_449=vec4(l9_448.x,l9_448.y,l9_448.z,vec4(0.0).w);
l9_449.w=1.0-(max(max(l9_289.x,l9_289.y),l9_289.z)*0.15700001);
l9_288=l9_449;
}
#else
{
l9_288=vec4(0.0);
}
#endif
float l9_450;
vec3 l9_451;
float l9_452;
#if (ENABLE_CLEARCOAT)
{
float l9_453;
#if (ENABLE_CLEARCOAT_TEX)
{
vec2 l9_454=N3_getUV(Tweak_N44);
vec2 l9_455;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_CLEARCOAT_TEXTURE_TRANSFORM)!=0))
{
l9_455=N3_uvTransform(l9_454,clearcoatTexture_offset,clearcoatTexture_scale,clearcoatTexture_rotation);
}
else
{
l9_455=l9_454;
}
vec4 l9_456;
#if (clearcoatTextureLayout==2)
{
bool l9_457=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatTexture)!=0));
float l9_458=l9_455.x;
sc_SoftwareWrapEarly(l9_458,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x);
float l9_459=l9_458;
float l9_460=l9_455.y;
sc_SoftwareWrapEarly(l9_460,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y);
float l9_461=l9_460;
vec2 l9_462;
float l9_463;
#if (SC_USE_UV_MIN_MAX_clearcoatTexture)
{
bool l9_464;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_464=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x==3;
}
#else
{
l9_464=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0);
}
#endif
float l9_465=l9_459;
float l9_466=1.0;
sc_ClampUV(l9_465,clearcoatTextureUvMinMax.x,clearcoatTextureUvMinMax.z,l9_464,l9_466);
float l9_467=l9_465;
float l9_468=l9_466;
bool l9_469;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_469=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y==3;
}
#else
{
l9_469=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0);
}
#endif
float l9_470=l9_461;
float l9_471=l9_468;
sc_ClampUV(l9_470,clearcoatTextureUvMinMax.y,clearcoatTextureUvMinMax.w,l9_469,l9_471);
l9_463=l9_471;
l9_462=vec2(l9_467,l9_470);
}
#else
{
l9_463=1.0;
l9_462=vec2(l9_459,l9_461);
}
#endif
vec2 l9_472=sc_TransformUV(l9_462,(int(SC_USE_UV_TRANSFORM_clearcoatTexture)!=0),clearcoatTextureTransform);
float l9_473=l9_472.x;
float l9_474=l9_463;
sc_SoftwareWrapLate(l9_473,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x,l9_457,l9_474);
float l9_475=l9_472.y;
float l9_476=l9_474;
sc_SoftwareWrapLate(l9_475,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y,l9_457,l9_476);
float l9_477=l9_476;
vec3 l9_478=sc_SamplingCoordsViewToGlobal(vec2(l9_473,l9_475),clearcoatTextureLayout,clearcoatTextureGetStereoViewIndex());
vec4 l9_479=texture(clearcoatTextureArrSC,l9_478,0.0);
vec4 l9_480;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_480=mix(clearcoatTextureBorderColor,l9_479,vec4(l9_477));
}
#else
{
l9_480=l9_479;
}
#endif
l9_456=l9_480;
}
#else
{
bool l9_481=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatTexture)!=0));
float l9_482=l9_455.x;
sc_SoftwareWrapEarly(l9_482,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x);
float l9_483=l9_482;
float l9_484=l9_455.y;
sc_SoftwareWrapEarly(l9_484,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y);
float l9_485=l9_484;
vec2 l9_486;
float l9_487;
#if (SC_USE_UV_MIN_MAX_clearcoatTexture)
{
bool l9_488;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_488=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x==3;
}
#else
{
l9_488=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0);
}
#endif
float l9_489=l9_483;
float l9_490=1.0;
sc_ClampUV(l9_489,clearcoatTextureUvMinMax.x,clearcoatTextureUvMinMax.z,l9_488,l9_490);
float l9_491=l9_489;
float l9_492=l9_490;
bool l9_493;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_493=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y==3;
}
#else
{
l9_493=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0);
}
#endif
float l9_494=l9_485;
float l9_495=l9_492;
sc_ClampUV(l9_494,clearcoatTextureUvMinMax.y,clearcoatTextureUvMinMax.w,l9_493,l9_495);
l9_487=l9_495;
l9_486=vec2(l9_491,l9_494);
}
#else
{
l9_487=1.0;
l9_486=vec2(l9_483,l9_485);
}
#endif
vec2 l9_496=sc_TransformUV(l9_486,(int(SC_USE_UV_TRANSFORM_clearcoatTexture)!=0),clearcoatTextureTransform);
float l9_497=l9_496.x;
float l9_498=l9_487;
sc_SoftwareWrapLate(l9_497,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x,l9_481,l9_498);
float l9_499=l9_496.y;
float l9_500=l9_498;
sc_SoftwareWrapLate(l9_499,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y,l9_481,l9_500);
float l9_501=l9_500;
vec3 l9_502=sc_SamplingCoordsViewToGlobal(vec2(l9_497,l9_499),clearcoatTextureLayout,clearcoatTextureGetStereoViewIndex());
vec4 l9_503=texture(clearcoatTexture,l9_502.xy,0.0);
vec4 l9_504;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_504=mix(clearcoatTextureBorderColor,l9_503,vec4(l9_501));
}
#else
{
l9_504=l9_503;
}
#endif
l9_456=l9_504;
}
#endif
l9_453=ssSRGB_to_Linear(l9_456.x);
}
#else
{
l9_453=1.0;
}
#endif
float l9_505=l9_453*clearcoatFactor;
float l9_506;
#if (ENABLE_CLEARCOAT_ROUGHNESS_TEX)
{
vec2 l9_507=N3_getUV(Tweak_N60);
vec2 l9_508;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM)!=0))
{
l9_508=N3_uvTransform(l9_507,clearcoatRoughnessTexture_offset,clearcoatRoughnessTexture_scale,clearcoatRoughnessTexture_rotation);
}
else
{
l9_508=l9_507;
}
vec4 l9_509;
#if (clearcoatRoughnessTextureLayout==2)
{
bool l9_510=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture)!=0));
float l9_511=l9_508.x;
sc_SoftwareWrapEarly(l9_511,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x);
float l9_512=l9_511;
float l9_513=l9_508.y;
sc_SoftwareWrapEarly(l9_513,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y);
float l9_514=l9_513;
vec2 l9_515;
float l9_516;
#if (SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture)
{
bool l9_517;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_517=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x==3;
}
#else
{
l9_517=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0);
}
#endif
float l9_518=l9_512;
float l9_519=1.0;
sc_ClampUV(l9_518,clearcoatRoughnessTextureUvMinMax.x,clearcoatRoughnessTextureUvMinMax.z,l9_517,l9_519);
float l9_520=l9_518;
float l9_521=l9_519;
bool l9_522;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_522=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y==3;
}
#else
{
l9_522=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0);
}
#endif
float l9_523=l9_514;
float l9_524=l9_521;
sc_ClampUV(l9_523,clearcoatRoughnessTextureUvMinMax.y,clearcoatRoughnessTextureUvMinMax.w,l9_522,l9_524);
l9_516=l9_524;
l9_515=vec2(l9_520,l9_523);
}
#else
{
l9_516=1.0;
l9_515=vec2(l9_512,l9_514);
}
#endif
vec2 l9_525=sc_TransformUV(l9_515,(int(SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture)!=0),clearcoatRoughnessTextureTransform);
float l9_526=l9_525.x;
float l9_527=l9_516;
sc_SoftwareWrapLate(l9_526,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x,l9_510,l9_527);
float l9_528=l9_525.y;
float l9_529=l9_527;
sc_SoftwareWrapLate(l9_528,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y,l9_510,l9_529);
float l9_530=l9_529;
vec3 l9_531=sc_SamplingCoordsViewToGlobal(vec2(l9_526,l9_528),clearcoatRoughnessTextureLayout,clearcoatRoughnessTextureGetStereoViewIndex());
vec4 l9_532=texture(clearcoatRoughnessTextureArrSC,l9_531,0.0);
vec4 l9_533;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_533=mix(clearcoatRoughnessTextureBorderColor,l9_532,vec4(l9_530));
}
#else
{
l9_533=l9_532;
}
#endif
l9_509=l9_533;
}
#else
{
bool l9_534=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture)!=0));
float l9_535=l9_508.x;
sc_SoftwareWrapEarly(l9_535,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x);
float l9_536=l9_535;
float l9_537=l9_508.y;
sc_SoftwareWrapEarly(l9_537,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y);
float l9_538=l9_537;
vec2 l9_539;
float l9_540;
#if (SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture)
{
bool l9_541;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_541=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x==3;
}
#else
{
l9_541=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0);
}
#endif
float l9_542=l9_536;
float l9_543=1.0;
sc_ClampUV(l9_542,clearcoatRoughnessTextureUvMinMax.x,clearcoatRoughnessTextureUvMinMax.z,l9_541,l9_543);
float l9_544=l9_542;
float l9_545=l9_543;
bool l9_546;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_546=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y==3;
}
#else
{
l9_546=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0);
}
#endif
float l9_547=l9_538;
float l9_548=l9_545;
sc_ClampUV(l9_547,clearcoatRoughnessTextureUvMinMax.y,clearcoatRoughnessTextureUvMinMax.w,l9_546,l9_548);
l9_540=l9_548;
l9_539=vec2(l9_544,l9_547);
}
#else
{
l9_540=1.0;
l9_539=vec2(l9_536,l9_538);
}
#endif
vec2 l9_549=sc_TransformUV(l9_539,(int(SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture)!=0),clearcoatRoughnessTextureTransform);
float l9_550=l9_549.x;
float l9_551=l9_540;
sc_SoftwareWrapLate(l9_550,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x,l9_534,l9_551);
float l9_552=l9_549.y;
float l9_553=l9_551;
sc_SoftwareWrapLate(l9_552,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y,l9_534,l9_553);
float l9_554=l9_553;
vec3 l9_555=sc_SamplingCoordsViewToGlobal(vec2(l9_550,l9_552),clearcoatRoughnessTextureLayout,clearcoatRoughnessTextureGetStereoViewIndex());
vec4 l9_556=texture(clearcoatRoughnessTexture,l9_555.xy,0.0);
vec4 l9_557;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_557=mix(clearcoatRoughnessTextureBorderColor,l9_556,vec4(l9_554));
}
#else
{
l9_557=l9_556;
}
#endif
l9_509=l9_557;
}
#endif
l9_506=ssSRGB_to_Linear(l9_509.y);
}
#else
{
l9_506=1.0;
}
#endif
float l9_558=l9_506*clearcoatRoughnessFactor;
vec3 l9_559;
#if (ENABLE_CLEARCOAT_NORMAL_TEX)
{
vec2 l9_560=N3_getUV(Tweak_N47);
vec2 l9_561;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM)!=0))
{
l9_561=N3_uvTransform(l9_560,clearcoatNormalTexture_offset,clearcoatNormalTexture_scale,clearcoatNormalTexture_rotation);
}
else
{
l9_561=l9_560;
}
vec4 l9_562;
#if (clearcoatNormalTextureLayout==2)
{
bool l9_563=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatNormalTexture)!=0));
float l9_564=l9_561.x;
sc_SoftwareWrapEarly(l9_564,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x);
float l9_565=l9_564;
float l9_566=l9_561.y;
sc_SoftwareWrapEarly(l9_566,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y);
float l9_567=l9_566;
vec2 l9_568;
float l9_569;
#if (SC_USE_UV_MIN_MAX_clearcoatNormalTexture)
{
bool l9_570;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_570=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x==3;
}
#else
{
l9_570=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0);
}
#endif
float l9_571=l9_565;
float l9_572=1.0;
sc_ClampUV(l9_571,clearcoatNormalTextureUvMinMax.x,clearcoatNormalTextureUvMinMax.z,l9_570,l9_572);
float l9_573=l9_571;
float l9_574=l9_572;
bool l9_575;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_575=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y==3;
}
#else
{
l9_575=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0);
}
#endif
float l9_576=l9_567;
float l9_577=l9_574;
sc_ClampUV(l9_576,clearcoatNormalTextureUvMinMax.y,clearcoatNormalTextureUvMinMax.w,l9_575,l9_577);
l9_569=l9_577;
l9_568=vec2(l9_573,l9_576);
}
#else
{
l9_569=1.0;
l9_568=vec2(l9_565,l9_567);
}
#endif
vec2 l9_578=sc_TransformUV(l9_568,(int(SC_USE_UV_TRANSFORM_clearcoatNormalTexture)!=0),clearcoatNormalTextureTransform);
float l9_579=l9_578.x;
float l9_580=l9_569;
sc_SoftwareWrapLate(l9_579,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x,l9_563,l9_580);
float l9_581=l9_578.y;
float l9_582=l9_580;
sc_SoftwareWrapLate(l9_581,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y,l9_563,l9_582);
float l9_583=l9_582;
vec3 l9_584=sc_SamplingCoordsViewToGlobal(vec2(l9_579,l9_581),clearcoatNormalTextureLayout,clearcoatNormalTextureGetStereoViewIndex());
vec4 l9_585=texture(clearcoatNormalTextureArrSC,l9_584,0.0);
vec4 l9_586;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_586=mix(clearcoatNormalTextureBorderColor,l9_585,vec4(l9_583));
}
#else
{
l9_586=l9_585;
}
#endif
l9_562=l9_586;
}
#else
{
bool l9_587=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatNormalTexture)!=0));
float l9_588=l9_561.x;
sc_SoftwareWrapEarly(l9_588,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x);
float l9_589=l9_588;
float l9_590=l9_561.y;
sc_SoftwareWrapEarly(l9_590,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y);
float l9_591=l9_590;
vec2 l9_592;
float l9_593;
#if (SC_USE_UV_MIN_MAX_clearcoatNormalTexture)
{
bool l9_594;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_594=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x==3;
}
#else
{
l9_594=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0);
}
#endif
float l9_595=l9_589;
float l9_596=1.0;
sc_ClampUV(l9_595,clearcoatNormalTextureUvMinMax.x,clearcoatNormalTextureUvMinMax.z,l9_594,l9_596);
float l9_597=l9_595;
float l9_598=l9_596;
bool l9_599;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_599=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y==3;
}
#else
{
l9_599=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0);
}
#endif
float l9_600=l9_591;
float l9_601=l9_598;
sc_ClampUV(l9_600,clearcoatNormalTextureUvMinMax.y,clearcoatNormalTextureUvMinMax.w,l9_599,l9_601);
l9_593=l9_601;
l9_592=vec2(l9_597,l9_600);
}
#else
{
l9_593=1.0;
l9_592=vec2(l9_589,l9_591);
}
#endif
vec2 l9_602=sc_TransformUV(l9_592,(int(SC_USE_UV_TRANSFORM_clearcoatNormalTexture)!=0),clearcoatNormalTextureTransform);
float l9_603=l9_602.x;
float l9_604=l9_593;
sc_SoftwareWrapLate(l9_603,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x,l9_587,l9_604);
float l9_605=l9_602.y;
float l9_606=l9_604;
sc_SoftwareWrapLate(l9_605,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y,l9_587,l9_606);
float l9_607=l9_606;
vec3 l9_608=sc_SamplingCoordsViewToGlobal(vec2(l9_603,l9_605),clearcoatNormalTextureLayout,clearcoatNormalTextureGetStereoViewIndex());
vec4 l9_609=texture(clearcoatNormalTexture,l9_608.xy,0.0);
vec4 l9_610;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_610=mix(clearcoatNormalTextureBorderColor,l9_609,vec4(l9_607));
}
#else
{
l9_610=l9_609;
}
#endif
l9_562=l9_610;
}
#endif
l9_559=l9_562.xyz*0.9921875;
}
#else
{
l9_559=vec3(0.0,0.0,1.0);
}
#endif
l9_452=l9_558;
l9_451=l9_559;
l9_450=l9_505;
}
#else
{
l9_452=0.0;
l9_451=vec3(0.0);
l9_450=0.0;
}
#endif
vec3 l9_611;
#if (!sc_ProjectiveShadowsCaster)
{
l9_611=l9_71;
}
#else
{
l9_611=vec3(0.0);
}
#endif
ngsAlphaTest(clamp(l9_287,0.0,1.0));
sc_WriteReceiverDataEx(varPos,l9_611,l9_125,0u);
vec3 l9_612;
#if (!sc_ProjectiveShadowsCaster)
{
l9_612=mat3(l9_1,l9_2,l9_0)*l9_451;
}
#else
{
l9_612=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N405);
sc_WriteReceiverDataEx(varPos,l9_612,l9_452,0u);
tempGlobals=l9_6;
if (((int(ENABLE_SHEEN)!=0)||(int(ENABLE_TRANSMISSION)!=0))||(int(ENABLE_CLEARCOAT)!=0))
{
vec4 l9_613=ssSRGB_to_Linear(vec4(0.0));
vec4 l9_614;
#if (ENABLE_SHEEN)
{
vec3 l9_615=(l9_613.xyz*l9_288.w)+l9_288.xyz;
l9_614=vec4(l9_615.x,l9_615.y,l9_615.z,l9_613.w);
}
#else
{
l9_614=l9_613;
}
#endif
vec4 l9_616;
#if (ENABLE_TRANSMISSION)
{
vec4 l9_617=mix(vec4(l9_181,1.0),l9_614,vec4(ssSRGB_to_Linear(l9_287)));
l9_617.w=1.0;
l9_616=l9_617;
}
#else
{
l9_616=l9_614;
}
#endif
vec4 l9_618;
#if (ENABLE_CLEARCOAT)
{
vec3 l9_619=l9_616.xyz+(ssSRGB_to_Linear(vec4(0.0))*l9_450).xyz;
l9_618=vec4(l9_619.x,l9_619.y,l9_619.z,l9_616.w);
}
#else
{
l9_618=l9_616;
}
#endif
}
}
#else
{
float l9_620;
Node40_Bool_Parameter(l9_620,l9_6);
float l9_621;
Node121_Bool_Parameter(l9_621,l9_6);
float l9_622;
Node48_Bool_Parameter(l9_622,l9_6);
float l9_623;
Node88_Bool_Parameter(l9_623,l9_6);
tempGlobals=l9_6;
vec4 l9_624;
#if (ENABLE_BASE_TEX)
{
vec2 l9_625=N35_getUV(NODE_7_DROPLIST_ITEM);
vec2 l9_626;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_BASE_TEXTURE_TRANSFORM)!=0))
{
l9_626=N35_uvTransform(l9_625,baseColorTexture_offset,baseColorTexture_scale,baseColorTexture_rotation);
}
else
{
l9_626=l9_625;
}
l9_624=baseColorFactor*ssSRGB_to_Linear(N35_BaseTexture_sample(l9_626));
}
#else
{
l9_624=baseColorFactor;
}
#endif
vec4 l9_627;
#if (ENABLE_VERTEX_COLOR_BASE)
{
l9_627=l9_624*tempGlobals.VertexColor;
}
#else
{
l9_627=l9_624;
}
#endif
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
vec3 SurfacePosition_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexTangent_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
vec2 Surface_UVCoord1;
vec2 gScreenCoord;
vec4 VertexColor;
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
#ifndef emissiveTextureHasSwappedViews
#define emissiveTextureHasSwappedViews 0
#elif emissiveTextureHasSwappedViews==1
#undef emissiveTextureHasSwappedViews
#define emissiveTextureHasSwappedViews 1
#endif
#ifndef emissiveTextureLayout
#define emissiveTextureLayout 0
#endif
#ifndef normalTextureHasSwappedViews
#define normalTextureHasSwappedViews 0
#elif normalTextureHasSwappedViews==1
#undef normalTextureHasSwappedViews
#define normalTextureHasSwappedViews 1
#endif
#ifndef normalTextureLayout
#define normalTextureLayout 0
#endif
#ifndef metallicRoughnessTextureHasSwappedViews
#define metallicRoughnessTextureHasSwappedViews 0
#elif metallicRoughnessTextureHasSwappedViews==1
#undef metallicRoughnessTextureHasSwappedViews
#define metallicRoughnessTextureHasSwappedViews 1
#endif
#ifndef metallicRoughnessTextureLayout
#define metallicRoughnessTextureLayout 0
#endif
#ifndef transmissionTextureHasSwappedViews
#define transmissionTextureHasSwappedViews 0
#elif transmissionTextureHasSwappedViews==1
#undef transmissionTextureHasSwappedViews
#define transmissionTextureHasSwappedViews 1
#endif
#ifndef transmissionTextureLayout
#define transmissionTextureLayout 0
#endif
#ifndef screenTextureHasSwappedViews
#define screenTextureHasSwappedViews 0
#elif screenTextureHasSwappedViews==1
#undef screenTextureHasSwappedViews
#define screenTextureHasSwappedViews 1
#endif
#ifndef screenTextureLayout
#define screenTextureLayout 0
#endif
#ifndef sheenColorTextureHasSwappedViews
#define sheenColorTextureHasSwappedViews 0
#elif sheenColorTextureHasSwappedViews==1
#undef sheenColorTextureHasSwappedViews
#define sheenColorTextureHasSwappedViews 1
#endif
#ifndef sheenColorTextureLayout
#define sheenColorTextureLayout 0
#endif
#ifndef sheenRoughnessTextureHasSwappedViews
#define sheenRoughnessTextureHasSwappedViews 0
#elif sheenRoughnessTextureHasSwappedViews==1
#undef sheenRoughnessTextureHasSwappedViews
#define sheenRoughnessTextureHasSwappedViews 1
#endif
#ifndef sheenRoughnessTextureLayout
#define sheenRoughnessTextureLayout 0
#endif
#ifndef clearcoatTextureHasSwappedViews
#define clearcoatTextureHasSwappedViews 0
#elif clearcoatTextureHasSwappedViews==1
#undef clearcoatTextureHasSwappedViews
#define clearcoatTextureHasSwappedViews 1
#endif
#ifndef clearcoatTextureLayout
#define clearcoatTextureLayout 0
#endif
#ifndef clearcoatRoughnessTextureHasSwappedViews
#define clearcoatRoughnessTextureHasSwappedViews 0
#elif clearcoatRoughnessTextureHasSwappedViews==1
#undef clearcoatRoughnessTextureHasSwappedViews
#define clearcoatRoughnessTextureHasSwappedViews 1
#endif
#ifndef clearcoatRoughnessTextureLayout
#define clearcoatRoughnessTextureLayout 0
#endif
#ifndef clearcoatNormalTextureHasSwappedViews
#define clearcoatNormalTextureHasSwappedViews 0
#elif clearcoatNormalTextureHasSwappedViews==1
#undef clearcoatNormalTextureHasSwappedViews
#define clearcoatNormalTextureHasSwappedViews 1
#endif
#ifndef clearcoatNormalTextureLayout
#define clearcoatNormalTextureLayout 0
#endif
#ifndef baseColorTextureHasSwappedViews
#define baseColorTextureHasSwappedViews 0
#elif baseColorTextureHasSwappedViews==1
#undef baseColorTextureHasSwappedViews
#define baseColorTextureHasSwappedViews 1
#endif
#ifndef baseColorTextureLayout
#define baseColorTextureLayout 0
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
#ifndef ENABLE_GLTF_LIGHTING
#define ENABLE_GLTF_LIGHTING 0
#elif ENABLE_GLTF_LIGHTING==1
#undef ENABLE_GLTF_LIGHTING
#define ENABLE_GLTF_LIGHTING 1
#endif
#ifndef ENABLE_TRANSMISSION
#define ENABLE_TRANSMISSION 0
#elif ENABLE_TRANSMISSION==1
#undef ENABLE_TRANSMISSION
#define ENABLE_TRANSMISSION 1
#endif
#ifndef ENABLE_SHEEN
#define ENABLE_SHEEN 0
#elif ENABLE_SHEEN==1
#undef ENABLE_SHEEN
#define ENABLE_SHEEN 1
#endif
#ifndef ENABLE_CLEARCOAT
#define ENABLE_CLEARCOAT 0
#elif ENABLE_CLEARCOAT==1
#undef ENABLE_CLEARCOAT
#define ENABLE_CLEARCOAT 1
#endif
#ifndef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 0
#elif ENABLE_EMISSIVE==1
#undef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_emissiveTexture
#define SC_USE_UV_TRANSFORM_emissiveTexture 0
#elif SC_USE_UV_TRANSFORM_emissiveTexture==1
#undef SC_USE_UV_TRANSFORM_emissiveTexture
#define SC_USE_UV_TRANSFORM_emissiveTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_emissiveTexture
#define SC_SOFTWARE_WRAP_MODE_U_emissiveTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_emissiveTexture
#define SC_SOFTWARE_WRAP_MODE_V_emissiveTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_emissiveTexture
#define SC_USE_UV_MIN_MAX_emissiveTexture 0
#elif SC_USE_UV_MIN_MAX_emissiveTexture==1
#undef SC_USE_UV_MIN_MAX_emissiveTexture
#define SC_USE_UV_MIN_MAX_emissiveTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_emissiveTexture
#define SC_USE_CLAMP_TO_BORDER_emissiveTexture 0
#elif SC_USE_CLAMP_TO_BORDER_emissiveTexture==1
#undef SC_USE_CLAMP_TO_BORDER_emissiveTexture
#define SC_USE_CLAMP_TO_BORDER_emissiveTexture 1
#endif
#ifndef NODE_10_DROPLIST_ITEM
#define NODE_10_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 0
#elif ENABLE_NORMALMAP==1
#undef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 1
#endif
#ifndef SC_USE_UV_TRANSFORM_normalTexture
#define SC_USE_UV_TRANSFORM_normalTexture 0
#elif SC_USE_UV_TRANSFORM_normalTexture==1
#undef SC_USE_UV_TRANSFORM_normalTexture
#define SC_USE_UV_TRANSFORM_normalTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_normalTexture
#define SC_SOFTWARE_WRAP_MODE_U_normalTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_normalTexture
#define SC_SOFTWARE_WRAP_MODE_V_normalTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_normalTexture
#define SC_USE_UV_MIN_MAX_normalTexture 0
#elif SC_USE_UV_MIN_MAX_normalTexture==1
#undef SC_USE_UV_MIN_MAX_normalTexture
#define SC_USE_UV_MIN_MAX_normalTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_normalTexture
#define SC_USE_CLAMP_TO_BORDER_normalTexture 0
#elif SC_USE_CLAMP_TO_BORDER_normalTexture==1
#undef SC_USE_CLAMP_TO_BORDER_normalTexture
#define SC_USE_CLAMP_TO_BORDER_normalTexture 1
#endif
#ifndef NODE_8_DROPLIST_ITEM
#define NODE_8_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_METALLIC_ROUGHNESS_TEX
#define ENABLE_METALLIC_ROUGHNESS_TEX 0
#elif ENABLE_METALLIC_ROUGHNESS_TEX==1
#undef ENABLE_METALLIC_ROUGHNESS_TEX
#define ENABLE_METALLIC_ROUGHNESS_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_metallicRoughnessTexture
#define SC_USE_UV_TRANSFORM_metallicRoughnessTexture 0
#elif SC_USE_UV_TRANSFORM_metallicRoughnessTexture==1
#undef SC_USE_UV_TRANSFORM_metallicRoughnessTexture
#define SC_USE_UV_TRANSFORM_metallicRoughnessTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_metallicRoughnessTexture
#define SC_USE_UV_MIN_MAX_metallicRoughnessTexture 0
#elif SC_USE_UV_MIN_MAX_metallicRoughnessTexture==1
#undef SC_USE_UV_MIN_MAX_metallicRoughnessTexture
#define SC_USE_UV_MIN_MAX_metallicRoughnessTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture 0
#elif SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture==1
#undef SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture 1
#endif
#ifndef NODE_11_DROPLIST_ITEM
#define NODE_11_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_TRANSMISSION_TEX
#define ENABLE_TRANSMISSION_TEX 0
#elif ENABLE_TRANSMISSION_TEX==1
#undef ENABLE_TRANSMISSION_TEX
#define ENABLE_TRANSMISSION_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_transmissionTexture
#define SC_USE_UV_TRANSFORM_transmissionTexture 0
#elif SC_USE_UV_TRANSFORM_transmissionTexture==1
#undef SC_USE_UV_TRANSFORM_transmissionTexture
#define SC_USE_UV_TRANSFORM_transmissionTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_transmissionTexture
#define SC_SOFTWARE_WRAP_MODE_U_transmissionTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_transmissionTexture
#define SC_SOFTWARE_WRAP_MODE_V_transmissionTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_transmissionTexture
#define SC_USE_UV_MIN_MAX_transmissionTexture 0
#elif SC_USE_UV_MIN_MAX_transmissionTexture==1
#undef SC_USE_UV_MIN_MAX_transmissionTexture
#define SC_USE_UV_MIN_MAX_transmissionTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_transmissionTexture
#define SC_USE_CLAMP_TO_BORDER_transmissionTexture 0
#elif SC_USE_CLAMP_TO_BORDER_transmissionTexture==1
#undef SC_USE_CLAMP_TO_BORDER_transmissionTexture
#define SC_USE_CLAMP_TO_BORDER_transmissionTexture 1
#endif
#ifndef Tweak_N30
#define Tweak_N30 0
#endif
#ifndef SC_USE_UV_TRANSFORM_screenTexture
#define SC_USE_UV_TRANSFORM_screenTexture 0
#elif SC_USE_UV_TRANSFORM_screenTexture==1
#undef SC_USE_UV_TRANSFORM_screenTexture
#define SC_USE_UV_TRANSFORM_screenTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_screenTexture
#define SC_SOFTWARE_WRAP_MODE_U_screenTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_screenTexture
#define SC_SOFTWARE_WRAP_MODE_V_screenTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_screenTexture
#define SC_USE_UV_MIN_MAX_screenTexture 0
#elif SC_USE_UV_MIN_MAX_screenTexture==1
#undef SC_USE_UV_MIN_MAX_screenTexture
#define SC_USE_UV_MIN_MAX_screenTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_screenTexture
#define SC_USE_CLAMP_TO_BORDER_screenTexture 0
#elif SC_USE_CLAMP_TO_BORDER_screenTexture==1
#undef SC_USE_CLAMP_TO_BORDER_screenTexture
#define SC_USE_CLAMP_TO_BORDER_screenTexture 1
#endif
#ifndef ENABLE_SHEEN_COLOR_TEX
#define ENABLE_SHEEN_COLOR_TEX 0
#elif ENABLE_SHEEN_COLOR_TEX==1
#undef ENABLE_SHEEN_COLOR_TEX
#define ENABLE_SHEEN_COLOR_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sheenColorTexture
#define SC_USE_UV_TRANSFORM_sheenColorTexture 0
#elif SC_USE_UV_TRANSFORM_sheenColorTexture==1
#undef SC_USE_UV_TRANSFORM_sheenColorTexture
#define SC_USE_UV_TRANSFORM_sheenColorTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture
#define SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture
#define SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sheenColorTexture
#define SC_USE_UV_MIN_MAX_sheenColorTexture 0
#elif SC_USE_UV_MIN_MAX_sheenColorTexture==1
#undef SC_USE_UV_MIN_MAX_sheenColorTexture
#define SC_USE_UV_MIN_MAX_sheenColorTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sheenColorTexture
#define SC_USE_CLAMP_TO_BORDER_sheenColorTexture 0
#elif SC_USE_CLAMP_TO_BORDER_sheenColorTexture==1
#undef SC_USE_CLAMP_TO_BORDER_sheenColorTexture
#define SC_USE_CLAMP_TO_BORDER_sheenColorTexture 1
#endif
#ifndef Tweak_N32
#define Tweak_N32 0
#endif
#ifndef ENABLE_SHEEN_ROUGHNESS_TEX
#define ENABLE_SHEEN_ROUGHNESS_TEX 0
#elif ENABLE_SHEEN_ROUGHNESS_TEX==1
#undef ENABLE_SHEEN_ROUGHNESS_TEX
#define ENABLE_SHEEN_ROUGHNESS_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sheenRoughnessTexture
#define SC_USE_UV_TRANSFORM_sheenRoughnessTexture 0
#elif SC_USE_UV_TRANSFORM_sheenRoughnessTexture==1
#undef SC_USE_UV_TRANSFORM_sheenRoughnessTexture
#define SC_USE_UV_TRANSFORM_sheenRoughnessTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sheenRoughnessTexture
#define SC_USE_UV_MIN_MAX_sheenRoughnessTexture 0
#elif SC_USE_UV_MIN_MAX_sheenRoughnessTexture==1
#undef SC_USE_UV_MIN_MAX_sheenRoughnessTexture
#define SC_USE_UV_MIN_MAX_sheenRoughnessTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture 0
#elif SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture==1
#undef SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture 1
#endif
#ifndef Tweak_N37
#define Tweak_N37 0
#endif
#ifndef ENABLE_CLEARCOAT_TEX
#define ENABLE_CLEARCOAT_TEX 0
#elif ENABLE_CLEARCOAT_TEX==1
#undef ENABLE_CLEARCOAT_TEX
#define ENABLE_CLEARCOAT_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_clearcoatTexture
#define SC_USE_UV_TRANSFORM_clearcoatTexture 0
#elif SC_USE_UV_TRANSFORM_clearcoatTexture==1
#undef SC_USE_UV_TRANSFORM_clearcoatTexture
#define SC_USE_UV_TRANSFORM_clearcoatTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture
#define SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture
#define SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_clearcoatTexture
#define SC_USE_UV_MIN_MAX_clearcoatTexture 0
#elif SC_USE_UV_MIN_MAX_clearcoatTexture==1
#undef SC_USE_UV_MIN_MAX_clearcoatTexture
#define SC_USE_UV_MIN_MAX_clearcoatTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_clearcoatTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatTexture 0
#elif SC_USE_CLAMP_TO_BORDER_clearcoatTexture==1
#undef SC_USE_CLAMP_TO_BORDER_clearcoatTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatTexture 1
#endif
#ifndef Tweak_N44
#define Tweak_N44 0
#endif
#ifndef ENABLE_CLEARCOAT_ROUGHNESS_TEX
#define ENABLE_CLEARCOAT_ROUGHNESS_TEX 0
#elif ENABLE_CLEARCOAT_ROUGHNESS_TEX==1
#undef ENABLE_CLEARCOAT_ROUGHNESS_TEX
#define ENABLE_CLEARCOAT_ROUGHNESS_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture
#define SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture 0
#elif SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture==1
#undef SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture
#define SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture
#define SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture
#define SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture 0
#elif SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture==1
#undef SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture
#define SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture 0
#elif SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture==1
#undef SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture 1
#endif
#ifndef Tweak_N60
#define Tweak_N60 0
#endif
#ifndef ENABLE_CLEARCOAT_NORMAL_TEX
#define ENABLE_CLEARCOAT_NORMAL_TEX 0
#elif ENABLE_CLEARCOAT_NORMAL_TEX==1
#undef ENABLE_CLEARCOAT_NORMAL_TEX
#define ENABLE_CLEARCOAT_NORMAL_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_clearcoatNormalTexture
#define SC_USE_UV_TRANSFORM_clearcoatNormalTexture 0
#elif SC_USE_UV_TRANSFORM_clearcoatNormalTexture==1
#undef SC_USE_UV_TRANSFORM_clearcoatNormalTexture
#define SC_USE_UV_TRANSFORM_clearcoatNormalTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture
#define SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture
#define SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_clearcoatNormalTexture
#define SC_USE_UV_MIN_MAX_clearcoatNormalTexture 0
#elif SC_USE_UV_MIN_MAX_clearcoatNormalTexture==1
#undef SC_USE_UV_MIN_MAX_clearcoatNormalTexture
#define SC_USE_UV_MIN_MAX_clearcoatNormalTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture 0
#elif SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture==1
#undef SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture
#define SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture 1
#endif
#ifndef Tweak_N47
#define Tweak_N47 0
#endif
#ifndef ENABLE_TEXTURE_TRANSFORM
#define ENABLE_TEXTURE_TRANSFORM 0
#elif ENABLE_TEXTURE_TRANSFORM==1
#undef ENABLE_TEXTURE_TRANSFORM
#define ENABLE_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_EMISSIVE_TEXTURE_TRANSFORM
#define ENABLE_EMISSIVE_TEXTURE_TRANSFORM 0
#elif ENABLE_EMISSIVE_TEXTURE_TRANSFORM==1
#undef ENABLE_EMISSIVE_TEXTURE_TRANSFORM
#define ENABLE_EMISSIVE_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_NORMAL_TEXTURE_TRANSFORM
#define ENABLE_NORMAL_TEXTURE_TRANSFORM 0
#elif ENABLE_NORMAL_TEXTURE_TRANSFORM==1
#undef ENABLE_NORMAL_TEXTURE_TRANSFORM
#define ENABLE_NORMAL_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM 0
#elif ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM==1
#undef ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_TRANSMISSION_TEXTURE_TRANSFORM
#define ENABLE_TRANSMISSION_TEXTURE_TRANSFORM 0
#elif ENABLE_TRANSMISSION_TEXTURE_TRANSFORM==1
#undef ENABLE_TRANSMISSION_TEXTURE_TRANSFORM
#define ENABLE_TRANSMISSION_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM
#define ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM 0
#elif ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM==1
#undef ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM
#define ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM 0
#elif ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM==1
#undef ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_CLEARCOAT_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_TEXTURE_TRANSFORM 0
#elif ENABLE_CLEARCOAT_TEXTURE_TRANSFORM==1
#undef ENABLE_CLEARCOAT_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM 0
#elif ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM==1
#undef ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM 1
#endif
#ifndef ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM 0
#elif ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM==1
#undef ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM
#define ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef ENABLE_VERTEX_COLOR_BASE
#define ENABLE_VERTEX_COLOR_BASE 0
#elif ENABLE_VERTEX_COLOR_BASE==1
#undef ENABLE_VERTEX_COLOR_BASE
#define ENABLE_VERTEX_COLOR_BASE 1
#endif
#ifndef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 0
#elif ENABLE_BASE_TEX==1
#undef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_baseColorTexture
#define SC_USE_UV_TRANSFORM_baseColorTexture 0
#elif SC_USE_UV_TRANSFORM_baseColorTexture==1
#undef SC_USE_UV_TRANSFORM_baseColorTexture
#define SC_USE_UV_TRANSFORM_baseColorTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_baseColorTexture
#define SC_SOFTWARE_WRAP_MODE_U_baseColorTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_baseColorTexture
#define SC_SOFTWARE_WRAP_MODE_V_baseColorTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_baseColorTexture
#define SC_USE_UV_MIN_MAX_baseColorTexture 0
#elif SC_USE_UV_MIN_MAX_baseColorTexture==1
#undef SC_USE_UV_MIN_MAX_baseColorTexture
#define SC_USE_UV_MIN_MAX_baseColorTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_baseColorTexture
#define SC_USE_CLAMP_TO_BORDER_baseColorTexture 0
#elif SC_USE_CLAMP_TO_BORDER_baseColorTexture==1
#undef SC_USE_CLAMP_TO_BORDER_baseColorTexture
#define SC_USE_CLAMP_TO_BORDER_baseColorTexture 1
#endif
#ifndef NODE_7_DROPLIST_ITEM
#define NODE_7_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_BASE_TEXTURE_TRANSFORM
#define ENABLE_BASE_TEXTURE_TRANSFORM 0
#elif ENABLE_BASE_TEXTURE_TRANSFORM==1
#undef ENABLE_BASE_TEXTURE_TRANSFORM
#define ENABLE_BASE_TEXTURE_TRANSFORM 1
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
uniform mat3 emissiveTextureTransform;
uniform vec4 emissiveTextureUvMinMax;
uniform vec4 emissiveTextureBorderColor;
uniform mat3 normalTextureTransform;
uniform vec4 normalTextureUvMinMax;
uniform vec4 normalTextureBorderColor;
uniform mat3 metallicRoughnessTextureTransform;
uniform vec4 metallicRoughnessTextureUvMinMax;
uniform vec4 metallicRoughnessTextureBorderColor;
uniform mat3 transmissionTextureTransform;
uniform vec4 transmissionTextureUvMinMax;
uniform vec4 transmissionTextureBorderColor;
uniform mat3 screenTextureTransform;
uniform vec4 screenTextureUvMinMax;
uniform vec4 screenTextureBorderColor;
uniform mat3 sheenColorTextureTransform;
uniform vec4 sheenColorTextureUvMinMax;
uniform vec4 sheenColorTextureBorderColor;
uniform mat3 sheenRoughnessTextureTransform;
uniform vec4 sheenRoughnessTextureUvMinMax;
uniform vec4 sheenRoughnessTextureBorderColor;
uniform mat3 clearcoatTextureTransform;
uniform vec4 clearcoatTextureUvMinMax;
uniform vec4 clearcoatTextureBorderColor;
uniform mat3 clearcoatRoughnessTextureTransform;
uniform vec4 clearcoatRoughnessTextureUvMinMax;
uniform vec4 clearcoatRoughnessTextureBorderColor;
uniform mat3 clearcoatNormalTextureTransform;
uniform vec4 clearcoatNormalTextureUvMinMax;
uniform vec4 clearcoatNormalTextureBorderColor;
uniform sc_Camera_t sc_Camera;
uniform vec3 emissiveFactor;
uniform float normalTextureScale;
uniform float metallicFactor;
uniform float roughnessFactor;
uniform float occlusionTextureStrength;
uniform float transmissionFactor;
uniform vec3 sheenColorFactor;
uniform float sheenRoughnessFactor;
uniform float clearcoatFactor;
uniform float clearcoatRoughnessFactor;
uniform mat3 baseColorTextureTransform;
uniform vec4 baseColorTextureUvMinMax;
uniform vec4 baseColorTextureBorderColor;
uniform vec4 baseColorFactor;
uniform vec2 baseColorTexture_offset;
uniform vec2 baseColorTexture_scale;
uniform float baseColorTexture_rotation;
uniform vec2 emissiveTexture_offset;
uniform vec2 emissiveTexture_scale;
uniform float emissiveTexture_rotation;
uniform vec2 normalTexture_offset;
uniform vec2 normalTexture_scale;
uniform float normalTexture_rotation;
uniform vec2 metallicRoughnessTexture_offset;
uniform vec2 metallicRoughnessTexture_scale;
uniform float metallicRoughnessTexture_rotation;
uniform vec2 transmissionTexture_offset;
uniform vec2 transmissionTexture_scale;
uniform float transmissionTexture_rotation;
uniform vec2 sheenColorTexture_offset;
uniform vec2 sheenColorTexture_scale;
uniform float sheenColorTexture_rotation;
uniform vec2 sheenRoughnessTexture_offset;
uniform vec2 sheenRoughnessTexture_scale;
uniform float sheenRoughnessTexture_rotation;
uniform vec2 clearcoatTexture_offset;
uniform vec2 clearcoatTexture_scale;
uniform float clearcoatTexture_rotation;
uniform vec2 clearcoatNormalTexture_offset;
uniform vec2 clearcoatNormalTexture_scale;
uniform float clearcoatNormalTexture_rotation;
uniform vec2 clearcoatRoughnessTexture_offset;
uniform vec2 clearcoatRoughnessTexture_scale;
uniform float clearcoatRoughnessTexture_rotation;
uniform float Port_Input2_N043;
uniform float Port_Input2_N062;
uniform vec3 Port_SpecularAO_N036;
uniform vec3 Port_Albedo_N405;
uniform float Port_Opacity_N405;
uniform vec3 Port_Emissive_N405;
uniform float Port_Metallic_N405;
uniform vec3 Port_SpecularAO_N405;
uniform float colorMultiplier;
uniform vec4 sc_Time;
uniform int PreviewEnabled;
uniform usampler2D sc_RayTracingHitCasterIdAndBarycentric;
uniform sampler2D sc_RayTracingRayDirection;
uniform sampler2D baseColorTexture;
uniform sampler2DArray baseColorTextureArrSC;
uniform sampler2D emissiveTexture;
uniform sampler2DArray emissiveTextureArrSC;
uniform sampler2D normalTexture;
uniform sampler2DArray normalTextureArrSC;
uniform sampler2D metallicRoughnessTexture;
uniform sampler2DArray metallicRoughnessTextureArrSC;
uniform sampler2D screenTexture;
uniform sampler2DArray screenTextureArrSC;
uniform sampler2D transmissionTexture;
uniform sampler2DArray transmissionTextureArrSC;
uniform sampler2D sheenColorTexture;
uniform sampler2DArray sheenColorTextureArrSC;
uniform sampler2D sheenRoughnessTexture;
uniform sampler2DArray sheenRoughnessTextureArrSC;
uniform sampler2D sc_EnvmapSpecular;
uniform sampler2DArray sc_EnvmapSpecularArrSC;
uniform sampler2D clearcoatTexture;
uniform sampler2DArray clearcoatTextureArrSC;
uniform sampler2D clearcoatRoughnessTexture;
uniform sampler2DArray clearcoatRoughnessTextureArrSC;
uniform sampler2D clearcoatNormalTexture;
uniform sampler2DArray clearcoatNormalTextureArrSC;
uniform sampler2D sc_SSAOTexture;
uniform sampler2D sc_ShadowTexture;
uniform sampler2D sc_RayTracingShadows;
uniform sampler2DArray sc_RayTracingShadowsArrSC;
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
void Node40_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (ENABLE_VERTEX_COLOR_BASE)
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
void Node121_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (ENABLE_BASE_TEX)
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
void Node48_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (ENABLE_TEXTURE_TRANSFORM)
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
void Node88_Bool_Parameter(out float Output,ssGlobals Globals)
{
#if (ENABLE_BASE_TEXTURE_TRANSFORM)
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
vec2 N35_getUV(int pickUV)
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
return l9_2;
}
vec2 N35_uvTransform(vec2 uvIn,vec2 offset,vec2 scale,float rotation)
{
return (((mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(offset.x,offset.y,1.0))*mat3(vec3(cos(rotation),sin(rotation),0.0),vec3(-sin(rotation),cos(rotation),0.0),vec3(0.0,0.0,1.0)))*mat3(vec3(scale.x,0.0,0.0),vec3(0.0,scale.y,0.0),vec3(0.0,0.0,1.0)))*vec3(uvIn,1.0)).xy;
}
int baseColorTextureGetStereoViewIndex()
{
int l9_0;
#if (baseColorTextureHasSwappedViews)
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
vec4 N35_BaseTexture_sample(vec2 coords)
{
vec4 l9_0;
#if (baseColorTextureLayout==2)
{
bool l9_1=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseColorTexture)!=0));
float l9_2=coords.x;
sc_SoftwareWrapEarly(l9_2,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x);
float l9_3=l9_2;
float l9_4=coords.y;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y);
float l9_5=l9_4;
vec2 l9_6;
float l9_7;
#if (SC_USE_UV_MIN_MAX_baseColorTexture)
{
bool l9_8;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_8=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x==3;
}
#else
{
l9_8=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0);
}
#endif
float l9_9=l9_3;
float l9_10=1.0;
sc_ClampUV(l9_9,baseColorTextureUvMinMax.x,baseColorTextureUvMinMax.z,l9_8,l9_10);
float l9_11=l9_9;
float l9_12=l9_10;
bool l9_13;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_13=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y==3;
}
#else
{
l9_13=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0);
}
#endif
float l9_14=l9_5;
float l9_15=l9_12;
sc_ClampUV(l9_14,baseColorTextureUvMinMax.y,baseColorTextureUvMinMax.w,l9_13,l9_15);
l9_7=l9_15;
l9_6=vec2(l9_11,l9_14);
}
#else
{
l9_7=1.0;
l9_6=vec2(l9_3,l9_5);
}
#endif
vec2 l9_16=sc_TransformUV(l9_6,(int(SC_USE_UV_TRANSFORM_baseColorTexture)!=0),baseColorTextureTransform);
float l9_17=l9_16.x;
float l9_18=l9_7;
sc_SoftwareWrapLate(l9_17,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x,l9_1,l9_18);
float l9_19=l9_16.y;
float l9_20=l9_18;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y,l9_1,l9_20);
float l9_21=l9_20;
vec3 l9_22=sc_SamplingCoordsViewToGlobal(vec2(l9_17,l9_19),baseColorTextureLayout,baseColorTextureGetStereoViewIndex());
vec4 l9_23=texture(baseColorTextureArrSC,l9_22,0.0);
vec4 l9_24;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_24=mix(baseColorTextureBorderColor,l9_23,vec4(l9_21));
}
#else
{
l9_24=l9_23;
}
#endif
l9_0=l9_24;
}
#else
{
bool l9_25=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseColorTexture)!=0));
float l9_26=coords.x;
sc_SoftwareWrapEarly(l9_26,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x);
float l9_27=l9_26;
float l9_28=coords.y;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y);
float l9_29=l9_28;
vec2 l9_30;
float l9_31;
#if (SC_USE_UV_MIN_MAX_baseColorTexture)
{
bool l9_32;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_32=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x==3;
}
#else
{
l9_32=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0);
}
#endif
float l9_33=l9_27;
float l9_34=1.0;
sc_ClampUV(l9_33,baseColorTextureUvMinMax.x,baseColorTextureUvMinMax.z,l9_32,l9_34);
float l9_35=l9_33;
float l9_36=l9_34;
bool l9_37;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_37=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y==3;
}
#else
{
l9_37=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture)!=0);
}
#endif
float l9_38=l9_29;
float l9_39=l9_36;
sc_ClampUV(l9_38,baseColorTextureUvMinMax.y,baseColorTextureUvMinMax.w,l9_37,l9_39);
l9_31=l9_39;
l9_30=vec2(l9_35,l9_38);
}
#else
{
l9_31=1.0;
l9_30=vec2(l9_27,l9_29);
}
#endif
vec2 l9_40=sc_TransformUV(l9_30,(int(SC_USE_UV_TRANSFORM_baseColorTexture)!=0),baseColorTextureTransform);
float l9_41=l9_40.x;
float l9_42=l9_31;
sc_SoftwareWrapLate(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).x,l9_25,l9_42);
float l9_43=l9_40.y;
float l9_44=l9_42;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture).y,l9_25,l9_44);
float l9_45=l9_44;
vec3 l9_46=sc_SamplingCoordsViewToGlobal(vec2(l9_41,l9_43),baseColorTextureLayout,baseColorTextureGetStereoViewIndex());
vec4 l9_47=texture(baseColorTexture,l9_46.xy,0.0);
vec4 l9_48;
#if (SC_USE_CLAMP_TO_BORDER_baseColorTexture)
{
l9_48=mix(baseColorTextureBorderColor,l9_47,vec4(l9_45));
}
#else
{
l9_48=l9_47;
}
#endif
l9_0=l9_48;
}
#endif
return l9_0;
}
vec4 ssSRGB_to_Linear(vec4 value)
{
vec4 l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=vec4(pow(value.x,2.2),pow(value.y,2.2),pow(value.z,2.2),pow(value.w,2.2));
}
#else
{
l9_0=value*value;
}
#endif
return l9_0;
}
vec4 ssLinear_to_SRGB(vec4 value)
{
vec4 l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=vec4(pow(value.x,0.45454544),pow(value.y,0.45454544),pow(value.z,0.45454544),pow(value.w,0.45454544));
}
#else
{
l9_0=sqrt(value);
}
#endif
return l9_0;
}
vec2 N3_getUV(int pickUV)
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
return l9_2;
}
vec2 N3_uvTransform(vec2 uvIn,vec2 offset,vec2 scale,float rotationAngle)
{
float l9_0=radians(rotationAngle);
float l9_1=cos(l9_0);
float l9_2=sin(l9_0);
return (((mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(offset.x,offset.y,1.0))*mat3(vec3(l9_1,l9_2,0.0),vec3(-l9_2,l9_1,0.0),vec3(0.0,0.0,1.0)))*mat3(vec3(scale.x,0.0,0.0),vec3(0.0,scale.y,0.0),vec3(0.0,0.0,1.0)))*vec3(uvIn,1.0)).xy;
}
int emissiveTextureGetStereoViewIndex()
{
int l9_0;
#if (emissiveTextureHasSwappedViews)
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
int normalTextureGetStereoViewIndex()
{
int l9_0;
#if (normalTextureHasSwappedViews)
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
int metallicRoughnessTextureGetStereoViewIndex()
{
int l9_0;
#if (metallicRoughnessTextureHasSwappedViews)
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
int screenTextureGetStereoViewIndex()
{
int l9_0;
#if (screenTextureHasSwappedViews)
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
int transmissionTextureGetStereoViewIndex()
{
int l9_0;
#if (transmissionTextureHasSwappedViews)
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
vec3 ssLinear_to_SRGB(vec3 value)
{
vec3 l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=vec3(pow(value.x,0.45454544),pow(value.y,0.45454544),pow(value.z,0.45454544));
}
#else
{
l9_0=sqrt(value);
}
#endif
return l9_0;
}
int sheenColorTextureGetStereoViewIndex()
{
int l9_0;
#if (sheenColorTextureHasSwappedViews)
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
int sheenRoughnessTextureGetStereoViewIndex()
{
int l9_0;
#if (sheenRoughnessTextureHasSwappedViews)
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
float ssSRGB_to_Linear(float value)
{
float l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=pow(value,2.2);
}
#else
{
l9_0=value*value;
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
float N3_charlieD(float roughness,float NdotH)
{
float l9_0=1.0/roughness;
return ((2.0+l9_0)*ssPow(1.0-(NdotH*NdotH),l9_0*0.5))/(2.0*3.1415927);
}
int clearcoatTextureGetStereoViewIndex()
{
int l9_0;
#if (clearcoatTextureHasSwappedViews)
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
int clearcoatRoughnessTextureGetStereoViewIndex()
{
int l9_0;
#if (clearcoatRoughnessTextureHasSwappedViews)
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
int clearcoatNormalTextureGetStereoViewIndex()
{
int l9_0;
#if (clearcoatNormalTextureHasSwappedViews)
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
vec4 l9_1;
vec2 l9_2;
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
l9_2=((l9_15.xy/vec2(l9_15.w))*0.5)+vec2(0.5);
l9_1=l9_10.color;
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
l9_2=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
l9_1=varColor;
}
ssGlobals l9_18=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec3(0.0),l9_9,l9_8,l9_8,l9_7,l9_6,l9_5,l9_4,l9_3,l9_2,l9_1);
vec4 l9_19;
#if (ENABLE_GLTF_LIGHTING)
{
float l9_20;
#if (ENABLE_NORMALMAP)
{
l9_20=normalTextureScale;
}
#else
{
l9_20=Port_Input2_N043;
}
#endif
float l9_21;
#if (ENABLE_METALLIC_ROUGHNESS_TEX)
{
l9_21=occlusionTextureStrength;
}
#else
{
l9_21=Port_Input2_N062;
}
#endif
float l9_22;
Node40_Bool_Parameter(l9_22,l9_18);
float l9_23;
Node121_Bool_Parameter(l9_23,l9_18);
float l9_24;
Node48_Bool_Parameter(l9_24,l9_18);
float l9_25;
Node88_Bool_Parameter(l9_25,l9_18);
tempGlobals=l9_18;
vec4 l9_26;
#if (ENABLE_BASE_TEX)
{
vec2 l9_27=N35_getUV(NODE_7_DROPLIST_ITEM);
vec2 l9_28;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_BASE_TEXTURE_TRANSFORM)!=0))
{
l9_28=N35_uvTransform(l9_27,baseColorTexture_offset,baseColorTexture_scale,baseColorTexture_rotation);
}
else
{
l9_28=l9_27;
}
l9_26=baseColorFactor*ssSRGB_to_Linear(N35_BaseTexture_sample(l9_28));
}
#else
{
l9_26=baseColorFactor;
}
#endif
vec4 l9_29;
#if (ENABLE_VERTEX_COLOR_BASE)
{
l9_29=l9_26*tempGlobals.VertexColor;
}
#else
{
l9_29=l9_26;
}
#endif
tempGlobals=l9_18;
vec3 l9_30;
#if (ENABLE_EMISSIVE)
{
vec2 l9_31=N3_getUV(NODE_10_DROPLIST_ITEM);
vec2 l9_32;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_EMISSIVE_TEXTURE_TRANSFORM)!=0))
{
l9_32=N3_uvTransform(l9_31,emissiveTexture_offset,emissiveTexture_scale,emissiveTexture_rotation);
}
else
{
l9_32=l9_31;
}
vec4 l9_33;
#if (emissiveTextureLayout==2)
{
bool l9_34=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTexture)!=0));
float l9_35=l9_32.x;
sc_SoftwareWrapEarly(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x);
float l9_36=l9_35;
float l9_37=l9_32.y;
sc_SoftwareWrapEarly(l9_37,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y);
float l9_38=l9_37;
vec2 l9_39;
float l9_40;
#if (SC_USE_UV_MIN_MAX_emissiveTexture)
{
bool l9_41;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_41=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x==3;
}
#else
{
l9_41=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0);
}
#endif
float l9_42=l9_36;
float l9_43=1.0;
sc_ClampUV(l9_42,emissiveTextureUvMinMax.x,emissiveTextureUvMinMax.z,l9_41,l9_43);
float l9_44=l9_42;
float l9_45=l9_43;
bool l9_46;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_46=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y==3;
}
#else
{
l9_46=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0);
}
#endif
float l9_47=l9_38;
float l9_48=l9_45;
sc_ClampUV(l9_47,emissiveTextureUvMinMax.y,emissiveTextureUvMinMax.w,l9_46,l9_48);
l9_40=l9_48;
l9_39=vec2(l9_44,l9_47);
}
#else
{
l9_40=1.0;
l9_39=vec2(l9_36,l9_38);
}
#endif
vec2 l9_49=sc_TransformUV(l9_39,(int(SC_USE_UV_TRANSFORM_emissiveTexture)!=0),emissiveTextureTransform);
float l9_50=l9_49.x;
float l9_51=l9_40;
sc_SoftwareWrapLate(l9_50,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x,l9_34,l9_51);
float l9_52=l9_49.y;
float l9_53=l9_51;
sc_SoftwareWrapLate(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y,l9_34,l9_53);
float l9_54=l9_53;
vec3 l9_55=sc_SamplingCoordsViewToGlobal(vec2(l9_50,l9_52),emissiveTextureLayout,emissiveTextureGetStereoViewIndex());
vec4 l9_56=texture(emissiveTextureArrSC,l9_55,0.0);
vec4 l9_57;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_57=mix(emissiveTextureBorderColor,l9_56,vec4(l9_54));
}
#else
{
l9_57=l9_56;
}
#endif
l9_33=l9_57;
}
#else
{
bool l9_58=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTexture)!=0));
float l9_59=l9_32.x;
sc_SoftwareWrapEarly(l9_59,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x);
float l9_60=l9_59;
float l9_61=l9_32.y;
sc_SoftwareWrapEarly(l9_61,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y);
float l9_62=l9_61;
vec2 l9_63;
float l9_64;
#if (SC_USE_UV_MIN_MAX_emissiveTexture)
{
bool l9_65;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_65=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x==3;
}
#else
{
l9_65=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0);
}
#endif
float l9_66=l9_60;
float l9_67=1.0;
sc_ClampUV(l9_66,emissiveTextureUvMinMax.x,emissiveTextureUvMinMax.z,l9_65,l9_67);
float l9_68=l9_66;
float l9_69=l9_67;
bool l9_70;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_70=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y==3;
}
#else
{
l9_70=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture)!=0);
}
#endif
float l9_71=l9_62;
float l9_72=l9_69;
sc_ClampUV(l9_71,emissiveTextureUvMinMax.y,emissiveTextureUvMinMax.w,l9_70,l9_72);
l9_64=l9_72;
l9_63=vec2(l9_68,l9_71);
}
#else
{
l9_64=1.0;
l9_63=vec2(l9_60,l9_62);
}
#endif
vec2 l9_73=sc_TransformUV(l9_63,(int(SC_USE_UV_TRANSFORM_emissiveTexture)!=0),emissiveTextureTransform);
float l9_74=l9_73.x;
float l9_75=l9_64;
sc_SoftwareWrapLate(l9_74,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).x,l9_58,l9_75);
float l9_76=l9_73.y;
float l9_77=l9_75;
sc_SoftwareWrapLate(l9_76,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture).y,l9_58,l9_77);
float l9_78=l9_77;
vec3 l9_79=sc_SamplingCoordsViewToGlobal(vec2(l9_74,l9_76),emissiveTextureLayout,emissiveTextureGetStereoViewIndex());
vec4 l9_80=texture(emissiveTexture,l9_79.xy,0.0);
vec4 l9_81;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTexture)
{
l9_81=mix(emissiveTextureBorderColor,l9_80,vec4(l9_78));
}
#else
{
l9_81=l9_80;
}
#endif
l9_33=l9_81;
}
#endif
l9_30=ssSRGB_to_Linear(l9_33.xyz)*ssSRGB_to_Linear(emissiveFactor);
}
#else
{
l9_30=emissiveFactor;
}
#endif
vec3 l9_82=tempGlobals.VertexNormal_WorldSpace;
vec3 l9_83=normalize(l9_82);
vec3 l9_84;
#if (ENABLE_NORMALMAP)
{
vec2 l9_85=N3_getUV(NODE_8_DROPLIST_ITEM);
vec2 l9_86;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_NORMAL_TEXTURE_TRANSFORM)!=0))
{
l9_86=N3_uvTransform(l9_85,normalTexture_offset,normalTexture_scale,normalTexture_rotation);
}
else
{
l9_86=l9_85;
}
vec4 l9_87;
#if (normalTextureLayout==2)
{
bool l9_88=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTexture)!=0));
float l9_89=l9_86.x;
sc_SoftwareWrapEarly(l9_89,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x);
float l9_90=l9_89;
float l9_91=l9_86.y;
sc_SoftwareWrapEarly(l9_91,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y);
float l9_92=l9_91;
vec2 l9_93;
float l9_94;
#if (SC_USE_UV_MIN_MAX_normalTexture)
{
bool l9_95;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_95=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x==3;
}
#else
{
l9_95=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0);
}
#endif
float l9_96=l9_90;
float l9_97=1.0;
sc_ClampUV(l9_96,normalTextureUvMinMax.x,normalTextureUvMinMax.z,l9_95,l9_97);
float l9_98=l9_96;
float l9_99=l9_97;
bool l9_100;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_100=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y==3;
}
#else
{
l9_100=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0);
}
#endif
float l9_101=l9_92;
float l9_102=l9_99;
sc_ClampUV(l9_101,normalTextureUvMinMax.y,normalTextureUvMinMax.w,l9_100,l9_102);
l9_94=l9_102;
l9_93=vec2(l9_98,l9_101);
}
#else
{
l9_94=1.0;
l9_93=vec2(l9_90,l9_92);
}
#endif
vec2 l9_103=sc_TransformUV(l9_93,(int(SC_USE_UV_TRANSFORM_normalTexture)!=0),normalTextureTransform);
float l9_104=l9_103.x;
float l9_105=l9_94;
sc_SoftwareWrapLate(l9_104,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x,l9_88,l9_105);
float l9_106=l9_103.y;
float l9_107=l9_105;
sc_SoftwareWrapLate(l9_106,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y,l9_88,l9_107);
float l9_108=l9_107;
vec3 l9_109=sc_SamplingCoordsViewToGlobal(vec2(l9_104,l9_106),normalTextureLayout,normalTextureGetStereoViewIndex());
vec4 l9_110=texture(normalTextureArrSC,l9_109,0.0);
vec4 l9_111;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_111=mix(normalTextureBorderColor,l9_110,vec4(l9_108));
}
#else
{
l9_111=l9_110;
}
#endif
l9_87=l9_111;
}
#else
{
bool l9_112=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTexture)!=0));
float l9_113=l9_86.x;
sc_SoftwareWrapEarly(l9_113,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x);
float l9_114=l9_113;
float l9_115=l9_86.y;
sc_SoftwareWrapEarly(l9_115,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y);
float l9_116=l9_115;
vec2 l9_117;
float l9_118;
#if (SC_USE_UV_MIN_MAX_normalTexture)
{
bool l9_119;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_119=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x==3;
}
#else
{
l9_119=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0);
}
#endif
float l9_120=l9_114;
float l9_121=1.0;
sc_ClampUV(l9_120,normalTextureUvMinMax.x,normalTextureUvMinMax.z,l9_119,l9_121);
float l9_122=l9_120;
float l9_123=l9_121;
bool l9_124;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_124=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y==3;
}
#else
{
l9_124=(int(SC_USE_CLAMP_TO_BORDER_normalTexture)!=0);
}
#endif
float l9_125=l9_116;
float l9_126=l9_123;
sc_ClampUV(l9_125,normalTextureUvMinMax.y,normalTextureUvMinMax.w,l9_124,l9_126);
l9_118=l9_126;
l9_117=vec2(l9_122,l9_125);
}
#else
{
l9_118=1.0;
l9_117=vec2(l9_114,l9_116);
}
#endif
vec2 l9_127=sc_TransformUV(l9_117,(int(SC_USE_UV_TRANSFORM_normalTexture)!=0),normalTextureTransform);
float l9_128=l9_127.x;
float l9_129=l9_118;
sc_SoftwareWrapLate(l9_128,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).x,l9_112,l9_129);
float l9_130=l9_127.y;
float l9_131=l9_129;
sc_SoftwareWrapLate(l9_130,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTexture,SC_SOFTWARE_WRAP_MODE_V_normalTexture).y,l9_112,l9_131);
float l9_132=l9_131;
vec3 l9_133=sc_SamplingCoordsViewToGlobal(vec2(l9_128,l9_130),normalTextureLayout,normalTextureGetStereoViewIndex());
vec4 l9_134=texture(normalTexture,l9_133.xy,0.0);
vec4 l9_135;
#if (SC_USE_CLAMP_TO_BORDER_normalTexture)
{
l9_135=mix(normalTextureBorderColor,l9_134,vec4(l9_132));
}
#else
{
l9_135=l9_134;
}
#endif
l9_87=l9_135;
}
#endif
l9_84=normalize(mat3(tempGlobals.VertexTangent_WorldSpace,tempGlobals.VertexBinormal_WorldSpace,l9_83)*mix(vec3(0.0,0.0,1.0),(l9_87.xyz*1.9921875)-vec3(1.0),vec3(l9_20)));
}
#else
{
l9_84=l9_83;
}
#endif
float l9_136;
vec4 l9_137;
float l9_138;
#if (ENABLE_METALLIC_ROUGHNESS_TEX)
{
vec2 l9_139=N3_getUV(NODE_11_DROPLIST_ITEM);
vec2 l9_140;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM)!=0))
{
l9_140=N3_uvTransform(l9_139,metallicRoughnessTexture_offset,metallicRoughnessTexture_scale,metallicRoughnessTexture_rotation);
}
else
{
l9_140=l9_139;
}
vec4 l9_141;
#if (metallicRoughnessTextureLayout==2)
{
bool l9_142=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_metallicRoughnessTexture)!=0));
float l9_143=l9_140.x;
sc_SoftwareWrapEarly(l9_143,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x);
float l9_144=l9_143;
float l9_145=l9_140.y;
sc_SoftwareWrapEarly(l9_145,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y);
float l9_146=l9_145;
vec2 l9_147;
float l9_148;
#if (SC_USE_UV_MIN_MAX_metallicRoughnessTexture)
{
bool l9_149;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_149=ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x==3;
}
#else
{
l9_149=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0);
}
#endif
float l9_150=l9_144;
float l9_151=1.0;
sc_ClampUV(l9_150,metallicRoughnessTextureUvMinMax.x,metallicRoughnessTextureUvMinMax.z,l9_149,l9_151);
float l9_152=l9_150;
float l9_153=l9_151;
bool l9_154;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_154=ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y==3;
}
#else
{
l9_154=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0);
}
#endif
float l9_155=l9_146;
float l9_156=l9_153;
sc_ClampUV(l9_155,metallicRoughnessTextureUvMinMax.y,metallicRoughnessTextureUvMinMax.w,l9_154,l9_156);
l9_148=l9_156;
l9_147=vec2(l9_152,l9_155);
}
#else
{
l9_148=1.0;
l9_147=vec2(l9_144,l9_146);
}
#endif
vec2 l9_157=sc_TransformUV(l9_147,(int(SC_USE_UV_TRANSFORM_metallicRoughnessTexture)!=0),metallicRoughnessTextureTransform);
float l9_158=l9_157.x;
float l9_159=l9_148;
sc_SoftwareWrapLate(l9_158,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x,l9_142,l9_159);
float l9_160=l9_157.y;
float l9_161=l9_159;
sc_SoftwareWrapLate(l9_160,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y,l9_142,l9_161);
float l9_162=l9_161;
vec3 l9_163=sc_SamplingCoordsViewToGlobal(vec2(l9_158,l9_160),metallicRoughnessTextureLayout,metallicRoughnessTextureGetStereoViewIndex());
vec4 l9_164=texture(metallicRoughnessTextureArrSC,l9_163,0.0);
vec4 l9_165;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_165=mix(metallicRoughnessTextureBorderColor,l9_164,vec4(l9_162));
}
#else
{
l9_165=l9_164;
}
#endif
l9_141=l9_165;
}
#else
{
bool l9_166=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_metallicRoughnessTexture)!=0));
float l9_167=l9_140.x;
sc_SoftwareWrapEarly(l9_167,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x);
float l9_168=l9_167;
float l9_169=l9_140.y;
sc_SoftwareWrapEarly(l9_169,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y);
float l9_170=l9_169;
vec2 l9_171;
float l9_172;
#if (SC_USE_UV_MIN_MAX_metallicRoughnessTexture)
{
bool l9_173;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_173=ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x==3;
}
#else
{
l9_173=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0);
}
#endif
float l9_174=l9_168;
float l9_175=1.0;
sc_ClampUV(l9_174,metallicRoughnessTextureUvMinMax.x,metallicRoughnessTextureUvMinMax.z,l9_173,l9_175);
float l9_176=l9_174;
float l9_177=l9_175;
bool l9_178;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_178=ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y==3;
}
#else
{
l9_178=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)!=0);
}
#endif
float l9_179=l9_170;
float l9_180=l9_177;
sc_ClampUV(l9_179,metallicRoughnessTextureUvMinMax.y,metallicRoughnessTextureUvMinMax.w,l9_178,l9_180);
l9_172=l9_180;
l9_171=vec2(l9_176,l9_179);
}
#else
{
l9_172=1.0;
l9_171=vec2(l9_168,l9_170);
}
#endif
vec2 l9_181=sc_TransformUV(l9_171,(int(SC_USE_UV_TRANSFORM_metallicRoughnessTexture)!=0),metallicRoughnessTextureTransform);
float l9_182=l9_181.x;
float l9_183=l9_172;
sc_SoftwareWrapLate(l9_182,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).x,l9_166,l9_183);
float l9_184=l9_181.y;
float l9_185=l9_183;
sc_SoftwareWrapLate(l9_184,ivec2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture).y,l9_166,l9_185);
float l9_186=l9_185;
vec3 l9_187=sc_SamplingCoordsViewToGlobal(vec2(l9_182,l9_184),metallicRoughnessTextureLayout,metallicRoughnessTextureGetStereoViewIndex());
vec4 l9_188=texture(metallicRoughnessTexture,l9_187.xy,0.0);
vec4 l9_189;
#if (SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture)
{
l9_189=mix(metallicRoughnessTextureBorderColor,l9_188,vec4(l9_186));
}
#else
{
l9_189=l9_188;
}
#endif
l9_141=l9_189;
}
#endif
vec4 l9_190=vec4(0.0);
l9_190.w=l9_21;
vec3 l9_191=vec3(1.0+(l9_21*(l9_141.z-1.0)));
l9_138=roughnessFactor*l9_141.y;
l9_137=vec4(l9_191.x,l9_191.y,l9_191.z,l9_190.w);
l9_136=metallicFactor*l9_141.x;
}
#else
{
l9_138=roughnessFactor;
l9_137=vec4(1.0,1.0,1.0,0.0);
l9_136=metallicFactor;
}
#endif
vec3 l9_192;
vec3 l9_193;
vec3 l9_194;
#if (ENABLE_TRANSMISSION)
{
vec2 l9_195=tempGlobals.gScreenCoord;
vec4 l9_196;
#if (screenTextureLayout==2)
{
bool l9_197=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenTexture)!=0));
float l9_198=l9_195.x;
sc_SoftwareWrapEarly(l9_198,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x);
float l9_199=l9_198;
float l9_200=l9_195.y;
sc_SoftwareWrapEarly(l9_200,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y);
float l9_201=l9_200;
vec2 l9_202;
float l9_203;
#if (SC_USE_UV_MIN_MAX_screenTexture)
{
bool l9_204;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_204=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x==3;
}
#else
{
l9_204=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0);
}
#endif
float l9_205=l9_199;
float l9_206=1.0;
sc_ClampUV(l9_205,screenTextureUvMinMax.x,screenTextureUvMinMax.z,l9_204,l9_206);
float l9_207=l9_205;
float l9_208=l9_206;
bool l9_209;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_209=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y==3;
}
#else
{
l9_209=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0);
}
#endif
float l9_210=l9_201;
float l9_211=l9_208;
sc_ClampUV(l9_210,screenTextureUvMinMax.y,screenTextureUvMinMax.w,l9_209,l9_211);
l9_203=l9_211;
l9_202=vec2(l9_207,l9_210);
}
#else
{
l9_203=1.0;
l9_202=vec2(l9_199,l9_201);
}
#endif
vec2 l9_212=sc_TransformUV(l9_202,(int(SC_USE_UV_TRANSFORM_screenTexture)!=0),screenTextureTransform);
float l9_213=l9_212.x;
float l9_214=l9_203;
sc_SoftwareWrapLate(l9_213,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x,l9_197,l9_214);
float l9_215=l9_212.y;
float l9_216=l9_214;
sc_SoftwareWrapLate(l9_215,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y,l9_197,l9_216);
float l9_217=l9_216;
vec3 l9_218=sc_SamplingCoordsViewToGlobal(vec2(l9_213,l9_215),screenTextureLayout,screenTextureGetStereoViewIndex());
vec4 l9_219=texture(screenTextureArrSC,l9_218,0.0);
vec4 l9_220;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_220=mix(screenTextureBorderColor,l9_219,vec4(l9_217));
}
#else
{
l9_220=l9_219;
}
#endif
l9_196=l9_220;
}
#else
{
bool l9_221=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenTexture)!=0));
float l9_222=l9_195.x;
sc_SoftwareWrapEarly(l9_222,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x);
float l9_223=l9_222;
float l9_224=l9_195.y;
sc_SoftwareWrapEarly(l9_224,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y);
float l9_225=l9_224;
vec2 l9_226;
float l9_227;
#if (SC_USE_UV_MIN_MAX_screenTexture)
{
bool l9_228;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_228=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x==3;
}
#else
{
l9_228=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0);
}
#endif
float l9_229=l9_223;
float l9_230=1.0;
sc_ClampUV(l9_229,screenTextureUvMinMax.x,screenTextureUvMinMax.z,l9_228,l9_230);
float l9_231=l9_229;
float l9_232=l9_230;
bool l9_233;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_233=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y==3;
}
#else
{
l9_233=(int(SC_USE_CLAMP_TO_BORDER_screenTexture)!=0);
}
#endif
float l9_234=l9_225;
float l9_235=l9_232;
sc_ClampUV(l9_234,screenTextureUvMinMax.y,screenTextureUvMinMax.w,l9_233,l9_235);
l9_227=l9_235;
l9_226=vec2(l9_231,l9_234);
}
#else
{
l9_227=1.0;
l9_226=vec2(l9_223,l9_225);
}
#endif
vec2 l9_236=sc_TransformUV(l9_226,(int(SC_USE_UV_TRANSFORM_screenTexture)!=0),screenTextureTransform);
float l9_237=l9_236.x;
float l9_238=l9_227;
sc_SoftwareWrapLate(l9_237,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).x,l9_221,l9_238);
float l9_239=l9_236.y;
float l9_240=l9_238;
sc_SoftwareWrapLate(l9_239,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTexture,SC_SOFTWARE_WRAP_MODE_V_screenTexture).y,l9_221,l9_240);
float l9_241=l9_240;
vec3 l9_242=sc_SamplingCoordsViewToGlobal(vec2(l9_237,l9_239),screenTextureLayout,screenTextureGetStereoViewIndex());
vec4 l9_243=texture(screenTexture,l9_242.xy,0.0);
vec4 l9_244;
#if (SC_USE_CLAMP_TO_BORDER_screenTexture)
{
l9_244=mix(screenTextureBorderColor,l9_243,vec4(l9_241));
}
#else
{
l9_244=l9_243;
}
#endif
l9_196=l9_244;
}
#endif
vec3 l9_245=ssSRGB_to_Linear(l9_196.xyz);
float l9_246;
#if (ENABLE_TRANSMISSION_TEX)
{
vec2 l9_247=N3_getUV(Tweak_N30);
vec2 l9_248;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_TRANSMISSION_TEXTURE_TRANSFORM)!=0))
{
l9_248=N3_uvTransform(l9_247,transmissionTexture_offset,transmissionTexture_scale,transmissionTexture_rotation);
}
else
{
l9_248=l9_247;
}
vec4 l9_249;
#if (transmissionTextureLayout==2)
{
bool l9_250=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_transmissionTexture)!=0));
float l9_251=l9_248.x;
sc_SoftwareWrapEarly(l9_251,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x);
float l9_252=l9_251;
float l9_253=l9_248.y;
sc_SoftwareWrapEarly(l9_253,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y);
float l9_254=l9_253;
vec2 l9_255;
float l9_256;
#if (SC_USE_UV_MIN_MAX_transmissionTexture)
{
bool l9_257;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_257=ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x==3;
}
#else
{
l9_257=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0);
}
#endif
float l9_258=l9_252;
float l9_259=1.0;
sc_ClampUV(l9_258,transmissionTextureUvMinMax.x,transmissionTextureUvMinMax.z,l9_257,l9_259);
float l9_260=l9_258;
float l9_261=l9_259;
bool l9_262;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_262=ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y==3;
}
#else
{
l9_262=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0);
}
#endif
float l9_263=l9_254;
float l9_264=l9_261;
sc_ClampUV(l9_263,transmissionTextureUvMinMax.y,transmissionTextureUvMinMax.w,l9_262,l9_264);
l9_256=l9_264;
l9_255=vec2(l9_260,l9_263);
}
#else
{
l9_256=1.0;
l9_255=vec2(l9_252,l9_254);
}
#endif
vec2 l9_265=sc_TransformUV(l9_255,(int(SC_USE_UV_TRANSFORM_transmissionTexture)!=0),transmissionTextureTransform);
float l9_266=l9_265.x;
float l9_267=l9_256;
sc_SoftwareWrapLate(l9_266,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x,l9_250,l9_267);
float l9_268=l9_265.y;
float l9_269=l9_267;
sc_SoftwareWrapLate(l9_268,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y,l9_250,l9_269);
float l9_270=l9_269;
vec3 l9_271=sc_SamplingCoordsViewToGlobal(vec2(l9_266,l9_268),transmissionTextureLayout,transmissionTextureGetStereoViewIndex());
vec4 l9_272=texture(transmissionTextureArrSC,l9_271,0.0);
vec4 l9_273;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_273=mix(transmissionTextureBorderColor,l9_272,vec4(l9_270));
}
#else
{
l9_273=l9_272;
}
#endif
l9_249=l9_273;
}
#else
{
bool l9_274=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_transmissionTexture)!=0));
float l9_275=l9_248.x;
sc_SoftwareWrapEarly(l9_275,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x);
float l9_276=l9_275;
float l9_277=l9_248.y;
sc_SoftwareWrapEarly(l9_277,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y);
float l9_278=l9_277;
vec2 l9_279;
float l9_280;
#if (SC_USE_UV_MIN_MAX_transmissionTexture)
{
bool l9_281;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_281=ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x==3;
}
#else
{
l9_281=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0);
}
#endif
float l9_282=l9_276;
float l9_283=1.0;
sc_ClampUV(l9_282,transmissionTextureUvMinMax.x,transmissionTextureUvMinMax.z,l9_281,l9_283);
float l9_284=l9_282;
float l9_285=l9_283;
bool l9_286;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_286=ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y==3;
}
#else
{
l9_286=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture)!=0);
}
#endif
float l9_287=l9_278;
float l9_288=l9_285;
sc_ClampUV(l9_287,transmissionTextureUvMinMax.y,transmissionTextureUvMinMax.w,l9_286,l9_288);
l9_280=l9_288;
l9_279=vec2(l9_284,l9_287);
}
#else
{
l9_280=1.0;
l9_279=vec2(l9_276,l9_278);
}
#endif
vec2 l9_289=sc_TransformUV(l9_279,(int(SC_USE_UV_TRANSFORM_transmissionTexture)!=0),transmissionTextureTransform);
float l9_290=l9_289.x;
float l9_291=l9_280;
sc_SoftwareWrapLate(l9_290,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).x,l9_274,l9_291);
float l9_292=l9_289.y;
float l9_293=l9_291;
sc_SoftwareWrapLate(l9_292,ivec2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture).y,l9_274,l9_293);
float l9_294=l9_293;
vec3 l9_295=sc_SamplingCoordsViewToGlobal(vec2(l9_290,l9_292),transmissionTextureLayout,transmissionTextureGetStereoViewIndex());
vec4 l9_296=texture(transmissionTexture,l9_295.xy,0.0);
vec4 l9_297;
#if (SC_USE_CLAMP_TO_BORDER_transmissionTexture)
{
l9_297=mix(transmissionTextureBorderColor,l9_296,vec4(l9_294));
}
#else
{
l9_297=l9_296;
}
#endif
l9_249=l9_297;
}
#endif
l9_246=l9_249.x;
}
#else
{
l9_246=1.0;
}
#endif
vec3 l9_298=vec3(l9_246*transmissionFactor);
vec3 l9_299=vec3(l9_136);
l9_194=l9_245;
l9_193=mix(mix(vec3(0.0),l9_29.xyz,l9_298)*l9_245,vec3(0.0),l9_299)+l9_30;
l9_192=mix(mix(l9_29.xyz,vec3(0.0),l9_298),l9_29.xyz,l9_299);
}
#else
{
l9_194=vec3(0.0);
l9_193=l9_30;
l9_192=l9_29.xyz;
}
#endif
vec3 l9_300=ssLinear_to_SRGB(l9_192);
float l9_301;
#if (SC_DEVICE_CLASS>=2)
{
l9_301=pow(l9_29.w,0.45454544);
}
#else
{
l9_301=sqrt(l9_29.w);
}
#endif
vec3 l9_302=ssLinear_to_SRGB(l9_193);
vec4 l9_303;
#if (ENABLE_SHEEN)
{
vec3 l9_304;
#if (ENABLE_SHEEN_COLOR_TEX)
{
vec2 l9_305=N3_getUV(Tweak_N32);
vec2 l9_306;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM)!=0))
{
l9_306=N3_uvTransform(l9_305,sheenColorTexture_offset,sheenColorTexture_scale,sheenColorTexture_rotation);
}
else
{
l9_306=l9_305;
}
vec4 l9_307;
#if (sheenColorTextureLayout==2)
{
bool l9_308=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sheenColorTexture)!=0));
float l9_309=l9_306.x;
sc_SoftwareWrapEarly(l9_309,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x);
float l9_310=l9_309;
float l9_311=l9_306.y;
sc_SoftwareWrapEarly(l9_311,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y);
float l9_312=l9_311;
vec2 l9_313;
float l9_314;
#if (SC_USE_UV_MIN_MAX_sheenColorTexture)
{
bool l9_315;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_315=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x==3;
}
#else
{
l9_315=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0);
}
#endif
float l9_316=l9_310;
float l9_317=1.0;
sc_ClampUV(l9_316,sheenColorTextureUvMinMax.x,sheenColorTextureUvMinMax.z,l9_315,l9_317);
float l9_318=l9_316;
float l9_319=l9_317;
bool l9_320;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_320=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y==3;
}
#else
{
l9_320=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0);
}
#endif
float l9_321=l9_312;
float l9_322=l9_319;
sc_ClampUV(l9_321,sheenColorTextureUvMinMax.y,sheenColorTextureUvMinMax.w,l9_320,l9_322);
l9_314=l9_322;
l9_313=vec2(l9_318,l9_321);
}
#else
{
l9_314=1.0;
l9_313=vec2(l9_310,l9_312);
}
#endif
vec2 l9_323=sc_TransformUV(l9_313,(int(SC_USE_UV_TRANSFORM_sheenColorTexture)!=0),sheenColorTextureTransform);
float l9_324=l9_323.x;
float l9_325=l9_314;
sc_SoftwareWrapLate(l9_324,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x,l9_308,l9_325);
float l9_326=l9_323.y;
float l9_327=l9_325;
sc_SoftwareWrapLate(l9_326,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y,l9_308,l9_327);
float l9_328=l9_327;
vec3 l9_329=sc_SamplingCoordsViewToGlobal(vec2(l9_324,l9_326),sheenColorTextureLayout,sheenColorTextureGetStereoViewIndex());
vec4 l9_330=texture(sheenColorTextureArrSC,l9_329,0.0);
vec4 l9_331;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_331=mix(sheenColorTextureBorderColor,l9_330,vec4(l9_328));
}
#else
{
l9_331=l9_330;
}
#endif
l9_307=l9_331;
}
#else
{
bool l9_332=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sheenColorTexture)!=0));
float l9_333=l9_306.x;
sc_SoftwareWrapEarly(l9_333,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x);
float l9_334=l9_333;
float l9_335=l9_306.y;
sc_SoftwareWrapEarly(l9_335,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y);
float l9_336=l9_335;
vec2 l9_337;
float l9_338;
#if (SC_USE_UV_MIN_MAX_sheenColorTexture)
{
bool l9_339;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_339=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x==3;
}
#else
{
l9_339=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0);
}
#endif
float l9_340=l9_334;
float l9_341=1.0;
sc_ClampUV(l9_340,sheenColorTextureUvMinMax.x,sheenColorTextureUvMinMax.z,l9_339,l9_341);
float l9_342=l9_340;
float l9_343=l9_341;
bool l9_344;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_344=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y==3;
}
#else
{
l9_344=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture)!=0);
}
#endif
float l9_345=l9_336;
float l9_346=l9_343;
sc_ClampUV(l9_345,sheenColorTextureUvMinMax.y,sheenColorTextureUvMinMax.w,l9_344,l9_346);
l9_338=l9_346;
l9_337=vec2(l9_342,l9_345);
}
#else
{
l9_338=1.0;
l9_337=vec2(l9_334,l9_336);
}
#endif
vec2 l9_347=sc_TransformUV(l9_337,(int(SC_USE_UV_TRANSFORM_sheenColorTexture)!=0),sheenColorTextureTransform);
float l9_348=l9_347.x;
float l9_349=l9_338;
sc_SoftwareWrapLate(l9_348,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).x,l9_332,l9_349);
float l9_350=l9_347.y;
float l9_351=l9_349;
sc_SoftwareWrapLate(l9_350,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture).y,l9_332,l9_351);
float l9_352=l9_351;
vec3 l9_353=sc_SamplingCoordsViewToGlobal(vec2(l9_348,l9_350),sheenColorTextureLayout,sheenColorTextureGetStereoViewIndex());
vec4 l9_354=texture(sheenColorTexture,l9_353.xy,0.0);
vec4 l9_355;
#if (SC_USE_CLAMP_TO_BORDER_sheenColorTexture)
{
l9_355=mix(sheenColorTextureBorderColor,l9_354,vec4(l9_352));
}
#else
{
l9_355=l9_354;
}
#endif
l9_307=l9_355;
}
#endif
l9_304=sheenColorFactor*ssSRGB_to_Linear(l9_307.xyz);
}
#else
{
l9_304=sheenColorFactor;
}
#endif
float l9_356;
#if (ENABLE_SHEEN_ROUGHNESS_TEX)
{
vec2 l9_357=N3_getUV(Tweak_N37);
vec2 l9_358;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM)!=0))
{
l9_358=N3_uvTransform(l9_357,sheenRoughnessTexture_offset,sheenRoughnessTexture_scale,sheenRoughnessTexture_rotation);
}
else
{
l9_358=l9_357;
}
vec4 l9_359;
#if (sheenRoughnessTextureLayout==2)
{
bool l9_360=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sheenRoughnessTexture)!=0));
float l9_361=l9_358.x;
sc_SoftwareWrapEarly(l9_361,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x);
float l9_362=l9_361;
float l9_363=l9_358.y;
sc_SoftwareWrapEarly(l9_363,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y);
float l9_364=l9_363;
vec2 l9_365;
float l9_366;
#if (SC_USE_UV_MIN_MAX_sheenRoughnessTexture)
{
bool l9_367;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_367=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x==3;
}
#else
{
l9_367=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0);
}
#endif
float l9_368=l9_362;
float l9_369=1.0;
sc_ClampUV(l9_368,sheenRoughnessTextureUvMinMax.x,sheenRoughnessTextureUvMinMax.z,l9_367,l9_369);
float l9_370=l9_368;
float l9_371=l9_369;
bool l9_372;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_372=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y==3;
}
#else
{
l9_372=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0);
}
#endif
float l9_373=l9_364;
float l9_374=l9_371;
sc_ClampUV(l9_373,sheenRoughnessTextureUvMinMax.y,sheenRoughnessTextureUvMinMax.w,l9_372,l9_374);
l9_366=l9_374;
l9_365=vec2(l9_370,l9_373);
}
#else
{
l9_366=1.0;
l9_365=vec2(l9_362,l9_364);
}
#endif
vec2 l9_375=sc_TransformUV(l9_365,(int(SC_USE_UV_TRANSFORM_sheenRoughnessTexture)!=0),sheenRoughnessTextureTransform);
float l9_376=l9_375.x;
float l9_377=l9_366;
sc_SoftwareWrapLate(l9_376,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x,l9_360,l9_377);
float l9_378=l9_375.y;
float l9_379=l9_377;
sc_SoftwareWrapLate(l9_378,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y,l9_360,l9_379);
float l9_380=l9_379;
vec3 l9_381=sc_SamplingCoordsViewToGlobal(vec2(l9_376,l9_378),sheenRoughnessTextureLayout,sheenRoughnessTextureGetStereoViewIndex());
vec4 l9_382=texture(sheenRoughnessTextureArrSC,l9_381,0.0);
vec4 l9_383;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_383=mix(sheenRoughnessTextureBorderColor,l9_382,vec4(l9_380));
}
#else
{
l9_383=l9_382;
}
#endif
l9_359=l9_383;
}
#else
{
bool l9_384=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sheenRoughnessTexture)!=0));
float l9_385=l9_358.x;
sc_SoftwareWrapEarly(l9_385,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x);
float l9_386=l9_385;
float l9_387=l9_358.y;
sc_SoftwareWrapEarly(l9_387,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y);
float l9_388=l9_387;
vec2 l9_389;
float l9_390;
#if (SC_USE_UV_MIN_MAX_sheenRoughnessTexture)
{
bool l9_391;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_391=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x==3;
}
#else
{
l9_391=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0);
}
#endif
float l9_392=l9_386;
float l9_393=1.0;
sc_ClampUV(l9_392,sheenRoughnessTextureUvMinMax.x,sheenRoughnessTextureUvMinMax.z,l9_391,l9_393);
float l9_394=l9_392;
float l9_395=l9_393;
bool l9_396;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_396=ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y==3;
}
#else
{
l9_396=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)!=0);
}
#endif
float l9_397=l9_388;
float l9_398=l9_395;
sc_ClampUV(l9_397,sheenRoughnessTextureUvMinMax.y,sheenRoughnessTextureUvMinMax.w,l9_396,l9_398);
l9_390=l9_398;
l9_389=vec2(l9_394,l9_397);
}
#else
{
l9_390=1.0;
l9_389=vec2(l9_386,l9_388);
}
#endif
vec2 l9_399=sc_TransformUV(l9_389,(int(SC_USE_UV_TRANSFORM_sheenRoughnessTexture)!=0),sheenRoughnessTextureTransform);
float l9_400=l9_399.x;
float l9_401=l9_390;
sc_SoftwareWrapLate(l9_400,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).x,l9_384,l9_401);
float l9_402=l9_399.y;
float l9_403=l9_401;
sc_SoftwareWrapLate(l9_402,ivec2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture).y,l9_384,l9_403);
float l9_404=l9_403;
vec3 l9_405=sc_SamplingCoordsViewToGlobal(vec2(l9_400,l9_402),sheenRoughnessTextureLayout,sheenRoughnessTextureGetStereoViewIndex());
vec4 l9_406=texture(sheenRoughnessTexture,l9_405.xy,0.0);
vec4 l9_407;
#if (SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture)
{
l9_407=mix(sheenRoughnessTextureBorderColor,l9_406,vec4(l9_404));
}
#else
{
l9_407=l9_406;
}
#endif
l9_359=l9_407;
}
#endif
l9_356=sheenRoughnessFactor*ssSRGB_to_Linear(l9_359.w);
}
#else
{
l9_356=sheenRoughnessFactor;
}
#endif
float l9_408=max(l9_356,9.9999997e-05);
vec3 l9_409=tempGlobals.SurfacePosition_WorldSpace;
vec3 l9_410=normalize(sc_Camera.position-l9_409);
float l9_411=dot(l9_84,l9_410);
float l9_412=max(clamp(l9_411,0.0,1.0),9.9999997e-05);
float l9_413=l9_408*l9_408;
vec3 l9_414=reflect(-l9_410,l9_84);
bool l9_415=l9_408<0.25;
float l9_416;
if (l9_415)
{
l9_416=(((-339.20001)*l9_413)+(161.39999*l9_408))-25.9;
}
else
{
l9_416=(((-8.4799995)*l9_413)+(14.3*l9_408))-9.9499998;
}
float l9_417;
if (l9_415)
{
l9_417=((44.0*l9_413)-(23.700001*l9_408))+3.26;
}
else
{
l9_417=((1.97*l9_413)-(3.27*l9_408))+0.72000003;
}
float l9_418=l9_416*l9_412;
float l9_419=l9_418+l9_417;
float l9_420;
if (l9_415)
{
l9_420=0.0;
}
else
{
l9_420=0.1*(l9_408-0.25);
}
float l9_421=exp(l9_419)+l9_420;
vec3 l9_422=sampleSpecularEnvTextureLod(normalize(l9_414),3.0+((((l9_408*4.0)-0.0)*2.0)/5.000001));
vec3 l9_423=((l9_422*sc_EnvmapExposure)+vec3(1e-06))*l9_304;
vec3 l9_424=(vec3(0.0)+(l9_423*clamp(l9_421*3.1415927,0.0,1.0))).xyz;
vec3 l9_425;
if (sc_DirectionalLightsCount>0)
{
vec3 l9_426;
l9_426=vec3(0.0);
vec3 l9_427;
int l9_428=0;
bool l9_429;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
l9_429=l9_428<sc_DirectionalLightsCount;
if (l9_429)
{
vec3 l9_430;
if (l9_429)
{
l9_430=sc_DirectionalLights[l9_428].color.xyz;
}
else
{
l9_430=vec3(0.0);
}
float l9_431;
if (l9_429)
{
l9_431=sc_DirectionalLights[l9_428].color.w;
}
else
{
l9_431=0.0;
}
vec3 l9_432=l9_430*l9_431;
vec3 l9_433;
if (l9_429)
{
l9_433=-sc_DirectionalLights[l9_428].direction;
}
else
{
l9_433=vec3(0.0);
}
vec3 l9_434=normalize(-l9_433);
float l9_435=clamp(dot(l9_84,l9_434),0.0,1.0);
l9_427=l9_426+(((((l9_432*3.1415901)*l9_304)*N3_charlieD(l9_413,clamp(dot(l9_84,normalize(l9_434+l9_410)),0.0,1.0)))*(1.0/(4.0*((l9_435+l9_412)-(l9_435*l9_412)))))*l9_435);
l9_426=l9_427;
l9_428++;
continue;
}
else
{
break;
}
}
l9_425=l9_426;
}
else
{
l9_425=vec3(0.0);
}
vec3 l9_436;
if (sc_PointLightsCount>0)
{
vec3 l9_437;
l9_437=l9_425;
vec3 l9_438;
int l9_439=0;
bool l9_440;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
l9_440=l9_439<sc_PointLightsCount;
if (l9_440)
{
vec3 l9_441;
if (l9_440)
{
l9_441=sc_PointLights[l9_439].color.xyz;
}
else
{
l9_441=vec3(0.0);
}
float l9_442;
if (l9_440)
{
l9_442=sc_PointLights[l9_439].color.w;
}
else
{
l9_442=0.0;
}
vec3 l9_443=l9_441*l9_442;
vec3 l9_444;
if (l9_440)
{
l9_444=sc_PointLights[l9_439].position;
}
else
{
l9_444=vec3(0.0);
}
vec3 l9_445=normalize(l9_444-tempGlobals.SurfacePosition_WorldSpace);
float l9_446=clamp(dot(l9_84,l9_445),0.0,1.0);
l9_438=l9_437+(((((l9_443*3.1415901)*l9_304)*N3_charlieD(l9_413,clamp(dot(l9_84,normalize(l9_445+l9_410)),0.0,1.0)))*(1.0/(4.0*((l9_446+l9_412)-(l9_446*l9_412)))))*l9_446);
l9_437=l9_438;
l9_439++;
continue;
}
else
{
break;
}
}
l9_436=l9_437;
}
else
{
l9_436=l9_425;
}
vec3 l9_447;
if (sc_AmbientLightsCount>0)
{
vec3 l9_448;
l9_448=l9_436;
vec3 l9_449;
int l9_450=0;
bool l9_451;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
l9_451=l9_450<sc_AmbientLightsCount;
if (l9_451)
{
vec3 l9_452;
if (l9_451)
{
l9_452=sc_AmbientLights[l9_450].color;
}
else
{
l9_452=vec3(0.0);
}
float l9_453;
if (l9_451)
{
l9_453=sc_AmbientLights[l9_450].intensity;
}
else
{
l9_453=0.0;
}
l9_449=l9_448+(((l9_452*l9_453)/vec3(3.1415901))*l9_304);
l9_448=l9_449;
l9_450++;
continue;
}
else
{
break;
}
}
l9_447=l9_448;
}
else
{
l9_447=l9_436;
}
vec3 l9_454=mix(l9_424,l9_424*l9_137.xyz,vec3(l9_137.w)).xyz+l9_447;
vec4 l9_455=vec4(l9_454.x,l9_454.y,l9_454.z,vec4(0.0).w);
l9_455.w=1.0-(max(max(l9_304.x,l9_304.y),l9_304.z)*0.15700001);
l9_303=l9_455;
}
#else
{
l9_303=vec4(0.0);
}
#endif
float l9_456;
vec3 l9_457;
float l9_458;
#if (ENABLE_CLEARCOAT)
{
float l9_459;
#if (ENABLE_CLEARCOAT_TEX)
{
vec2 l9_460=N3_getUV(Tweak_N44);
vec2 l9_461;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_CLEARCOAT_TEXTURE_TRANSFORM)!=0))
{
l9_461=N3_uvTransform(l9_460,clearcoatTexture_offset,clearcoatTexture_scale,clearcoatTexture_rotation);
}
else
{
l9_461=l9_460;
}
vec4 l9_462;
#if (clearcoatTextureLayout==2)
{
bool l9_463=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatTexture)!=0));
float l9_464=l9_461.x;
sc_SoftwareWrapEarly(l9_464,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x);
float l9_465=l9_464;
float l9_466=l9_461.y;
sc_SoftwareWrapEarly(l9_466,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y);
float l9_467=l9_466;
vec2 l9_468;
float l9_469;
#if (SC_USE_UV_MIN_MAX_clearcoatTexture)
{
bool l9_470;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_470=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x==3;
}
#else
{
l9_470=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0);
}
#endif
float l9_471=l9_465;
float l9_472=1.0;
sc_ClampUV(l9_471,clearcoatTextureUvMinMax.x,clearcoatTextureUvMinMax.z,l9_470,l9_472);
float l9_473=l9_471;
float l9_474=l9_472;
bool l9_475;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_475=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y==3;
}
#else
{
l9_475=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0);
}
#endif
float l9_476=l9_467;
float l9_477=l9_474;
sc_ClampUV(l9_476,clearcoatTextureUvMinMax.y,clearcoatTextureUvMinMax.w,l9_475,l9_477);
l9_469=l9_477;
l9_468=vec2(l9_473,l9_476);
}
#else
{
l9_469=1.0;
l9_468=vec2(l9_465,l9_467);
}
#endif
vec2 l9_478=sc_TransformUV(l9_468,(int(SC_USE_UV_TRANSFORM_clearcoatTexture)!=0),clearcoatTextureTransform);
float l9_479=l9_478.x;
float l9_480=l9_469;
sc_SoftwareWrapLate(l9_479,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x,l9_463,l9_480);
float l9_481=l9_478.y;
float l9_482=l9_480;
sc_SoftwareWrapLate(l9_481,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y,l9_463,l9_482);
float l9_483=l9_482;
vec3 l9_484=sc_SamplingCoordsViewToGlobal(vec2(l9_479,l9_481),clearcoatTextureLayout,clearcoatTextureGetStereoViewIndex());
vec4 l9_485=texture(clearcoatTextureArrSC,l9_484,0.0);
vec4 l9_486;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_486=mix(clearcoatTextureBorderColor,l9_485,vec4(l9_483));
}
#else
{
l9_486=l9_485;
}
#endif
l9_462=l9_486;
}
#else
{
bool l9_487=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatTexture)!=0));
float l9_488=l9_461.x;
sc_SoftwareWrapEarly(l9_488,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x);
float l9_489=l9_488;
float l9_490=l9_461.y;
sc_SoftwareWrapEarly(l9_490,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y);
float l9_491=l9_490;
vec2 l9_492;
float l9_493;
#if (SC_USE_UV_MIN_MAX_clearcoatTexture)
{
bool l9_494;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_494=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x==3;
}
#else
{
l9_494=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0);
}
#endif
float l9_495=l9_489;
float l9_496=1.0;
sc_ClampUV(l9_495,clearcoatTextureUvMinMax.x,clearcoatTextureUvMinMax.z,l9_494,l9_496);
float l9_497=l9_495;
float l9_498=l9_496;
bool l9_499;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_499=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y==3;
}
#else
{
l9_499=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture)!=0);
}
#endif
float l9_500=l9_491;
float l9_501=l9_498;
sc_ClampUV(l9_500,clearcoatTextureUvMinMax.y,clearcoatTextureUvMinMax.w,l9_499,l9_501);
l9_493=l9_501;
l9_492=vec2(l9_497,l9_500);
}
#else
{
l9_493=1.0;
l9_492=vec2(l9_489,l9_491);
}
#endif
vec2 l9_502=sc_TransformUV(l9_492,(int(SC_USE_UV_TRANSFORM_clearcoatTexture)!=0),clearcoatTextureTransform);
float l9_503=l9_502.x;
float l9_504=l9_493;
sc_SoftwareWrapLate(l9_503,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).x,l9_487,l9_504);
float l9_505=l9_502.y;
float l9_506=l9_504;
sc_SoftwareWrapLate(l9_505,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture).y,l9_487,l9_506);
float l9_507=l9_506;
vec3 l9_508=sc_SamplingCoordsViewToGlobal(vec2(l9_503,l9_505),clearcoatTextureLayout,clearcoatTextureGetStereoViewIndex());
vec4 l9_509=texture(clearcoatTexture,l9_508.xy,0.0);
vec4 l9_510;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatTexture)
{
l9_510=mix(clearcoatTextureBorderColor,l9_509,vec4(l9_507));
}
#else
{
l9_510=l9_509;
}
#endif
l9_462=l9_510;
}
#endif
l9_459=ssSRGB_to_Linear(l9_462.x);
}
#else
{
l9_459=1.0;
}
#endif
float l9_511=l9_459*clearcoatFactor;
float l9_512;
#if (ENABLE_CLEARCOAT_ROUGHNESS_TEX)
{
vec2 l9_513=N3_getUV(Tweak_N60);
vec2 l9_514;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM)!=0))
{
l9_514=N3_uvTransform(l9_513,clearcoatRoughnessTexture_offset,clearcoatRoughnessTexture_scale,clearcoatRoughnessTexture_rotation);
}
else
{
l9_514=l9_513;
}
vec4 l9_515;
#if (clearcoatRoughnessTextureLayout==2)
{
bool l9_516=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture)!=0));
float l9_517=l9_514.x;
sc_SoftwareWrapEarly(l9_517,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x);
float l9_518=l9_517;
float l9_519=l9_514.y;
sc_SoftwareWrapEarly(l9_519,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y);
float l9_520=l9_519;
vec2 l9_521;
float l9_522;
#if (SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture)
{
bool l9_523;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_523=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x==3;
}
#else
{
l9_523=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0);
}
#endif
float l9_524=l9_518;
float l9_525=1.0;
sc_ClampUV(l9_524,clearcoatRoughnessTextureUvMinMax.x,clearcoatRoughnessTextureUvMinMax.z,l9_523,l9_525);
float l9_526=l9_524;
float l9_527=l9_525;
bool l9_528;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_528=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y==3;
}
#else
{
l9_528=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0);
}
#endif
float l9_529=l9_520;
float l9_530=l9_527;
sc_ClampUV(l9_529,clearcoatRoughnessTextureUvMinMax.y,clearcoatRoughnessTextureUvMinMax.w,l9_528,l9_530);
l9_522=l9_530;
l9_521=vec2(l9_526,l9_529);
}
#else
{
l9_522=1.0;
l9_521=vec2(l9_518,l9_520);
}
#endif
vec2 l9_531=sc_TransformUV(l9_521,(int(SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture)!=0),clearcoatRoughnessTextureTransform);
float l9_532=l9_531.x;
float l9_533=l9_522;
sc_SoftwareWrapLate(l9_532,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x,l9_516,l9_533);
float l9_534=l9_531.y;
float l9_535=l9_533;
sc_SoftwareWrapLate(l9_534,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y,l9_516,l9_535);
float l9_536=l9_535;
vec3 l9_537=sc_SamplingCoordsViewToGlobal(vec2(l9_532,l9_534),clearcoatRoughnessTextureLayout,clearcoatRoughnessTextureGetStereoViewIndex());
vec4 l9_538=texture(clearcoatRoughnessTextureArrSC,l9_537,0.0);
vec4 l9_539;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_539=mix(clearcoatRoughnessTextureBorderColor,l9_538,vec4(l9_536));
}
#else
{
l9_539=l9_538;
}
#endif
l9_515=l9_539;
}
#else
{
bool l9_540=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture)!=0));
float l9_541=l9_514.x;
sc_SoftwareWrapEarly(l9_541,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x);
float l9_542=l9_541;
float l9_543=l9_514.y;
sc_SoftwareWrapEarly(l9_543,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y);
float l9_544=l9_543;
vec2 l9_545;
float l9_546;
#if (SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture)
{
bool l9_547;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_547=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x==3;
}
#else
{
l9_547=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0);
}
#endif
float l9_548=l9_542;
float l9_549=1.0;
sc_ClampUV(l9_548,clearcoatRoughnessTextureUvMinMax.x,clearcoatRoughnessTextureUvMinMax.z,l9_547,l9_549);
float l9_550=l9_548;
float l9_551=l9_549;
bool l9_552;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_552=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y==3;
}
#else
{
l9_552=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)!=0);
}
#endif
float l9_553=l9_544;
float l9_554=l9_551;
sc_ClampUV(l9_553,clearcoatRoughnessTextureUvMinMax.y,clearcoatRoughnessTextureUvMinMax.w,l9_552,l9_554);
l9_546=l9_554;
l9_545=vec2(l9_550,l9_553);
}
#else
{
l9_546=1.0;
l9_545=vec2(l9_542,l9_544);
}
#endif
vec2 l9_555=sc_TransformUV(l9_545,(int(SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture)!=0),clearcoatRoughnessTextureTransform);
float l9_556=l9_555.x;
float l9_557=l9_546;
sc_SoftwareWrapLate(l9_556,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).x,l9_540,l9_557);
float l9_558=l9_555.y;
float l9_559=l9_557;
sc_SoftwareWrapLate(l9_558,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture).y,l9_540,l9_559);
float l9_560=l9_559;
vec3 l9_561=sc_SamplingCoordsViewToGlobal(vec2(l9_556,l9_558),clearcoatRoughnessTextureLayout,clearcoatRoughnessTextureGetStereoViewIndex());
vec4 l9_562=texture(clearcoatRoughnessTexture,l9_561.xy,0.0);
vec4 l9_563;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture)
{
l9_563=mix(clearcoatRoughnessTextureBorderColor,l9_562,vec4(l9_560));
}
#else
{
l9_563=l9_562;
}
#endif
l9_515=l9_563;
}
#endif
l9_512=ssSRGB_to_Linear(l9_515.y);
}
#else
{
l9_512=1.0;
}
#endif
float l9_564=l9_512*clearcoatRoughnessFactor;
vec3 l9_565;
#if (ENABLE_CLEARCOAT_NORMAL_TEX)
{
vec2 l9_566=N3_getUV(Tweak_N47);
vec2 l9_567;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM)!=0))
{
l9_567=N3_uvTransform(l9_566,clearcoatNormalTexture_offset,clearcoatNormalTexture_scale,clearcoatNormalTexture_rotation);
}
else
{
l9_567=l9_566;
}
vec4 l9_568;
#if (clearcoatNormalTextureLayout==2)
{
bool l9_569=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatNormalTexture)!=0));
float l9_570=l9_567.x;
sc_SoftwareWrapEarly(l9_570,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x);
float l9_571=l9_570;
float l9_572=l9_567.y;
sc_SoftwareWrapEarly(l9_572,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y);
float l9_573=l9_572;
vec2 l9_574;
float l9_575;
#if (SC_USE_UV_MIN_MAX_clearcoatNormalTexture)
{
bool l9_576;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_576=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x==3;
}
#else
{
l9_576=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0);
}
#endif
float l9_577=l9_571;
float l9_578=1.0;
sc_ClampUV(l9_577,clearcoatNormalTextureUvMinMax.x,clearcoatNormalTextureUvMinMax.z,l9_576,l9_578);
float l9_579=l9_577;
float l9_580=l9_578;
bool l9_581;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_581=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y==3;
}
#else
{
l9_581=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0);
}
#endif
float l9_582=l9_573;
float l9_583=l9_580;
sc_ClampUV(l9_582,clearcoatNormalTextureUvMinMax.y,clearcoatNormalTextureUvMinMax.w,l9_581,l9_583);
l9_575=l9_583;
l9_574=vec2(l9_579,l9_582);
}
#else
{
l9_575=1.0;
l9_574=vec2(l9_571,l9_573);
}
#endif
vec2 l9_584=sc_TransformUV(l9_574,(int(SC_USE_UV_TRANSFORM_clearcoatNormalTexture)!=0),clearcoatNormalTextureTransform);
float l9_585=l9_584.x;
float l9_586=l9_575;
sc_SoftwareWrapLate(l9_585,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x,l9_569,l9_586);
float l9_587=l9_584.y;
float l9_588=l9_586;
sc_SoftwareWrapLate(l9_587,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y,l9_569,l9_588);
float l9_589=l9_588;
vec3 l9_590=sc_SamplingCoordsViewToGlobal(vec2(l9_585,l9_587),clearcoatNormalTextureLayout,clearcoatNormalTextureGetStereoViewIndex());
vec4 l9_591=texture(clearcoatNormalTextureArrSC,l9_590,0.0);
vec4 l9_592;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_592=mix(clearcoatNormalTextureBorderColor,l9_591,vec4(l9_589));
}
#else
{
l9_592=l9_591;
}
#endif
l9_568=l9_592;
}
#else
{
bool l9_593=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_clearcoatNormalTexture)!=0));
float l9_594=l9_567.x;
sc_SoftwareWrapEarly(l9_594,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x);
float l9_595=l9_594;
float l9_596=l9_567.y;
sc_SoftwareWrapEarly(l9_596,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y);
float l9_597=l9_596;
vec2 l9_598;
float l9_599;
#if (SC_USE_UV_MIN_MAX_clearcoatNormalTexture)
{
bool l9_600;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_600=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x==3;
}
#else
{
l9_600=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0);
}
#endif
float l9_601=l9_595;
float l9_602=1.0;
sc_ClampUV(l9_601,clearcoatNormalTextureUvMinMax.x,clearcoatNormalTextureUvMinMax.z,l9_600,l9_602);
float l9_603=l9_601;
float l9_604=l9_602;
bool l9_605;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_605=ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y==3;
}
#else
{
l9_605=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)!=0);
}
#endif
float l9_606=l9_597;
float l9_607=l9_604;
sc_ClampUV(l9_606,clearcoatNormalTextureUvMinMax.y,clearcoatNormalTextureUvMinMax.w,l9_605,l9_607);
l9_599=l9_607;
l9_598=vec2(l9_603,l9_606);
}
#else
{
l9_599=1.0;
l9_598=vec2(l9_595,l9_597);
}
#endif
vec2 l9_608=sc_TransformUV(l9_598,(int(SC_USE_UV_TRANSFORM_clearcoatNormalTexture)!=0),clearcoatNormalTextureTransform);
float l9_609=l9_608.x;
float l9_610=l9_599;
sc_SoftwareWrapLate(l9_609,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).x,l9_593,l9_610);
float l9_611=l9_608.y;
float l9_612=l9_610;
sc_SoftwareWrapLate(l9_611,ivec2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture).y,l9_593,l9_612);
float l9_613=l9_612;
vec3 l9_614=sc_SamplingCoordsViewToGlobal(vec2(l9_609,l9_611),clearcoatNormalTextureLayout,clearcoatNormalTextureGetStereoViewIndex());
vec4 l9_615=texture(clearcoatNormalTexture,l9_614.xy,0.0);
vec4 l9_616;
#if (SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture)
{
l9_616=mix(clearcoatNormalTextureBorderColor,l9_615,vec4(l9_613));
}
#else
{
l9_616=l9_615;
}
#endif
l9_568=l9_616;
}
#endif
l9_565=l9_568.xyz*0.9921875;
}
#else
{
l9_565=vec3(0.0,0.0,1.0);
}
#endif
l9_458=l9_564;
l9_457=l9_565;
l9_456=l9_511;
}
#else
{
l9_458=0.0;
l9_457=vec3(0.0);
l9_456=0.0;
}
#endif
vec3 l9_617;
#if (!sc_ProjectiveShadowsCaster)
{
l9_617=l9_84;
}
#else
{
l9_617=vec3(0.0);
}
#endif
float l9_618=clamp(l9_301,0.0,1.0);
ngsAlphaTest(l9_618);
vec3 l9_619=max(l9_300,vec3(0.0));
vec4 l9_620;
#if (sc_ProjectiveShadowsCaster)
{
l9_620=vec4(l9_619,l9_618);
}
#else
{
l9_620=ngsCalculateLighting(l9_619,l9_618,l9_617,l9_8,l9_9,max(l9_302,vec3(0.0)),clamp(l9_136,0.0,1.0),clamp(l9_138,0.0,1.0),clamp(l9_137.xyz,vec3(0.0),vec3(1.0)),Port_SpecularAO_N036);
}
#endif
vec4 l9_621=max(l9_620,vec4(0.0));
vec3 l9_622;
#if (!sc_ProjectiveShadowsCaster)
{
l9_622=mat3(l9_6,l9_5,l9_7)*l9_457;
}
#else
{
l9_622=vec3(0.0);
}
#endif
ngsAlphaTest(Port_Opacity_N405);
vec4 l9_623;
#if (sc_ProjectiveShadowsCaster)
{
l9_623=vec4(Port_Albedo_N405,Port_Opacity_N405);
}
#else
{
l9_623=ngsCalculateLighting(Port_Albedo_N405,Port_Opacity_N405,l9_622,l9_8,l9_9,Port_Emissive_N405,Port_Metallic_N405,clamp(l9_458,0.0,1.0),vec3(1.0),Port_SpecularAO_N405);
}
#endif
vec4 l9_624=max(l9_623,vec4(0.0));
tempGlobals=l9_18;
vec4 l9_625;
if (((int(ENABLE_SHEEN)!=0)||(int(ENABLE_TRANSMISSION)!=0))||(int(ENABLE_CLEARCOAT)!=0))
{
vec4 l9_626=ssSRGB_to_Linear(l9_621);
vec4 l9_627;
#if (ENABLE_SHEEN)
{
vec3 l9_628=(l9_626.xyz*l9_303.w)+l9_303.xyz;
l9_627=vec4(l9_628.x,l9_628.y,l9_628.z,l9_626.w);
}
#else
{
l9_627=l9_626;
}
#endif
vec4 l9_629;
#if (ENABLE_TRANSMISSION)
{
vec4 l9_630=mix(vec4(l9_194,1.0),l9_627,vec4(ssSRGB_to_Linear(l9_301)));
l9_630.w=1.0;
l9_629=l9_630;
}
#else
{
l9_629=l9_627;
}
#endif
vec4 l9_631;
#if (ENABLE_CLEARCOAT)
{
vec3 l9_632=l9_629.xyz+(ssSRGB_to_Linear(l9_624)*l9_456).xyz;
l9_631=vec4(l9_632.x,l9_632.y,l9_632.z,l9_629.w);
}
#else
{
l9_631=l9_629;
}
#endif
l9_625=ssLinear_to_SRGB(l9_631);
}
else
{
l9_625=l9_621;
}
l9_19=l9_625;
}
#else
{
float l9_633;
Node40_Bool_Parameter(l9_633,l9_18);
float l9_634;
Node121_Bool_Parameter(l9_634,l9_18);
float l9_635;
Node48_Bool_Parameter(l9_635,l9_18);
float l9_636;
Node88_Bool_Parameter(l9_636,l9_18);
tempGlobals=l9_18;
vec4 l9_637;
#if (ENABLE_BASE_TEX)
{
vec2 l9_638=N35_getUV(NODE_7_DROPLIST_ITEM);
vec2 l9_639;
if ((int(ENABLE_TEXTURE_TRANSFORM)!=0)&&(int(ENABLE_BASE_TEXTURE_TRANSFORM)!=0))
{
l9_639=N35_uvTransform(l9_638,baseColorTexture_offset,baseColorTexture_scale,baseColorTexture_rotation);
}
else
{
l9_639=l9_638;
}
l9_637=baseColorFactor*ssSRGB_to_Linear(N35_BaseTexture_sample(l9_639));
}
#else
{
l9_637=baseColorFactor;
}
#endif
vec4 l9_640;
#if (ENABLE_VERTEX_COLOR_BASE)
{
l9_640=l9_637*tempGlobals.VertexColor;
}
#else
{
l9_640=l9_637;
}
#endif
l9_19=ssLinear_to_SRGB(l9_640);
}
#endif
vec4 l9_641=l9_19*vec4(colorMultiplier+1.0);
vec4 l9_642=vec4(l9_641.x,l9_641.y,l9_641.z,vec4(0.0).w);
l9_642.w=l9_19.w;
if (l9_0)
{
vec4 l9_643;
#if (sc_RayTracingCasterForceOpaque)
{
vec4 l9_644=l9_642;
l9_644.w=1.0;
l9_643=l9_644;
}
#else
{
l9_643=l9_642;
}
#endif
sc_writeFragData0Internal(max(l9_643,vec4(0.0)),sc_UniformConstants.x,sc_ShaderCacheConstant);
return;
}
vec4 l9_645;
#if (sc_ProjectiveShadowsCaster)
{
float l9_646;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_646=l9_19.w;
}
#else
{
float l9_647;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_647=clamp(l9_19.w*2.0,0.0,1.0);
}
#else
{
float l9_648;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_648=clamp(dot(l9_642.xyz,vec3(l9_19.w)),0.0,1.0);
}
#else
{
float l9_649;
#if (sc_BlendMode_AlphaTest)
{
l9_649=1.0;
}
#else
{
float l9_650;
#if (sc_BlendMode_Multiply)
{
l9_650=(1.0-dot(l9_642.xyz,vec3(0.33333001)))*l9_19.w;
}
#else
{
float l9_651;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_651=(1.0-clamp(dot(l9_642.xyz,vec3(1.0)),0.0,1.0))*l9_19.w;
}
#else
{
float l9_652;
#if (sc_BlendMode_ColoredGlass)
{
l9_652=clamp(dot(l9_642.xyz,vec3(1.0)),0.0,1.0)*l9_19.w;
}
#else
{
float l9_653;
#if (sc_BlendMode_Add)
{
l9_653=clamp(dot(l9_642.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_654;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_654=clamp(dot(l9_642.xyz,vec3(1.0)),0.0,1.0)*l9_19.w;
}
#else
{
float l9_655;
#if (sc_BlendMode_Screen)
{
l9_655=dot(l9_642.xyz,vec3(0.33333001))*l9_19.w;
}
#else
{
float l9_656;
#if (sc_BlendMode_Min)
{
l9_656=1.0-clamp(dot(l9_642.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_657;
#if (sc_BlendMode_Max)
{
l9_657=clamp(dot(l9_642.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_657=1.0;
}
#endif
l9_656=l9_657;
}
#endif
l9_655=l9_656;
}
#endif
l9_654=l9_655;
}
#endif
l9_653=l9_654;
}
#endif
l9_652=l9_653;
}
#endif
l9_651=l9_652;
}
#endif
l9_650=l9_651;
}
#endif
l9_649=l9_650;
}
#endif
l9_648=l9_649;
}
#endif
l9_647=l9_648;
}
#endif
l9_646=l9_647;
}
#endif
l9_645=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_642.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_646);
}
#else
{
vec4 l9_658;
#if (sc_RenderAlphaToColor)
{
l9_658=vec4(l9_19.w);
}
#else
{
vec4 l9_659;
#if (sc_BlendMode_Custom)
{
vec3 l9_660=sc_GetFramebufferColor().xyz;
vec3 l9_661=mix(l9_660,definedBlend(l9_660,l9_642.xyz).xyz,vec3(l9_19.w));
vec4 l9_662=vec4(l9_661.x,l9_661.y,l9_661.z,vec4(0.0).w);
l9_662.w=1.0;
l9_659=l9_662;
}
#else
{
vec4 l9_663;
#if (sc_Voxelization)
{
l9_663=vec4(varScreenPos.xyz,1.0);
}
#else
{
vec4 l9_664;
#if (sc_OutputBounds)
{
float l9_665=clamp(abs(gl_FragCoord.z),0.0,1.0);
l9_664=vec4(l9_665,1.0-l9_665,1.0,1.0);
}
#else
{
vec4 l9_666;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_666=vec4(mix(vec3(1.0),l9_642.xyz,vec3(l9_19.w)),l9_19.w);
}
#else
{
vec4 l9_667;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_668;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_668=clamp(l9_19.w,0.0,1.0);
}
#else
{
l9_668=l9_19.w;
}
#endif
l9_667=vec4(l9_642.xyz*l9_668,l9_668);
}
#else
{
l9_667=l9_642;
}
#endif
l9_666=l9_667;
}
#endif
l9_664=l9_666;
}
#endif
l9_663=l9_664;
}
#endif
l9_659=l9_663;
}
#endif
l9_658=l9_659;
}
#endif
l9_645=l9_658;
}
#endif
vec4 l9_669;
if (PreviewEnabled==1)
{
vec4 l9_670;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_670=PreviewVertexColor;
}
else
{
l9_670=vec4(0.0);
}
l9_669=l9_670;
}
else
{
l9_669=l9_645;
}
vec4 l9_671=sc_OutputMotionVectorsIfNeeded(varPos,max(l9_669,vec4(0.0)));
vec4 l9_672=clamp(l9_671,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_673=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_673-0.0039215689)),min(1.0,l9_673+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_674=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_674).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_675=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_674).xy);
float l9_676=packValue(l9_675);
int l9_683=int(l9_672.w*255.0);
float l9_684=packValue(l9_683);
sc_writeFragData0Internal(vec4(packValue(l9_675),packValue(l9_675),packValue(l9_675),packValue(l9_675)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_676,packValue(l9_675),packValue(l9_675),packValue(l9_675)));
sc_writeFragData2(vec4(l9_684,packValue(l9_683),packValue(l9_683),packValue(l9_683)));
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
vec2 l9_687=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_687).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_688[8];
int l9_689[8];
int l9_690=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_690<8)
{
l9_688[l9_690]=0;
l9_689[l9_690]=0;
l9_690++;
continue;
}
else
{
break;
}
}
int l9_691;
#if (sc_OITMaxLayers8)
{
l9_691=2;
}
#else
{
l9_691=1;
}
#endif
int l9_692=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_692<l9_691)
{
vec4 l9_693;
vec4 l9_694;
vec4 l9_695;
if (l9_692==0)
{
l9_695=texture(sc_OITAlpha0,l9_687);
l9_694=texture(sc_OITDepthLow0,l9_687);
l9_693=texture(sc_OITDepthHigh0,l9_687);
}
else
{
l9_695=vec4(0.0);
l9_694=vec4(0.0);
l9_693=vec4(0.0);
}
vec4 l9_696;
vec4 l9_697;
vec4 l9_698;
if (l9_692==1)
{
l9_698=texture(sc_OITAlpha1,l9_687);
l9_697=texture(sc_OITDepthLow1,l9_687);
l9_696=texture(sc_OITDepthHigh1,l9_687);
}
else
{
l9_698=l9_695;
l9_697=l9_694;
l9_696=l9_693;
}
if (any(notEqual(l9_696,vec4(0.0)))||any(notEqual(l9_697,vec4(0.0))))
{
int l9_699[8]=l9_688;
unpackValues(l9_696.w,l9_692,l9_699);
unpackValues(l9_696.z,l9_692,l9_699);
unpackValues(l9_696.y,l9_692,l9_699);
unpackValues(l9_696.x,l9_692,l9_699);
unpackValues(l9_697.w,l9_692,l9_699);
unpackValues(l9_697.z,l9_692,l9_699);
unpackValues(l9_697.y,l9_692,l9_699);
unpackValues(l9_697.x,l9_692,l9_699);
int l9_708[8]=l9_689;
unpackValues(l9_698.w,l9_692,l9_708);
unpackValues(l9_698.z,l9_692,l9_708);
unpackValues(l9_698.y,l9_692,l9_708);
unpackValues(l9_698.x,l9_692,l9_708);
}
l9_692++;
continue;
}
else
{
break;
}
}
vec4 l9_713=texture(sc_OITFilteredDepthBoundsTexture,l9_687);
vec2 l9_714=l9_713.xy;
int l9_715;
#if (sc_SkinBonesCount>0)
{
l9_715=encodeDepth(((1.0-l9_713.x)*1000.0)+getDepthOrderingEpsilon(),l9_714);
}
#else
{
l9_715=0;
}
#endif
int l9_716=encodeDepth(viewSpaceDepth(),l9_714);
vec4 l9_717;
l9_717=l9_672*l9_672.w;
vec4 l9_718;
int l9_719=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_719<8)
{
int l9_720=l9_688[l9_719];
int l9_721=l9_716-l9_715;
bool l9_722=l9_720<l9_721;
bool l9_723;
if (l9_722)
{
l9_723=l9_688[l9_719]>0;
}
else
{
l9_723=l9_722;
}
if (l9_723)
{
vec3 l9_724=l9_717.xyz*(1.0-(float(l9_689[l9_719])/255.0));
l9_718=vec4(l9_724.x,l9_724.y,l9_724.z,l9_717.w);
}
else
{
l9_718=l9_717;
}
l9_717=l9_718;
l9_719++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_717,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
sc_writeFragData0Internal(l9_672,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_671,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
