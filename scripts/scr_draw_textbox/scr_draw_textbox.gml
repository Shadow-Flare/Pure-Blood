///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg type
///@arg scale
///@arg blend
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var type = argument4;
var scale = argument5;
var blend = argument6;

var prevAlpha = draw_get_alpha();
draw_set_alpha(1);

var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

if !variable_instance_exists(id,"texboxTempSurface") || !surface_exists(texboxTempSurface) texboxTempSurface = surface_create(surfW,surfH);
if !variable_instance_exists(id,"texboxTempSurfaceMod") || !surface_exists(texboxTempSurfaceMod) texboxTempSurfaceMod = surface_create(surfW,surfH);

if x1 > x2
{
	var temp = x1;
	x1 = x2;
	x2 = temp;
}
if y1 > y2
{
	var temp = y1;
	y1 = y2;
	y2 = temp;
}

var textSprite = noone;
var textTexture = noone;
var textDrawTiled = true;		//tile by default, if changed to false then stretch
var maxTextureSize = 32*4;
switch type
{
	case 0:
		textSprite = spr_textbox_0;
		textDrawTiled = false;
		break;
	case 1:
		textSprite = spr_textbox_1;
		textTexture = spr_textbox_1_texture;
		break;
	case 2:
		textSprite = spr_textbox_2;
		textTexture = spr_textbox_2_texture;
		break;
	case 3:
		textSprite = spr_textbox_3;
		textTexture = spr_textbox_3_texture;
		break; 
	case 4:
		textSprite = spr_textbox_4;
		textTexture = spr_textbox_4_texture;
		break;
	case 5:
		textSprite = spr_textbox_5;
		textTexture = spr_textbox_5_texture;
		break;
}

var spriteW = sprite_get_width(textSprite)*scale;
var spriteH = sprite_get_height(textSprite)*scale;
if x1+spriteW >= x2 x2 = x1+spriteW;
if y1+spriteH >= y2 y2 = y1+spriteH;
var width = abs(x2-x1);
var height = abs(y2-y1);
var midHorScale = max(width/spriteW-2,0);
var midVerScale = max(height/spriteH-2,0);

