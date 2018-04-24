///@arg var1 [Details in script]
///@arg var2
///@arg var3
///@arg vertical?
///@arg index
///@arg max
///@arg type
///@arg scale
///@arg colour
	//var 1 is the one only dimension, var2/3 is the other; If vertical, var 1 is X, if hor, var 1 is Y
var var1 = argument0;
var var2 = argument1;
var var3 = argument2;
var vertical = argument3;
var index = argument4;
var maxVal = argument5;
var type = argument6;
var scale = argument7;
var col = argument8;

	//sort distance
if var2 > var3
{
	var temp = var2;
	var2 = var3;
	var3 = temp;
}

var style;		//0: slider, 1: abacus
switch type
{
	case 0:
		style = 0;
		if vertical
		{
			var barSprite = spr_scrollbar_0_v;
			var cursor = spr_scrollbar_0_v_cursor;
		}
		else
		{
			var barSprite = spr_scrollbar_0_h;
			var cursor = spr_scrollbar_0_h_cursor;
		}
		break;
	case 1:
		style = 1;
		var abacusPerpShift = 1*4;
		if vertical
		{
			var arrows = spr_scrollbar_1_v;
			var abacus1 = spr_scrollbar_1_v_abacus_1;
			var abacus10 = spr_scrollbar_1_v_abacus_10;
		}
		else
		{
			var arrows = spr_scrollbar_1_h;
			var abacus1 = spr_scrollbar_1_h_abacus_1;
			var abacus10 = spr_scrollbar_1_h_abacus_10;
		}
		break;
}

