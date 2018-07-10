///@arg palette_index
///@arg x
///@arg y
///@arg sprite_index
///@arg image_index
///@arg image_xscale
///@arg image_yscale
///@arg image_angle
///@arg image_blend
///@arg image_alpha
var arg = argument;
var pal = global.palettes[| arg[0]];

pal_swap_set(pal[| 1],pal_ind);
    draw_sprite_ext(arg[3], arg[4],arg[1],arg[2],arg[5],arg[6],arg[7],arg[8],arg[9]);
pal_swap_reset();