if textSprite != noone
{
	surface_set_target(texboxTempSurface);
		draw_clear_alpha(c_white,0);
		if textDrawTiled
		{
				//top
			draw_sprite_stretched(textSprite,0,x1,y1,spriteW,spriteH);
			for(var i = 0; i < midHorScale; i++)
			{
				var partW = min(midHorScale-i,1);
				draw_sprite_part_ext(textSprite,1,0,0,(spriteW/scale)*partW,spriteH/scale,x1+spriteW*(i+1),y1,scale,scale,c_white,1.0);
			}
			draw_sprite_stretched(textSprite,2,x1+spriteW+spriteW*midHorScale,y1,spriteW,spriteH);
				//mid
			for(var j = 0; j < midVerScale; j++)
			{
				var partH = min(midVerScale-j,1);
				draw_sprite_part_ext(textSprite,3,0,0,spriteW/scale,(spriteH/scale)*partH,x1,y1+spriteH*(j+1),scale,scale,c_white,1.0);
			}
			for(var i = 0; i < midHorScale; i++)
			{
				var partW = min(midHorScale-i,1);
				for(var j = 0; j < midVerScale; j++)
				{
					var partH = min(midVerScale-j,1);
					draw_sprite_part_ext(textSprite,4,0,0,(spriteW/scale)*partW,(spriteH/scale)*partH,x1+spriteW*(i+1),y1+spriteH*(j+1),scale,scale,c_white,1.0);
				}
			}
			for(var j = 0; j < midVerScale; j++)
			{
				var partH = min(midVerScale-j,1);
				draw_sprite_part_ext(textSprite,5,0,0,spriteW/scale,(spriteH/scale)*partH,x1+spriteW+spriteW*midHorScale,y1+spriteH*(j+1),scale,scale,c_white,1.0);
			}
				//bot
			draw_sprite_stretched(textSprite,6,x1,y1+spriteH+spriteH*midVerScale,spriteW,spriteH);
			for(var i = 0; i < midHorScale; i++)
			{
				var partW = min(midHorScale-i,1);
				draw_sprite_part_ext(textSprite,7,0,0,(spriteW/scale)*partW,spriteH/scale,x1+spriteW*(i+1),y1+spriteH+spriteH*midVerScale,scale,scale,c_white,1.0);
			}
			draw_sprite_stretched(textSprite,8,x1+spriteW+spriteW*midHorScale,y1+spriteH+spriteH*midVerScale,spriteW,spriteH);
		}
		else
		{
				//top
			draw_sprite_stretched(textSprite,0,x1,y1,spriteW,spriteH);
			draw_sprite_stretched(textSprite,1,x1+spriteW,y1,spriteW*midHorScale,spriteH);
			draw_sprite_stretched(textSprite,2,x1+spriteW+spriteW*midHorScale,y1,spriteW,spriteH);
				//mid
			draw_sprite_stretched(textSprite,3,x1,y1+spriteH,spriteW,spriteH*midVerScale);
			draw_sprite_stretched(textSprite,4,x1+spriteW,y1+spriteH,spriteW*midHorScale,spriteH*midVerScale);
			draw_sprite_stretched(textSprite,5,x1+spriteW+spriteW*midHorScale,y1+spriteH,spriteW,spriteH*midVerScale);
				//bot
			draw_sprite_stretched(textSprite,6,x1,y1+spriteH+spriteH*midVerScale,spriteW,spriteH);
			draw_sprite_stretched(textSprite,7,x1+spriteW,y1+spriteH+spriteH*midVerScale,spriteW*midHorScale,spriteH);
			draw_sprite_stretched(textSprite,8,x1+spriteW+spriteW*midHorScale,y1+spriteH+spriteH*midVerScale,spriteW,spriteH);
		}
	surface_reset_target();
}
	if textTexture == noone
	{
		shader_set(shd_textbox_recolor);
			var shd_newColor = shader_get_uniform(shd_textbox_recolor,"newColor");
			var shd_vertData = shader_get_uniform(shd_textbox_recolor,"vertData");
			shader_set_uniform_f(shd_newColor,colour_get_red(blend)/255,colour_get_green(blend)/255,colour_get_blue(blend)/255,1);
			shader_set_uniform_f(shd_vertData,(y1/surfH)-(0.1*((y2-y1)/surfH)),(y2/surfH)+(0.1*((y2-y1)/surfH)));
		
			surface_set_target(texboxTempSurfaceMod);
				draw_clear_alpha(c_white,0);
				draw_surface(texboxTempSurface,0,0);
			surface_reset_target();
		shader_reset();
	}
	else
	{
		var sprW = sprite_get_width(textTexture)*scale;
		var sprH = sprite_get_height(textTexture)*scale;
		if !variable_instance_exists(id,"texboxTextureSurface") || !surface_exists(texboxTextureSurface) texboxTextureSurface = surface_create(maxTextureSize,maxTextureSize);
		surface_set_target(texboxTextureSurface);
			draw_clear_alpha(c_white,0);
			draw_sprite_ext(textTexture,0,0,0,scale,scale,0,c_white,1.0);
		surface_reset_target();

		shader_set(shd_textbox_recolor_texture);
			var shd_sample = shader_get_sampler_index(shd_textbox_recolor_texture,"sample");
			var shd_newColor = shader_get_uniform(shd_textbox_recolor_texture,"newColor");
			var shd_vertData = shader_get_uniform(shd_textbox_recolor_texture,"vertData");
			var shd_sampData = shader_get_uniform(shd_textbox_recolor_texture,"sampData");
			var shd_surf = shader_get_uniform(shd_textbox_recolor_texture,"surf");
			texture_set_stage(shd_sample,surface_get_texture(texboxTextureSurface));
			shader_set_uniform_f(shd_newColor,colour_get_red(blend)/255,colour_get_green(blend)/255,colour_get_blue(blend)/255,1);
			shader_set_uniform_f(shd_vertData,(x1/surfW),(y1/surfH),(x2-x1)/surfW,(y2-y1)/surfH);
			shader_set_uniform_f(shd_sampData,sprW,sprH,maxTextureSize,maxTextureSize);
			shader_set_uniform_f(shd_surf,surfW,surfH);

			surface_set_target(texboxTempSurfaceMod);
				draw_clear_alpha(c_white,0);
				draw_surface(texboxTempSurface,0,0);
			surface_reset_target();
		shader_reset();	
	}

draw_surface_ext(texboxTempSurfaceMod,0,0,1,1,0,c_white,prevAlpha);

draw_set_alpha(prevAlpha);