///@arg xStart[0-1]
///@arg y1[0-1]
///@arg y2[0-1]
///@arg type
///@arg scale
///@arg colour
var xS = argument0;
var y1 = argument1;
var y2 = argument2;
var type = argument3;
var scale = argument4;
var col = argument5;

if y1 > y2
{
	var temp = y1;
	y1 = y2;
	y2 = temp;
}

switch type
{
	case 0:
		var barSprite = spr_scrollbar_0;
		break;
}

var spriteW = sprite_get_width(barSprite)*scale;
var spriteH = sprite_get_height(barSprite)*scale;
if y1+spriteH >= y2 y2 = y1+spriteH;
var height = abs(y2-y1);
var midVerScale = max(height/spriteH-2,0);

	//first
draw_sprite_stretched_ext(barSprite,0,xS,y1,spriteW,spriteH,col,1);
	//middle
draw_sprite_stretched_ext(barSprite,1,xS,y1+spriteH,spriteW,spriteH*midVerScale,col,1);
	//last
draw_sprite_stretched_ext(barSprite,2,xS,y1+spriteH+spriteH*midVerScale,spriteW,spriteH,col,1);
	
surface_reset_target();