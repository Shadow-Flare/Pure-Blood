///*shader_set(sh_fog);
//draw_set_colour(c_white);
//shader_set_uniform_f(FogTimerUniform, FogTimer);
////drawing sprite stretched to fill room (screen)
//draw_sprite_ext(spr_fog_noise, 0, 0, 0,room_width/64,room_height/128,0,c_white,1);
//shader_reset();*/
//var centerX = x-sprite_xoffset+sprite_width/2;
//var centerY = y-sprite_yoffset+sprite_height/2;
//scr_draw_fog(spr_fog_noise, sprite_width, sprite_height, centerX, centerY, 0.9, FogTimer);
//FogTimer += 5 / room_speed;

/*shader_set(sh_fog);
draw_set_colour(c_white);
shader_set_uniform_f(FogTimerUniform, FogTimer);
//drawing sprite stretched to fill room (screen)
draw_sprite_ext(spr_fog_noise, 0, 0, 0,room_width/64,room_height/128,0,c_white,1);
shader_reset();*/
var centerX = 0;//x-sprite_xoffset+sprite_width/2;
var centerY = 0;//-sprite_yoffset+sprite_height/2;

scr_draw_fog(spr_fog_noise, 128, 336, centerX, centerY, 0.9, FogTimer);
FogTimer += 5 / room_speed;