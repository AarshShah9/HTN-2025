//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(200)
//attribute vec4 position 0
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec3 normal 1
//attribute vec4 tangent 2
//sampler sampler renderTarget0SmpSC 0:22
//sampler sampler renderTarget1SmpSC 0:23
//sampler sampler renderTarget2SmpSC 0:24
//sampler sampler renderTarget3SmpSC 0:25
//texture texture2D renderTarget0 0:1:0:22
//texture texture2D renderTarget1 0:2:0:23
//texture texture2D renderTarget2 0:3:0:24
//texture texture2D renderTarget3 0:4:0:25
//spec_const bool renderTarget0HasSwappedViews 0 0
//spec_const bool renderTarget1HasSwappedViews 1 0
//spec_const bool renderTarget2HasSwappedViews 2 0
//spec_const bool renderTarget3HasSwappedViews 3 0
//spec_const int SC_DEVICE_CLASS 4 -1
//spec_const int renderTarget0Layout 5 0
//spec_const int renderTarget1Layout 6 0
//spec_const int renderTarget2Layout 7 0
//spec_const int renderTarget3Layout 8 0
//spec_const int sc_ShaderCacheConstant 9 0
//spec_const int sc_StereoRenderingMode 10 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 11 0
//spec_const int sc_StereoViewID 12 0
//SG_REFLECTION_END
#define SC_ENABLE_INSTANCED_RENDERING
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
struct ssParticle
{
vec3 Position;
vec3 Velocity;
vec4 Color;
float Size;
float Age;
float Life;
float Mass;
mat3 Matrix;
bool Dead;
vec4 Quaternion;
float SpawnIndex;
float SpawnIndexRemainder;
float NextBurstTime;
float collisionCount_N119;
float SpawnOffset;
float Seed;
vec2 Seed2000;
float TimeShift;
int Index1D;
int Index1DPerCopy;
float Index1DPerCopyF;
int StateID;
float Coord1D;
float Ratio1D;
float Ratio1DPerCopy;
ivec2 Index2D;
vec2 Coord2D;
vec2 Ratio2D;
vec3 Force;
bool Spawned;
float CopyId;
float SpawnAmount;
float BurstAmount;
float BurstPeriod;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float gComponentTime;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
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
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
#endif
#ifndef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 0
#elif renderTarget0HasSwappedViews==1
#undef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 1
#endif
#ifndef renderTarget0Layout
#define renderTarget0Layout 0
#endif
#ifndef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 0
#elif renderTarget1HasSwappedViews==1
#undef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 1
#endif
#ifndef renderTarget1Layout
#define renderTarget1Layout 0
#endif
#ifndef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 0
#elif renderTarget2HasSwappedViews==1
#undef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 1
#endif
#ifndef renderTarget2Layout
#define renderTarget2Layout 0
#endif
#ifndef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 0
#elif renderTarget3HasSwappedViews==1
#undef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 1
#endif
#ifndef renderTarget3Layout
#define renderTarget3Layout 0
#endif
uniform int sc_FallbackInstanceID;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_UniformConstants;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed[32];
uniform vec4 sc_Time;
uniform int vfxOffsetInstancesRead;
uniform int vfxTargetWidth;
uniform vec2 vfxTargetSizeRead;
uniform bool vfxBatchEnable[32];
uniform float Port_Input1_N149;
uniform vec3 Port_Min_N150;
uniform vec3 Port_Max_N150;
uniform float Port_Import_N151;
uniform float Port_Input1_N153;
uniform vec3 Port_Max_N154;
uniform float Port_Import_N157;
uniform vec3 Port_Import_N158;
uniform float Port_Input1_N162;
uniform float Port_Input1_N165;
uniform float Port_Import_N042;
uniform float Port_Import_N043;
uniform vec3 vfxLocalAabbMax;
uniform vec3 vfxLocalAabbMin;
uniform float particles_speed;
uniform float particlesReduce;
uniform vec3 Port_Import_N216;
uniform float Port_Import_N023;
uniform float Port_Import_N024;
uniform float Port_Import_N053;
uniform vec3 Port_Import_N054;
uniform vec3 Port_Import_N187;
uniform mat4 vfxModelMatrix[32];
uniform float Tweak_N12;
uniform float particle_scale;
uniform float overrideTimeDelta;
uniform vec3 Port_Import_N142;
uniform vec3 Port_Import_N006;
uniform float Port_Input1_N014;
uniform vec3 Port_Import_N208;
uniform vec3 Port_Import_N318;
uniform float Port_Multiplier_N319;
uniform vec3 Port_Import_N322;
uniform vec2 Port_Input1_N326;
uniform vec2 Port_Scale_N327;
uniform vec2 Port_Input1_N329;
uniform vec2 Port_Scale_N330;
uniform vec2 Port_Input1_N332;
uniform vec2 Port_Scale_N333;
uniform vec3 Port_Input1_N335;
uniform float Port_Import_N126;
uniform float Port_Import_N127;
uniform float Port_Import_N128;
uniform float Port_Input4_N137;
uniform float Port_Multiplier_N272;
uniform vec3 Port_Import_N112;
uniform float Port_Value1_N213;
uniform float Port_Value2_N213;
uniform float Port_Value3_N213;
uniform vec3 Port_Import_N113;
uniform float Port_Import_N114;
uniform float Port_Import_N115;
uniform float Port_Import_N116;
uniform float Port_CollisionCount_N118;
uniform float Port_VelocityThreshold_N118;
uniform float Port_DefaultFloat_N119;
uniform float Port_Input1_N171;
uniform float Port_Input1_N109;
uniform float Port_Input2_N109;
uniform vec2 vfxTargetSizeWrite;
uniform int vfxOffsetInstancesWrite;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
varying float varClipDistance;
varying float varStereoViewID;
attribute vec4 position;
attribute vec2 texture0;
attribute vec2 texture1;
varying vec3 varPos;
varying vec4 varPackedTex;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec3 varNormal;
varying float Interp_Particle_Index;
varying vec2 Interp_Particle_Coord;
varying vec3 Interp_Particle_Force;
varying float Interp_Particle_SpawnIndex;
varying float Interp_Particle_NextBurstTime;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Size;
varying vec4 Interp_Particle_Color;
varying vec4 Interp_Particle_Quaternion;
varying float Interp_Particle_collisionCount_N119;
varying float Interp_Particle_Mass;
varying vec4 varTangent;
varying vec2 varShadowTex;
attribute vec3 normal;
attribute vec4 tangent;
varying vec4 varColor;
ssParticle gParticle;
int sc_GetLocalInstanceIDInternal(int id)
{
#ifdef sc_LocalInstanceID
return sc_LocalInstanceID;
#else
return 0;
#endif
}
void ssCalculateParticleSeed(inout ssParticle Particle,int copyId)
{
float l9_0;
if (overrideTimeEnabled==1)
{
l9_0=overrideTimeElapsed[copyId];
}
else
{
l9_0=sc_Time.x;
}
Particle.Seed=(Particle.Ratio1D*0.97637898)+0.151235;
Particle.Seed+=(floor(((((l9_0-Particle.SpawnOffset)-0.0)+0.0)+0.40000001)/0.2)*4.32723);
Particle.Seed=fract(abs(Particle.Seed));
Particle.Seed2000=(vec2(ivec2(Particle.Index1D%400,Particle.Index1D/400))+vec2(1.0))/vec2(399.0);
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
int renderTarget0GetStereoViewIndex()
{
int l9_0;
#if (renderTarget0HasSwappedViews)
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
int renderTarget1GetStereoViewIndex()
{
int l9_0;
#if (renderTarget1HasSwappedViews)
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
int renderTarget2GetStereoViewIndex()
{
int l9_0;
#if (renderTarget2HasSwappedViews)
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
int renderTarget3GetStereoViewIndex()
{
int l9_0;
#if (renderTarget3HasSwappedViews)
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
float DecodeFloat32(vec4 rgba,bool Quantize)
{
if (Quantize)
{
rgba=floor((rgba*255.0)+vec4(0.5))/vec4(255.0);
}
return dot(rgba,vec4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
}
float DecodeFloat16(vec2 rg,bool Quantize)
{
if (Quantize)
{
rg=floor((rg*255.0)+vec2(0.5))/vec2(255.0);
}
return dot(rg,vec2(1.0,0.0039215689));
}
float DecodeFloat8(float r,bool Quantize)
{
if (Quantize)
{
r=floor((r*255.0)+0.5)/255.0;
}
return r;
}
bool ssDecodeParticle(int InstanceID)
{
gParticle=ssParticle(vec3(0.0),vec3(0.0),vec4(0.0),0.0,0.0,0.0,1.0,mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0)),gParticle.Dead,vec4(0.0,0.0,0.0,1.0),-1.0,-1.0,0.0,gParticle.collisionCount_N119,gParticle.SpawnOffset,gParticle.Seed,gParticle.Seed2000,gParticle.TimeShift,gParticle.Index1D,gParticle.Index1DPerCopy,gParticle.Index1DPerCopyF,gParticle.StateID,gParticle.Coord1D,gParticle.Ratio1D,gParticle.Ratio1DPerCopy,gParticle.Index2D,gParticle.Coord2D,gParticle.Ratio2D,gParticle.Force,gParticle.Spawned,float(InstanceID/40),0.0,0.0,0.0);
int l9_0=InstanceID/40;
int l9_1=InstanceID%40;
float l9_2=float(l9_1);
ivec2 l9_3=ivec2(l9_1,l9_0);
float l9_4=float(InstanceID);
vec2 l9_5=vec2(l9_3);
float l9_6=l9_4/39.0;
ssParticle l9_7=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,false,gParticle.Quaternion,gParticle.SpawnIndex,gParticle.SpawnIndexRemainder,gParticle.NextBurstTime,gParticle.collisionCount_N119,l9_6*0.2,0.0,gParticle.Seed2000,float(((InstanceID*((InstanceID*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,InstanceID,l9_1,l9_2,(40*(l9_0+1))-1,(l9_4+0.5)/40.0,l9_6,l9_2/39.0,l9_3,(l9_5+vec2(0.5))/vec2(40.0,1.0),l9_5/vec2(39.0,1.0),vec3(0.0),false,gParticle.CopyId,gParticle.SpawnAmount,gParticle.BurstAmount,gParticle.BurstPeriod);
ssCalculateParticleSeed(l9_7,l9_0);
gParticle=l9_7;
int l9_8=InstanceID;
int l9_9=(vfxOffsetInstancesRead+l9_8)*4;
int l9_10=l9_9/vfxTargetWidth;
vec2 l9_11=(vec2(ivec2(l9_9-(l9_10*vfxTargetWidth),l9_10))+vec2(0.5))/vec2(2048.0,vfxTargetSizeRead.y);
vec2 l9_12=l9_11+vec2(0.0);
vec3 l9_13=sc_SamplingCoordsViewToGlobal(l9_12,renderTarget0Layout,renderTarget0GetStereoViewIndex());
vec4 l9_14=texture2DLod(renderTarget0,l9_13.xy,0.0);
bool l9_15=dot(abs(l9_14),vec4(1.0))<9.9999997e-06;
bool l9_16;
if (!l9_15)
{
l9_16=!vfxBatchEnable[sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40];
}
else
{
l9_16=l9_15;
}
if (l9_16)
{
return false;
}
float l9_17=1000.0-(-1000.0);
float l9_18=0.99998999-0.0;
gParticle.Position.x=(-1000.0)+(((DecodeFloat32(l9_14,true)-0.0)*l9_17)/l9_18);
gParticle.Position.y=(-1000.0)+(((DecodeFloat32(texture2DLod(renderTarget1,sc_SamplingCoordsViewToGlobal(l9_12,renderTarget1Layout,renderTarget1GetStereoViewIndex()).xy,0.0),true)-0.0)*l9_17)/l9_18);
gParticle.Position.z=(-1000.0)+(((DecodeFloat32(texture2DLod(renderTarget2,sc_SamplingCoordsViewToGlobal(l9_12,renderTarget2Layout,renderTarget2GetStereoViewIndex()).xy,0.0),true)-0.0)*l9_17)/l9_18);
gParticle.Velocity.x=(-1000.0)+(((DecodeFloat32(texture2DLod(renderTarget3,sc_SamplingCoordsViewToGlobal(l9_12,renderTarget3Layout,renderTarget3GetStereoViewIndex()).xy,0.0),true)-0.0)*l9_17)/l9_18);
vec2 l9_19=l9_11+vec2(0.00048828125,0.0);
gParticle.Velocity.y=(-1000.0)+(((DecodeFloat32(texture2DLod(renderTarget0,sc_SamplingCoordsViewToGlobal(l9_19,renderTarget0Layout,renderTarget0GetStereoViewIndex()).xy,0.0),true)-0.0)*l9_17)/l9_18);
gParticle.Velocity.z=(-1000.0)+(((DecodeFloat32(texture2DLod(renderTarget1,sc_SamplingCoordsViewToGlobal(l9_19,renderTarget1Layout,renderTarget1GetStereoViewIndex()).xy,0.0),true)-0.0)*l9_17)/l9_18);
float l9_20=0.2-0.0;
gParticle.Life=0.0+(((DecodeFloat32(texture2DLod(renderTarget2,sc_SamplingCoordsViewToGlobal(l9_19,renderTarget2Layout,renderTarget2GetStereoViewIndex()).xy,0.0),true)-0.0)*l9_20)/l9_18);
gParticle.Age=0.0+(((DecodeFloat32(texture2DLod(renderTarget3,sc_SamplingCoordsViewToGlobal(l9_19,renderTarget3Layout,renderTarget3GetStereoViewIndex()).xy,0.0),true)-0.0)*l9_20)/l9_18);
vec2 l9_21=l9_11+vec2(0.0009765625,0.0);
vec4 l9_22=texture2DLod(renderTarget0,sc_SamplingCoordsViewToGlobal(l9_21,renderTarget0Layout,renderTarget0GetStereoViewIndex()).xy,0.0);
vec4 l9_23=texture2DLod(renderTarget1,sc_SamplingCoordsViewToGlobal(l9_21,renderTarget1Layout,renderTarget1GetStereoViewIndex()).xy,0.0);
vec4 l9_24=texture2DLod(renderTarget2,sc_SamplingCoordsViewToGlobal(l9_21,renderTarget2Layout,renderTarget2GetStereoViewIndex()).xy,0.0);
vec4 l9_25=texture2DLod(renderTarget3,sc_SamplingCoordsViewToGlobal(l9_21,renderTarget3Layout,renderTarget3GetStereoViewIndex()).xy,0.0);
float l9_26=100.0-0.0;
gParticle.Size=0.0+(((DecodeFloat16(vec2(l9_22.xy),true)-0.0)*l9_26)/l9_18);
float l9_27=1.0-(-1.0);
gParticle.Quaternion.x=(-1.0)+(((DecodeFloat16(vec2(l9_22.zw),true)-0.0)*l9_27)/l9_18);
gParticle.Quaternion.y=(-1.0)+(((DecodeFloat16(vec2(l9_23.xy),true)-0.0)*l9_27)/l9_18);
gParticle.Quaternion.z=(-1.0)+(((DecodeFloat16(vec2(l9_23.zw),true)-0.0)*l9_27)/l9_18);
gParticle.Quaternion.w=(-1.0)+(((DecodeFloat16(vec2(l9_24.xy),true)-0.0)*l9_27)/l9_18);
gParticle.Mass=0.0+(((DecodeFloat16(vec2(l9_24.zw),true)-0.0)*l9_26)/l9_18);
float l9_28=1.00001-0.0;
float l9_29=1.0-0.0;
gParticle.Color.x=0.0+(((DecodeFloat8(l9_25.x,true)-0.0)*l9_28)/l9_29);
gParticle.Color.y=0.0+(((DecodeFloat8(l9_25.y,true)-0.0)*l9_28)/l9_29);
gParticle.Color.z=0.0+(((DecodeFloat8(l9_25.z,true)-0.0)*l9_28)/l9_29);
gParticle.Color.w=0.0+(((DecodeFloat8(l9_25.w,true)-0.0)*l9_28)/l9_29);
vec2 l9_30=l9_11+vec2(0.0014648438,0.0);
gParticle.collisionCount_N119=0.0+(((DecodeFloat8(texture2DLod(renderTarget0,sc_SamplingCoordsViewToGlobal(l9_30,renderTarget0Layout,renderTarget0GetStereoViewIndex()).xy,0.0).x,true)-0.0)*(255.0-0.0))/l9_29);
vec4 l9_31=normalize(gParticle.Quaternion.yzwx);
float l9_32=l9_31.x;
float l9_33=l9_32*l9_32;
float l9_34=l9_31.y;
float l9_35=l9_34*l9_34;
float l9_36=l9_31.z;
float l9_37=l9_36*l9_36;
float l9_38=l9_32*l9_36;
float l9_39=l9_32*l9_34;
float l9_40=l9_34*l9_36;
float l9_41=l9_31.w;
float l9_42=l9_41*l9_32;
float l9_43=l9_41*l9_34;
float l9_44=l9_41*l9_36;
gParticle.Matrix=mat3(vec3(1.0-(2.0*(l9_35+l9_37)),2.0*(l9_39+l9_44),2.0*(l9_38-l9_43)),vec3(2.0*(l9_39-l9_44),1.0-(2.0*(l9_33+l9_37)),2.0*(l9_40+l9_42)),vec3(2.0*(l9_38+l9_43),2.0*(l9_40-l9_42),1.0-(2.0*(l9_33+l9_35))));
gParticle.Velocity=floor((gParticle.Velocity*2000.0)+vec3(0.5))*0.00050000002;
gParticle.Position=floor((gParticle.Position*2000.0)+vec3(0.5))*0.00050000002;
gParticle.Color=floor((gParticle.Color*2000.0)+vec4(0.5))*0.00050000002;
gParticle.Size=floor((gParticle.Size*2000.0)+0.5)*0.00050000002;
gParticle.Mass=floor((gParticle.Mass*2000.0)+0.5)*0.00050000002;
gParticle.Life=floor((gParticle.Life*2000.0)+0.5)*0.00050000002;
return true;
}
vec4 ssRandVec4(int seed)
{
return vec4(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*7177)*((seed*1969894119)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*18919)*((seed*2066534441)+101146501))+1559861749)&2147483647)*4.6566129e-10);
}
vec3 ssRandVec3(int seed)
{
return vec3(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*7177)*((seed*1969894119)+101146501))+1559861749)&2147483647)*4.6566129e-10);
}
vec2 ssRandVec2(int seed)
{
return vec2(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.6566129e-10);
}
vec4 ssGetParticleRandom(int Dimension,bool UseTime,bool UseNodeID,bool UseParticleID,float NodeID,ssParticle Particle,float ExtraSeed,float Time)
{
vec4 l9_0;
if (UseTime)
{
vec4 l9_1=vec4(0.0);
l9_1.x=floor(fract(Time)*1000.0);
l9_0=l9_1;
}
else
{
l9_0=vec4(0.0);
}
vec4 l9_2;
if (UseParticleID)
{
vec4 l9_3=l9_0;
l9_3.y=float(Particle.Index1D^((Particle.Index1D*15299)+Particle.Index1D));
l9_2=l9_3;
}
else
{
l9_2=l9_0;
}
vec4 l9_4;
if (UseNodeID)
{
vec4 l9_5=l9_2;
l9_5.z=NodeID;
l9_4=l9_5;
}
else
{
l9_4=l9_2;
}
float l9_6=ExtraSeed;
int l9_7=(((int(l9_4.x)*15299)^(int(l9_4.y)*30133))^(int(l9_4.z)*17539))^(int(l9_6*1000.0)*12113);
vec4 l9_8;
if (Dimension==1)
{
vec4 l9_9=vec4(0.0);
l9_9.x=float(((l9_7*((l9_7*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10;
l9_8=l9_9;
}
else
{
vec4 l9_10;
if (Dimension==2)
{
vec2 l9_11=ssRandVec2(l9_7);
l9_10=vec4(l9_11.x,l9_11.y,vec4(0.0).z,vec4(0.0).w);
}
else
{
vec4 l9_12;
if (Dimension==3)
{
vec3 l9_13=ssRandVec3(l9_7);
l9_12=vec4(l9_13.x,l9_13.y,l9_13.z,vec4(0.0).w);
}
else
{
l9_12=ssRandVec4(l9_7);
}
l9_10=l9_12;
}
l9_8=l9_10;
}
return l9_8;
}
void Node150_Particle_Random(vec3 Min,vec3 Max,out vec3 Random,ssGlobals Globals)
{
Random=mix(Min,Max,ssGetParticleRandom(3,true,true,true,150.0,gParticle,0.0,Globals.gTimeElapsed).xyz);
}
void Node154_Particle_Random(vec3 Min,vec3 Max,out vec3 Random,ssGlobals Globals)
{
Random=mix(Min,Max,ssGetParticleRandom(3,true,true,true,154.0,gParticle,0.0,Globals.gTimeElapsed).xyz);
}
void Node44_Particle_Random(float Min,float Max,out float Random,ssGlobals Globals)
{
Random=mix(Min,Max,ssGetParticleRandom(1,false,true,true,44.0,gParticle,0.0,Globals.gTimeElapsed).x);
}
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
varStereoViewID=float(sc_StereoViewID);
}
#endif
sc_SetClipDistance(clipPosition);
gl_Position=clipPosition;
}
float snoise(vec2 v)
{
#if (SC_DEVICE_CLASS>=2)
{
vec2 l9_0=floor(v+vec2(dot(v,vec2(0.36602542))));
vec2 l9_1=(v-l9_0)+vec2(dot(l9_0,vec2(0.21132487)));
float l9_2=l9_1.x;
float l9_3=l9_1.y;
bvec2 l9_4=bvec2(l9_2>l9_3);
vec2 l9_5=vec2(l9_4.x ? vec2(1.0,0.0).x : vec2(0.0,1.0).x,l9_4.y ? vec2(1.0,0.0).y : vec2(0.0,1.0).y);
vec2 l9_6=(l9_1+vec2(0.21132487))-l9_5;
vec2 l9_7=l9_1+vec2(-0.57735026);
vec2 l9_8=l9_0-(floor(l9_0*0.0034602077)*289.0);
vec3 l9_9=vec3(l9_8.y)+vec3(0.0,l9_5.y,1.0);
vec3 l9_10=((l9_9*34.0)+vec3(1.0))*l9_9;
vec3 l9_11=((l9_10-(floor(l9_10*0.0034602077)*289.0))+vec3(l9_8.x))+vec3(0.0,l9_5.x,1.0);
vec3 l9_12=((l9_11*34.0)+vec3(1.0))*l9_11;
vec3 l9_13=max(vec3(0.5)-vec3(dot(l9_1,l9_1),dot(l9_6,l9_6),dot(l9_7,l9_7)),vec3(0.0));
vec3 l9_14=l9_13*l9_13;
vec3 l9_15=(fract((l9_12-(floor(l9_12*0.0034602077)*289.0))*vec3(0.024390243))*2.0)-vec3(1.0);
vec3 l9_16=abs(l9_15)-vec3(0.5);
vec3 l9_17=l9_15-floor(l9_15+vec3(0.5));
vec3 l9_18=vec3(0.0);
l9_18.x=(l9_17.x*l9_2)+(l9_16.x*l9_3);
vec2 l9_19=(l9_17.yz*vec2(l9_6.x,l9_7.x))+(l9_16.yz*vec2(l9_6.y,l9_7.y));
return 130.0*dot((l9_14*l9_14)*(vec3(1.7928429)-(((l9_17*l9_17)+(l9_16*l9_16))*0.85373473)),vec3(l9_18.x,l9_19.x,l9_19.y));
}
#else
{
return 0.0;
}
#endif
}
vec4 matrixToQuaternion(mat3 m)
{
float l9_0=m[0].x;
float l9_1=m[1].y;
float l9_2=m[2].z;
float l9_3=(l9_0-l9_1)-l9_2;
float l9_4=m[1].y;
float l9_5=m[0].x;
float l9_6=m[2].z;
float l9_7=(l9_4-l9_5)-l9_6;
float l9_8=m[2].z;
float l9_9=m[0].x;
float l9_10=m[1].y;
float l9_11=(l9_8-l9_9)-l9_10;
float l9_12=m[0].x;
float l9_13=m[1].y;
float l9_14=m[2].z;
float l9_15=(l9_12+l9_13)+l9_14;
float l9_16;
int l9_17;
if (l9_3>l9_15)
{
l9_17=1;
l9_16=l9_3;
}
else
{
l9_17=0;
l9_16=l9_15;
}
float l9_18;
int l9_19;
if (l9_7>l9_16)
{
l9_19=2;
l9_18=l9_7;
}
else
{
l9_19=l9_17;
l9_18=l9_16;
}
float l9_20;
int l9_21;
if (l9_11>l9_18)
{
l9_21=3;
l9_20=l9_11;
}
else
{
l9_21=l9_19;
l9_20=l9_18;
}
float l9_22=l9_20+1.0;
float l9_23=sqrt(l9_22)*0.5;
float l9_24=0.25/l9_23;
if (l9_21==0)
{
return vec4(l9_23,(m[1].z-m[2].y)*l9_24,(m[2].x-m[0].z)*l9_24,(m[0].y-m[1].x)*l9_24);
}
else
{
if (l9_21==1)
{
return vec4((m[1].z-m[2].y)*l9_24,l9_23,(m[0].y+m[1].x)*l9_24,(m[2].x+m[0].z)*l9_24);
}
else
{
if (l9_21==2)
{
return vec4((m[2].x-m[0].z)*l9_24,(m[0].y+m[1].x)*l9_24,l9_23,(m[1].z+m[2].y)*l9_24);
}
else
{
if (l9_21==3)
{
return vec4((m[0].y-m[1].x)*l9_24,(m[2].x+m[0].z)*l9_24,(m[1].z+m[2].y)*l9_24,l9_23);
}
else
{
return vec4(1.0,0.0,0.0,0.0);
}
}
}
}
}
void main()
{
int l9_0=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID);
bool l9_1=ssDecodeParticle(l9_0);
float l9_2=min(overrideTimeDelta,0.5);
float l9_3=gParticle.TimeShift;
float l9_4=(sc_Time.x-(l9_3*l9_2))-0.0;
gParticle.Age=mod((l9_4-gParticle.SpawnOffset)+0.0,0.2);
float l9_5=gParticle.SpawnOffset;
bool l9_6=(sc_Time.x-l9_5)<(0.0-0.0);
bool l9_7;
if (!l9_6)
{
l9_7=gParticle.Age>0.2;
}
else
{
l9_7=l9_6;
}
bool l9_8=l9_7 ? true : false;
bool l9_9=!l9_8;
bool l9_10;
if (l9_9)
{
l9_10=gParticle.Life<=9.9999997e-05;
}
else
{
l9_10=l9_9;
}
bool l9_11;
if (!l9_10)
{
l9_11=mod(((max(sc_Time.x,0.1)-gParticle.SpawnOffset)-0.0)+0.0,0.2)<=l9_2;
}
else
{
l9_11=l9_10;
}
if (l9_11)
{
if (l9_2!=0.0)
{
ssGlobals l9_12=ssGlobals(sc_Time.x,l9_2,l9_4,overrideTimeElapsed[sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40]);
ssCalculateParticleSeed(gParticle,int(gParticle.CopyId));
float l9_14=floor(6.0);
gParticle.Position=(vec3(((floor(mod(gParticle.Index1DPerCopyF,l9_14))/6.0)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/l9_14)/6.0)*2.0)-1.0,0.0)*20.0)+vec3(1.0,1.0,0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(1.0);
gParticle.Age=0.0;
gParticle.Life=0.2;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
gParticle.Quaternion=vec4(0.0,0.0,0.0,1.0);
float l9_15;
if ((float(0.0==Port_Input1_N149)*1.0)!=0.0)
{
vec3 l9_16;
Node150_Particle_Random(Port_Min_N150,Port_Max_N150,l9_16,l9_12);
vec3 l9_17=l9_16;
float l9_18=1.0-clamp(Port_Import_N151,0.0,1.0);
float l9_19;
if (l9_18<=0.0)
{
l9_19=0.0;
}
else
{
l9_19=pow(l9_18,Port_Input1_N153);
}
vec3 l9_20;
Node154_Particle_Random(vec3(l9_19),Port_Max_N154,l9_20,l9_12);
vec3 l9_21=l9_20;
float l9_22;
if (l9_21.x<=0.0)
{
l9_22=0.0;
}
else
{
l9_22=sqrt(l9_21.x);
}
float l9_23;
if (l9_22<=0.0)
{
l9_23=0.0;
}
else
{
l9_23=sqrt(l9_22);
}
l9_15=abs(((((l9_17/(vec3(length(l9_17))+vec3(1.234e-06)))*vec3(l9_23,0.0,0.0))*vec3(Port_Import_N157))*Port_Import_N158).x);
}
else
{
vec3 l9_24;
Node150_Particle_Random(Port_Min_N150,Port_Max_N150,l9_24,l9_12);
vec3 l9_25=l9_24;
float l9_26=1.0-clamp(Port_Import_N151,0.0,1.0);
float l9_27;
if (l9_26<=0.0)
{
l9_27=0.0;
}
else
{
l9_27=pow(l9_26,Port_Input1_N153);
}
vec3 l9_28;
Node154_Particle_Random(vec3(l9_27),Port_Max_N154,l9_28,l9_12);
vec3 l9_29=l9_28;
float l9_30;
if (l9_29.x<=0.0)
{
l9_30=0.0;
}
else
{
l9_30=sqrt(l9_29.x);
}
float l9_31;
if (l9_30<=0.0)
{
l9_31=0.0;
}
else
{
l9_31=sqrt(l9_30);
}
l9_15=((((l9_25/(vec3(length(l9_25))+vec3(1.234e-06)))*vec3(l9_31,0.0,0.0))*vec3(Port_Import_N157))*Port_Import_N158).x;
}
float l9_32;
if ((float(0.0==Port_Input1_N162)*1.0)!=0.0)
{
vec3 l9_33;
Node150_Particle_Random(Port_Min_N150,Port_Max_N150,l9_33,l9_12);
vec3 l9_34=l9_33;
float l9_35=1.0-clamp(Port_Import_N151,0.0,1.0);
float l9_36;
if (l9_35<=0.0)
{
l9_36=0.0;
}
else
{
l9_36=pow(l9_35,Port_Input1_N153);
}
vec3 l9_37;
Node154_Particle_Random(vec3(l9_36),Port_Max_N154,l9_37,l9_12);
vec3 l9_38=l9_37;
float l9_39;
if (l9_38.y<=0.0)
{
l9_39=0.0;
}
else
{
l9_39=sqrt(l9_38.y);
}
float l9_40;
if (l9_39<=0.0)
{
l9_40=0.0;
}
else
{
l9_40=sqrt(l9_39);
}
l9_32=abs(((((l9_34/(vec3(length(l9_34))+vec3(1.234e-06)))*vec3(0.0,l9_40,0.0))*vec3(Port_Import_N157))*Port_Import_N158).y);
}
else
{
vec3 l9_41;
Node150_Particle_Random(Port_Min_N150,Port_Max_N150,l9_41,l9_12);
vec3 l9_42=l9_41;
float l9_43=1.0-clamp(Port_Import_N151,0.0,1.0);
float l9_44;
if (l9_43<=0.0)
{
l9_44=0.0;
}
else
{
l9_44=pow(l9_43,Port_Input1_N153);
}
vec3 l9_45;
Node154_Particle_Random(vec3(l9_44),Port_Max_N154,l9_45,l9_12);
vec3 l9_46=l9_45;
float l9_47;
if (l9_46.y<=0.0)
{
l9_47=0.0;
}
else
{
l9_47=sqrt(l9_46.y);
}
float l9_48;
if (l9_47<=0.0)
{
l9_48=0.0;
}
else
{
l9_48=sqrt(l9_47);
}
l9_32=((((l9_42/(vec3(length(l9_42))+vec3(1.234e-06)))*vec3(0.0,l9_48,0.0))*vec3(Port_Import_N157))*Port_Import_N158).y;
}
float l9_49;
if ((float(0.0==Port_Input1_N165)*1.0)!=0.0)
{
vec3 l9_50;
Node150_Particle_Random(Port_Min_N150,Port_Max_N150,l9_50,l9_12);
vec3 l9_51=l9_50;
float l9_52=1.0-clamp(Port_Import_N151,0.0,1.0);
float l9_53;
if (l9_52<=0.0)
{
l9_53=0.0;
}
else
{
l9_53=pow(l9_52,Port_Input1_N153);
}
vec3 l9_54;
Node154_Particle_Random(vec3(l9_53),Port_Max_N154,l9_54,l9_12);
vec3 l9_55=l9_54;
float l9_56;
if (l9_55.z<=0.0)
{
l9_56=0.0;
}
else
{
l9_56=sqrt(l9_55.z);
}
float l9_57;
if (l9_56<=0.0)
{
l9_57=0.0;
}
else
{
l9_57=sqrt(l9_56);
}
l9_49=abs(((((l9_51/(vec3(length(l9_51))+vec3(1.234e-06)))*vec3(0.0,0.0,l9_57))*vec3(Port_Import_N157))*Port_Import_N158).z);
}
else
{
vec3 l9_58;
Node150_Particle_Random(Port_Min_N150,Port_Max_N150,l9_58,l9_12);
vec3 l9_59=l9_58;
float l9_60=1.0-clamp(Port_Import_N151,0.0,1.0);
float l9_61;
if (l9_60<=0.0)
{
l9_61=0.0;
}
else
{
l9_61=pow(l9_60,Port_Input1_N153);
}
vec3 l9_62;
Node154_Particle_Random(vec3(l9_61),Port_Max_N154,l9_62,l9_12);
vec3 l9_63=l9_62;
float l9_64;
if (l9_63.z<=0.0)
{
l9_64=0.0;
}
else
{
l9_64=sqrt(l9_63.z);
}
float l9_65;
if (l9_64<=0.0)
{
l9_65=0.0;
}
else
{
l9_65=sqrt(l9_64);
}
l9_49=((((l9_59/(vec3(length(l9_59))+vec3(1.234e-06)))*vec3(0.0,0.0,l9_65))*vec3(Port_Import_N157))*Port_Import_N158).z;
}
gParticle.Position=Port_Import_N216+vec3(l9_15,l9_32,l9_49);
float l9_66;
if ((1.0*1.0)!=0.0)
{
float l9_67;
Node44_Particle_Random(Port_Import_N042,Port_Import_N043,l9_67,l9_12);
l9_66=l9_67/(length(vfxLocalAabbMax-vfxLocalAabbMin)+1.234e-06);
}
else
{
float l9_68;
Node44_Particle_Random(Port_Import_N042,Port_Import_N043,l9_68,l9_12);
l9_66=l9_68;
}
gParticle.Size=l9_66;
gParticle.Mass=mix(Port_Import_N023,Port_Import_N024,ssGetParticleRandom(1,false,true,true,26.0,gParticle,0.0,sc_Time.x).x);
gParticle.Mass=max(9.9999997e-06,gParticle.Mass);
vec3 l9_69=gParticle.Position;
vec3 l9_70=Port_Import_N054-l9_69;
float l9_71=dot(l9_70,l9_70);
float l9_72;
if (l9_71>0.0)
{
l9_72=1.0/sqrt(l9_71);
}
else
{
l9_72=0.0;
}
gParticle.Force+=(vec3(Port_Import_N053)*(l9_70*l9_72));
float l9_73=dot(Port_Import_N187,Port_Import_N187);
float l9_74;
if (l9_73>0.0)
{
l9_74=1.0/sqrt(l9_73);
}
else
{
l9_74=0.0;
}
gParticle.Force+=((Port_Import_N187*l9_74)*vec3(particles_speed));
if ((float(clamp(gParticle.Age/gParticle.Life,0.0,1.0)>(1.0-particlesReduce))*1.0)!=0.0)
{
gParticle.Dead=true;
}
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*0.033330001);
gParticle.Force=vec3(0.0);
gParticle.Position=(vfxModelMatrix[sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40]*vec4(gParticle.Position,1.0)).xyz;
int l9_75=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40;
gParticle.Velocity=mat3(vfxModelMatrix[l9_75][0].xyz,vfxModelMatrix[l9_75][1].xyz,vfxModelMatrix[l9_75][2].xyz)*gParticle.Velocity;
int l9_76=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40;
gParticle.Force=mat3(vfxModelMatrix[l9_76][0].xyz,vfxModelMatrix[l9_76][1].xyz,vfxModelMatrix[l9_76][2].xyz)*gParticle.Force;
gParticle.Size=max(length(vfxModelMatrix[sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40][0].xyz),max(length(vfxModelMatrix[sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40][1].xyz),length(vfxModelMatrix[sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40][2].xyz)))*gParticle.Size;
int l9_77=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID)/40;
gParticle.Matrix=mat3(vfxModelMatrix[l9_77][0].xyz,vfxModelMatrix[l9_77][1].xyz,vfxModelMatrix[l9_77][2].xyz)*gParticle.Matrix;
gParticle.Spawned=true;
}
}
if (gParticle.Dead)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
vec3 l9_78=mix(Port_Import_N142,Port_Import_N006,vec3(clamp(gParticle.Age/gParticle.Life,0.0,1.0)));
vec4 l9_79=vec4(l9_78.x,l9_78.y,l9_78.z,vec4(0.0).w);
l9_79.w=gParticle.Color.w;
gParticle.Color=l9_79;
vec3 l9_80=((gParticle.Position+Port_Import_N208)+(Port_Import_N318*vec3(l9_4*Port_Multiplier_N319)))*(vec3(1.0)/Port_Import_N322);
vec2 l9_81=vec2(l9_80.xy)+Port_Input1_N326;
vec2 l9_82=vec2(l9_80.yz)+Port_Input1_N329;
vec2 l9_83=vec2(l9_80.zx)+Port_Input1_N332;
gParticle.Force+=(vec3(Tweak_N12,Tweak_N12/(Port_Input1_N014+1.234e-06),Tweak_N12)*((vec3(floor(((snoise(vec2(floor(l9_81.x*10000.0)*9.9999997e-05,floor(l9_81.y*10000.0)*9.9999997e-05)*(Port_Scale_N327*0.5))*0.5)+0.5)*10000.0)*9.9999997e-05,floor(((snoise(vec2(floor(l9_82.x*10000.0)*9.9999997e-05,floor(l9_82.y*10000.0)*9.9999997e-05)*(Port_Scale_N330*0.5))*0.5)+0.5)*10000.0)*9.9999997e-05,floor(((snoise(vec2(floor(l9_83.x*10000.0)*9.9999997e-05,floor(l9_83.y*10000.0)*9.9999997e-05)*(Port_Scale_N333*0.5))*0.5)+0.5)*10000.0)*9.9999997e-05)*Port_Input1_N335)-vec3(1.0)));
vec3 l9_84=abs(gParticle.Velocity*vec3(gParticle.Mass))/(vec3(l9_2*Port_Multiplier_N272)+vec3(1.234e-06));
gParticle.Force+=clamp((((vec3(Port_Import_N126)*vec3(Port_Import_N127))*vec3(Port_Import_N128))*((-gParticle.Velocity)*vec3(length(gParticle.Velocity))))*vec3(Port_Input4_N137),-l9_84,l9_84);
vec3 l9_85=Port_Import_N112+vec3(Port_Value1_N213,Port_Value2_N213,Port_Value3_N213);
vec3 l9_86=gParticle.Velocity;
vec3 l9_87=gParticle.Force;
vec3 l9_88=gParticle.Position;
vec3 l9_89=vec3(l9_2);
vec3 l9_90=normalize(Port_Import_N113);
vec3 l9_91;
vec3 l9_92;
vec3 l9_93;
bool l9_94;
if ((dot(l9_90,(((gParticle.Velocity+((gParticle.Force/vec3(max(9.9999997e-06,gParticle.Mass)))*l9_89))*l9_89)+gParticle.Position)-l9_85)-Port_Import_N116)<0.0)
{
vec3 l9_95=l9_90*dot(l9_90,gParticle.Velocity);
vec3 l9_96=((gParticle.Velocity-l9_95)*(1.0-clamp(Port_Import_N115,0.0,1.0)))-(l9_95*clamp(Port_Import_N114,0.0,1.0));
l9_94=true;
l9_93=l9_96;
l9_92=l9_88+(l9_90*(-(dot(l9_90,gParticle.Position-l9_85)-Port_Import_N116)));
l9_91=l9_87*float(length(l9_96)>Port_VelocityThreshold_N118);
}
else
{
l9_94=false;
l9_93=l9_86;
l9_92=l9_88;
l9_91=l9_87;
}
float l9_97=floor(Port_CollisionCount_N118);
float l9_98;
if (l9_94)
{
l9_98=l9_97+1.0;
}
else
{
l9_98=l9_97;
}
if (gParticle.Spawned)
{
gParticle.collisionCount_N119=Port_DefaultFloat_N119;
}
else
{
gParticle.collisionCount_N119=l9_98;
}
gParticle.Force=l9_91;
gParticle.Velocity=l9_93;
gParticle.Position=l9_92;
if ((0.0*1.0)!=0.0)
{
gParticle.Dead=true;
}
gParticle.Size=(clamp(sin((1.0-clamp(gParticle.Age/gParticle.Life,0.0,1.0))*Port_Input1_N171)+0.001,Port_Input1_N109+0.001,Port_Input2_N109+0.001)-0.001)*particle_scale;
if ((float(clamp(gParticle.Age/gParticle.Life,0.0,1.0)>(1.0-particlesReduce))*1.0)!=0.0)
{
gParticle.Dead=true;
}
gParticle.Quaternion=matrixToQuaternion(gParticle.Matrix);
if (gParticle.Dead)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
float l9_99;
if (abs(gParticle.Force.x)<0.0049999999)
{
l9_99=0.0;
}
else
{
l9_99=gParticle.Force.x;
}
gParticle.Force.x=l9_99;
float l9_100;
if (abs(gParticle.Force.y)<0.0049999999)
{
l9_100=0.0;
}
else
{
l9_100=gParticle.Force.y;
}
gParticle.Force.y=l9_100;
float l9_101;
if (abs(gParticle.Force.z)<0.0049999999)
{
l9_101=0.0;
}
else
{
l9_101=gParticle.Force.z;
}
gParticle.Force.z=l9_101;
gParticle.Mass=max(0.0049999999,gParticle.Mass);
if (l9_2!=0.0)
{
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*l9_2);
}
float l9_102;
if (abs(gParticle.Velocity.x)<0.0049999999)
{
l9_102=0.0;
}
else
{
l9_102=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_102;
float l9_103;
if (abs(gParticle.Velocity.y)<0.0049999999)
{
l9_103=0.0;
}
else
{
l9_103=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_103;
float l9_104;
if (abs(gParticle.Velocity.z)<0.0049999999)
{
l9_104=0.0;
}
else
{
l9_104=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_104;
gParticle.Position+=(gParticle.Velocity*l9_2);
vec2 l9_105=vec2(4.0,1.0)/vec2(2048.0,vfxTargetSizeWrite.y);
int l9_106=vfxOffsetInstancesWrite+l9_0;
float l9_107;
if (texture0.x<0.5)
{
l9_107=0.0;
}
else
{
l9_107=l9_105.x;
}
float l9_108;
if (texture0.y<0.5)
{
l9_108=0.0;
}
else
{
l9_108=l9_105.y;
}
sc_SetClipPosition(vec4(((vec2(l9_107,l9_108)+(vec2(float(l9_106%512),float(l9_106/512))*l9_105))*2.0)-vec2(1.0),1.0,1.0));
Interp_Particle_Index=float(l9_0);
Interp_Particle_Coord=texture0;
Interp_Particle_Force=gParticle.Force;
Interp_Particle_SpawnIndex=gParticle.SpawnIndex;
Interp_Particle_NextBurstTime=gParticle.NextBurstTime;
Interp_Particle_Position=gParticle.Position;
Interp_Particle_Velocity=gParticle.Velocity;
Interp_Particle_Life=gParticle.Life;
Interp_Particle_Age=gParticle.Age;
Interp_Particle_Size=gParticle.Size;
Interp_Particle_Color=gParticle.Color;
Interp_Particle_Quaternion=gParticle.Quaternion;
Interp_Particle_collisionCount_N119=gParticle.collisionCount_N119;
Interp_Particle_Mass=gParticle.Mass;
if (gParticle.Dead)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
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
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 0
#elif renderTarget0HasSwappedViews==1
#undef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 1
#endif
#ifndef renderTarget0Layout
#define renderTarget0Layout 0
#endif
#ifndef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 0
#elif renderTarget1HasSwappedViews==1
#undef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 1
#endif
#ifndef renderTarget1Layout
#define renderTarget1Layout 0
#endif
#ifndef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 0
#elif renderTarget2HasSwappedViews==1
#undef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 1
#endif
#ifndef renderTarget2Layout
#define renderTarget2Layout 0
#endif
#ifndef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 0
#elif renderTarget3HasSwappedViews==1
#undef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 1
#endif
#ifndef renderTarget3Layout
#define renderTarget3Layout 0
#endif
uniform vec4 sc_UniformConstants;
varying float varStereoViewID;
varying vec2 varShadowTex;
varying float varClipDistance;
varying vec4 varScreenPos;
varying float Interp_Particle_Index;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Size;
varying vec4 Interp_Particle_Color;
varying vec4 Interp_Particle_Quaternion;
varying float Interp_Particle_collisionCount_N119;
varying float Interp_Particle_Mass;
varying float Interp_Particle_SpawnIndex;
varying float Interp_Particle_NextBurstTime;
varying vec2 Interp_Particle_Coord;
varying vec3 varPos;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varPackedTex;
varying vec2 varScreenTexturePos;
varying vec4 varColor;
varying vec3 Interp_Particle_Force;
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
vec4 ssEncodeFloat32(float Value,float Min,float Max,float RemapRange)
{
vec4 l9_0=fract(vec4(1.0,255.0,65025.0,16581375.0)*(0.0+(((clamp(Value,Min,Max)-Min)*(RemapRange-0.0))/(Max-Min))));
return l9_0-(l9_0.yzww*vec4(0.0039215689,0.0039215689,0.0039215689,0.0));
}
vec2 ssEncodeFloat16(float Value,float Min,float Max,float RemapRange)
{
vec4 l9_0=fract(vec4(1.0,255.0,65025.0,16581375.0)*(0.0+(((clamp(Value,Min,Max)-Min)*(RemapRange-0.0))/(Max-Min))));
return (l9_0-(l9_0.yzww*vec4(0.0039215689,0.0039215689,0.0039215689,0.0))).xy;
}
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
col.x+=zero*float(cacheConst);
sc_FragData0=col;
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
void sc_writeFragData3(vec4 col)
{
#if sc_FragDataCount>=4
sc_FragData3=col;
#endif
}
void main()
{
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==0))
{
if (varClipDistance<0.0)
{
discard;
}
}
#endif
int l9_0;
#if (renderTarget0HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
int l9_1;
#if (renderTarget1HasSwappedViews)
{
l9_1=1-sc_GetStereoViewIndex();
}
#else
{
l9_1=sc_GetStereoViewIndex();
}
#endif
int l9_2;
#if (renderTarget2HasSwappedViews)
{
l9_2=1-sc_GetStereoViewIndex();
}
#else
{
l9_2=sc_GetStereoViewIndex();
}
#endif
int l9_3;
#if (renderTarget3HasSwappedViews)
{
l9_3=1-sc_GetStereoViewIndex();
}
#else
{
l9_3=sc_GetStereoViewIndex();
}
#endif
int l9_4=int(floor(Interp_Particle_Coord.x*4.0));
float l9_5;
float l9_6;
float l9_7;
float l9_8;
float l9_9;
float l9_10;
float l9_11;
float l9_12;
float l9_13;
float l9_14;
float l9_15;
float l9_16;
float l9_17;
float l9_18;
float l9_19;
float l9_20;
if (l9_4==0)
{
vec4 l9_21=ssEncodeFloat32(Interp_Particle_Position.x,-1000.0,1000.0,0.99998999);
vec4 l9_22=ssEncodeFloat32(Interp_Particle_Position.y,-1000.0,1000.0,0.99998999);
vec4 l9_23=ssEncodeFloat32(Interp_Particle_Position.z,-1000.0,1000.0,0.99998999);
vec4 l9_24=ssEncodeFloat32(Interp_Particle_Velocity.x,-1000.0,1000.0,0.99998999);
l9_20=l9_24.w;
l9_19=l9_24.z;
l9_18=l9_24.y;
l9_17=l9_24.x;
l9_16=l9_23.w;
l9_15=l9_23.z;
l9_14=l9_23.y;
l9_13=l9_23.x;
l9_12=l9_22.w;
l9_11=l9_22.z;
l9_10=l9_22.y;
l9_9=l9_22.x;
l9_8=l9_21.w;
l9_7=l9_21.z;
l9_6=l9_21.y;
l9_5=l9_21.x;
}
else
{
float l9_25;
float l9_26;
float l9_27;
float l9_28;
float l9_29;
float l9_30;
float l9_31;
float l9_32;
float l9_33;
float l9_34;
float l9_35;
float l9_36;
float l9_37;
float l9_38;
float l9_39;
float l9_40;
if (l9_4==1)
{
vec4 l9_41=ssEncodeFloat32(Interp_Particle_Velocity.y,-1000.0,1000.0,0.99998999);
vec4 l9_42=ssEncodeFloat32(Interp_Particle_Velocity.z,-1000.0,1000.0,0.99998999);
vec4 l9_43=ssEncodeFloat32(Interp_Particle_Life,0.0,0.2,0.99998999);
vec4 l9_44=ssEncodeFloat32(Interp_Particle_Age,0.0,0.2,0.99998999);
l9_40=l9_44.w;
l9_39=l9_44.z;
l9_38=l9_44.y;
l9_37=l9_44.x;
l9_36=l9_43.w;
l9_35=l9_43.z;
l9_34=l9_43.y;
l9_33=l9_43.x;
l9_32=l9_42.w;
l9_31=l9_42.z;
l9_30=l9_42.y;
l9_29=l9_42.x;
l9_28=l9_41.w;
l9_27=l9_41.z;
l9_26=l9_41.y;
l9_25=l9_41.x;
}
else
{
float l9_45;
float l9_46;
float l9_47;
float l9_48;
float l9_49;
float l9_50;
float l9_51;
float l9_52;
float l9_53;
float l9_54;
float l9_55;
float l9_56;
float l9_57;
float l9_58;
float l9_59;
float l9_60;
if (l9_4==2)
{
vec2 l9_61=ssEncodeFloat16(Interp_Particle_Size,0.0,100.0,0.99998999);
vec2 l9_62=ssEncodeFloat16(Interp_Particle_Quaternion.x,-1.0,1.0,0.99998999);
vec2 l9_63=ssEncodeFloat16(Interp_Particle_Quaternion.y,-1.0,1.0,0.99998999);
vec2 l9_64=ssEncodeFloat16(Interp_Particle_Quaternion.z,-1.0,1.0,0.99998999);
vec2 l9_65=ssEncodeFloat16(Interp_Particle_Quaternion.w,-1.0,1.0,0.99998999);
vec2 l9_66=ssEncodeFloat16(Interp_Particle_Mass,0.0,100.0,0.99998999);
float l9_67=1.0-0.0;
float l9_68=1.00001-0.0;
l9_60=0.0+(((clamp(Interp_Particle_Color.w,0.0,1.00001)-0.0)*l9_67)/l9_68);
l9_59=0.0+(((clamp(Interp_Particle_Color.z,0.0,1.00001)-0.0)*l9_67)/l9_68);
l9_58=0.0+(((clamp(Interp_Particle_Color.y,0.0,1.00001)-0.0)*l9_67)/l9_68);
l9_57=0.0+(((clamp(Interp_Particle_Color.x,0.0,1.00001)-0.0)*l9_67)/l9_68);
l9_56=l9_66.y;
l9_55=l9_66.x;
l9_54=l9_65.y;
l9_53=l9_65.x;
l9_52=l9_64.y;
l9_51=l9_64.x;
l9_50=l9_63.y;
l9_49=l9_63.x;
l9_48=l9_62.y;
l9_47=l9_62.x;
l9_46=l9_61.y;
l9_45=l9_61.x;
}
else
{
float l9_69;
if (l9_4==3)
{
l9_69=0.0+(((clamp(Interp_Particle_collisionCount_N119,0.0,255.0)-0.0)*(1.0-0.0))/(255.0-0.0));
}
else
{
l9_69=0.0;
}
l9_60=0.0;
l9_59=0.0;
l9_58=0.0;
l9_57=0.0;
l9_56=0.0;
l9_55=0.0;
l9_54=0.0;
l9_53=0.0;
l9_52=0.0;
l9_51=0.0;
l9_50=0.0;
l9_49=0.0;
l9_48=0.0;
l9_47=0.0;
l9_46=0.0;
l9_45=l9_69;
}
l9_40=l9_60;
l9_39=l9_59;
l9_38=l9_58;
l9_37=l9_57;
l9_36=l9_56;
l9_35=l9_55;
l9_34=l9_54;
l9_33=l9_53;
l9_32=l9_52;
l9_31=l9_51;
l9_30=l9_50;
l9_29=l9_49;
l9_28=l9_48;
l9_27=l9_47;
l9_26=l9_46;
l9_25=l9_45;
}
l9_20=l9_40;
l9_19=l9_39;
l9_18=l9_38;
l9_17=l9_37;
l9_16=l9_36;
l9_15=l9_35;
l9_14=l9_34;
l9_13=l9_33;
l9_12=l9_32;
l9_11=l9_31;
l9_10=l9_30;
l9_9=l9_29;
l9_8=l9_28;
l9_7=l9_27;
l9_6=l9_26;
l9_5=l9_25;
}
vec4 l9_70=vec4(l9_5,l9_6,l9_7,l9_8);
vec4 l9_71=vec4(l9_9,l9_10,l9_11,l9_12);
vec4 l9_72=vec4(l9_13,l9_14,l9_15,l9_16);
vec4 l9_73=vec4(l9_17,l9_18,l9_19,l9_20);
vec4 l9_74;
if (dot(((l9_70+l9_71)+l9_72)+l9_73,vec4(0.23454))==0.34231836)
{
l9_74=l9_70+vec4(1e-06);
}
else
{
l9_74=l9_70;
}
sc_writeFragData0Internal(l9_74,sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(l9_71);
sc_writeFragData2(l9_72);
sc_writeFragData3(l9_73);
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
