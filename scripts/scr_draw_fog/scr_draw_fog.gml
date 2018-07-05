///@arg noise_tex
///@arg width
///@arg height
///@arg 0x
///@arg 0y
///@arg dispersion_factor
///@arg fog_timer
var noise_tex, width, height, cx, cy, dispf, fogtimer, sw, sh, xorig, yorig, uni, t;
noise_tex = argument[0];
width = argument[1];
height = argument[2];
cx = argument[3];
cy = argument[4];
dispf = argument[5];
fogtimer = argument[6];
xorig = cx;//cx-(width/2);
yorig = cy;//-(height/2);
t = 0;
uni = shader_get_uniform(sh_fog, "runTime");
var h = shader_get_uniform(sh_fog, "height");
sw = sprite_get_width(noise_tex);
sh = sprite_get_height(noise_tex);
shader_set(sh_fog);
draw_set_colour(c_white);
shader_set_uniform_f(h, height);
shader_set_uniform_f(uni, fogtimer);
for (var xx = 0; xx < max(width/sw, 1); xx++) {
    for (var yy = 0; yy < max(height/sh, 1); yy++) {
        draw_sprite(spr_fog_noise, 0, xorig+(xx*sw), yorig+(yy*sh));
    }
}
shader_reset();
//FogTimer += 5 / room_speed;