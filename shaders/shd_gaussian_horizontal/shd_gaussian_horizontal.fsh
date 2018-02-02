varying vec2 v_texcoord;
varying vec4 v_colour;

uniform vec2 resolution;
uniform float blur_amount;

void main()
{ 
	float blurSize = 1.0/resolution.x * blur_amount;
	vec4 sum = vec4(0.0);
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x - 4.0*blurSize, v_texcoord.y)) * 0.0162162162;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x - 3.0*blurSize, v_texcoord.y)) * 0.0540540541;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x - 2.0*blurSize, v_texcoord.y)) * 0.1216216216;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x - blurSize, v_texcoord.y)) * 0.1945945946;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y)) * 0.227027027;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x + blurSize, v_texcoord.y)) * 0.1945945946;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x + 2.0*blurSize, v_texcoord.y)) * 0.1216216216;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x + 3.0*blurSize, v_texcoord.y)) * 0.0540540541;
	sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x + 4.0*blurSize, v_texcoord.y)) * 0.0162162162;
	gl_FragColor = v_colour * vec4(sum.rgb,1);
}
