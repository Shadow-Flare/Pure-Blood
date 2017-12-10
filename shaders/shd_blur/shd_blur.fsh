varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 resolution;
uniform float radius;

const int directions = 16;
const int quality = 8;
const float PI = 3.14159265359;

void main()
{
    vec2 size = radius/resolution.xy;
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord);
    for( float d = 0.0; d < (PI*2.0); d += (PI*2.0)/float(directions))
    {
        for( float i = 1.0/float(quality); i <= 1.0; i += 1.0/float(quality))
        {
                Color += texture2D( gm_BaseTexture, v_vTexcoord+vec2(cos(d),sin(d))*size*i);
        }
    }
    Color /= float(quality)*float(directions)+1.0;
    gl_FragColor =  Color *  v_vColour;
}