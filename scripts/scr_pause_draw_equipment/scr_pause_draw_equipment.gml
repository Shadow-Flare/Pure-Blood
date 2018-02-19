var surfX = surface_get_width(application_surface);
var surfY = surface_get_height(application_surface);

#region basic options draw

//for (var i = 0; i < array_height_2d(current_menu_options); i++)
//{
//	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
//	{
//		draw_set_halign(fa_center);
//		if sX == i && sY == j draw_set_colour(c_blue);
//		else if j == 0 && current_menu_options[i,j] == PlayerStats.activeOffhandID draw_set_colour(c_aqua);
//		else if j != 0 && current_menu_options[i,j] == PlayerStats.activeOffhandSubtypeID draw_set_colour(c_aqua);
//		else draw_set_colour(c_white);
//		if j == 0 
//		{
//			draw_set_font(fnt_menu_large);
//			draw_text(960+600*(i-sX),200,ComboCache.offhandNames[? current_menu_options[i, j]]);
//			draw_set_font(fnt_menu);
//		}
//		else draw_text(960+600*(i-sX),300+60*j,ComboCache.offhandSubtypeNames[? current_menu_options[i, j]]);
//		draw_set_halign(fa_left);
//	}
//}

#endregion

#region textbox & backings
	//trinkets
PRETENDDATATRINKETANGLEMOD++;
for(var i = 0; i < 360; i += 360/PRETENDDATATRINKETNUM)
{
	var angle = (i+90+PRETENDDATATRINKETANGLEMOD)%360;
	var centerX = equipmentTrinketsCenterX+dcos(angle)*equipmentTrinketsRadius;
	var centerY = equipmentTrinketsCenterY-dsin(angle)*equipmentTrinketsRadius;
	var distX = equipmentTrinketsWidth/2;
	var distY = equipmentTrinketsHeight/2;
	var x1 = centerX-distX;
	var y1 = centerY-distY;
	var x2 = centerX+distX;
	var y2 = centerY+distY;
	scr_draw_textbox(x1,y1,x2,y2,equipmentTrinketsType,equipmentTrinketsScale,equipmentTrinketsColour);
}
	//Main equipment
scr_draw_textbox(equipmentHeadX1,equipmentHeadY1,equipmentHeadX2,equipmentHeadY2,equipmentHeadType,equipmentHeadScale,equipmentHeadColour);
scr_draw_textbox(equipmentChestX1,equipmentChestY1,equipmentChestX2,equipmentChestY2,equipmentChestType,equipmentChestScale,equipmentChestColour);
scr_draw_textbox(equipmentLegsX1,equipmentLegsY1,equipmentLegsX2,equipmentLegsY2,equipmentLegsType,equipmentLegsScale,equipmentLegsColour);
scr_draw_textbox(equipmentMain1X1,equipmentMain1Y1,equipmentMain1X2,equipmentMain1Y2,equipmentMain1Type,equipmentMain1Scale,equipmentMain1Colour);
scr_draw_textbox(equipmentMain2X1,equipmentMain2Y1,equipmentMain2X2,equipmentMain2Y2,equipmentMain2Type,equipmentMain2Scale,equipmentMain2Colour);
scr_draw_textbox(equipmentOff1X1,equipmentOff1Y1,equipmentOff1X2,equipmentOff1Y2,equipmentOff1Type,equipmentOff1Scale,equipmentOff1Colour);
scr_draw_textbox(equipmentOff2X1,equipmentOff2Y1,equipmentOff2X2,equipmentOff2Y2,equipmentOff2Type,equipmentOff2Scale,equipmentOff2Colour);
#endregion
