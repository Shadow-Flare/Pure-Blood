//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixW;
uniform float pixH;

float sampleAlpha(vec2 coord)
{
	return texture2D( gm_BaseTexture, vec2(coord.x,coord.y)).a;
}

void main()
{
	vec2 xOff;
	xOff.x = pixW;
	vec2 yOff;
	yOff.y = pixH;
	
	float alpha = sampleAlpha(v_vTexcoord);
	alpha += ceil(sampleAlpha(v_vTexcoord+xOff));
	alpha += ceil(sampleAlpha(v_vTexcoord-xOff));
	alpha += ceil(sampleAlpha(v_vTexcoord+yOff));
	alpha += ceil(sampleAlpha(v_vTexcoord-yOff));
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
}
