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
//sampler sampler baseTexSmpSC 0:24
//sampler sampler detailNormalTexSmpSC 0:25
//sampler sampler emissiveTexSmpSC 0:26
//sampler sampler intensityTextureSmpSC 0:27
//sampler sampler materialParamsTexSmpSC 0:28
//sampler sampler normalTexSmpSC 0:29
//sampler sampler opacityTexSmpSC 0:30
//sampler sampler reflectionModulationTexSmpSC 0:31
//sampler sampler reflectionTexSmpSC 0:32
//sampler sampler rimColorTexSmpSC 0:33
//sampler sampler sc_EnvmapDiffuseSmpSC 0:34
//sampler sampler sc_EnvmapSpecularSmpSC 0:35
//sampler sampler sc_OITCommonSampler 0:36
//sampler sampler sc_SSAOTextureSmpSC 0:37
//sampler sampler sc_ScreenTextureSmpSC 0:38
//sampler sampler sc_ShadowTextureSmpSC 0:39
//texture texture2D baseTex 0:0:0:24
//texture texture2D detailNormalTex 0:1:0:25
//texture texture2D emissiveTex 0:2:0:26
//texture texture2D intensityTexture 0:3:0:27
//texture texture2D materialParamsTex 0:4:0:28
//texture texture2D normalTex 0:5:0:29
//texture texture2D opacityTex 0:6:0:30
//texture texture2D reflectionModulationTex 0:7:0:31
//texture texture2D reflectionTex 0:8:0:32
//texture texture2D rimColorTex 0:9:0:33
//texture texture2D sc_EnvmapDiffuse 0:10:0:34
//texture texture2D sc_EnvmapSpecular 0:11:0:35
//texture texture2D sc_OITAlpha0 0:12:0:36
//texture texture2D sc_OITAlpha1 0:13:0:36
//texture texture2D sc_OITDepthHigh0 0:14:0:36
//texture texture2D sc_OITDepthHigh1 0:15:0:36
//texture texture2D sc_OITDepthLow0 0:16:0:36
//texture texture2D sc_OITDepthLow1 0:17:0:36
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:18:0:36
//texture texture2D sc_OITFrontDepthTexture 0:19:0:36
//texture texture2D sc_SSAOTexture 0:20:0:37
//texture texture2D sc_ScreenTexture 0:21:0:38
//texture texture2D sc_ShadowTexture 0:22:0:39
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
//spec_const bool ENABLE_MATERIAL_PARAM_TEX 33 0
//spec_const bool ENABLE_NORMALMAP 34 0
//spec_const bool ENABLE_OPACITY_TEX 35 0
//spec_const bool ENABLE_RECOLOR 36 0
//spec_const bool ENABLE_RIM_HIGHLIGHT 37 0
//spec_const bool ENABLE_RIM_INVERT 38 0
//spec_const bool ENABLE_SIMPLE_REFLECTION 39 0
//spec_const bool ENABLE_SPECULAR_AO 40 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 41 0
//spec_const bool ENABLE_UV2 42 0
//spec_const bool ENABLE_UV3 43 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 44 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 45 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTex 46 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 47 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 48 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 49 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 50 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 51 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionTex 52 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_rimColorTex 53 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 54 0
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 55 0
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTex 56 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 57 0
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 58 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 59 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 60 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionModulationTex 61 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionTex 62 0
//spec_const bool SC_USE_UV_MIN_MAX_rimColorTex 63 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 64 0
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 65 0
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTex 66 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 67 0
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 68 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 69 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 70 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionModulationTex 71 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionTex 72 0
//spec_const bool SC_USE_UV_TRANSFORM_rimColorTex 73 0
//spec_const bool Tweak_N177 74 0
//spec_const bool Tweak_N216 75 0
//spec_const bool UseViewSpaceDepthVariant 76 1
//spec_const bool baseTexHasSwappedViews 77 0
//spec_const bool detailNormalTexHasSwappedViews 78 0
//spec_const bool emissiveTexHasSwappedViews 79 0
//spec_const bool intensityTextureHasSwappedViews 80 0
//spec_const bool materialParamsTexHasSwappedViews 81 0
//spec_const bool normalTexHasSwappedViews 82 0
//spec_const bool opacityTexHasSwappedViews 83 0
//spec_const bool reflectionModulationTexHasSwappedViews 84 0
//spec_const bool reflectionTexHasSwappedViews 85 0
//spec_const bool rimColorTexHasSwappedViews 86 0
//spec_const bool sc_BlendMode_Add 87 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 88 0
//spec_const bool sc_BlendMode_AlphaTest 89 0
//spec_const bool sc_BlendMode_AlphaToCoverage 90 0
//spec_const bool sc_BlendMode_ColoredGlass 91 0
//spec_const bool sc_BlendMode_Custom 92 0
//spec_const bool sc_BlendMode_Max 93 0
//spec_const bool sc_BlendMode_Min 94 0
//spec_const bool sc_BlendMode_Multiply 95 0
//spec_const bool sc_BlendMode_MultiplyOriginal 96 0
//spec_const bool sc_BlendMode_Normal 97 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 98 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 99 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 100 0
//spec_const bool sc_BlendMode_Screen 101 0
//spec_const bool sc_BlendMode_Software 102 0
//spec_const bool sc_DepthOnly 103 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 104 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 105 0
//spec_const bool sc_FramebufferFetch 106 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 107 0
//spec_const bool sc_HasDiffuseEnvmap 108 0
//spec_const bool sc_IsEditor 109 0
//spec_const bool sc_LightEstimation 110 0
//spec_const bool sc_MotionVectorsPass 111 0
//spec_const bool sc_OITCompositingPass 112 0
//spec_const bool sc_OITDepthBoundsPass 113 0
//spec_const bool sc_OITDepthGatherPass 114 0
//spec_const bool sc_OITDepthPrepass 115 0
//spec_const bool sc_OITFrontLayerPass 116 0
//spec_const bool sc_OITMaxLayers4Plus1 117 0
//spec_const bool sc_OITMaxLayers8 118 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 119 0
//spec_const bool sc_ProjectiveShadowsCaster 120 0
//spec_const bool sc_ProjectiveShadowsReceiver 121 0
//spec_const bool sc_RenderAlphaToColor 122 0
//spec_const bool sc_SSAOEnabled 123 0
//spec_const bool sc_ScreenTextureHasSwappedViews 124 0
//spec_const bool sc_ShaderComplexityAnalyzer 125 0
//spec_const bool sc_TAAEnabled 126 0
//spec_const bool sc_UseFramebufferFetchMarker 127 0
//spec_const bool sc_VertexBlending 128 0
//spec_const bool sc_VertexBlendingUseNormals 129 0
//spec_const bool uv2EnableAnimation 130 0
//spec_const bool uv3EnableAnimation 131 0
//spec_const int NODE_13_DROPLIST_ITEM 132 0
//spec_const int NODE_181_DROPLIST_ITEM 133 0
//spec_const int NODE_184_DROPLIST_ITEM 134 0
//spec_const int NODE_221_DROPLIST_ITEM 135 0
//spec_const int NODE_228_DROPLIST_ITEM 136 0
//spec_const int NODE_27_DROPLIST_ITEM 137 0
//spec_const int NODE_315_DROPLIST_ITEM 138 0
//spec_const int NODE_38_DROPLIST_ITEM 139 0
//spec_const int NODE_49_DROPLIST_ITEM 140 0
//spec_const int NODE_69_DROPLIST_ITEM 141 0
//spec_const int NODE_76_DROPLIST_ITEM 142 0
//spec_const int SC_DEVICE_CLASS 143 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 144 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 145 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTex 146 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 147 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 148 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 149 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 150 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex 151 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionTex 152 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_rimColorTex 153 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 154 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 155 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTex 156 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 157 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 158 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 159 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 160 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex 161 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionTex 162 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_rimColorTex 163 -1
//spec_const int baseTexLayout 164 0
//spec_const int detailNormalTexLayout 165 0
//spec_const int emissiveTexLayout 166 0
//spec_const int intensityTextureLayout 167 0
//spec_const int materialParamsTexLayout 168 0
//spec_const int normalTexLayout 169 0
//spec_const int opacityTexLayout 170 0
//spec_const int reflectionModulationTexLayout 171 0
//spec_const int reflectionTexLayout 172 0
//spec_const int rimColorTexLayout 173 0
//spec_const int sc_AmbientLightMode0 174 0
//spec_const int sc_AmbientLightMode1 175 0
//spec_const int sc_AmbientLightMode2 176 0
//spec_const int sc_AmbientLightMode_Constant 177 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 178 0
//spec_const int sc_AmbientLightMode_FromCamera 179 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 180 0
//spec_const int sc_AmbientLightsCount 181 0
//spec_const int sc_DepthBufferMode 182 0
//spec_const int sc_DirectionalLightsCount 183 0
//spec_const int sc_EnvLightMode 184 0
//spec_const int sc_EnvmapDiffuseLayout 185 0
//spec_const int sc_EnvmapSpecularLayout 186 0
//spec_const int sc_LightEstimationSGCount 187 0
//spec_const int sc_MaxTextureImageUnits 188 0
//spec_const int sc_PointLightsCount 189 0
//spec_const int sc_RenderingSpace 190 -1
//spec_const int sc_ScreenTextureLayout 191 0
//spec_const int sc_ShaderCacheConstant 192 0
//spec_const int sc_SkinBonesCount 193 0
//spec_const int sc_StereoRenderingMode 194 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 195 0
//spec_const int sc_StereoViewID 196 0
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef GL_ES
    #define SC_GLES_VERSION_20 2000
    #define SC_GLES_VERSION_30 3000
    #define SC_GLES_VERSION_31 3100
    #define SC_GLES_VERSION_32 3200
#endif
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
#if defined(GL_ES)&&(__VERSION__<300)&&!defined(GL_OES_standard_derivatives)
#define dFdx(A) (A)
#define dFdy(A) (A)
#define fwidth(A) (A)
#endif
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef sc_EnableStereoClipDistance
        #if defined(GL_APPLE_clip_distance)
            #extension GL_APPLE_clip_distance : require
        #elif defined(GL_EXT_clip_cull_distance)
            #extension GL_EXT_clip_cull_distance : require
        #else
            #error Clip distance is requested but not supported by this device.
        #endif
    #endif
#else
    #ifdef sc_EnableStereoClipDistance
        #error Clip distance is requested but not supported by this device.
    #endif
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef VERTEX_SHADER
        #define attribute in
        #define varying out
    #endif
    #ifdef FRAGMENT_SHADER
        #define varying in
    #endif
    #define gl_FragColor sc_FragData0
    #define texture2D texture
    #define texture2DLod textureLod
    #define texture2DLodEXT textureLod
    #define textureCubeLodEXT textureLod
#endif
#if defined(sc_EnableMultiviewStereoRendering)
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
        #ifdef sc_EnableFeatureLevelES3
            #define sc_LocalInstanceID (sc_GlobalInstanceID/2)
            #define sc_StereoViewID (sc_GlobalInstanceID%2)
        #else
            #define sc_LocalInstanceID int(sc_GlobalInstanceID/2.0)
            #define sc_StereoViewID int(mod(sc_GlobalInstanceID,2.0))
        #endif
    #endif
