#region get data
var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);
#endregion

#region Boundaries
	//1 (vert)
var size = (mainBoundary1Y2-mainBoundary1Y1)*surfH;
var sprW = sprite_get_width(spr_pause_main_boundary_vert)*mainBoundaryScale;
var sprH = sprite_get_height(spr_pause_main_boundary_vert)*mainBoundaryScale;
var n = size/sprH;
for(var i = 0; i < n; i++)
{
	var yPart = min(n-i,1);
	draw_sprite_part_ext(spr_pause_main_boundary_vert,0,0,0,sprW/mainBoundaryScale,sprH/mainBoundaryScale*yPart,mainBoundary1X*surfW-sprite_get_xoffset(spr_pause_main_boundary_vert)*mainBoundaryScale,mainBoundary1Y1*surfH+i*sprH,mainBoundaryScale,mainBoundaryScale,c_white,1.0);
}

	//2 (vert)
var size = (mainBoundary2Y2-mainBoundary2Y1)*surfH;
var sprW = sprite_get_width(spr_pause_main_boundary_vert)*mainBoundaryScale;
var sprH = sprite_get_height(spr_pause_main_boundary_vert)*mainBoundaryScale;
var n = size/sprH;
for(var i = 0; i < n; i++)
{
	var yPart = min(n-i,1);
	draw_sprite_part_ext(spr_pause_main_boundary_vert,0,0,0,sprW/mainBoundaryScale,sprH/mainBoundaryScale*yPart,mainBoundary2X*surfW-sprite_get_xoffset(spr_pause_main_boundary_vert)*mainBoundaryScale,mainBoundary2Y1*surfH+i*sprH,mainBoundaryScale,mainBoundaryScale,c_white,1.0);
}

	//3 (hor)
var size = (mainBoundary3X2-mainBoundary3X1)*surfW;
var sprW = sprite_get_width(spr_pause_main_boundary_hor)*mainBoundaryScale;
var sprH = sprite_get_height(spr_pause_main_boundary_hor)*mainBoundaryScale;
var n = size/sprW;
for(var i = 0; i < n; i++)
{
	var xPart = min(n-i,1);
	draw_sprite_part_ext(spr_pause_main_boundary_hor,0,0,0,sprW/mainBoundaryScale*xPart,sprH/mainBoundaryScale,mainBoundary3X1*surfW+i*sprW,mainBoundary3Y*surfH-sprite_get_yoffset(spr_pause_main_boundary_hor)*mainBoundaryScale,mainBoundaryScale,mainBoundaryScale,c_white,1.0);
}
	
	//4 (vert)
var size = (mainBoundary4Y2-mainBoundary4Y1)*surfH;
var sprW = sprite_get_width(spr_pause_main_boundary_vert)*mainBoundaryScale;
var sprH = sprite_get_height(spr_pause_main_boundary_vert)*mainBoundaryScale;
var n = size/sprH;
for(var i = 0; i < n; i++)
{
	var yPart = min(n-i,1);
	draw_sprite_part_ext(spr_pause_main_boundary_vert,0,0,0,sprW/mainBoundaryScale,sprH/mainBoundaryScale*yPart,mainBoundary4X*surfW-sprite_get_xoffset(spr_pause_main_boundary_vert)*mainBoundaryScale,mainBoundary4Y1*surfH+i*sprH,mainBoundaryScale,mainBoundaryScale,c_white,1.0);
}
#endregion

#region Panels

draw_set_font(mainPanelsFont);
for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		var col = c_gray;
		if sX == i && sY == j {var col = c_white;}
		draw_sprite_ext(mainPanelsSprite,0,(mainPanelsX)*surfW,(mainPanelsY+mainPanelsYSep*j)*surfH,mainPanelsScale,mainPanelsScale,0,col,1.0);
		draw_text_color((mainPanelsX+mainPanelsTextX)*surfW,(mainPanelsY+mainPanelsTextY+mainPanelsYSep*j)*surfH,current_menu_options[i, j],col,col,col,col,1.0);
	}
}

