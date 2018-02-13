var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

#region ability interface section
//get data
var maxAbilities = array_length_1d(slot_options);
var typeCache = AbilityCache.ability[? selection];
//set
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
	//category
var catName;
switch selection
{
	case abilityTabType.combat:
		catName = "Combat";
		break;
	case abilityTabType.movement:
		catName = "Movement";
		break;
	case abilityTabType.support:
		catName = "Support";
		break;
}
draw_text(surfW*abilityCategoryTextX,surfH*abilityCategoryTextY,catName);
	//ap display
var apText = string(PlayerStats.ap)+"/"+string(PlayerStats.apMax);
draw_text(surfW*abilityApDisplayX,surfH*abilityApDisplayY,apText);
//set
draw_set_font(fnt_small_text);
draw_set_halign(fa_left);
	//tabs
for (var i = 0; i < ds_list_size(abilityTabSprites); i++)
{
	var col = c_dkgray;
	var vertPos = abilityTabY;
	if (i = sX)
	{
		col = c_white;
		vertPos += abilityTabYSelectMod;
		if (sY == 0) 
		{
			draw_sprite_ext(abilityTabSelectionSprite,0,surfW*(abilityTabX+abilityTabXInc*i),surfH*vertPos,abilityTabImageScale,abilityTabImageScale,0,col,1);
		}
	}
	draw_sprite_ext(abilityTabSprites[| i],0,surfW*(abilityTabX+abilityTabXInc*i),surfH*vertPos,abilityTabImageScale,abilityTabImageScale,0,col,1);
}

//scroll bar
scr_draw_scroll_bar(surfW*abilityScrollBarX, surfH*abilityScrollBarY1,surfH*abilityScrollBarY2,abilityScrollBarType,abilityScrollBarScale,abilityScrollBarColour);
//scroll cursor
var scrollYMod = abs(abilityScrollBarY2-abilityScrollBarY1-(sprite_get_height(abilityScrollCursorSprite)*abilityScrollBarScale/surfH))*(abilityPanelScroll/(array_length_1d(slot_options)-abilityPanelNum));
draw_sprite_ext(abilityScrollCursorSprite,0,surfW*abilityScrollBarX,surfH*(abilityScrollBarY1+scrollYMod),abilityScrollBarScale,abilityScrollBarScale,0,abilityScrollCursorColour,1);

	//backing
if !surface_exists(abilityTextbox1) abilityTextbox1 = surface_create(surfW,surfH);
surface_set_target(abilityTextbox1);
	scr_draw_textbox(surfW*abilityTextbox1X1,surfH*abilityTextbox1Y1,surfW*abilityTextbox1X2,surfH*abilityTextbox1Y2,abilityTextbox1Type,abilityTextbox1Scale);
surface_reset_target()

if !surface_exists(abilityTextbox1Mod) abilityTextbox1Mod = surface_create(surfW,surfH);
surface_set_target(abilityTextbox1Mod);
	shader_set(shd_textbox_recolor);
	var shd_newColor = shader_get_uniform(shd_textbox_recolor,"newColor");
	var shd_vertData = shader_get_uniform(shd_textbox_recolor,"vertData");
	shader_set_uniform_f(shd_newColor,abilityTextbox1Colour[0],abilityTextbox1Colour[1],abilityTextbox1Colour[2],1);
	shader_set_uniform_f(shd_vertData,abilityTextbox1Y1-0.1,abilityTextbox1Y2+0.1);
		draw_surface(abilityTextbox1,0,0);
	shader_reset();
surface_reset_target()

draw_surface(abilityTextbox1Mod,0,0);
	
	//panels
var panelSep = (abilityPanelYEnd-abilityPanelYBegin-(sprite_get_height(abilityPanelSprite)*abilityPanelScale)/surfH)/(abilityPanelNum-1);
for (var i = 0; i < abilityPanelNum; i++)
{
	var colMod = 0.25;
	if i < maxAbilities colMod = 1;
	var blend = make_color_rgb(color_get_red(abilityPanelBlend)*colMod,color_get_green(abilityPanelBlend)*colMod,color_get_blue(abilityPanelBlend)*colMod);
	draw_sprite_ext(abilityPanelSprite,0,surfW*abilityPanelX,surfH*(abilityPanelYBegin+panelSep*i),abilityPanelScale,abilityPanelScale,0,blend,1.0);
	draw_sprite_ext(abilityPanelNumSprite,0,surfW*abilityPanelNumX,surfH*(abilityPanelYBegin+panelSep*i),abilityPanelScale,abilityPanelScale,0,blend,1.0);
}
	
	//Individual abilities
if (maxAbilities == 0)
{
	var col = c_gray;
	if sY == 1 col = c_white;
	draw_set_colour(col);
	var name = "Nothing";
	var icon = spr_icon_ability_undefined;
	draw_text(surfW*(abilityListX+abilityTextXOffset),surfH*(abilityListY+abilityTextYOffset),name)
	draw_sprite_ext(icon,0,surfW*abilityListX,surfH*(abilityListY),abilityIconScale,abilityIconScale,0,col,1);
}
else
{
	for (var i = 0; i < min(abilityPanelNum,maxAbilities); i++)
	{
		var abilityID = slot_options[i+abilityPanelScroll];
		var lastAbilityID = noone;
		var count = 0;
		for (var j = 0; j < array_length_1d(slot_options); j++)
		{
			var temp = slot_options[j];
			if temp == lastAbilityID count++;
			else count = 0;
			if count < scr_player_ability_get(selection, temp, playerAbilityStats.numberActivated)
			{
				var icon = abilityIconActivated;
			}
			else var icon = abilityIconDeactivated;
			if i+abilityPanelScroll == j break;
			lastAbilityID = temp;
		}
		
		var name = ability_get_data(selection, abilityID, abilityStats.name);
		var num = ability_get_data(selection, abilityID, abilityStats.cost);
		var col = c_gray;
			//ability selection emphasis
		if (sY == 1 && i+abilityPanelScroll == sExpY)
		{
			var desc = ability_get_data(selection, abilityID, abilityStats.description);
			col = c_white;
			draw_set_color(col);
			draw_text_ext(surfW*abilityDescriptionX,surfH*abilityDescriptionY, desc, surfH*abilityDescriptionSep, surfW*abilityDescriptionWidth);
		}
			
		if (name == undefined)
		{
			name = "UNDEFINED";
		}
		if (icon == undefined)
		{
			icon = spr_icon_ability_undefined;
		}
			
		draw_sprite_ext(icon,0,surfW*abilityListX,surfH*(abilityListY+(panelSep*i)),abilityIconScale,abilityIconScale,0,col,1);
		draw_set_color(col);
		draw_text(surfW*(abilityListX+abilityTextXOffset),surfH*(abilityListY+(panelSep*i)+abilityTextYOffset),name)
		draw_set_halign(fa_center);
		draw_text(surfW*(abilityListX+abilityNumberXOffset),surfH*(abilityListY+(panelSep*i)+abilityNumberYOffset),num)
		draw_set_halign(fa_left);
	}
}
#endregion