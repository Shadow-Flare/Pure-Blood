varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform ivec2 rStat;
uniform ivec2 gStat;

void main()
{
	vec4 sample = texture2D( gm_BaseTexture, v_vTexcoord );
	float red, green;

	if (rStat.x == 0)
	{
		red = sample.r;
	}
	else
	{
		red = sample.g;
	}
	
	if (rStat.y == 1)
	{
		red = 1.0-red;
	}
	
	if (gStat.x == 0)
	{
		green = sample.r;
	}
	else
	{
		green = sample.g;
	}
	
	if (gStat.y == 1)
	{
		green = 1.0-green;
	}
    
	gl_FragColor = v_vColour * vec4(red,green,sample.b,sample.a);
}