#endregion
#region Description
//	//portrait
//var playerName = "{NAME}"
//scr_draw_textbox(mainDescriptionPortraitX1*surfW,mainDescriptionPortraitY1*surfH,mainDescriptionPortraitX2*surfW,mainDescriptionPortraitY2*surfH,mainDescriptionPortraitType,mainDescriptionPortraitScale,mainDescriptionPortraitBlend);
//draw_set_font(mainDescriptionNameFont);
//draw_set_colour(mainDescriptionNameColour);
//draw_text(mainDescriptionNameX*surfW,mainDescriptionNameY*surfH,playerName);
	//details
ds_list_clear(mainDescriptionList);
ds_list_clear(mainDescriptionValuesList);
switch(mainDescriptionDetailsPageNum)
{
	case 0:		#region Main Stats
	
			//Level
		ds_list_add(mainDescriptionList,"Level");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.level));
			//SPACE
		ds_list_add(mainDescriptionList,"");
		ds_list_add(mainDescriptionValuesList,"");
			//Strength
		ds_list_add(mainDescriptionList,"Strength");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.strength));
			//Constitution
		ds_list_add(mainDescriptionList,"Constitution");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.constitution));
			//Dexterity
		ds_list_add(mainDescriptionList,"Dexterity");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.dexterity));
			//Cunning
		ds_list_add(mainDescriptionList,"Cunning");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.cunning));
			//Intelligence
		ds_list_add(mainDescriptionList,"Intelligence");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.intelligence));
			//Willpower
		ds_list_add(mainDescriptionList,"Willpower");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.willpower));
		
		break;	#endregion
	case 1:		#region Offensive Stats
		
		var equipCache = ItemCache.equipment;
			//Main1 Damage
		ds_list_add(mainDescriptionList,item_get_data(itemType.weapon,equipCache[? equipmentSlot.main1],itemStats.name)+" Damage");
		ds_list_add(mainDescriptionValuesList,string(round(scr_weapon_damage_compiled(PlayerStats.weaponMain1DamageDetails))));
			//Main1 Stagger
		ds_list_add(mainDescriptionList,"          Stagger");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.weaponMain1DamageDetails[? weaponDamageDetails.stagger]));
			//Main2 Damage
		ds_list_add(mainDescriptionList,item_get_data(itemType.weapon,equipCache[? equipmentSlot.main2],itemStats.name)+" Damage");
		ds_list_add(mainDescriptionValuesList,string(round(scr_weapon_damage_compiled(PlayerStats.weaponMain2DamageDetails))));
			//Main2 Stagger
		ds_list_add(mainDescriptionList,"          Stagger");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.weaponMain2DamageDetails[? weaponDamageDetails.stagger]));
			//Off1 Damage
		ds_list_add(mainDescriptionList,item_get_data(itemType.weapon,equipCache[? equipmentSlot.off1],itemStats.name)+" Damage");
		ds_list_add(mainDescriptionValuesList,string(round(scr_weapon_damage_compiled(PlayerStats.weaponOff1DamageDetails))));
			//Off1 Stagger
		ds_list_add(mainDescriptionList,"          Stagger");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.weaponOff1DamageDetails[? weaponDamageDetails.stagger]));
			//Off2 Damage
		ds_list_add(mainDescriptionList,item_get_data(itemType.weapon,equipCache[? equipmentSlot.off2],itemStats.name)+" Damage");
		ds_list_add(mainDescriptionValuesList,string(round(scr_weapon_damage_compiled(PlayerStats.weaponOff2DamageDetails))));
			//Off2 Stagger
		ds_list_add(mainDescriptionList,"          Stagger");
		ds_list_add(mainDescriptionValuesList,string(PlayerStats.weaponOff2DamageDetails[? weaponDamageDetails.stagger]));
		
		break;	#endregion
	case 2:		#region Defensive Stats
		
		var defenses = PlayerStats.damageResistances;
			//Physical
		ds_list_add(mainDescriptionList,"Physical Defense");
		ds_list_add(mainDescriptionValuesList,string(round((defenses[damageType.slash]+defenses[damageType.pierce]+defenses[damageType.blunt])/3)));
			//SPACE
		ds_list_add(mainDescriptionList,"");
		ds_list_add(mainDescriptionValuesList,"");
			//Fire
		ds_list_add(mainDescriptionList,"Fire Res.");
		ds_list_add(mainDescriptionValuesList,string(defenses[damageType.fire]));
			//Ice
		ds_list_add(mainDescriptionList,"Ice Res.");
		ds_list_add(mainDescriptionValuesList,string(defenses[damageType.ice]));
			//Lightning
		ds_list_add(mainDescriptionList,"Lightning Res.");
		ds_list_add(mainDescriptionValuesList,string(defenses[damageType.lightning]));
			//Arcane
		ds_list_add(mainDescriptionList,"Arcane Res.");
		ds_list_add(mainDescriptionValuesList,string(defenses[damageType.arcane]));
			//Light
		ds_list_add(mainDescriptionList,"Light Res.");
		ds_list_add(mainDescriptionValuesList,string(defenses[damageType.light]));
			//Dark
		ds_list_add(mainDescriptionList,"Dark Res.");
		ds_list_add(mainDescriptionValuesList,string(defenses[damageType.dark]));
		
		break;	#endregion
	case 3:		#region Equipment Stats
		
		var equipCache = ItemCache.equipment;
			//Head
		ds_list_add(mainDescriptionList,"Head");
		ds_list_add(mainDescriptionValuesList,item_get_data(itemType.equipment,equipCache[? equipmentSlot.head],itemStats.name));
			//Chest
		ds_list_add(mainDescriptionList,"Chest");
		ds_list_add(mainDescriptionValuesList,item_get_data(itemType.equipment,equipCache[? equipmentSlot.chest],itemStats.name));
			//Hands
		ds_list_add(mainDescriptionList,"Hands");
		ds_list_add(mainDescriptionValuesList,item_get_data(itemType.equipment,equipCache[? equipmentSlot.hands],itemStats.name));
			//Legs
		ds_list_add(mainDescriptionList,"Legs");
		ds_list_add(mainDescriptionValuesList,item_get_data(itemType.equipment,equipCache[? equipmentSlot.legs],itemStats.name));
			//Space
		ds_list_add(mainDescriptionList,"");
		ds_list_add(mainDescriptionValuesList,"");
			//Space
		ds_list_add(mainDescriptionList,"");
		ds_list_add(mainDescriptionValuesList,"");
			//Space
		ds_list_add(mainDescriptionList,"");
		ds_list_add(mainDescriptionValuesList,"");
			//Space
		ds_list_add(mainDescriptionList,"");
		ds_list_add(mainDescriptionValuesList,"");
		
		break;	#endregion
}

