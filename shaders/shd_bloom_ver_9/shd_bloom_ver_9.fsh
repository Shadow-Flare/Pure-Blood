varying vec2 v_texcoord;
varying vec4 v_colour;

uniform float reso_y;
uniform float bloom_boost;

void main()
{ 
	float blurSize = 1.0/reso_y;
	vec4 sum = vec4(0.0);
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y - 4.0*blurSize)) * 0.0162162162;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y - 3.0*blurSize)) * 0.0540540541;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y - 2.0*blurSize)) * 0.1216216216;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y - blurSize)) * 0.1945945946;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y)) * 0.227027027;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y + blurSize)) * 0.1945945946;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y + 2.0*blurSize)) * 0.1216216216;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y + 3.0*blurSize)) * 0.0540540541;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y + 4.0*blurSize)) * 0.0162162162;
	sum *= bloom_boost;
	gl_FragColor = v_colour * vec4(sum.rgb,1);
}
