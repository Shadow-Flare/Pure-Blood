//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 reso;
uniform float time;

float noise(in vec3 x)
{
    vec3 p = floor(x);
    vec3 f = fract(x);
	f = f*f*(3.0-2.0*f);
	vec2 uv = (p.xy+vec2(37.0,17.0)*p.z) + f.xy;
	vec2 rg = texture2D(gm_BaseTexture, (uv+0.5)/256.0, -100.0 ).yx;
	return mix( rg.x, rg.y, f.z );
}

float fbm(vec3 pos)
{
    mat3 m = mat3( 0.00,  0.80,  0.60, -0.80,  0.36, -0.48,  -0.60, -0.48,  0.64 );
    vec3 q = 3.0*pos;
    float f  = 0.5000*noise( q ); q = m*q*2.01;
    f += 0.2500*noise( q ); q = m*q*2.02;
    f += 0.1250*noise( q ); q = m*q*2.03;
    f += 0.0625*noise( q ); q = m*q*2.01;
    return f;
}

float galaxyNoise(vec2 uv, float radius, float angle, float speed)
{
    float dist = length(uv);    
    float percent = max(0., (radius - dist) / radius);
    float theta = time * speed + percent * percent * angle;
    vec2 cs = vec2(cos(theta), sin(theta));
	uv *= mat2(cs.x, -cs.y, cs.y, cs.x);
    
    float n = abs(fbm(vec3(uv, 1. + time * 0.4) * 0.1) - 0.5) * 2.0;
    float nSmall = smoothstep(0.2, 0.0, n);
    
    float result = 0.;
    result += nSmall * 0.6;
    result += n;
    result += smoothstep(0.7, 1., percent);
    result *= smoothstep(0.2, 0.7, percent);
    return pow(result, 2.);
}

vec3 galaxy(vec2 uv)
{
    float radius = 20.;
    float f = 0.;
    f += galaxyNoise(uv * 1.0, radius, 9.0, 0.12) * 0.5;
    f += galaxyNoise(uv * 1.3, radius, 11.0, -0.1) * 0.6;
    f += galaxyNoise(uv * 1.6, radius, 8.0, 0.1) * 0.7;
    f = max(0., f);
    
    vec3 col = mix(vec3(0.4, 0.5, 1.0), vec3(0.5, 0.2, 1.0), length(uv) / radius); 
    col += vec3(smoothstep(1.2, 5., f * 0.2));
	col *= f;
    
    return col;
}

void main()
{
	vec2 uv = (v_vTexcoord.xy / reso.xy - vec2(0.5)) * vec2(reso.x / reso.y, 1.);
    uv *= 5. + 0. * cos(time * 0.3);
    gl_FragColor = v_vColour * vec4(galaxy(uv * 3.),1.0);
}
