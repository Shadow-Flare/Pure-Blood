//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 sample = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = v_vColour * vec4(1.0-sample.r,1.0-sample.g,1.0-sample.b,sample.a);
}
