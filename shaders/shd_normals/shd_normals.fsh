varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D light;
uniform float lightNum;

uniform float RAND;

uniform sampler2D norm;
uniform sampler2D spec;

const float PI = 3.14159265359;

void main()
{
	float sampleDepth = texture2D(spec, v_vTexcoord ).r;
	vec3 normalPos = vec3(v_vTexcoord.xy,sampleDepth);
	vec3 normalVector = texture2D(norm, v_vTexcoord ).rgb*2.0-1.0;
	
	float brightnessMod = 0.0;
	for (float i = 0.0; i < lightNum; i++)
	{
		vec3 lightPos = texture2D(light,vec2(i,0.0)).rgb;
		vec3 lightVector = vec3(normalPos-lightPos);
		float angle = acos(dot(normalize(lightVector),normalize(normalVector)));
		brightnessMod += smoothstep(0.0,PI/2.0,angle);
	}
	vec3 lightPos = texture2D(light,vec2(0.0,0.0)).rgb;
	vec3 lightVector = vec3(normalPos-lightPos);
	gl_FragColor = vec4((v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * min(brightnessMod,1.0)).rgb,1.0);
	//gl_FragColor = vec4((v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )).rgb,1.0);
	//gl_FragColor = vec4(lightVector*0.5+vec3(0.5),1.0);
}