#else
    #define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableInstancing
        #ifdef GL_ES
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)
                #define gl_InstanceID (0)
            #endif
        #else
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)&&!defined(GL_ARB_draw_instanced)&&!defined(GL_EXT_gpu_shader4)
                #define gl_InstanceID (0)
            #endif
        #endif
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
#endif
#ifdef VERTEX_SHADER
    #if (__VERSION__<300)&&!defined(GL_EXT_gpu_shader4)
        #define gl_VertexID (0)
    #endif
#endif
#ifndef GL_ES
        #extension GL_EXT_gpu_shader4 : enable
    #extension GL_ARB_shader_texture_lod : enable
    #ifndef texture2DLodEXT
        #define texture2DLodEXT texture2DLod
    #endif
    #define precision
    #define lowp
    #define mediump
    #define highp
    #define sc_FragmentPrecision
#endif
#ifdef sc_EnableFeatureLevelES3
    #define sc_CanUseSampler2DArray 1
#endif
#if defined(sc_EnableFeatureLevelES2)&&defined(GL_ES)
    #ifdef GL_EXT_texture_array
        #extension GL_EXT_texture_array : require
        #define sc_CanUseSampler2DArray 1
    #else
        #define sc_CanUseSampler2DArray 0
    #endif
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
#if __VERSION__>100
    #define SC_INT_FALLBACK_FLOAT int
    #define SC_INTERPOLATION_FLAT flat
    #define SC_INTERPOLATION_CENTROID centroid
#else
    #define SC_INT_FALLBACK_FLOAT float
    #define SC_INTERPOLATION_FLAT
    #define SC_INTERPOLATION_CENTROID
#endif
#ifndef sc_NumStereoViews
    #define sc_NumStereoViews 1
#endif
#ifndef sc_CanUseSampler2DArray
    #define sc_CanUseSampler2DArray 0
