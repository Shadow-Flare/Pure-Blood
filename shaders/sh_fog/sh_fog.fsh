//
// Source: https://www.shadertoy.com/view/XsjSRt
//

//SETTINGS//
uniform float runTime;
//float skyCover;
uniform float height;
const float timeScale = 10.0;
const float cloudScale = 0.5;
const float softness = 0.2;
const float brightness = 1.0;
const int noiseOctaves = 16;

float curlStrain = 90.0;
//SETTINGS//

varying vec2 fragCoord;

float saturate(float num)
{
    return clamp(num,0.0,1.0);
}

float noise(vec2 uv)
{
	return texture2D(gm_BaseTexture,uv).g;

}

vec2 rotate(vec2 uv)
{
    uv = uv+noise(uv*0.2)*0.005;
    float rot = curlStrain;
    float sinRot= sin(radians(rot));
    float cosRot= cos(radians(rot));
    mat2 rotMat = mat2(cosRot,-sinRot,sinRot,cosRot);
    return uv * rotMat;
}


float fbm (vec2 uv)
{
    float rot = 0.0;
    float sinRot = sin(radians(rot));
    float cosRot=  cos(radians(rot));
    float f = 0.0;
    float total = 0.0;
    float mul = 0.5;
    mat2 rotMat = mat2(cosRot,-sinRot,sinRot,cosRot);
  
    for(int i = 0;i < noiseOctaves;i++)
    {
        f += noise(uv+runTime*0.00015*timeScale*(1.0-mul))*mul;
        total += mul;
        uv *= 3.0;
        uv=rotate(uv);
        mul *= 0.5;
    }
    return f/total;
}

float smootherstep(float edge0, float edge1, float num) {
  // Scale, and clamp num to 0..1 range
  num = clamp((num - edge0) / (edge1 - edge0), 0.0, 1.0);
  // Evaluate polynomial
  return num * num * num * (num * (num * 6.0 - 15.0) + 10.0);
}

void main(void)
{
    vec2 uv = fragCoord.xy/(40000.0*cloudScale);
	float yfac = (fragCoord.y/height);
	float skyCover = yfac*1.1+0.1;
    float bright = brightness*(1.8-skyCover);
  
    float color1 = fbm(uv-0.5+runTime*0.00004*timeScale);
    float color2 = fbm(uv-10.5+runTime*0.00002*timeScale);
  
    float clouds1 = smootherstep(1.0-skyCover,min((1.0-skyCover)+softness*2.0,1.0),color1);
    float clouds2 = smootherstep(1.0-skyCover,min((1.0-skyCover)+softness,1.0),color2);
	
    float cloudsFormComb = saturate(clouds1+clouds2);
  
    vec4 skyCol = vec4(0.6,0.8,1.0,1.0);
    float cloudCol = saturate(saturate(1.0-pow(color1,1.0)*0.2)*bright);
    vec4 clouds1Color = vec4(cloudCol,cloudCol,cloudCol,1.0);
    vec4 clouds2Color = mix(clouds1Color,skyCol,0.25);
    vec4 cloudColComb = mix(clouds1Color,clouds2Color,saturate(clouds2-clouds1));
  
    gl_FragColor = mix(skyCol,cloudColComb,cloudsFormComb);
    //gl_FragColor = vec4(cloudColComb.rgb,cloudsFormComb);
}
