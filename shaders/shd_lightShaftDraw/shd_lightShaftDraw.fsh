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
		//translate
	vec2 coordPrime = v_vTexcoord-0.5;
		//rotate
	coordPrime = vec2(coordPrime.x*angle.x-coordPrime.y*angle.y,coordPrime.x*angle.y+coordPrime.y*angle.x);
		//scale
	float square = sqrt(reso.x*reso.x+reso.y*reso.y);
	coordPrime = vec2(coordPrime.x/(square/reso.x),coordPrime.y/(square/reso.y));
		//translate back
	coordPrime += 0.5;
	
		//grab individual data (can be removed)
	float stepVal = coordPrime.y;
	float dist = coordPrime.x;
	
	vec4 shaftSample = texture2D(gm_BaseTexture, vec2(stepVal,0.0));
	//float d1 = dist-shaftSample.r;
	//float d2 = dist-shaftSample.b;
	float d1 = clamp(dist-shaftSample.r,0.0,1.0);
	float d2 = clamp(dist-shaftSample.b,0.0,1.0);
	
	float center = sample(stepVal,d1,d2);
		
    //multiply the blur amount by distance ((currently altered so output is clearer)
    float blur = (blurFactor/reso.x);// * smoothstep(d1+d2, 0.0, 1.0); 

	//simple gaussian radial blur
    float sum = 0.0;

    sum += sample(stepVal - 4.0*blur, d1, d2) * 0.05;
    sum += sample(stepVal - 3.0*blur, d1, d2) * 0.09;
    sum += sample(stepVal - 2.0*blur, d1, d2) * 0.12;
    sum += sample(stepVal - 1.0*blur, d1, d2) * 0.15;

    sum += center * 0.16;

    sum += sample(stepVal + 1.0*blur, d1, d2) * 0.15;
    sum += sample(stepVal + 2.0*blur, d1, d2) * 0.12;
    sum += sample(stepVal + 3.0*blur, d1, d2) * 0.09;
    sum += sample(stepVal + 4.0*blur, d1, d2) * 0.05;
	
	//gl_FragColor = vec4(vec3(stepVal), 1.0);
	//gl_FragColor = shaftSample;
	gl_FragColor = v_vColour * vec4(vec3(1.0), center);
	//gl_FragColor = v_vColour * vec4(vec3(1.0), sum * smoothstep(1.0, 0.0, d1+d2));
}