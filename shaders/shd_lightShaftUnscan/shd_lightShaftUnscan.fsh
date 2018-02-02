varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float blurFactor;
uniform vec2 angle;
uniform vec2 reso;

//sample from the 1D texture
float sample(float stepVal, float d1, float d2)
{
	vec4 shaftSample = texture2D(gm_BaseTexture, vec2(stepVal,0.0));
	float dist1 = d1 <= shaftSample.g ? 1.0:0.0;
	float dist2 = d2 <= shaftSample.a ? 1.0:0.0;
	return max(dist1,dist2);
}

void main()
{	
	//	//translate
	//vec2 coordPrime = v_vTexcoord-0.5;
	//	//rotate
	//coordPrime = vec2(coordPrime.x*angle.x-coordPrime.y*angle.y,coordPrime.x*angle.y+coordPrime.y*angle.x);
	//	//scale
	//float square = sqrt(reso.x*reso.x+reso.y*reso.y);
	//coordPrime = vec2(coordPrime.x/(square/reso.x),coordPrime.y/(square/reso.y));
	//	//translate back
	//coordPrime += 0.5;
	
		//grab individual data (can be removed)
	//float stepVal = coordPrime.y;
	//float dist = coordPrime.x;
	
		//grab ver 2
	float stepVal = v_vTexcoord.y;
	float dist = v_vTexcoord.x;
	
	vec4 shaftSample = texture2D(gm_BaseTexture, vec2(stepVal,0.0));
	float margin = 0.005;
	
	if (abs(shaftSample.r - dist) <= margin)
	{
		gl_FragColor = vec4(vec3(0.0), 1.0);
	}
	else if (abs(shaftSample.g - dist) <= margin)
	{
		gl_FragColor = vec4(vec3(1.0), 1.0);
	}
	else if (abs(shaftSample.b - dist) <= margin)
	{
		gl_FragColor = vec4(vec3(0.0), 1.0);
	}
	else if (abs(shaftSample.a - dist) <= margin)
	{
		gl_FragColor = vec4(vec3(1.0), 1.0);
	}
	else
	{
		gl_FragColor = vec4(vec3(0.5), 1.0);
	}
}