draw_set_font(mainDescriptionDetailsFont);
draw_set_colour(mainDescriptionDetailsColour);
var ySep = ((mainDescriptionDetailsY2-mainDescriptionDetailsY1)*surfH-string_height(" "))/(mainDescriptionDetailsMaxEntries-1);
for(var i = 0; i < ds_list_size(mainDescriptionList); i++)
{
	draw_text(mainDescriptionDetailsX1*surfW,mainDescriptionDetailsY1*surfH+ySep*i,mainDescriptionList[| i]);
}
draw_set_halign(fa_right);
for(var i = 0; i < ds_list_size(mainDescriptionValuesList); i++)
{
	draw_text(mainDescriptionDetailsX2*surfW,mainDescriptionDetailsY1*surfH+ySep*i,mainDescriptionValuesList[| i]);
}
draw_set_halign(fa_left);
#endregion
#region Map
	//THE MAP
var mapSurfW = (surfW)*(mainMapDrawRegionX2-mainMapDrawRegionX1);
var mapSurfH = (surfH)*(mainMapDrawRegionY2-mainMapDrawRegionY1);
var mapBaseW = mapSurfW+mainMapDrawRegionBorderWidth*2;
var mapBaseH = mapSurfH+mainMapDrawRegionBorderWidth*2;

