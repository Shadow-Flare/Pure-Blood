//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D sample;
uniform vec4 newColor;
uniform vec4 vertData;	//xi, yi, width, height
uniform vec4 sampData;	//width, height	(pixels)
uniform vec2 surf;		//surface w, surface h

void main()
{
	if (texture2D(gm_BaseTexture,v_vTexcoord) == vec4(1.0,0.0,0.0,1.0))
	{
		float sampX = mod(abs(v_vTexcoord.x-vertData.x)*surf.x,sampData.x)/sampData.x*(sampData.x/sampData.z);
		float sampY = mod(abs(v_vTexcoord.y-vertData.y)*surf.y,sampData.y)/sampData.y*(sampData.y/sampData.w);
		gl_FragColor = newColor*texture2D( sample, vec2(sampX,sampY) );
	}
	else gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
}