switch style
{
	case 0:		#region slider
		#region Hor
		if !vertical
		{
			var yi = var1;
			var x1 = var2;
			var x2 = var3;
				//bar
			var spriteW = sprite_get_width(barSprite)*scale;
			var spriteH = sprite_get_height(barSprite)*scale;
			if x1+spriteW >= x2 x2 = x1+spriteW;
			var width = abs(x2-x1);
			var midHorScale = max(width/spriteW-2,0);

				//first
			draw_sprite_stretched_ext(barSprite,0,x1,yi,spriteW,spriteH,col,1);
				//middle
			for (var i = 0; i < midHorScale; i++)
			{
			    var horScale = min(midHorScale-i,1);
				draw_sprite_part_ext(barSprite,1,0,0,spriteW*horScale,spriteH,x1+spriteW*(i+1),yi,scale,scale,col,1);
			}
				//last
			draw_sprite_stretched_ext(barSprite,2,x1+spriteW+spriteW*midHorScale,yi,spriteW,spriteH,col,1);
	
			surface_reset_target();

			//scroll cursor
			var scrollXMod = (x2-x1-sprite_get_width(cursor))*(index/maxVal);
			draw_sprite_ext(cursor,0,(x1+scrollXMod),xi,scale,scale,0,col,1);
		}
		#endregion
		#region Vert
		else 
		{
			var xi = var1;
			var y1 = var2;
			var y2 = var3;
				//bar
			var spriteW = sprite_get_width(barSprite)*scale;
			var spriteH = sprite_get_height(barSprite)*scale;
			if y1+spriteH >= y2 y2 = y1+spriteH;
			var height = abs(y2-y1);
			var midVerScale = max(height/spriteH-2,0);

				//first
			draw_sprite_stretched_ext(barSprite,0,xi,y1,spriteW,spriteH,col,1);
				//middle
			for (var i = 0; i < midVerScale; i++)
			{
			    var verScale = min(midVerScale-i,1);
				draw_sprite_part_ext(barSprite,1,0,0,spriteW,spriteH*verScale,xi,y1+spriteH*(i+1),scale,scale,col,1);
			}
				//last
			draw_sprite_stretched_ext(barSprite,2,xi,y1+spriteH+spriteH*midVerScale,spriteW,spriteH,col,1);
	
			surface_reset_target();

			//scroll cursor
			var scrollYMod = (y2-y1-sprite_get_height(cursor))*(index/maxVal);
			draw_sprite_ext(cursor,0,xi,(y1+scrollYMod),scale,scale,0,col,1);
		}
		#endregion
		break; #endregion
	case 1:		#region abacus
		#region setup index data
		var startNum1 = index%10;
		var startNum10 = floor(index/10);
		var endNum1 = (maxVal-index+1)%10;
		var endNum10 = floor((maxVal-index+1)/10);
		#endregion
		#region Hor
		if !vertical
		{
			var yi = var1;
			var x1 = var2;
			var x2 = var3;
			
			var arrowSpriteW = sprite_get_width(arrows)*scale;
			var start10X = x1+arrowSpriteW+4;
			var end10X = x2-arrowSpriteW+4;
				//Left Arrow
			draw_sprite_ext(arrows,0,x1,yi,scale,scale,0,col,1.0);
				//Right Arrow
			draw_sprite_ext(arrows,1,x2-arrowSpriteW,yi,scale,scale,0,col,1.0);
			
				//tens
			var abacus10SpriteW = sprite_get_width(abacus10)*scale;
			var abacus1SpriteW = sprite_get_width(abacus1)*scale;
			for( var i = 0; i < startNum10; i++)
			{
				draw_sprite_ext(abacus10,0,x1+arrowSpriteW+(i+1)*4+i*abacus10SpriteW,yi+abacusPerpShift,scale,scale,0,col,1.0);
				var start10X = x1+arrowSpriteW+(i+1)*4+(i+1)*abacus10SpriteW;
			}
			for( var i = 0; i < endNum10; i++)
			{
				draw_sprite_ext(abacus10,0,x2-arrowSpriteW-(i+1)*4-(i+1)*abacus10SpriteW,yi+abacusPerpShift,scale,scale,0,col,1.0);
				var end10X = x2-arrowSpriteW-(i+1)*4-(i+1)*abacus10SpriteW;
			}
				//ones
			for( var i = 0; i < startNum1; i++)
			{
				draw_sprite_ext(abacus1,0,start10X+(i+1)*4+i*abacus1SpriteW,yi+abacusPerpShift,scale,scale,0,col,1.0);
			}
			for( var i = 0; i < endNum1; i++)
			{
				draw_sprite_ext(abacus1,0,end10X-(i+1)*4-i*abacus1SpriteW,yi+abacusPerpShift,scale,scale,0,col,1.0);
			}
		}
		#endregion
		#region Ver
		else
		{
			var xi = var1;
			var y1 = var2;
			var y2 = var3;
			
			var arrowSpriteH = sprite_get_height(arrows)*scale;
			var start10Y = y1+arrowSpriteH;
			var end10Y = y2-arrowSpriteH;
				//Left Arrow
			draw_sprite_ext(arrows,0,xi,y1,scale,scale,0,col,1.0);
				//Right Arrow
			draw_sprite_ext(arrows,1,xi,y2-arrowSpriteH,scale,scale,0,col,1.0);
			
				//tens
			var abacus10SpriteH = sprite_get_height(abacus10)*scale;
			var abacus1SpriteH = sprite_get_height(abacus1)*scale;
			for( var i = 0; i < startNum10; i++)
			{
				draw_sprite_ext(abacus10,0,xi+abacusPerpShift,y1+arrowSpriteH+(i+1)*4+i*abacus10SpriteH,scale,scale,0,col,1.0);
				var start10Y = y1+arrowSpriteH+(i+1)*4+(i+1)*abacus10SpriteH;
			}
			for( var i = 0; i < endNum10; i++)
			{
				draw_sprite_ext(abacus10,0,xi+abacusPerpShift,y2-arrowSpriteH-(i+1)*4-(i+1)*abacus10SpriteH,scale,scale,0,col,1.0);
				var end10Y = y2-arrowSpriteH-(i+1)*4-(i+1)*abacus10SpriteH;
			}
				//ones
			for( var i = 0; i < startNum1; i++)
			{
				draw_sprite_ext(abacus1,0,xi+abacusPerpShift,start10Y+(i+1)*4+i*abacus1SpriteH,scale,scale,0,col,1.0);
			}
			for( var i = 0; i < endNum1; i++)
			{
				draw_sprite_ext(abacus1,0,xi+abacusPerpShift,end10Y-(i+1)*4-(i+1)*abacus1SpriteH,scale,scale,0,col,1.0);
			}
		}
		#endregion
		break; #endregion
}