var mapViewPixelScale = 4;
var str = room_get_name(room);
var coordinates = string_replace(str,"rmRoom","");
var coordX = int64(string_copy(coordinates,2,3));
var coordY = int64(string_copy(coordinates,6,3));
var rmCW = RoomCache.rmWidths[? room];
var rmCH = RoomCache.rmHeights[? room];
var cursorX = MapManager.mapCellW*(coordX+(0.5*rmCW));
var cursorY = MapManager.mapCellH*(coordY+(0.5*rmCH));

if !surface_exists(mainMapViewSurface)
{
	mainMapViewSurface = surface_create(mapSurfW,mapSurfH);
}
if !surface_exists(mainMapViewBase)
{
	mainMapViewBase = surface_create(mapBaseW,mapBaseH);
	surface_set_target(mainMapViewBase);
		draw_set_colour(mainMapDrawRegionBorderColour);
			draw_rectangle(0,0,mapBaseW-1,mapBaseH-1,0);
		gpu_set_blendmode(bm_subtract);
			draw_rectangle(mainMapDrawRegionBorderWidth,mainMapDrawRegionBorderWidth,mapBaseW-mainMapDrawRegionBorderWidth-1,mapBaseH-mainMapDrawRegionBorderWidth-2,0);
		gpu_set_blendmode(bm_normal);
		draw_set_colour(mainMapDrawRegionBaseColour);
		draw_set_alpha(mainMapDrawRegionBaseAlpha);
			draw_rectangle(mainMapDrawRegionBorderWidth,mainMapDrawRegionBorderWidth,mapBaseW-mainMapDrawRegionBorderWidth-1,mapBaseH-mainMapDrawRegionBorderWidth-2,0);
		draw_set_alpha(1.0);
	surface_reset_target();
}
if !surface_exists(mainMapViewDetails)
{
	mainMapViewDetails = surface_create(mapSurfW,mapSurfH);
}

surface_set_target(mainMapViewSurface);
	draw_clear_alpha(c_white,0.0);
	var x1 = round(mapSurfW/2+(MapManager.cellStartX*MapManager.mapCellW-cursorX)*mapViewPixelScale);
	var y1 = round(mapSurfH/2+(MapManager.cellStartY*MapManager.mapCellH-cursorY)*mapViewPixelScale);
	draw_surface_ext(MapManager.mapSurface,x1,y1,mapViewPixelScale,mapViewPixelScale,0,c_white,1.0);
surface_reset_target();

surface_set_target(mainMapViewDetails);
	draw_clear_alpha(c_black,0.0);
	var coordinates = string_replace(room_get_name(room),"rmRoom","");
	var coordX = int64(string_copy(coordinates,2,3));
	var coordY = int64(string_copy(coordinates,6,3));
	instance_activate_object(objPlayer);
	var playerX = objPlayer.x/room_width;
	var playerY = objPlayer.y/room_height;
	instance_deactivate_object(objPlayer);
	var rmCW = RoomCache.rmWidths[? room];
	var rmCH = RoomCache.rmHeights[? room];
	var xPM = MapManager.mapCellW*(coordX+(playerX*rmCW));
	var yPM = MapManager.mapCellH*(coordY+(playerY*rmCH));
	var xPV = mapSurfW/2+(xPM-cursorX)*mapViewPixelScale;
	var yPV = mapSurfH/2+(yPM-cursorY)*mapViewPixelScale;
	draw_sprite_ext(sprPlayerMarker,0,xPV,yPV,4,4,0,c_white,1);
	//draw_sprite_ext(sprMapCursor,0,mapSurfW/2,mapSurfH/2,4,4,0,c_white,1.0);