#endif
#if __VERSION__>=300
#define texture3D texture
#define textureCube texture
#define texture2DArray texture
#define texture2DLod textureLod
#define texture3DLod textureLod
#define texture2DLodEXT textureLod
#define texture3DLodEXT textureLod
#define textureCubeLod textureLod
#define textureCubeLodEXT textureLod
#define texture2DArrayLod textureLod
#define texture2DArrayLodEXT textureLod
#endif
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
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
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ProjectorMatrix;
uniform vec2 sc_TAAJitterOffset;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_UniformConstants;
uniform vec4 sc_BoneMatrices[((sc_SkinBonesCount*3)+1)];
uniform mat3 sc_SkinBonesNormalMatrices[(sc_SkinBonesCount+1)];
uniform vec4 weights0;
uniform vec4 weights1;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform mat3 sc_NormalMatrix;
uniform int PreviewEnabled;
varying float varClipDistance;
varying float varStereoViewID;
attribute vec4 boneData;
attribute vec3 blendShape0Pos;
attribute vec3 blendShape0Normal;
attribute vec3 blendShape1Pos;
attribute vec3 blendShape1Normal;
attribute vec3 blendShape2Pos;
attribute vec3 blendShape2Normal;
attribute vec3 blendShape3Pos;
attribute vec3 blendShape4Pos;
attribute vec3 blendShape5Pos;
attribute vec4 position;
attribute vec3 normal;
attribute vec4 tangent;
attribute vec2 texture0;
attribute vec2 texture1;
varying vec3 varPos;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varPackedTex;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec2 varShadowTex;
varying float varViewSpaceDepth;
varying vec4 varColor;
attribute vec4 color;
varying vec4 PreviewVertexColor;
varying float PreviewVertexSaved;
attribute vec3 positionNext;
attribute vec3 positionPrevious;
attribute vec4 strandProperties;
void blendTargetShapeWithNormal(inout sc_Vertex_t v,vec3 position_1,vec3 normal_1,float weight)
{
vec3 l9_0=v.position.xyz+(position_1*weight);
v=sc_Vertex_t(vec4(l9_0.x,l9_0.y,l9_0.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
v.normal+=(normal_1*weight);
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
void sc_SetClipDistancePlatform(float dstClipDistance)
{
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&sc_StereoRendering_IsClipDistanceEnabled
        gl_ClipDistance[0]=dstClipDistance;
    #endif
}
void main()
{
PreviewVertexColor=vec4(0.5);
PreviewVertexSaved=0.0;
vec2 l9_0;
vec2 l9_1;
vec3 l9_2;
vec3 l9_3;
vec4 l9_4;
#if (sc_VertexBlending)
{
vec2 l9_5;
vec2 l9_6;
vec3 l9_7;
vec3 l9_8;
vec4 l9_9;
#if (sc_VertexBlendingUseNormals)
{
sc_Vertex_t l9_10=sc_Vertex_t(position,normal,tangent.xyz,texture0,texture1);
blendTargetShapeWithNormal(l9_10,blendShape0Pos,blendShape0Normal,weights0.x);
blendTargetShapeWithNormal(l9_10,blendShape1Pos,blendShape1Normal,weights0.y);
blendTargetShapeWithNormal(l9_10,blendShape2Pos,blendShape2Normal,weights0.z);
l9_9=l9_10.position;
l9_8=l9_10.normal;
l9_7=l9_10.tangent;
l9_6=l9_10.texture0;
l9_5=l9_10.texture1;
}
#else
{
vec3 l9_12=(((((position.xyz+(blendShape0Pos*weights0.x)).xyz+(blendShape1Pos*weights0.y)).xyz+(blendShape2Pos*weights0.z)).xyz+(blendShape3Pos*weights0.w)).xyz+(blendShape4Pos*weights1.x)).xyz+(blendShape5Pos*weights1.y);
l9_9=vec4(l9_12.x,l9_12.y,l9_12.z,position.w);
l9_8=normal;
l9_7=tangent.xyz;
l9_6=texture0;
l9_5=texture1;
}
#endif
l9_4=l9_9;
l9_3=l9_8;
l9_2=l9_7;
l9_1=l9_6;
l9_0=l9_5;
}
#else
{
l9_4=position;
l9_3=normal;
l9_2=tangent.xyz;
l9_1=texture0;
l9_0=texture1;
}
#endif
vec3 l9_13;
vec3 l9_14;
vec4 l9_15;
#if (sc_SkinBonesCount>0)
{
vec4 l9_16;
#if (sc_SkinBonesCount>0)
{
vec4 l9_17=vec4(1.0,fract(boneData.yzw));
vec4 l9_18=l9_17;
l9_18.x=1.0-dot(l9_17.yzw,vec3(1.0));
l9_16=l9_18;
}
#else
{
l9_16=vec4(0.0);
}
#endif
int l9_19=int(boneData.x);
int l9_20=int(boneData.y);
int l9_21=int(boneData.z);
int l9_22=int(boneData.w);
vec3 l9_23=(((skinVertexPosition(l9_19,l9_4)*l9_16.x)+(skinVertexPosition(l9_20,l9_4)*l9_16.y))+(skinVertexPosition(l9_21,l9_4)*l9_16.z))+(skinVertexPosition(l9_22,l9_4)*l9_16.w);
l9_15=vec4(l9_23.x,l9_23.y,l9_23.z,l9_4.w);
l9_14=((((sc_SkinBonesNormalMatrices[l9_19]*l9_3)*l9_16.x)+((sc_SkinBonesNormalMatrices[l9_20]*l9_3)*l9_16.y))+((sc_SkinBonesNormalMatrices[l9_21]*l9_3)*l9_16.z))+((sc_SkinBonesNormalMatrices[l9_22]*l9_3)*l9_16.w);
l9_13=((((sc_SkinBonesNormalMatrices[l9_19]*l9_2)*l9_16.x)+((sc_SkinBonesNormalMatrices[l9_20]*l9_2)*l9_16.y))+((sc_SkinBonesNormalMatrices[l9_21]*l9_2)*l9_16.z))+((sc_SkinBonesNormalMatrices[l9_22]*l9_2)*l9_16.w);
}
#else
{
l9_15=l9_4;
l9_14=l9_3;
l9_13=l9_2;
}
#endif
#if (sc_RenderingSpace==3)
{
varPos=vec3(0.0);
varNormal=l9_14;
varTangent=vec4(l9_13.x,l9_13.y,l9_13.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==4)
{
varPos=vec3(0.0);
varNormal=l9_14;
varTangent=vec4(l9_13.x,l9_13.y,l9_13.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==2)
{
varPos=l9_15.xyz;
varNormal=l9_14;
varTangent=vec4(l9_13.x,l9_13.y,l9_13.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==1)
{
varPos=(sc_ModelMatrix*l9_15).xyz;
varNormal=sc_NormalMatrix*l9_14;
vec3 l9_24=sc_NormalMatrix*l9_13;
varTangent=vec4(l9_24.x,l9_24.y,l9_24.z,varTangent.w);
}
#endif
}
#endif
}
#endif
}
#endif
bool l9_25=PreviewEnabled==1;
vec2 l9_26;
if (l9_25)
{
vec2 l9_27=l9_1;
l9_27.x=1.0-l9_1.x;
l9_26=l9_27;
}
else
{
l9_26=l9_1;
}
varColor=color;
vec3 l9_28=varPos;
vec3 l9_29=varNormal;
vec3 l9_30;
vec3 l9_31;
vec3 l9_32;
if (l9_25)
{
l9_32=varTangent.xyz;
l9_31=varNormal;
l9_30=varPos;
}
else
{
l9_32=varTangent.xyz;
l9_31=l9_29;
l9_30=l9_28;
}
varPos=l9_30;
varNormal=normalize(l9_31);
vec3 l9_33=normalize(l9_32);
varTangent=vec4(l9_33.x,l9_33.y,l9_33.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_34;
#if (sc_RenderingSpace==3)
{
l9_34=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
vec4 l9_35;
#if (sc_RenderingSpace==2)
{
l9_35=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
vec4 l9_36;
#if (sc_RenderingSpace==1)
{
l9_36=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
l9_36=l9_15;
}
#endif
l9_35=l9_36;
}
#endif
l9_34=l9_35;
}
#endif
varViewSpaceDepth=-l9_34.z;
}
#endif
vec4 l9_37;
#if (sc_RenderingSpace==3)
{
l9_37=l9_15;
}
#else
{
vec4 l9_38;
#if (sc_RenderingSpace==4)
{
l9_38=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_15)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_39;
#if (sc_RenderingSpace==2)
{
l9_39=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_40;
#if (sc_RenderingSpace==1)
{
l9_40=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_40=vec4(0.0);
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
varPackedTex=vec4(l9_26,l9_0);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_41;
#if (sc_RenderingSpace==1)
{
l9_41=sc_ModelMatrix*l9_15;
}
#else
{
l9_41=l9_15;
}
#endif
vec4 l9_42=sc_ProjectorMatrix*l9_41;
varShadowTex=((l9_42.xy/vec2(l9_42.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_43;
#if (sc_DepthBufferMode==1)
{
vec4 l9_44;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_45=l9_37;
l9_45.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_37.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_37.w;
l9_44=l9_45;
}
else
{
l9_44=l9_37;
}
l9_43=l9_44;
}
#else
{
l9_43=l9_37;
}
#endif
vec4 l9_46;
#if (sc_TAAEnabled)
{
vec2 l9_47=l9_43.xy+(sc_TAAJitterOffset*l9_43.w);
l9_46=vec4(l9_47.x,l9_47.y,l9_43.z,l9_43.w);
}
#else
{
l9_46=l9_43;
}
#endif
vec4 l9_48;
#if (sc_ShaderCacheConstant!=0)
{
vec4 l9_49=l9_46;
l9_49.x=l9_46.x+(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
l9_48=l9_49;
}
#else
{
l9_48=l9_46;
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
#if (sc_StereoRenderingMode==1)
{
float l9_50=dot(l9_48,sc_StereoClipPlanes[sc_StereoViewID]);
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(l9_50);
}
#else
{
varClipDistance=l9_50;
}
#endif
}
#endif
gl_Position=l9_48;
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef GL_ES
    #define SC_GLES_VERSION_20 2000
    #define SC_GLES_VERSION_30 3000
    #define SC_GLES_VERSION_31 3100
    #define SC_GLES_VERSION_32 3200
#endif
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
#if defined(GL_ES)&&(__VERSION__<300)&&!defined(GL_OES_standard_derivatives)
#define dFdx(A) (A)
#define dFdy(A) (A)
#define fwidth(A) (A)
#endif
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef sc_EnableStereoClipDistance
        #if defined(GL_APPLE_clip_distance)
            #extension GL_APPLE_clip_distance : require
        #elif defined(GL_EXT_clip_cull_distance)
            #extension GL_EXT_clip_cull_distance : require
        #else
            #error Clip distance is requested but not supported by this device.
        #endif
    #endif
#else
    #ifdef sc_EnableStereoClipDistance
        #error Clip distance is requested but not supported by this device.
    #endif
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef VERTEX_SHADER
        #define attribute in
        #define varying out
    #endif
    #ifdef FRAGMENT_SHADER
        #define varying in
    #endif
    #define gl_FragColor sc_FragData0
    #define texture2D texture
    #define texture2DLod textureLod
    #define texture2DLodEXT textureLod
    #define textureCubeLodEXT textureLod
#endif
#if defined(sc_EnableMultiviewStereoRendering)
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
        #ifdef sc_EnableFeatureLevelES3
            #define sc_LocalInstanceID (sc_GlobalInstanceID/2)
            #define sc_StereoViewID (sc_GlobalInstanceID%2)
        #else
            #define sc_LocalInstanceID int(sc_GlobalInstanceID/2.0)
            #define sc_StereoViewID int(mod(sc_GlobalInstanceID,2.0))
        #endif
    #endif
#else
    #define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableInstancing
        #ifdef GL_ES
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)
                #define gl_InstanceID (0)
            #endif
        #else
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)&&!defined(GL_ARB_draw_instanced)&&!defined(GL_EXT_gpu_shader4)
                #define gl_InstanceID (0)
            #endif
        #endif
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
#endif
#ifdef VERTEX_SHADER
    #if (__VERSION__<300)&&!defined(GL_EXT_gpu_shader4)
        #define gl_VertexID (0)
    #endif
#endif
#ifndef GL_ES
        #extension GL_EXT_gpu_shader4 : enable
    #extension GL_ARB_shader_texture_lod : enable
    #ifndef texture2DLodEXT
        #define texture2DLodEXT texture2DLod
    #endif
    #define precision
    #define lowp
    #define mediump
    #define highp
    #define sc_FragmentPrecision
#endif
#ifdef sc_EnableFeatureLevelES3
    #define sc_CanUseSampler2DArray 1
#endif
#if defined(sc_EnableFeatureLevelES2)&&defined(GL_ES)
    #ifdef GL_EXT_texture_array
        #extension GL_EXT_texture_array : require
        #define sc_CanUseSampler2DArray 1
    #else
        #define sc_CanUseSampler2DArray 0
    #endif
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
#if __VERSION__>100
    #define SC_INT_FALLBACK_FLOAT int
    #define SC_INTERPOLATION_FLAT flat
    #define SC_INTERPOLATION_CENTROID centroid
#else
    #define SC_INT_FALLBACK_FLOAT float
    #define SC_INTERPOLATION_FLAT
    #define SC_INTERPOLATION_CENTROID
#endif
#ifndef sc_NumStereoViews
    #define sc_NumStereoViews 1
#endif
#ifndef sc_CanUseSampler2DArray
    #define sc_CanUseSampler2DArray 0
#endif
#if __VERSION__>=300
#define texture3D texture
#define textureCube texture
#define texture2DArray texture
#define texture2DLod textureLod
#define texture3DLod textureLod
#define texture2DLodEXT textureLod
#define texture3DLodEXT textureLod
#define textureCubeLod textureLod
#define textureCubeLodEXT textureLod
#define texture2DArrayLod textureLod
#define texture2DArrayLodEXT textureLod
#endif
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#if sc_ExporterVersion<224
#define MAIN main
#endif
    #ifndef sc_FramebufferFetch
    #define sc_FramebufferFetch 0
    #elif sc_FramebufferFetch==1
    #undef sc_FramebufferFetch
    #define sc_FramebufferFetch 1
    #endif
    #if !defined(GL_ES)&&__VERSION__<420
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
    #elif defined(sc_EnableFeatureLevelES3)
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
            #ifdef sc_EnableFeatureLevelES3
                sc_DeclareFragData0(out);
                sc_DeclareFragData1(out);
                sc_DeclareFragData2(out);
                sc_DeclareFragData3(out);
                mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
                #define gl_LastFragData (getFragData())
            #endif
        #endif
    #elif defined(sc_EnableFeatureLevelES2)
        #define sc_FragData0 gl_FragColor
        mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
    #else
        #define sc_FragData0 gl_FragColor
        mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
    #endif
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
#ifndef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 0
#elif sc_ShaderComplexityAnalyzer==1
#undef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 1
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_UseFramebufferFetchMarker
#define sc_UseFramebufferFetchMarker 0
#elif sc_UseFramebufferFetchMarker==1
#undef sc_UseFramebufferFetchMarker
#define sc_UseFramebufferFetchMarker 1
#endif
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef sc_GetFramebufferColorInvalidUsageMarker
#define sc_GetFramebufferColorInvalidUsageMarker 0
#elif sc_GetFramebufferColorInvalidUsageMarker==1
#undef sc_GetFramebufferColorInvalidUsageMarker
#define sc_GetFramebufferColorInvalidUsageMarker 1
#endif
#ifndef sc_BlendMode_Software
#define sc_BlendMode_Software 0
#elif sc_BlendMode_Software==1
#undef sc_BlendMode_Software
#define sc_BlendMode_Software 1
#endif
#ifndef sc_SSAOEnabled
#define sc_SSAOEnabled 0
#elif sc_SSAOEnabled==1
#undef sc_SSAOEnabled
#define sc_SSAOEnabled 1
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
#ifndef sc_MaxTextureImageUnits
#define sc_MaxTextureImageUnits 0
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
#ifndef ENABLE_MATERIAL_PARAM_TEX
#define ENABLE_MATERIAL_PARAM_TEX 0
#elif ENABLE_MATERIAL_PARAM_TEX==1
#undef ENABLE_MATERIAL_PARAM_TEX
#define ENABLE_MATERIAL_PARAM_TEX 1
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
uniform vec4 sc_CurrentRenderTargetDims;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameModelMatrix;
uniform mat4 sc_ModelMatrixInverse;
uniform float shaderComplexityValue;
uniform vec4 sc_UniformConstants;
uniform float _sc_framebufferFetchMarker;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float alphaTestThreshold;
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec3 sc_EnvmapRotation;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapDiffuseSize;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform sc_AmbientLight_t sc_AmbientLights[(sc_AmbientLightsCount+1)];
uniform sc_DirectionalLight_t sc_DirectionalLights[(sc_DirectionalLightsCount+1)];
uniform sc_PointLight_t sc_PointLights[(sc_PointLightsCount+1)];
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
uniform sampler2D baseTex;
uniform sampler2D opacityTex;
uniform sampler2D normalTex;
uniform sampler2D detailNormalTex;
uniform sampler2D emissiveTex;
uniform sampler2D reflectionTex;
uniform sampler2D reflectionModulationTex;
uniform sampler2D rimColorTex;
uniform sampler2D materialParamsTex;
uniform sampler2D sc_SSAOTexture;
uniform sampler2D sc_ShadowTexture;
uniform sampler2D sc_EnvmapSpecular;
uniform sampler2D sc_EnvmapDiffuse;
uniform sampler2D sc_ScreenTexture;
uniform sampler2D intensityTexture;
uniform sampler2D sc_OITFrontDepthTexture;
uniform sampler2D sc_OITDepthHigh0;
uniform sampler2D sc_OITDepthLow0;
uniform sampler2D sc_OITAlpha0;
uniform sampler2D sc_OITDepthHigh1;
uniform sampler2D sc_OITDepthLow1;
uniform sampler2D sc_OITAlpha1;
uniform sampler2D sc_OITFilteredDepthBoundsTexture;
varying float varStereoViewID;
varying vec2 varShadowTex;
varying float varClipDistance;
varying float varViewSpaceDepth;
varying vec4 PreviewVertexColor;
varying float PreviewVertexSaved;
varying vec3 varPos;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varPackedTex;
varying vec4 varColor;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
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
l9_0=int(varStereoViewID);
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
return vec3(texture2D(sc_SSAOTexture,((l9_0.xyz/vec3(l9_0.w)).xy*0.5)+vec2(0.5)).x);
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
float l9_0=roughness_1*roughness_1;
float l9_1=l9_0*l9_0;
float l9_2=((NdotH*NdotH)*(l9_1-1.0))+1.0;
return l9_1/((l9_2*l9_2)+9.9999999e-09);
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
vec4 sc_EnvmapSpecularSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
return texture2D(sc_EnvmapSpecular,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex).xy,bias);
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
vec4 sc_EnvmapSpecularSampleViewIndexLevel(vec2 uv,int viewIndex,float level_)
{
return texture2DLod(sc_EnvmapSpecular,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex).xy,level_);
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
vec4 sc_ScreenTextureSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
return texture2D(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(uv,sc_ScreenTextureLayout,viewIndex).xy,bias);
}
vec4 sc_readFragData0_Platform()
{
    return getFragData()[0];
}
vec4 sc_readFragData0()
{
vec4 l9_0=sc_readFragData0_Platform();
vec4 l9_1;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_2=l9_0;
l9_2.x=l9_0.x+_sc_framebufferFetchMarker;
l9_1=l9_2;
}
#else
{
l9_1=l9_0;
}
#endif
return l9_1;
}
vec4 sc_GetFramebufferColor()
{
vec4 l9_0;
#if (sc_FramebufferFetch)
{
l9_0=sc_readFragData0();
}
#else
{
l9_0=sc_ScreenTextureSampleViewIndexBias(sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw),sc_ScreenTextureGetStereoViewIndex(),0.0);
}
#endif
vec4 l9_1;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_2=l9_0;
l9_2.x=l9_0.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_1=l9_2;
}
#else
{
l9_1=l9_0;
}
#endif
return l9_1;
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
int l9_48;
#if (intensityTextureHasSwappedViews)
{
l9_48=1-sc_GetStereoViewIndex();
}
#else
{
l9_48=sc_GetStereoViewIndex();
}
#endif
bool l9_49=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_50=pow(l9_47,1.0/correctedIntensity);
sc_SoftwareWrapEarly(l9_50,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_51=l9_50;
float l9_52=0.5;
sc_SoftwareWrapEarly(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_53=l9_52;
vec2 l9_54;
float l9_55;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_56;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_56=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_56=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_57=l9_51;
float l9_58=1.0;
sc_ClampUV(l9_57,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_56,l9_58);
float l9_59=l9_57;
float l9_60=l9_58;
bool l9_61;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_61=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_61=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_62=l9_53;
float l9_63=l9_60;
sc_ClampUV(l9_62,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_61,l9_63);
l9_55=l9_63;
l9_54=vec2(l9_59,l9_62);
}
#else
{
l9_55=1.0;
l9_54=vec2(l9_51,l9_53);
}
#endif
vec2 l9_64=sc_TransformUV(l9_54,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_65=l9_64.x;
float l9_66=l9_55;
sc_SoftwareWrapLate(l9_65,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_49,l9_66);
float l9_67=l9_64.y;
float l9_68=l9_66;
sc_SoftwareWrapLate(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_49,l9_68);
float l9_69=l9_68;
vec3 l9_70=sc_SamplingCoordsViewToGlobal(vec2(l9_65,l9_67),intensityTextureLayout,l9_48);
vec4 l9_71=texture2D(intensityTexture,l9_70.xy,0.0);
vec4 l9_72;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_72=mix(intensityTextureBorderColor,l9_71,vec4(l9_69));
}
#else
{
l9_72=l9_71;
}
#endif
float l9_73=((((l9_72.x*256.0)+l9_72.y)+(l9_72.z/256.0))/257.00391)*16.0;
float l9_74;
#if (BLEND_MODE_FORGRAY)
{
l9_74=max(l9_73,1.0);
}
#else
{
l9_74=l9_73;
}
#endif
float l9_75;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_75=min(l9_74,1.0);
}
#else
{
l9_75=l9_74;
}
#endif
return transformColor(l9_47,l9_45,l9_46,1.0,l9_75);
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
vec4 outputMotionVectorsIfNeeded(vec3 surfacePosWorldSpace,vec4 finalColor)
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
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
    col.x+=zero*float(cacheConst);
    sc_FragData0=col;
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
vec3 l9_0=normalize(varNormal);
vec3 l9_1=normalize(varTangent.xyz);
vec2 l9_2=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec3 l9_3=normalize(sc_Camera.position-varPos);
tempGlobals=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec2(0.0),vec2(0.0),vec3(0.0),l9_3,varPos,l9_0,l9_1,cross(l9_0,l9_1)*varTangent.w,varPackedTex.xy,varPackedTex.zw,varColor,sc_ScreenCoordsGlobalToView(l9_2),varPos);
N7_EnableUV2=(int(ENABLE_UV2)!=0);
tempGlobals.N7_TransformedUV2=N7_gettransformUV(NODE_13_DROPLIST_ITEM,uv2Scale,uv2Offset,(int(uv2EnableAnimation)!=0),N7_EnableUV2);
tempGlobals.N7_TransformedUV3=N7_gettransformUV(NODE_49_DROPLIST_ITEM,uv3Scale,uv3Offset,(int(uv3EnableAnimation)!=0),(int(ENABLE_UV3)!=0));
vec4 l9_4;
#if (ENABLE_BASE_TEX)
{
vec2 l9_5=N7_getUV(NODE_27_DROPLIST_ITEM);
int l9_6;
#if (baseTexHasSwappedViews)
{
l9_6=1-sc_GetStereoViewIndex();
}
#else
{
l9_6=sc_GetStereoViewIndex();
}
#endif
bool l9_7=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_8=l9_5.x;
sc_SoftwareWrapEarly(l9_8,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_9=l9_8;
float l9_10=l9_5.y;
sc_SoftwareWrapEarly(l9_10,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_11=l9_10;
vec2 l9_12;
float l9_13;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_14;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_14=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_14=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_15=l9_9;
float l9_16=1.0;
sc_ClampUV(l9_15,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_14,l9_16);
float l9_17=l9_15;
float l9_18=l9_16;
bool l9_19;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_19=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_19=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_20=l9_11;
float l9_21=l9_18;
sc_ClampUV(l9_20,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_19,l9_21);
l9_13=l9_21;
l9_12=vec2(l9_17,l9_20);
}
#else
{
l9_13=1.0;
l9_12=vec2(l9_9,l9_11);
}
#endif
vec2 l9_22=sc_TransformUV(l9_12,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_23=l9_22.x;
float l9_24=l9_13;
sc_SoftwareWrapLate(l9_23,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_7,l9_24);
float l9_25=l9_22.y;
float l9_26=l9_24;
sc_SoftwareWrapLate(l9_25,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_7,l9_26);
float l9_27=l9_26;
vec3 l9_28=sc_SamplingCoordsViewToGlobal(vec2(l9_23,l9_25),baseTexLayout,l9_6);
vec4 l9_29=texture2D(baseTex,l9_28.xy,0.0);
vec4 l9_30;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_30=mix(baseTexBorderColor,l9_29,vec4(l9_27));
}
#else
{
l9_30=l9_29;
}
#endif
l9_4=baseColor*l9_30;
}
#else
{
l9_4=baseColor;
}
#endif
vec4 l9_31;
#if (ENABLE_RECOLOR)
{
vec3 l9_32=((recolorRed*l9_4.x)+(recolorGreen*l9_4.y))+(recolorBlue*l9_4.z);
l9_31=vec4(l9_32.x,l9_32.y,l9_32.z,l9_4.w);
}
#else
{
l9_31=l9_4;
}
#endif
float l9_33;
#if (ENABLE_OPACITY_TEX)
{
vec2 l9_34=N7_getUV(NODE_69_DROPLIST_ITEM);
int l9_35;
#if (opacityTexHasSwappedViews)
{
l9_35=1-sc_GetStereoViewIndex();
}
#else
{
l9_35=sc_GetStereoViewIndex();
}
#endif
bool l9_36=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_37=l9_34.x;
sc_SoftwareWrapEarly(l9_37,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_38=l9_37;
float l9_39=l9_34.y;
sc_SoftwareWrapEarly(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_40=l9_39;
vec2 l9_41;
float l9_42;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_43;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_43=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_43=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_44=l9_38;
float l9_45=1.0;
sc_ClampUV(l9_44,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_43,l9_45);
float l9_46=l9_44;
float l9_47=l9_45;
bool l9_48;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_48=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_48=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_49=l9_40;
float l9_50=l9_47;
sc_ClampUV(l9_49,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_48,l9_50);
l9_42=l9_50;
l9_41=vec2(l9_46,l9_49);
}
#else
{
l9_42=1.0;
l9_41=vec2(l9_38,l9_40);
}
#endif
vec2 l9_51=sc_TransformUV(l9_41,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_52=l9_51.x;
float l9_53=l9_42;
sc_SoftwareWrapLate(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_36,l9_53);
float l9_54=l9_51.y;
float l9_55=l9_53;
sc_SoftwareWrapLate(l9_54,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_36,l9_55);
float l9_56=l9_55;
vec3 l9_57=sc_SamplingCoordsViewToGlobal(vec2(l9_52,l9_54),opacityTexLayout,l9_35);
vec4 l9_58=texture2D(opacityTex,l9_57.xy,0.0);
vec4 l9_59;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_59=mix(opacityTexBorderColor,l9_58,vec4(l9_56));
}
#else
{
l9_59=l9_58;
}
#endif
l9_33=l9_59.x;
}
#else
{
l9_33=1.0;
}
#endif
float l9_60=l9_33*l9_31.w;
vec4 l9_61;
float l9_62;
if (NODE_38_DROPLIST_ITEM==1)
{
l9_62=l9_60*tempGlobals.VertexColor.w;
l9_61=l9_31*tempGlobals.VertexColor;
}
else
{
l9_62=l9_60;
l9_61=l9_31;
}
vec3 l9_63;
#if (ENABLE_NORMALMAP)
{
vec2 l9_64=N7_getUV(NODE_181_DROPLIST_ITEM);
int l9_65;
#if (normalTexHasSwappedViews)
{
l9_65=1-sc_GetStereoViewIndex();
}
#else
{
l9_65=sc_GetStereoViewIndex();
}
#endif
bool l9_66=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_67=l9_64.x;
sc_SoftwareWrapEarly(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_68=l9_67;
float l9_69=l9_64.y;
sc_SoftwareWrapEarly(l9_69,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_70=l9_69;
vec2 l9_71;
float l9_72;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_73;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_73=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_73=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_74=l9_68;
float l9_75=1.0;
sc_ClampUV(l9_74,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_73,l9_75);
float l9_76=l9_74;
float l9_77=l9_75;
bool l9_78;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_78=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_78=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_79=l9_70;
float l9_80=l9_77;
sc_ClampUV(l9_79,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_78,l9_80);
l9_72=l9_80;
l9_71=vec2(l9_76,l9_79);
}
#else
{
l9_72=1.0;
l9_71=vec2(l9_68,l9_70);
}
#endif
vec2 l9_81=sc_TransformUV(l9_71,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_82=l9_81.x;
float l9_83=l9_72;
sc_SoftwareWrapLate(l9_82,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_66,l9_83);
float l9_84=l9_81.y;
float l9_85=l9_83;
sc_SoftwareWrapLate(l9_84,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_66,l9_85);
float l9_86=l9_85;
vec3 l9_87=sc_SamplingCoordsViewToGlobal(vec2(l9_82,l9_84),normalTexLayout,l9_65);
vec4 l9_88=texture2D(normalTex,l9_87.xy,0.0);
vec4 l9_89;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_89=mix(normalTexBorderColor,l9_88,vec4(l9_86));
}
#else
{
l9_89=l9_88;
}
#endif
vec3 l9_90;
#if (ENABLE_DETAIL_NORMAL)
{
vec2 l9_91=N7_getUV(NODE_184_DROPLIST_ITEM);
int l9_92;
#if (detailNormalTexHasSwappedViews)
{
l9_92=1-sc_GetStereoViewIndex();
}
#else
{
l9_92=sc_GetStereoViewIndex();
}
#endif
bool l9_93=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_94=l9_91.x;
sc_SoftwareWrapEarly(l9_94,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_95=l9_94;
float l9_96=l9_91.y;
sc_SoftwareWrapEarly(l9_96,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_97=l9_96;
vec2 l9_98;
float l9_99;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_100;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_100=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_100=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_101=l9_95;
float l9_102=1.0;
sc_ClampUV(l9_101,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_100,l9_102);
float l9_103=l9_101;
float l9_104=l9_102;
bool l9_105;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_105=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_105=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_106=l9_97;
float l9_107=l9_104;
sc_ClampUV(l9_106,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_105,l9_107);
l9_99=l9_107;
l9_98=vec2(l9_103,l9_106);
}
#else
{
l9_99=1.0;
l9_98=vec2(l9_95,l9_97);
}
#endif
vec2 l9_108=sc_TransformUV(l9_98,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_109=l9_108.x;
float l9_110=l9_99;
sc_SoftwareWrapLate(l9_109,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_93,l9_110);
float l9_111=l9_108.y;
float l9_112=l9_110;
sc_SoftwareWrapLate(l9_111,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_93,l9_112);
float l9_113=l9_112;
vec3 l9_114=sc_SamplingCoordsViewToGlobal(vec2(l9_109,l9_111),detailNormalTexLayout,l9_92);
vec4 l9_115=texture2D(detailNormalTex,l9_114.xy,0.0);
vec4 l9_116;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_116=mix(detailNormalTexBorderColor,l9_115,vec4(l9_113));
}
#else
{
l9_116=l9_115;
}
#endif
l9_90=(l9_116.xyz*1.9921875)-vec3(1.0);
}
#else
{
l9_90=vec3(0.0,0.0,1.0);
}
#endif
vec3 l9_117=((l9_89.xyz*1.9921875)-vec3(1.0))+vec3(0.0,0.0,1.0);
vec3 l9_118=l9_90*vec3(-1.0,-1.0,1.0);
l9_63=normalize(mat3(tempGlobals.VertexTangent_WorldSpace,tempGlobals.VertexBinormal_WorldSpace,tempGlobals.VertexNormal_WorldSpace)*normalize((l9_117*dot(l9_117,l9_118))-(l9_118*l9_117.z)));
}
#else
{
l9_63=normalize(tempGlobals.VertexNormal_WorldSpace);
}
#endif
vec3 l9_119;
#if (ENABLE_EMISSIVE)
{
vec2 l9_120=N7_getUV(NODE_76_DROPLIST_ITEM);
int l9_121;
#if (emissiveTexHasSwappedViews)
{
l9_121=1-sc_GetStereoViewIndex();
}
#else
{
l9_121=sc_GetStereoViewIndex();
}
#endif
bool l9_122=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTex)!=0));
float l9_123=l9_120.x;
sc_SoftwareWrapEarly(l9_123,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x);
float l9_124=l9_123;
float l9_125=l9_120.y;
sc_SoftwareWrapEarly(l9_125,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y);
float l9_126=l9_125;
vec2 l9_127;
float l9_128;
#if (SC_USE_UV_MIN_MAX_emissiveTex)
{
bool l9_129;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_129=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x==3;
}
#else
{
l9_129=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_130=l9_124;
float l9_131=1.0;
sc_ClampUV(l9_130,emissiveTexUvMinMax.x,emissiveTexUvMinMax.z,l9_129,l9_131);
float l9_132=l9_130;
float l9_133=l9_131;
bool l9_134;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_134=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y==3;
}
#else
{
l9_134=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_135=l9_126;
float l9_136=l9_133;
sc_ClampUV(l9_135,emissiveTexUvMinMax.y,emissiveTexUvMinMax.w,l9_134,l9_136);
l9_128=l9_136;
l9_127=vec2(l9_132,l9_135);
}
#else
{
l9_128=1.0;
l9_127=vec2(l9_124,l9_126);
}
#endif
vec2 l9_137=sc_TransformUV(l9_127,(int(SC_USE_UV_TRANSFORM_emissiveTex)!=0),emissiveTexTransform);
float l9_138=l9_137.x;
float l9_139=l9_128;
sc_SoftwareWrapLate(l9_138,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x,l9_122,l9_139);
float l9_140=l9_137.y;
float l9_141=l9_139;
sc_SoftwareWrapLate(l9_140,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y,l9_122,l9_141);
float l9_142=l9_141;
vec3 l9_143=sc_SamplingCoordsViewToGlobal(vec2(l9_138,l9_140),emissiveTexLayout,l9_121);
vec4 l9_144=texture2D(emissiveTex,l9_143.xy,0.0);
vec4 l9_145;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_145=mix(emissiveTexBorderColor,l9_144,vec4(l9_142));
}
#else
{
l9_145=l9_144;
}
#endif
l9_119=l9_145.xyz;
}
#else
{
l9_119=vec3(0.0);
}
#endif
bool l9_146=NODE_38_DROPLIST_ITEM==2;
vec3 l9_147;
if (l9_146)
{
l9_147=l9_119+tempGlobals.VertexColor.xyz;
}
else
{
l9_147=l9_119;
}
vec3 l9_148;
if (l9_146||(int(ENABLE_EMISSIVE)!=0))
{
l9_148=ssPow((l9_147*emissiveColor)*vec3(emissiveIntensity),vec3(2.2));
}
else
{
l9_148=l9_147;
}
vec3 l9_149;
#if (ENABLE_SIMPLE_REFLECTION)
{
vec3 l9_150=tempGlobals.ViewDirWS;
vec3 l9_151=reflect(l9_150,l9_63);
float l9_152=l9_151.x;
float l9_153=l9_151.y;
float l9_154=(-l9_151.z)+1.0;
float l9_155=((l9_152*l9_152)+(l9_153*l9_153))+(l9_154*l9_154);
float l9_156;
if (l9_155<=0.0)
{
l9_156=0.0;
}
else
{
l9_156=sqrt(l9_155);
}
float l9_157=2.0*l9_156;
vec2 l9_158=vec2(1.0)-((l9_151.xy/vec2(l9_157))+vec2(0.5));
int l9_159;
#if (reflectionTexHasSwappedViews)
{
l9_159=1-sc_GetStereoViewIndex();
}
#else
{
l9_159=sc_GetStereoViewIndex();
}
#endif
bool l9_160=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionTex)!=0));
float l9_161=l9_158.x;
sc_SoftwareWrapEarly(l9_161,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x);
float l9_162=l9_161;
float l9_163=l9_158.y;
sc_SoftwareWrapEarly(l9_163,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y);
float l9_164=l9_163;
vec2 l9_165;
float l9_166;
#if (SC_USE_UV_MIN_MAX_reflectionTex)
{
bool l9_167;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_167=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x==3;
}
#else
{
l9_167=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_168=l9_162;
float l9_169=1.0;
sc_ClampUV(l9_168,reflectionTexUvMinMax.x,reflectionTexUvMinMax.z,l9_167,l9_169);
float l9_170=l9_168;
float l9_171=l9_169;
bool l9_172;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_172=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y==3;
}
#else
{
l9_172=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_173=l9_164;
float l9_174=l9_171;
sc_ClampUV(l9_173,reflectionTexUvMinMax.y,reflectionTexUvMinMax.w,l9_172,l9_174);
l9_166=l9_174;
l9_165=vec2(l9_170,l9_173);
}
#else
{
l9_166=1.0;
l9_165=vec2(l9_162,l9_164);
}
#endif
vec2 l9_175=sc_TransformUV(l9_165,(int(SC_USE_UV_TRANSFORM_reflectionTex)!=0),reflectionTexTransform);
float l9_176=l9_175.x;
float l9_177=l9_166;
sc_SoftwareWrapLate(l9_176,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x,l9_160,l9_177);
float l9_178=l9_175.y;
float l9_179=l9_177;
sc_SoftwareWrapLate(l9_178,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y,l9_160,l9_179);
float l9_180=l9_179;
vec3 l9_181=sc_SamplingCoordsViewToGlobal(vec2(l9_176,l9_178),reflectionTexLayout,l9_159);
vec4 l9_182=texture2D(reflectionTex,l9_181.xy,0.0);
vec4 l9_183;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_183=mix(reflectionTexBorderColor,l9_182,vec4(l9_180));
}
#else
{
l9_183=l9_182;
}
#endif
vec3 l9_184;
#if (Tweak_N177)
{
vec2 l9_185=N7_getUV(NODE_228_DROPLIST_ITEM);
int l9_186;
#if (reflectionModulationTexHasSwappedViews)
{
l9_186=1-sc_GetStereoViewIndex();
}
#else
{
l9_186=sc_GetStereoViewIndex();
}
#endif
bool l9_187=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionModulationTex)!=0));
float l9_188=l9_185.x;
sc_SoftwareWrapEarly(l9_188,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x);
float l9_189=l9_188;
float l9_190=l9_185.y;
sc_SoftwareWrapEarly(l9_190,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y);
float l9_191=l9_190;
vec2 l9_192;
float l9_193;
#if (SC_USE_UV_MIN_MAX_reflectionModulationTex)
{
bool l9_194;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_194=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x==3;
}
#else
{
l9_194=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_195=l9_189;
float l9_196=1.0;
sc_ClampUV(l9_195,reflectionModulationTexUvMinMax.x,reflectionModulationTexUvMinMax.z,l9_194,l9_196);
float l9_197=l9_195;
float l9_198=l9_196;
bool l9_199;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_199=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y==3;
}
#else
{
l9_199=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_200=l9_191;
float l9_201=l9_198;
sc_ClampUV(l9_200,reflectionModulationTexUvMinMax.y,reflectionModulationTexUvMinMax.w,l9_199,l9_201);
l9_193=l9_201;
l9_192=vec2(l9_197,l9_200);
}
#else
{
l9_193=1.0;
l9_192=vec2(l9_189,l9_191);
}
#endif
vec2 l9_202=sc_TransformUV(l9_192,(int(SC_USE_UV_TRANSFORM_reflectionModulationTex)!=0),reflectionModulationTexTransform);
float l9_203=l9_202.x;
float l9_204=l9_193;
sc_SoftwareWrapLate(l9_203,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x,l9_187,l9_204);
float l9_205=l9_202.y;
float l9_206=l9_204;
sc_SoftwareWrapLate(l9_205,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y,l9_187,l9_206);
float l9_207=l9_206;
vec3 l9_208=sc_SamplingCoordsViewToGlobal(vec2(l9_203,l9_205),reflectionModulationTexLayout,l9_186);
vec4 l9_209=texture2D(reflectionModulationTex,l9_208.xy,0.0);
vec4 l9_210;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_210=mix(reflectionModulationTexBorderColor,l9_209,vec4(l9_207));
}
#else
{
l9_210=l9_209;
}
#endif
l9_184=l9_183.xyz*l9_210.xyz;
}
#else
{
l9_184=l9_183.xyz;
}
#endif
l9_149=ssSRGB_to_Linear(l9_184)*reflectionIntensity;
}
#else
{
l9_149=vec3(0.0);
}
#endif
vec3 l9_211;
#if (ENABLE_RIM_HIGHLIGHT)
{
vec3 l9_212=rimColor*rimIntensity;
vec3 l9_213;
#if (Tweak_N216)
{
vec2 l9_214=N7_getUV(NODE_315_DROPLIST_ITEM);
int l9_215;
#if (rimColorTexHasSwappedViews)
{
l9_215=1-sc_GetStereoViewIndex();
}
#else
{
l9_215=sc_GetStereoViewIndex();
}
#endif
bool l9_216=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_rimColorTex)!=0));
float l9_217=l9_214.x;
sc_SoftwareWrapEarly(l9_217,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x);
float l9_218=l9_217;
float l9_219=l9_214.y;
sc_SoftwareWrapEarly(l9_219,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y);
float l9_220=l9_219;
vec2 l9_221;
float l9_222;
#if (SC_USE_UV_MIN_MAX_rimColorTex)
{
bool l9_223;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_223=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x==3;
}
#else
{
l9_223=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_224=l9_218;
float l9_225=1.0;
sc_ClampUV(l9_224,rimColorTexUvMinMax.x,rimColorTexUvMinMax.z,l9_223,l9_225);
float l9_226=l9_224;
float l9_227=l9_225;
bool l9_228;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_228=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y==3;
}
#else
{
l9_228=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_229=l9_220;
float l9_230=l9_227;
sc_ClampUV(l9_229,rimColorTexUvMinMax.y,rimColorTexUvMinMax.w,l9_228,l9_230);
l9_222=l9_230;
l9_221=vec2(l9_226,l9_229);
}
#else
{
l9_222=1.0;
l9_221=vec2(l9_218,l9_220);
}
#endif
vec2 l9_231=sc_TransformUV(l9_221,(int(SC_USE_UV_TRANSFORM_rimColorTex)!=0),rimColorTexTransform);
float l9_232=l9_231.x;
float l9_233=l9_222;
sc_SoftwareWrapLate(l9_232,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x,l9_216,l9_233);
float l9_234=l9_231.y;
float l9_235=l9_233;
sc_SoftwareWrapLate(l9_234,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y,l9_216,l9_235);
float l9_236=l9_235;
vec3 l9_237=sc_SamplingCoordsViewToGlobal(vec2(l9_232,l9_234),rimColorTexLayout,l9_215);
vec4 l9_238=texture2D(rimColorTex,l9_237.xy,0.0);
vec4 l9_239;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_239=mix(rimColorTexBorderColor,l9_238,vec4(l9_236));
}
#else
{
l9_239=l9_238;
}
#endif
l9_213=l9_212*l9_239.xyz;
}
#else
{
l9_213=l9_212;
}
#endif
vec3 l9_240=tempGlobals.ViewDirWS;
float l9_241=dot(l9_63,l9_240);
float l9_242=abs(l9_241);
float l9_243;
if (!(int(ENABLE_RIM_INVERT)!=0))
{
l9_243=1.0-l9_242;
}
else
{
l9_243=l9_242;
}
float l9_244;
if (l9_243<=0.0)
{
l9_244=0.0;
}
else
{
l9_244=pow(l9_243,rimExponent);
}
l9_211=vec3(0.0)+(ssSRGB_to_Linear(l9_213)*l9_244);
}
#else
{
l9_211=vec3(0.0);
}
#endif
vec3 l9_245=ssPow((l9_148+l9_149)+l9_211,vec3(0.45454547));
vec3 l9_246;
if (NODE_38_DROPLIST_ITEM==3)
{
l9_246=tempGlobals.VertexColor.xyz;
}
else
{
l9_246=vec3(1.0);
}
float l9_247;
vec3 l9_248;
float l9_249;
#if (ENABLE_MATERIAL_PARAM_TEX)
{
vec2 l9_250=N7_getUV(NODE_221_DROPLIST_ITEM);
int l9_251;
#if (materialParamsTexHasSwappedViews)
{
l9_251=1-sc_GetStereoViewIndex();
}
#else
{
l9_251=sc_GetStereoViewIndex();
}
#endif
bool l9_252=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_materialParamsTex)!=0));
float l9_253=l9_250.x;
sc_SoftwareWrapEarly(l9_253,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x);
float l9_254=l9_253;
float l9_255=l9_250.y;
sc_SoftwareWrapEarly(l9_255,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y);
float l9_256=l9_255;
vec2 l9_257;
float l9_258;
#if (SC_USE_UV_MIN_MAX_materialParamsTex)
{
bool l9_259;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_259=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x==3;
}
#else
{
l9_259=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_260=l9_254;
float l9_261=1.0;
sc_ClampUV(l9_260,materialParamsTexUvMinMax.x,materialParamsTexUvMinMax.z,l9_259,l9_261);
float l9_262=l9_260;
float l9_263=l9_261;
bool l9_264;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_264=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y==3;
}
#else
{
l9_264=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_265=l9_256;
float l9_266=l9_263;
sc_ClampUV(l9_265,materialParamsTexUvMinMax.y,materialParamsTexUvMinMax.w,l9_264,l9_266);
l9_258=l9_266;
l9_257=vec2(l9_262,l9_265);
}
#else
{
l9_258=1.0;
l9_257=vec2(l9_254,l9_256);
}
#endif
vec2 l9_267=sc_TransformUV(l9_257,(int(SC_USE_UV_TRANSFORM_materialParamsTex)!=0),materialParamsTexTransform);
float l9_268=l9_267.x;
float l9_269=l9_258;
sc_SoftwareWrapLate(l9_268,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x,l9_252,l9_269);
float l9_270=l9_267.y;
float l9_271=l9_269;
sc_SoftwareWrapLate(l9_270,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y,l9_252,l9_271);
float l9_272=l9_271;
vec3 l9_273=sc_SamplingCoordsViewToGlobal(vec2(l9_268,l9_270),materialParamsTexLayout,l9_251);
vec4 l9_274=texture2D(materialParamsTex,l9_273.xy,0.0);
vec4 l9_275;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_275=mix(materialParamsTexBorderColor,l9_274,vec4(l9_272));
}
#else
{
l9_275=l9_274;
}
#endif
l9_249=roughness*l9_275.y;
l9_248=l9_246*l9_275.z;
l9_247=metallic*l9_275.x;
}
#else
{
l9_249=roughness;
l9_248=l9_246;
l9_247=metallic;
}
#endif
vec3 l9_276;
#if (ENABLE_SPECULAR_AO)
{
vec3 l9_277=mix(vec3(0.039999999),l9_61.xyz*l9_247,vec3(l9_247));
l9_276=mix(vec3(1.0),mix((l9_277*(1.0-specularAoDarkening))*l9_277,vec3(1.0),vec3(l9_248.x)),vec3(specularAoIntensity));
}
#else
{
l9_276=vec3(1.0);
}
#endif
vec3 l9_278;
#if (ENABLE_SIMPLE_REFLECTION)
{
l9_278=vec3(0.0);
}
#else
{
l9_278=l9_276;
}
#endif
vec3 l9_279;
#if (!sc_ProjectiveShadowsCaster)
{
l9_279=l9_63;
}
#else
{
l9_279=vec3(0.0);
}
#endif
float l9_280=clamp(l9_62,0.0,1.0);
#if (sc_BlendMode_AlphaTest)
{
if (l9_280<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_280<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec3 l9_281=max(l9_61.xyz,vec3(0.0));
vec4 l9_282;
#if (sc_ProjectiveShadowsCaster)
{
l9_282=vec4(l9_281,l9_280);
}
#else
{
float l9_283=clamp(l9_247,0.0,1.0);
float l9_284=clamp(l9_249,0.0,1.0);
vec3 l9_285=clamp(l9_248,vec3(0.0),vec3(1.0));
vec3 l9_286=clamp(l9_278,vec3(0.0),vec3(1.0));
vec3 l9_287=ssSRGB_to_Linear(l9_281);
vec3 l9_288=normalize(l9_279);
vec3 l9_289=ssSRGB_to_Linear(max(l9_245,vec3(0.0)));
vec3 l9_290;
#if (sc_SSAOEnabled)
{
l9_290=evaluateSSAO(varPos);
}
#else
{
l9_290=l9_285;
}
#endif
vec3 l9_291=vec3(l9_283);
vec3 l9_292=mix(vec3(0.039999999),l9_287*l9_283,l9_291);
vec3 l9_293=mix(l9_287*(1.0-l9_283),vec3(0.0),l9_291);
SurfaceProperties l9_294=SurfaceProperties(l9_293,l9_280,l9_288,varPos,l9_3,l9_283,l9_284,l9_289,l9_290,l9_286,vec3(1.0),l9_292);
vec4 l9_295=vec4(1.0);
vec3 l9_296;
vec3 l9_297;
vec3 l9_298;
vec3 l9_299;
int l9_300;
vec3 l9_301;
vec3 l9_302;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_303;
vec3 l9_304;
vec3 l9_305;
vec3 l9_306;
int l9_307;
vec3 l9_308;
vec3 l9_309;
l9_309=vec3(1.0);
l9_308=vec3(0.0);
l9_307=0;
l9_306=vec3(0.0);
l9_305=vec3(0.0);
l9_304=vec3(0.0);
l9_303=vec3(0.0);
LightingComponents l9_310;
LightProperties l9_311;
SurfaceProperties l9_312;
vec3 l9_313;
int l9_314=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_314<sc_DirectionalLightsCount)
{
LightingComponents l9_315=accumulateLight(LightingComponents(l9_303,l9_304,l9_309,l9_308,l9_306,l9_305),LightProperties(sc_DirectionalLights[l9_314].direction,sc_DirectionalLights[l9_314].color.xyz,sc_DirectionalLights[l9_314].color.w*l9_295[(l9_307<3) ? l9_307 : 3]),l9_294,l9_3);
l9_309=l9_315.indirectDiffuse;
l9_308=l9_315.indirectSpecular;
l9_307++;
l9_306=l9_315.emitted;
l9_305=l9_315.transmitted;
l9_304=l9_315.directSpecular;
l9_303=l9_315.directDiffuse;
l9_314++;
continue;
}
else
{
break;
}
}
l9_302=l9_309;
l9_301=l9_308;
l9_300=l9_307;
l9_299=l9_306;
l9_298=l9_305;
l9_297=l9_304;
l9_296=l9_303;
}
#else
{
l9_302=vec3(1.0);
l9_301=vec3(0.0);
l9_300=0;
l9_299=vec3(0.0);
l9_298=vec3(0.0);
l9_297=vec3(0.0);
l9_296=vec3(0.0);
}
#endif
vec3 l9_316;
vec3 l9_317;
vec3 l9_318;
#if (sc_PointLightsCount>0)
{
vec3 l9_319;
vec3 l9_320;
vec3 l9_321;
vec3 l9_322;
vec3 l9_323;
vec3 l9_324;
l9_324=l9_302;
l9_323=l9_301;
l9_322=l9_299;
l9_321=l9_298;
l9_320=l9_297;
l9_319=l9_296;
int l9_325;
vec3 l9_326;
vec3 l9_327;
vec3 l9_328;
vec3 l9_329;
vec3 l9_330;
vec3 l9_331;
int l9_332=0;
int l9_333=l9_300;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_332<sc_PointLightsCount)
{
vec3 l9_334=sc_PointLights[l9_332].position-varPos;
vec3 l9_335=normalize(l9_334);
float l9_336=l9_295[(l9_333<3) ? l9_333 : 3];
float l9_337=clamp((dot(l9_335,sc_PointLights[l9_332].direction)*sc_PointLights[l9_332].angleScale)+sc_PointLights[l9_332].angleOffset,0.0,1.0);
float l9_338=(sc_PointLights[l9_332].color.w*l9_336)*(l9_337*l9_337);
float l9_339;
if (sc_PointLights[l9_332].falloffEnabled)
{
l9_339=l9_338*computeDistanceAttenuation(length(l9_334),sc_PointLights[l9_332].falloffEndDistance);
}
else
{
l9_339=l9_338;
}
l9_325=l9_333+1;
LightingComponents l9_340=accumulateLight(LightingComponents(l9_319,l9_320,l9_324,l9_323,l9_322,l9_321),LightProperties(l9_335,sc_PointLights[l9_332].color.xyz,l9_339),l9_294,l9_3);
l9_326=l9_340.directDiffuse;
l9_327=l9_340.directSpecular;
l9_328=l9_340.indirectDiffuse;
l9_329=l9_340.indirectSpecular;
l9_330=l9_340.emitted;
l9_331=l9_340.transmitted;
l9_324=l9_328;
l9_323=l9_329;
l9_333=l9_325;
l9_322=l9_330;
l9_321=l9_331;
l9_320=l9_327;
l9_319=l9_326;
l9_332++;
continue;
}
else
{
break;
}
}
l9_318=l9_321;
l9_317=l9_320;
l9_316=l9_319;
}
#else
{
l9_318=l9_298;
l9_317=l9_297;
l9_316=l9_296;
}
#endif
vec3 l9_341;
vec3 l9_342;
#if (sc_ProjectiveShadowsReceiver)
{
vec3 l9_343;
#if (sc_ProjectiveShadowsReceiver)
{
vec2 l9_344=abs(varShadowTex-vec2(0.5));
vec4 l9_345=texture2D(sc_ShadowTexture,varShadowTex)*step(max(l9_344.x,l9_344.y),0.5);
l9_343=mix(vec3(1.0),mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_345.xyz,vec3(sc_ShadowColor.w)),vec3(l9_345.w*sc_ShadowDensity));
}
#else
{
l9_343=vec3(1.0);
}
#endif
l9_342=l9_316*l9_343;
l9_341=l9_317*l9_343;
}
#else
{
l9_342=l9_316;
l9_341=l9_317;
}
#endif
vec3 l9_346;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
vec2 l9_347=calcPanoramicTexCoordsFromDir(l9_288,sc_EnvmapRotation.y);
vec4 l9_348;
#if (sc_EnvLightMode==sc_AmbientLightMode_FromCamera)
{
vec2 l9_349;
#if (SC_DEVICE_CLASS>=2)
{
l9_349=calcSeamlessPanoramicUvsForSampling(l9_347,sc_EnvmapSpecularSize.xy,5.0);
}
#else
{
l9_349=l9_347;
}
#endif
l9_348=sc_EnvmapSpecularSampleViewIndexBias(l9_349,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#else
{
vec4 l9_350;
#if ((sc_MaxTextureImageUnits>8)&&sc_HasDiffuseEnvmap)
{
vec2 l9_351=calcSeamlessPanoramicUvsForSampling(l9_347,sc_EnvmapDiffuseSize.xy,0.0);
int l9_352;
#if (sc_EnvmapDiffuseHasSwappedViews)
{
l9_352=1-sc_GetStereoViewIndex();
}
#else
{
l9_352=sc_GetStereoViewIndex();
}
#endif
l9_350=texture2D(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(l9_351,sc_EnvmapDiffuseLayout,l9_352).xy,-13.0);
}
#else
{
l9_350=sc_EnvmapSpecularSampleViewIndexBias(l9_347,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#endif
l9_348=l9_350;
}
#endif
l9_346=(l9_348.xyz*(1.0/l9_348.w))*sc_EnvmapExposure;
}
#else
{
vec3 l9_353;
#if (sc_EnvLightMode==sc_AmbientLightMode_SphericalHarmonics)
{
vec3 l9_354=-l9_288;
float l9_355=l9_354.x;
float l9_356=l9_354.y;
float l9_357=l9_354.z;
l9_353=(((((((sc_Sh[8]*0.42904299)*((l9_355*l9_355)-(l9_356*l9_356)))+((sc_Sh[6]*0.74312502)*(l9_357*l9_357)))+(sc_Sh[0]*0.88622701))-(sc_Sh[6]*0.24770799))+((((sc_Sh[4]*(l9_355*l9_356))+(sc_Sh[7]*(l9_355*l9_357)))+(sc_Sh[5]*(l9_356*l9_357)))*0.85808599))+((((sc_Sh[3]*l9_355)+(sc_Sh[1]*l9_356))+(sc_Sh[2]*l9_357))*1.0233279))*sc_ShIntensity;
}
#else
{
l9_353=vec3(0.0);
}
#endif
l9_346=l9_353;
}
#endif
vec3 l9_358;
#if (sc_AmbientLightsCount>0)
{
vec3 l9_359;
#if (sc_AmbientLightMode0==sc_AmbientLightMode_Constant)
{
l9_359=l9_346+(sc_AmbientLights[0].color*sc_AmbientLights[0].intensity);
}
#else
{
vec3 l9_360=l9_346;
l9_360.x=l9_346.x+(1e-06*sc_AmbientLights[0].color.x);
l9_359=l9_360;
}
#endif
l9_358=l9_359;
}
#else
{
l9_358=l9_346;
}
#endif
vec3 l9_361;
#if (sc_AmbientLightsCount>1)
{
vec3 l9_362;
#if (sc_AmbientLightMode1==sc_AmbientLightMode_Constant)
{
l9_362=l9_358+(sc_AmbientLights[1].color*sc_AmbientLights[1].intensity);
}
#else
{
vec3 l9_363=l9_358;
l9_363.x=l9_358.x+(1e-06*sc_AmbientLights[1].color.x);
l9_362=l9_363;
}
#endif
l9_361=l9_362;
}
#else
{
l9_361=l9_358;
}
#endif
vec3 l9_364;
#if (sc_AmbientLightsCount>2)
{
vec3 l9_365;
#if (sc_AmbientLightMode2==sc_AmbientLightMode_Constant)
{
l9_365=l9_361+(sc_AmbientLights[2].color*sc_AmbientLights[2].intensity);
}
#else
{
vec3 l9_366=l9_361;
l9_366.x=l9_361.x+(1e-06*sc_AmbientLights[2].color.x);
l9_365=l9_366;
}
#endif
l9_364=l9_365;
}
#else
{
l9_364=l9_361;
}
#endif
vec3 l9_367;
#if (sc_LightEstimation)
{
vec3 l9_368;
l9_368=sc_LightEstimationData.ambientLight;
vec3 l9_369;
int l9_370=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_370<sc_LightEstimationSGCount)
{
float l9_371=dot(sc_LightEstimationData.sg[l9_370].axis,l9_288);
float l9_372=exp(-sc_LightEstimationData.sg[l9_370].sharpness);
float l9_373=l9_372*l9_372;
float l9_374=1.0/sc_LightEstimationData.sg[l9_370].sharpness;
float l9_375=(1.0+(2.0*l9_373))-l9_374;
float l9_376=sqrt(1.0-l9_375);
float l9_377=0.36000001*l9_371;
float l9_378=(1.0/(4.0*0.36000001))*l9_376;
float l9_379=l9_377+l9_378;
float l9_380;
if (step(abs(l9_377),l9_378)>0.5)
{
l9_380=(l9_379*l9_379)/l9_376;
}
else
{
l9_380=clamp(l9_371,0.0,1.0);
}
l9_369=l9_368+((((sc_LightEstimationData.sg[l9_370].color/vec3(sc_LightEstimationData.sg[l9_370].sharpness))*6.2831855)*((l9_375*l9_380)+(((l9_372-l9_373)*l9_374)-l9_373)))/vec3(3.1415927));
l9_368=l9_369;
l9_370++;
continue;
}
else
{
break;
}
}
l9_367=l9_364+l9_368;
}
#else
{
l9_367=l9_364;
}
#endif
vec3 l9_381;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
float l9_382=clamp(pow(l9_284,0.66666669),0.0,1.0)*5.0;
vec2 l9_383=calcPanoramicTexCoordsFromDir(getSpecularDominantDir(l9_288,reflect(-l9_3,l9_288),l9_284),sc_EnvmapRotation.y);
vec4 l9_384;
#if (SC_DEVICE_CLASS>=2)
{
float l9_385=floor(l9_382);
float l9_386=ceil(l9_382);
l9_384=mix(sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_383,sc_EnvmapSpecularSize.xy,l9_385),sc_EnvmapSpecularGetStereoViewIndex(),l9_385),sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_383,sc_EnvmapSpecularSize.xy,l9_386),sc_EnvmapSpecularGetStereoViewIndex(),l9_386),vec4(l9_382-l9_385));
}
#else
{
l9_384=sc_EnvmapSpecularSampleViewIndexLevel(l9_383,sc_EnvmapSpecularGetStereoViewIndex(),l9_382);
}
#endif
l9_381=vec3(0.0)+((((l9_384.xyz*(1.0/l9_384.w))*sc_EnvmapExposure)+vec3(1e-06))*envBRDFApprox(l9_294,abs(dot(l9_288,l9_3))));
}
#else
{
l9_381=vec3(0.0);
}
#endif
vec3 l9_387;
#if (sc_LightEstimation)
{
float l9_388=clamp(l9_284*l9_284,0.0099999998,1.0);
vec3 l9_389;
l9_389=sc_LightEstimationData.ambientLight*l9_292;
int l9_390=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_390<sc_LightEstimationSGCount)
{
float l9_391=l9_388*l9_388;
vec3 l9_392=reflect(-l9_3,l9_288);
float l9_393=dot(l9_288,l9_3);
float l9_394=(2.0/l9_391)/(4.0*max(l9_393,9.9999997e-05));
float l9_395=length((l9_392*l9_394)+(sc_LightEstimationData.sg[l9_390].axis*sc_LightEstimationData.sg[l9_390].sharpness));
float l9_396=clamp(dot(l9_288,l9_392),0.0,1.0);
float l9_397=clamp(l9_393,0.0,1.0);
float l9_398=1.0-l9_391;
l9_389+=((((((((vec3(1.0/(3.1415927*l9_391))*exp((l9_395-l9_394)-sc_LightEstimationData.sg[l9_390].sharpness))*sc_LightEstimationData.sg[l9_390].color)*6.2831855)*(1.0-exp((-2.0)*l9_395)))/vec3(l9_395))*((1.0/(l9_396+sqrt(l9_391+((l9_398*l9_396)*l9_396))))*(1.0/(l9_397+sqrt(l9_391+((l9_398*l9_397)*l9_397))))))*(l9_292+((vec3(1.0)-l9_292)*pow(1.0-clamp(dot(l9_392,normalize(l9_392+l9_3)),0.0,1.0),5.0))))*l9_396);
l9_390++;
continue;
}
else
{
break;
}
}
l9_387=l9_381+l9_389;
}
#else
{
l9_387=l9_381;
}
#endif
float l9_399;
vec3 l9_400;
vec3 l9_401;
vec3 l9_402;
#if (sc_BlendMode_ColoredGlass)
{
l9_402=vec3(0.0);
l9_401=vec3(0.0);
l9_400=ssSRGB_to_Linear(sc_GetFramebufferColor().xyz)*mix(vec3(1.0),l9_293,vec3(l9_280));
l9_399=1.0;
}
#else
{
l9_402=l9_342;
l9_401=l9_367;
l9_400=l9_318;
l9_399=l9_280;
}
#endif
bool l9_403;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_403=true;
}
#else
{
l9_403=false;
}
#endif
vec3 l9_404=l9_401*l9_290;
vec3 l9_405=l9_402+l9_404;
vec3 l9_406=l9_293*l9_405;
vec3 l9_407=l9_387*l9_286;
vec3 l9_408=l9_341+l9_407;
vec3 l9_409;
if (l9_403)
{
l9_409=l9_406*srgbToLinear(l9_399);
}
else
{
l9_409=l9_406;
}
vec3 l9_410=l9_409+l9_408;
vec3 l9_411=(l9_410+l9_289)+l9_400;
float l9_412=l9_411.x;
vec4 l9_413=vec4(l9_412,l9_411.yz,l9_399);
vec4 l9_414;
#if (sc_IsEditor)
{
vec4 l9_415=l9_413;
l9_415.x=l9_412+((l9_290.x*l9_286.x)*9.9999997e-06);
l9_414=l9_415;
}
#else
{
l9_414=l9_413;
}
#endif
vec4 l9_416;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_417=l9_414.xyz*1.8;
vec3 l9_418=(l9_414.xyz*(l9_417+vec3(1.4)))/((l9_414.xyz*(l9_417+vec3(0.5)))+vec3(1.5));
l9_416=vec4(l9_418.x,l9_418.y,l9_418.z,l9_414.w);
}
#else
{
l9_416=l9_414;
}
#endif
vec3 l9_419=vec3(linearToSrgb(l9_416.x),linearToSrgb(l9_416.y),linearToSrgb(l9_416.z));
l9_282=vec4(l9_419.x,l9_419.y,l9_419.z,l9_416.w);
}
#endif
vec4 l9_420=max(l9_282,vec4(0.0));
vec4 l9_421;
#if (sc_ProjectiveShadowsCaster)
{
float l9_422;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_422=l9_420.w;
}
#else
{
float l9_423;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_423=clamp(l9_420.w*2.0,0.0,1.0);
}
#else
{
float l9_424;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_424=clamp(dot(l9_420.xyz,vec3(l9_420.w)),0.0,1.0);
}
#else
{
float l9_425;
#if (sc_BlendMode_AlphaTest)
{
l9_425=1.0;
}
#else
{
float l9_426;
#if (sc_BlendMode_Multiply)
{
l9_426=(1.0-dot(l9_420.xyz,vec3(0.33333001)))*l9_420.w;
}
#else
{
float l9_427;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_427=(1.0-clamp(dot(l9_420.xyz,vec3(1.0)),0.0,1.0))*l9_420.w;
}
#else
{
float l9_428;
#if (sc_BlendMode_ColoredGlass)
{
l9_428=clamp(dot(l9_420.xyz,vec3(1.0)),0.0,1.0)*l9_420.w;
}
#else
{
float l9_429;
#if (sc_BlendMode_Add)
{
l9_429=clamp(dot(l9_420.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_430;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_430=clamp(dot(l9_420.xyz,vec3(1.0)),0.0,1.0)*l9_420.w;
}
#else
{
float l9_431;
#if (sc_BlendMode_Screen)
{
l9_431=dot(l9_420.xyz,vec3(0.33333001))*l9_420.w;
}
#else
{
float l9_432;
#if (sc_BlendMode_Min)
{
l9_432=1.0-clamp(dot(l9_420.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_433;
#if (sc_BlendMode_Max)
{
l9_433=clamp(dot(l9_420.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_433=1.0;
}
#endif
l9_432=l9_433;
}
#endif
l9_431=l9_432;
}
#endif
l9_430=l9_431;
}
#endif
l9_429=l9_430;
}
#endif
l9_428=l9_429;
}
#endif
l9_427=l9_428;
}
#endif
l9_426=l9_427;
}
#endif
l9_425=l9_426;
}
#endif
l9_424=l9_425;
}
#endif
l9_423=l9_424;
}
#endif
l9_422=l9_423;
}
#endif
l9_421=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_420.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_422);
}
#else
{
vec4 l9_434;
#if (sc_RenderAlphaToColor)
{
l9_434=vec4(l9_420.w);
}
#else
{
vec4 l9_435;
#if (sc_BlendMode_Custom)
{
vec3 l9_436=sc_GetFramebufferColor().xyz;
vec3 l9_437=mix(l9_436,definedBlend(l9_436,l9_420.xyz).xyz,vec3(l9_420.w));
vec4 l9_438=vec4(l9_437.x,l9_437.y,l9_437.z,vec4(0.0).w);
l9_438.w=1.0;
l9_435=l9_438;
}
#else
{
vec4 l9_439;
#if (sc_BlendMode_MultiplyOriginal)
{
float l9_440=l9_420.w;
l9_439=vec4(mix(vec3(1.0),l9_420.xyz,vec3(l9_440)),l9_440);
}
#else
{
vec4 l9_441;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_442=l9_420.w;
float l9_443;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_443=clamp(l9_442,0.0,1.0);
}
#else
{
l9_443=l9_442;
}
#endif
l9_441=vec4(l9_420.xyz*l9_443,l9_443);
}
#else
{
l9_441=l9_420;
}
#endif
l9_439=l9_441;
}
#endif
l9_435=l9_439;
}
#endif
l9_434=l9_435;
}
#endif
l9_421=l9_434;
}
#endif
vec4 l9_444;
if (PreviewEnabled==1)
{
vec4 l9_445;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_445=PreviewVertexColor;
}
else
{
l9_445=vec4(0.0);
}
l9_444=l9_445;
}
else
{
l9_444=l9_421;
}
vec4 l9_446;
#if (sc_ShaderComplexityAnalyzer)
{
l9_446=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_446=vec4(0.0);
}
#endif
vec4 l9_447;
if (l9_446.w>0.0)
{
l9_447=l9_446;
}
else
{
l9_447=l9_444;
}
vec4 l9_448=outputMotionVectorsIfNeeded(varPos,max(l9_447,vec4(0.0)));
vec4 l9_449=clamp(l9_448,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_450=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_450-0.0039215689)),min(1.0,l9_450+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_451=sc_ScreenCoordsGlobalToView(l9_2);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_451).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_452=encodeDepth(viewSpaceDepth(),texture2D(sc_OITFilteredDepthBoundsTexture,l9_451).xy);
float l9_453=packValue(l9_452);
int l9_460=int(l9_449.w*255.0);
float l9_461=packValue(l9_460);
sc_writeFragData0Internal(vec4(packValue(l9_452),packValue(l9_452),packValue(l9_452),packValue(l9_452)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_453,packValue(l9_452),packValue(l9_452),packValue(l9_452)));
sc_writeFragData2(vec4(l9_461,packValue(l9_460),packValue(l9_460),packValue(l9_460)));
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
vec2 l9_464=sc_ScreenCoordsGlobalToView(l9_2);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_464).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_465[8];
int l9_466[8];
int l9_467=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_467<8)
{
l9_465[l9_467]=0;
l9_466[l9_467]=0;
l9_467++;
continue;
}
else
{
break;
}
}
int l9_468;
#if (sc_OITMaxLayers8)
{
l9_468=2;
}
#else
{
l9_468=1;
}
#endif
int l9_469=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_469<l9_468)
{
vec4 l9_470;
vec4 l9_471;
vec4 l9_472;
if (l9_469==0)
{
l9_472=texture2D(sc_OITAlpha0,l9_464);
l9_471=texture2D(sc_OITDepthLow0,l9_464);
l9_470=texture2D(sc_OITDepthHigh0,l9_464);
}
else
{
l9_472=vec4(0.0);
l9_471=vec4(0.0);
l9_470=vec4(0.0);
}
vec4 l9_473;
vec4 l9_474;
vec4 l9_475;
if (l9_469==1)
{
l9_475=texture2D(sc_OITAlpha1,l9_464);
l9_474=texture2D(sc_OITDepthLow1,l9_464);
l9_473=texture2D(sc_OITDepthHigh1,l9_464);
}
else
{
l9_475=l9_472;
l9_474=l9_471;
l9_473=l9_470;
}
if (any(notEqual(l9_473,vec4(0.0)))||any(notEqual(l9_474,vec4(0.0))))
{
int l9_476[8]=l9_465;
unpackValues(l9_473.w,l9_469,l9_476);
unpackValues(l9_473.z,l9_469,l9_476);
unpackValues(l9_473.y,l9_469,l9_476);
unpackValues(l9_473.x,l9_469,l9_476);
unpackValues(l9_474.w,l9_469,l9_476);
unpackValues(l9_474.z,l9_469,l9_476);
unpackValues(l9_474.y,l9_469,l9_476);
unpackValues(l9_474.x,l9_469,l9_476);
int l9_485[8]=l9_466;
unpackValues(l9_475.w,l9_469,l9_485);
unpackValues(l9_475.z,l9_469,l9_485);
unpackValues(l9_475.y,l9_469,l9_485);
unpackValues(l9_475.x,l9_469,l9_485);
}
l9_469++;
continue;
}
else
{
break;
}
}
vec4 l9_490=texture2D(sc_OITFilteredDepthBoundsTexture,l9_464);
vec2 l9_491=l9_490.xy;
int l9_492;
#if (sc_SkinBonesCount>0)
{
l9_492=encodeDepth(((1.0-l9_490.x)*1000.0)+getDepthOrderingEpsilon(),l9_491);
}
#else
{
l9_492=0;
}
#endif
int l9_493=encodeDepth(viewSpaceDepth(),l9_491);
vec4 l9_494;
l9_494=l9_449*l9_449.w;
vec4 l9_495;
int l9_496=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_496<8)
{
int l9_497=l9_465[l9_496];
int l9_498=l9_493-l9_492;
bool l9_499=l9_497<l9_498;
bool l9_500;
if (l9_499)
{
l9_500=l9_465[l9_496]>0;
}
else
{
l9_500=l9_499;
}
if (l9_500)
{
vec3 l9_501=l9_494.xyz*(1.0-(float(l9_466[l9_496])/255.0));
l9_495=vec4(l9_501.x,l9_501.y,l9_501.z,l9_494.w);
}
else
{
l9_495=l9_494;
}
l9_494=l9_495;
l9_496++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_494,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
if (abs(gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(l9_2)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_449,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_448,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
