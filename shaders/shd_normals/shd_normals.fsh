varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D light;
uniform int lightNum;
uniform int lightNumMax;
uniform int lightMaxRadius;
uniform int depthScale;
uniform int camX;
uniform int camY;
uniform int camW;
uniform int camH;
uniform int roomW;
uniform int roomH;
uniform int frameNum;
uniform vec2 reso;

uniform bool shaftLighting;
uniform vec2 shaftAngle;

uniform sampler2D norm;
uniform sampler2D spec;

const float PI = 3.14159265359;

//float rand(vec2 n)
//{
//    return fract(sin(dot(n,vec2(85.7255,-73.4975))+0.5)*46247.34645);
//}

float linearStep(float edge0, float edge1, float value)
{
	float result = clamp((value-edge0)/(edge1-edge0), 0.0, 1.0);
	return result;
}

void main()
{	
	
	float sampleDepth = texture2D(spec, v_vTexcoord ).r;
	vec3 normalPos = vec3(v_vTexcoord.xy,sampleDepth);
	vec3 normalVector = texture2D(norm, v_vTexcoord ).rgb*2.0-1.0;
	
	float brightnessMod = 0.0;
	for (float i = 0.0; i < float(lightNum); i++)
	{
		vec4 lightData = texture2D(light,vec2((i+0.5)/float(lightNumMax),0.0));
		vec3 lightPos = vec3((lightData.r*float(roomW)-float(camX))/float(camW),(lightData.g*float(roomH)-float(camY))/float(camH),lightData.b);
		vec3 lightVector = vec3(normalPos-lightPos);
		float lightVectorRatio = reso.x/reso.y;
		vec3 lightVectorRelative = vec3(lightVector.x*float(reso.x),lightVector.y*float(reso.y),lightVector.z*float(depthScale));
		float angle = acos(dot(normalize(lightVectorRelative),normalize(normalVector))*0.9999);
		float distMod = 1.0-linearStep(0.0,lightData.a*float(lightMaxRadius),length(lightVectorRelative));
		brightnessMod += distMod*smoothstep(0.0,PI,angle);
	}
	if (shaftLighting)
	{
		vec3 lightPos = vec3(float(roomW)/2.0-10000.0*shaftAngle.x,float(roomH)/2.0+10000.0*shaftAngle.y,0.5);
		vec3 lightVector = vec3(normalPos-lightPos);
		float lightVectorRatio = reso.x/reso.y;
		vec3 lightVectorRelative = vec3(lightVector.x*float(reso.x),lightVector.y*float(reso.y),lightVector.z*float(depthScale));
		float angle = acos(dot(normalize(lightVectorRelative),normalize(normalVector))*0.9999);
		float distMod = 1.0-linearStep(0.0,100000.0*float(lightMaxRadius),length(lightVectorRelative));
		brightnessMod += distMod*smoothstep(0.0,PI,angle);
	}
	//gl_FragColor = vec4(vec3(1.0) * 1.0-min(brightnessMod,1.0),1.0);
	gl_FragColor = vec4((v_vColour*texture2D(gm_BaseTexture,v_vTexcoord)).rgb*(clamp(brightnessMod,0.0,1.0)),1.0);
	//gl_FragColor = v_vColour*texture2D(gm_BaseTexture,v_vTexcoord)*(1.0-clamp(brightnessMod,0.0,1.0));
}