surface_reset_target();

draw_surface(mainMapViewBase,surfW*mainMapDrawRegionX1-mainMapDrawRegionBorderWidth,surfH*mainMapDrawRegionY1-mainMapDrawRegionBorderWidth);
draw_surface(mainMapViewSurface,surfW*mainMapDrawRegionX1,surfH*mainMapDrawRegionY1);
draw_surface(mainMapViewDetails,surfW*mainMapDrawRegionX1,surfH*mainMapDrawRegionY1);

	//Area name and coord;
var areaName = "{AREA NAME}";
draw_set_font(fnt_alagard);
	draw_text_colour(mainMapAreaNameX*surfW,mainMapAreaNameY*surfH,areaName,mainMapAreaNameColour,mainMapAreaNameColour,mainMapAreaNameColour,mainMapAreaNameColour,1.0);
draw_set_halign(fa_right);
	draw_text_colour(mainMapCoordX*surfW,mainMapCoordY*surfH,"("+string(coordX)+","+string(coordY)+")",mainMapCoordColour,mainMapCoordColour,mainMapCoordColour,mainMapCoordColour,1.0);
draw_set_halign(fa_left);
#endregion
#region player status
	//hp
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_text_color((mainPlayerHpX1-mainPlayerStatsTextSep)*surfW,(mainPlayerHpY+mainPlayerHpThickness/2)*surfH,"HP",mainPlayerHpTextColour,mainPlayerHpTextColour,mainPlayerHpTextColour,mainPlayerHpTextColour,1.0);
scr_draw_bar(mainPlayerHpX1*surfW,mainPlayerHpX2*surfW,mainPlayerHpY*surfH,mainPlayerHpThickness*surfH,PlayerStats.hp,PlayerStats.hpMax,mainPlayerHpScale,mainPlayerHpColour);
	//mp
draw_text_color((mainPlayerMpX1-mainPlayerStatsTextSep)*surfW,(mainPlayerMpY+mainPlayerMpThickness/2)*surfH,"MP",mainPlayerMpTextColour,mainPlayerMpTextColour,mainPlayerMpTextColour,mainPlayerMpTextColour,1.0);
scr_draw_bar(mainPlayerMpX1*surfW,mainPlayerMpX2*surfW,mainPlayerMpY*surfH,mainPlayerMpThickness*surfH,PlayerStats.mp,PlayerStats.mpMax,mainPlayerMpScale,mainPlayerMpColour);
	//ap
draw_text_color((mainPlayerApX1-mainPlayerStatsTextSep)*surfW,(mainPlayerApY+mainPlayerApThickness/2)*surfH,"AP",mainPlayerApTextColour,mainPlayerApTextColour,mainPlayerApTextColour,mainPlayerApTextColour,1.0);
scr_draw_bar(mainPlayerApX1*surfW,mainPlayerApX2*surfW,mainPlayerApY*surfH,mainPlayerApThickness*surfH,PlayerStats.ap,PlayerStats.apMax,mainPlayerApScale,mainPlayerApColour);
	//hp Num
draw_text_color((mainPlayerHpX2+mainPlayerStatsNumSep)*surfW,(mainPlayerHpY+mainPlayerHpThickness/2)*surfH,string(round(PlayerStats.hp))+"/"+string(round(PlayerStats.hpMax)),mainPlayerHpTextColour,mainPlayerHpTextColour,mainPlayerHpTextColour,mainPlayerHpTextColour,1.0);
	//mp Num
draw_text_color((mainPlayerMpX2+mainPlayerStatsNumSep)*surfW,(mainPlayerMpY+mainPlayerMpThickness/2)*surfH,string(round(PlayerStats.mp))+"/"+string(round(PlayerStats.mpMax)),mainPlayerMpTextColour,mainPlayerMpTextColour,mainPlayerMpTextColour,mainPlayerMpTextColour,1.0);	
	//ap Num
