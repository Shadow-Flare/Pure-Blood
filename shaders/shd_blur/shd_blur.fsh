varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 resolution;
uniform float radius;

const float directions = 32.0;
const float PI = 3.14159265359;

void main()
{
	vec3 sum = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
	for(float i = 0.0; i < 2.0*PI; i += (2.0*PI)/directions)
	{
		for(float j = 1.0; j <= radius; j++)
		{
			sum += texture2D(gm_BaseTexture, v_vTexcoord + vec2(sin(i)/resolution.x,cos(i)/resolution.y)*j).rgb;
		}
	}

	gl_FragColor = v_vColour * vec4(sum.rgb/(directions*radius+1.0), 1.0);
}