///@arg x1[0-1]
///@arg y1[0-1]
///@arg x2[0-1]
///@arg y2[0-1]
///@arg type
///@arg scale
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var type = argument4;
var scale = argument5;

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

switch type
{
	case 0:
		var textSprite = spr_textbox_0;
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
	
surface_reset_target();