draw_text_color((mainPlayerApX2+mainPlayerStatsNumSep)*surfW,(mainPlayerApY+mainPlayerApThickness/2)*surfH,string(round(PlayerStats.ap))+"/"+string(round(PlayerStats.apMax)),mainPlayerApTextColour,mainPlayerApTextColour,mainPlayerApTextColour,mainPlayerApTextColour,1.0);
	//exp
draw_set_font(fnt_alagard);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
	draw_text_colour(mainPlayerExpX*surfW,mainPlayerExpY*surfH,"Exp Needed: ",mainPlayerExpColour,mainPlayerExpColour,mainPlayerExpColour,mainPlayerExpColour,1.0);
	draw_text_colour((mainPlayerExpX+mainPlayerExpValueSep)*surfW,mainPlayerExpY*surfH,string(round(PlayerStats.xpNeeded-PlayerStats.xp)),mainPlayerExpColour,mainPlayerExpColour,mainPlayerExpColour,mainPlayerExpColour,1.0);
	//gold
	draw_text_colour(mainPlayerGoldX*surfW,mainPlayerGoldY*surfH,"Gold: ",mainPlayerGoldColour,mainPlayerGoldColour,mainPlayerGoldColour,mainPlayerGoldColour,1.0);
	draw_text_colour((mainPlayerGoldX+mainPlayerGoldValueSep)*surfW,mainPlayerGoldY*surfH,string(PlayerStats.gold),mainPlayerGoldColour,mainPlayerGoldColour,mainPlayerGoldColour,mainPlayerGoldColour,1.0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);	
#endregion
#region weaponry status
var equipCache = ItemCache.equipment;
var class1ID = weapon_get_stat(equipCache[? equipmentSlot.main1],weaponStats.type);
var class2ID = weapon_get_stat(equipCache[? equipmentSlot.main2],weaponStats.type);
var class3ID = weapon_get_stat(equipCache[? equipmentSlot.off1],weaponStats.type);
var class4ID = weapon_get_stat(equipCache[? equipmentSlot.off2],weaponStats.type);

var class1Name = class_get_stat(class1ID,weaponClassStats.name);
var class2Name = class_get_stat(class2ID,weaponClassStats.name);
var class3Name = class_get_stat(class3ID,weaponClassStats.name);
var class4Name = class_get_stat(class4ID,weaponClassStats.name);

var class1Level = playerClass_get_stat(class1ID,playerClassStats.level);
var class2Level = playerClass_get_stat(class2ID,playerClassStats.level);
var class3Level = playerClass_get_stat(class3ID,playerClassStats.level);
var class4Level = playerClass_get_stat(class4ID,playerClassStats.level);

var class1Exp = playerClass_get_stat(class1ID,playerClassStats.xp);
var class2Exp = playerClass_get_stat(class2ID,playerClassStats.xp);
var class3Exp = playerClass_get_stat(class3ID,playerClassStats.xp);
var class4Exp = playerClass_get_stat(class4ID,playerClassStats.xp);

var class1ExpNeeded = playerClass_get_stat(class1ID,playerClassStats.xpNeeded);
var class2ExpNeeded = playerClass_get_stat(class2ID,playerClassStats.xpNeeded);
var class3ExpNeeded = playerClass_get_stat(class3ID,playerClassStats.xpNeeded);
var class4ExpNeeded = playerClass_get_stat(class4ID,playerClassStats.xpNeeded);

