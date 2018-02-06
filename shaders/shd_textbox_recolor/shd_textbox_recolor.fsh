//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 newColor;
uniform vec2 vertData;

void main()
{
	if (texture2D(gm_BaseTexture,v_vTexcoord) == vec4(1.0,0.0,0.0,1.0))
	{
		float vertMod = 1.0-(abs(v_vTexcoord.y-vertData.x)/(vertData.y-vertData.x));
		gl_FragColor = vec4(newColor.rgb*vertMod,newColor.a);
	}
	else gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
}