if class1Name != undefined
{
	var i = 0;
	draw_set_valign(fa_middle);
	draw_text_color(mainWeaponryNameX*surfW,(mainWeaponryYI+mainWeaponryThickness/2+mainWeaponryYSep*i)*surfH,class1Name,mainWeaponryNameColour,mainWeaponryNameColour,mainWeaponryNameColour,mainWeaponryNameColour,1.0);
	scr_draw_bar(mainWeaponryX1*surfW,mainWeaponryX2*surfW,(mainWeaponryYI+mainWeaponryYSep*i)*surfH,mainWeaponryThickness*surfH,class1Exp,class1ExpNeeded,mainWeaponryScale,mainWeaponryColour);
	draw_set_halign(fa_middle);
	draw_text_color(mainWeaponryLevelX*surfW,(mainWeaponryYI+mainWeaponryThickness/2+mainWeaponryYSep*i)*surfH,class1Level,mainWeaponryLevelColour,mainWeaponryLevelColour,mainWeaponryLevelColour,mainWeaponryLevelColour,1.0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
if class2Name != undefined
{
	var i = 1;
	draw_set_valign(fa_middle);
	draw_text_color(mainWeaponryNameX*surfW,(mainWeaponryYI+mainWeaponryThickness/2+mainWeaponryYSep*i)*surfH,class2Name,mainWeaponryNameColour,mainWeaponryNameColour,mainWeaponryNameColour,mainWeaponryNameColour,1.0);
	scr_draw_bar(mainWeaponryX1*surfW,mainWeaponryX2*surfW,(mainWeaponryYI+mainWeaponryYSep*i)*surfH,mainWeaponryThickness*surfH,class2Exp,class2ExpNeeded,mainWeaponryScale,mainWeaponryColour);
	draw_set_halign(fa_middle);
	draw_text_color(mainWeaponryLevelX*surfW,(mainWeaponryYI+mainWeaponryThickness/2+mainWeaponryYSep*i)*surfH,class1Level,mainWeaponryLevelColour,mainWeaponryLevelColour,mainWeaponryLevelColour,mainWeaponryLevelColour,1.0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
if class3Name != undefined
{
	var i = 2;
	draw_set_valign(fa_middle);
	draw_text_color(mainWeaponryNameX*surfW,(mainWeaponryYI+mainWeaponryThickness/2+mainWeaponryYSep*i)*surfH,class3Name,mainWeaponryNameColour,mainWeaponryNameColour,mainWeaponryNameColour,mainWeaponryNameColour,1.0);
	scr_draw_bar(mainWeaponryX1*surfW,mainWeaponryX2*surfW,(mainWeaponryYI+mainWeaponryYSep*i)*surfH,mainWeaponryThickness*surfH,class3Exp,class3ExpNeeded,mainWeaponryScale,mainWeaponryColour);
	draw_set_halign(fa_middle);
	draw_text_color(mainWeaponryLevelX*surfW,(mainWeaponryYI+mainWeaponryThickness/2+mainWeaponryYSep*i)*surfH,class1Level,mainWeaponryLevelColour,mainWeaponryLevelColour,mainWeaponryLevelColour,mainWeaponryLevelColour,1.0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
if class4Name != undefined
{
	var i = 3;
	draw_set_valign(fa_middle);
	draw_text_color(mainWeaponryNameX*surfW,(mainWeaponryYI+mainWeaponryThickness/2+mainWeaponryYSep*i)*surfH,class4Name,mainWeaponryNameColour,mainWeaponryNameColour,mainWeaponryNameColour,mainWeaponryNameColour,1.0);
	scr_draw_bar(mainWeaponryX1*surfW,mainWeaponryX2*surfW,(mainWeaponryYI+mainWeaponryYSep*i)*surfH,mainWeaponryThickness*surfH,class4Exp,class4ExpNeeded,mainWeaponryScale,mainWeaponryColour);
	draw_set_halign(fa_middle);
	draw_text_color(mainWeaponryLevelX*surfW,(mainWeaponryYI+mainWeaponryThickness/2+mainWeaponryYSep*i)*surfH,class1Level,mainWeaponryLevelColour,mainWeaponryLevelColour,mainWeaponryLevelColour,mainWeaponryLevelColour,1.0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
#endregion

