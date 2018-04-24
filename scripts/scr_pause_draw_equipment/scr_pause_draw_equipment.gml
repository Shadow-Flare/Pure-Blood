var surfX = surface_get_width(application_surface);
var surfY = surface_get_height(application_surface);
	
	//compose surfaces
#region Manage surfaces
if !surface_exists(equipmentSurfaceMain) equipmentSurfaceMain = surface_create(surfX,surfY);
if !surface_exists(equipmentSurfaceRunes) equipmentSurfaceRunes = surface_create(surfX,surfY);
if !surface_exists(equipmentSurfaceRunesCutout) equipmentSurfaceRunesCutout = surface_create(surfX,surfY);
if !surface_exists(equipmentSurfaceInfo) equipmentSurfaceInfo = surface_create(surfX,surfY);
if !surface_exists(equipmentSurfaceSlot) equipmentSurfaceSlot = surface_create(surfX,surfY);
#endregion
#region Runes
	#region Cutout
surface_set_target(equipmentSurfaceRunesCutout);
	draw_clear_alpha(c_white,1.0);	
	gpu_set_blendmode(bm_subtract);
		draw_rectangle(equipmentMainRegionX1*surfX,equipmentMainRegionY1*surfY,equipmentMainRegionX2*surfX,equipmentMainRegionY2*surfY,false);
	gpu_set_blendmode(bm_normal);
surface_reset_target();
	#endregion
surface_set_target(equipmentSurfaceRunes);
draw_clear_alpha(c_black,0);
	#region Dark Glow
		repeat(3) draw_sprite_ext(equipmentRunesDarkGlowSprite,0,equipmentRunesCenterX*surfX,equipmentRunesCenterY*surfY,equipmentRunesDarkGlowScale,equipmentRunesDarkGlowScale,0,c_black,equipmentRunesDarkGlowAlpha);
	#endregion
	#region Runes Text Boxes & icons + details
var maxRunes = PlayerStats.runeSize;
var runeAngleDesired = (360/maxRunes)*sExpY;
var rotateMod = runeAngleDesired-runeAngleMod;
if rotateMod > 180 rotateMod = -(360-rotateMod);
else if rotateMod < -180 rotateMod = 360+rotateMod;

runeAngleMod += (rotateMod)/6;
runeAngleMod = (runeAngleMod+360)%360;

for(var i = 0; i < 360; i += 360/maxRunes)
{
	var index = maxRunes-1-i/(360/maxRunes);
		//textbox
	var col = equipmentRunesColour;
	if selection == equipmentSlot.rune
	{
		if index == sExpY
		{
			col = equipmentSelectionColour;
			var a = 1;
		}
		else var a = equipmentSurfaceRunesAlpha;
	}
	else var a = equipmentSurfaceRunesAlpha;
	var angle = (i+180+runeAngleMod)%360;
	var centerX = equipmentRunesCenterX*surfX+dcos(angle)*equipmentRunesRadius*surfX;
	var centerY = equipmentRunesCenterY*surfY-dsin(angle)*equipmentRunesRadius*surfX;
	var distX = equipmentRunesWidth/2*surfX;
	var distY = equipmentRunesHeight/2*surfY;
	var x1 = centerX-distX;
	var y1 = centerY-distY;
	var x2 = centerX+distX;
	var y2 = centerY+distY;
	draw_set_alpha(a);
	scr_draw_textbox(x1,y1,x2,y2,equipmentRunesType,equipmentRunesScale,col);
		//icon
	var runeID, xGap, yGap, name;
	var sprite = spr_icon_item_TEMPLATE;
	var equipCache = ItemCache.equipment;
	var runeCache = equipCache[? equipmentSlot.rune];
	xGap = ((equipmentHeadX2-equipmentHeadX1)*surfX-equipmentIconScale*sprite_get_width(sprite))/2;
	yGap = ((equipmentHeadY2-equipmentHeadY1)*surfY-equipmentIconScale*sprite_get_height(sprite))/2;
	
	runeID = runeCache[| index];
	if runeID == noone || runeID == undefined sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.rune,runeID,itemStats.icon);
	if sprite == undefined sprite = spr_icon_item_undefined;
	draw_sprite_ext(sprite,0,x1+xGap,y1+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);
}
draw_set_alpha(1.0);
	#endregion
surface_reset_target();
#endregion
#region Main
surface_set_target(equipmentSurfaceMain);
draw_clear_alpha(c_black,0);
draw_set_alpha(1);
	#region Main equipment Text boxes
var col;
if selection == equipmentSlot.head {col = equipmentSelectionColour; draw_set_alpha(1);}
else {col = equipmentHeadColour; draw_set_alpha(equipmentSurfaceMainAlpha);}
scr_draw_textbox(equipmentHeadX1*surfX,equipmentHeadY1*surfY,equipmentHeadX2*surfX,equipmentHeadY2*surfY,equipmentHeadType,equipmentHeadScale,col);

if selection == equipmentSlot.chest {col = equipmentSelectionColour; draw_set_alpha(1);}
else {col = equipmentHeadColour; draw_set_alpha(equipmentSurfaceMainAlpha);}
scr_draw_textbox(equipmentChestX1*surfX,equipmentChestY1*surfY,equipmentChestX2*surfX,equipmentChestY2*surfY,equipmentChestType,equipmentChestScale,col);

if selection == equipmentSlot.hands {col = equipmentSelectionColour; draw_set_alpha(1);}
else {col = equipmentHeadColour; draw_set_alpha(equipmentSurfaceMainAlpha);}
scr_draw_textbox(equipmentHandsX1*surfX,equipmentHandsY1*surfY,equipmentHandsX2*surfX,equipmentHandsY2*surfY,equipmentHandsType,equipmentHandsScale,col);

if selection == equipmentSlot.legs {col = equipmentSelectionColour; draw_set_alpha(1);}
else {col = equipmentHeadColour; draw_set_alpha(equipmentSurfaceMainAlpha);}
scr_draw_textbox(equipmentLegsX1*surfX,equipmentLegsY1*surfY,equipmentLegsX2*surfX,equipmentLegsY2*surfY,equipmentLegsType,equipmentLegsScale,col);

if selection == equipmentSlot.main1 {col = equipmentSelectionColour; draw_set_alpha(1);}
else {col = equipmentHeadColour; draw_set_alpha(equipmentSurfaceMainAlpha);}
scr_draw_textbox(equipmentMain1X1*surfX,equipmentMain1Y1*surfY,equipmentMain1X2*surfX,equipmentMain1Y2*surfY,equipmentMain1Type,equipmentMain1Scale,col);

if selection == equipmentSlot.main2 {col = equipmentSelectionColour; draw_set_alpha(1);}
else {col = equipmentHeadColour; draw_set_alpha(equipmentSurfaceMainAlpha);}
scr_draw_textbox(equipmentMain2X1*surfX,equipmentMain2Y1*surfY,equipmentMain2X2*surfX,equipmentMain2Y2*surfY,equipmentMain2Type,equipmentMain2Scale,col);

if selection == equipmentSlot.off1 {col = equipmentSelectionColour; draw_set_alpha(1);}
else {col = equipmentHeadColour; draw_set_alpha(equipmentSurfaceMainAlpha);}
scr_draw_textbox(equipmentOff1X1*surfX,equipmentOff1Y1*surfY,equipmentOff1X2*surfX,equipmentOff1Y2*surfY,equipmentOff1Type,equipmentOff1Scale,col);

if selection == equipmentSlot.off2 {col = equipmentSelectionColour; draw_set_alpha(1);}
else {col = equipmentHeadColour; draw_set_alpha(equipmentSurfaceMainAlpha);}
scr_draw_textbox(equipmentOff2X1*surfX,equipmentOff2Y1*surfY,equipmentOff2X2*surfX,equipmentOff2Y2*surfY,equipmentOff2Type,equipmentOff2Scale,col);
	#endregion
	#region Main equipment icons and details
	
	var equipID, xGap, yGap, name;
	var sprite = spr_icon_item_TEMPLATE;
	var equipCache = ItemCache.equipment;
	xGap = ((equipmentHeadX2-equipmentHeadX1)*surfX-equipmentIconScale*sprite_get_width(sprite))/2;
	yGap = ((equipmentHeadY2-equipmentHeadY1)*surfY-equipmentIconScale*sprite_get_height(sprite))/2;
	
	if selection == equipmentSlot.head var a = 1;
	else var a = equipmentSurfaceMainAlpha;
	equipID = equipCache[? equipmentSlot.head];
	if equipID == noone sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.equipment,equipID,itemStats.icon);
	if sprite == undefined sprite = spr_icon_item_undefined;
	draw_sprite_ext(sprite,0,equipmentHeadX1*surfX+xGap,equipmentHeadY1*surfY+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);
	
	if selection == equipmentSlot.chest var a = 1;
	else var a = equipmentSurfaceMainAlpha;
	equipID = equipCache[? equipmentSlot.chest];
	if equipID == noone sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.equipment,equipID,itemStats.icon);
	draw_sprite_ext(sprite,0,equipmentChestX1*surfX+xGap,equipmentChestY1*surfY+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);

	if selection == equipmentSlot.hands var a = 1;
	else var a = equipmentSurfaceMainAlpha;
	equipID = equipCache[? equipmentSlot.hands];
	if equipID == noone sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.equipment,equipID,itemStats.icon);
	if sprite == undefined sprite = spr_icon_item_undefined;
	draw_sprite_ext(sprite,0,equipmentHandsX1*surfX+xGap,equipmentHandsY1*surfY+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);

	if selection == equipmentSlot.legs var a = 1;
	else var a = equipmentSurfaceMainAlpha;
	equipID = equipCache[? equipmentSlot.legs];
	if equipID == noone sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.equipment,equipID,itemStats.icon);
	if sprite == undefined sprite = spr_icon_item_undefined;
	draw_sprite_ext(sprite,0,equipmentLegsX1*surfX+xGap,equipmentLegsY1*surfY+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);
	
	if selection == equipmentSlot.main1 var a = 1;
	else var a = equipmentSurfaceMainAlpha;
	equipID = equipCache[? equipmentSlot.main1];
	if equipID == noone sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.weapon,equipID,itemStats.icon);
	if sprite == undefined sprite = spr_icon_item_undefined;
	draw_sprite_ext(sprite,0,equipmentMain1X1*surfX+xGap,equipmentMain1Y1*surfY+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);
	
	if selection == equipmentSlot.main2 var a = 1;
	else var a = equipmentSurfaceMainAlpha;
	equipID = equipCache[? equipmentSlot.main2];
	if equipID == noone sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.weapon,equipID,itemStats.icon);
	draw_sprite_ext(sprite,0,equipmentMain2X1*surfX+xGap,equipmentMain2Y1*surfY+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);
	
	if selection == equipmentSlot.off1 var a = 1;
	else var a = equipmentSurfaceMainAlpha;
	equipID = equipCache[? equipmentSlot.off1];
	if equipID == noone sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.weapon,equipID,itemStats.icon);
	
	draw_sprite_ext(sprite,0,equipmentOff1X1*surfX+xGap,equipmentOff1Y1*surfY+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);
	
	if selection == equipmentSlot.off2 var a = 1;
	else var a = equipmentSurfaceMainAlpha;
	equipID = equipCache[? equipmentSlot.off2];
	if equipID == noone sprite = spr_icon_item_TEMPLATE;
	else sprite = item_get_data(itemType.weapon,equipID,itemStats.icon);
	if sprite == undefined sprite = spr_icon_item_undefined;
	draw_sprite_ext(sprite,0,equipmentOff2X1*surfX+xGap,equipmentOff2Y1*surfY+yGap,equipmentIconScale,equipmentIconScale,0,c_white,a);
	
	draw_set_alpha(1);
	#endregion
	#region Items Text boxes
		//draw boxes
	for (var i = 0; i < 4; i++)
	{
		if selection == equipmentSlot.item && sY == i a = 1;
		else a = equipmentSurfaceMainAlpha;
		var col = equipmentItemColour;
		var textX = (equipmentItemCenterX-equipmentItemWidth/2+(i-1.5)*equipmentItemHorSep)*surfX;
		var textY = (equipmentItemCenterY-equipmentItemHeight/2)*surfY;
		if sY == i && selection == equipmentSlot.item col = equipmentSelectionColour;
		draw_set_alpha(a);
		scr_draw_textbox(textX,textY,textX+equipmentItemWidth*surfX,textY+equipmentItemHeight*surfY,equipmentItemType,equipmentItemScale,col);
	}
	draw_set_alpha(1);
	#endregion
	#region Items icons and details
	var itemID, xGap, yGap, iconX, iconY, name, sep, a;
	var sprite = spr_icon_item_TEMPLATE;
	var itemCache = ItemCache.equipment[? equipmentSlot.item];
	xGap = ((equipmentItemWidth*surfX)-equipmentIconScale*sprite_get_width(sprite))/2;
	yGap = ((equipmentItemHeight*surfY)-equipmentIconScale*sprite_get_height(sprite))/2;
	
	for (var i = 0; i < 4; i++)
	{
		if selection == equipmentSlot.item && sY == i a = 1;
		else a = equipmentSurfaceMainAlpha;
		itemID = itemCache[| i];
		if itemID == noone || itemID == undefined sprite = spr_icon_item_TEMPLATE;
		else sprite = item_get_data(itemType.item,itemID,itemStats.icon);
		if sprite == undefined sprite = spr_icon_item_undefined;
		iconX = (equipmentItemCenterX-equipmentItemWidth/2+(i-1.5)*equipmentItemHorSep)*surfX+xGap;
		iconY = (equipmentItemCenterY-equipmentItemHeight/2)*surfY+yGap;
		draw_sprite_ext(sprite,0,iconX,iconY,equipmentIconScale,equipmentIconScale,0,c_white,a);
	}
	#endregion
surface_reset_target();
#endregion
#region Info
surface_set_target(equipmentSurfaceInfo);
draw_clear_alpha(c_black,0);
	#region Info Text Boxes
		//Player Stats
	scr_draw_textbox(equipmentPlayerStatsX1*surfX,equipmentPlayerStatsY1*surfY,equipmentPlayerStatsX2*surfX,equipmentPlayerStatsY2*surfY,equipmentPlayerStatsType,equipmentPlayerStatsScale,equipmentPlayerStatsColour);
		//item Stats
	scr_draw_textbox(equipmentItemStatsX1*surfX,equipmentItemStatsY1*surfY,equipmentItemStatsX2*surfX,equipmentItemStatsY2*surfY,equipmentItemStatsType,equipmentItemStatsScale,equipmentItemStatsColour);
	#endregion
	#region Info Data: Player Stats
		#region Update Equip-Alt Stats when slot open (SHOULD MIRROR THE UPDATE IN THE PlayerStats STEP EVENT)
		ds_list_destroy(equipmentPlayerEquipAlt[? equipmentSlot.rune]);
		ds_map_copy(equipmentPlayerEquipAlt,ItemCache.equipment);
		equipmentPlayerEquipAlt[? equipmentSlot.rune] = ds_list_create();
		ds_list_copy(equipmentPlayerEquipAlt[? equipmentSlot.rune],ItemCache.equipment[? equipmentSlot.rune]);
		
		if slotExpanded
		{
			//insert current selection into equipmentAlt
			if selection == equipmentSlot.rune
			{
				var tempCache = equipmentPlayerEquipAlt[? selection];
				tempCache[| sExpY] = equipmentSlotCache[| sX];
			}
			else if selection != equipmentSlot.item
			{
				equipmentPlayerEquipAlt[? selection] = equipmentSlotCache[| sX];
			}
		}
			#region manage & gather equipment data
				//reset
			ds_map_clear(equipmentPlayerEquipAltStats);
			for(var i = 0; i < itemEffects.LENGTH; i++) equipmentPlayerEquipAltStats[? i] = 0;
				//scan and get (IGNORES RUNES)
			var equipID = ds_map_find_first(equipmentPlayerEquipAlt);
			while equipID != undefined
			{
				if equipmentPlayerEquipAlt[? equipID] == undefined equipmentPlayerEquipAlt[? equipID] = noone;
				if equipID != equipmentSlot.item
				{
					var itemID = equipmentPlayerEquipAlt[? equipID];
					if itemID != noone && itemID != undefined
					{
						if equipID == equipmentSlot.rune
						{
							var runeCache = itemID;
							keyType = itemType.rune;
							var cache = ItemCache.item[? keyType];
							for (var i = 0; i < ds_list_size(runeCache); i++)
							{
								var itemID = runeCache[| i];
								if itemID != noone && itemID != undefined
								{
									var itemCache = cache[? itemID];
									var effectCache = itemCache[? itemStats.effectsCache];
									var effectID = ds_map_find_first(effectCache);
									while effectID != undefined
									{
										equipmentPlayerEquipAltStats[? effectID] += effectCache[? effectID];
										effectID = ds_map_find_next(effectCache,effectID);
									}
								}
							}
						}
						else
						{
							switch equipID
							{
								case equipmentSlot.head:
								case equipmentSlot.chest:
								case equipmentSlot.hands:
								case equipmentSlot.legs:
									var keyType = itemType.equipment;
									break;
								case equipmentSlot.main1:
								case equipmentSlot.main2:
								case equipmentSlot.off1:
								case equipmentSlot.off2:
									var keyType = itemType.weapon;
									break;
							}
							var equipMain = [equipmentSlot.main1,equipmentSlot.main2];
							var equipOff = [equipmentSlot.off1,equipmentSlot.off2];
							var mainSlot = equipMain[PlayerStats.currentWeaponIndex];
							var offSlot = equipOff[PlayerStats.currentOffhandIndex];
							if keyType != itemType.weapon || equipID == mainSlot || equipID = offSlot
							{
								var cache = ItemCache.item[? keyType];
								var itemCache = cache[? itemID];
								var effectCache = itemCache[? itemStats.effectsCache];
								var effectID = ds_map_find_first(effectCache);
								while effectID != undefined
								{
									equipmentPlayerEquipAltStats[? effectID] += effectCache[? effectID];
									effectID = ds_map_find_next(effectCache,effectID);
								}
							}
						}
					}
				}
				equipID = ds_map_find_next(equipmentPlayerEquipAlt,equipID);
			}
			#endregion
			#region setup simulated Alt Data
			var _strength = PlayerStats.strengthBase+equipmentPlayerEquipAltStats[? itemEffects.str];
			var _constitution = PlayerStats.constitutionBase+equipmentPlayerEquipAltStats[? itemEffects.con];
			var _dexterity = PlayerStats.dexterityBase+equipmentPlayerEquipAltStats[? itemEffects.dex];
			var _cunning = PlayerStats.cunningBase+equipmentPlayerEquipAltStats[? itemEffects.cun];
			var _intelligence = PlayerStats.intelligenceBase+equipmentPlayerEquipAltStats[? itemEffects.int];
			var _willpower = PlayerStats.willpowerBase+equipmentPlayerEquipAltStats[? itemEffects.wil];

			var _hpMax = 20+4*_constitution+equipmentPlayerEquipAltStats[? itemEffects.hp];
			var _mpMax = 20+4*_willpower+equipmentPlayerEquipAltStats[? itemEffects.mp];
			var _apMax = 10+1*_cunning+equipmentPlayerEquipAltStats[? itemEffects.ap];

			var _damageResistances_slash = equipmentPlayerEquipAltStats[? itemEffects.slashDef];
			var _damageResistances_pierce = equipmentPlayerEquipAltStats[? itemEffects.pierceDef];
			var _damageResistances_blunt = equipmentPlayerEquipAltStats[? itemEffects.bluntDef];

			var _damageResistances_fire = 1+equipmentPlayerEquipAltStats[? itemEffects.fireRes]+0.01*_willpower;
			var _damageResistances_ice = 1+equipmentPlayerEquipAltStats[? itemEffects.iceRes]+0.01*_willpower;
			var _damageResistances_lightning = 1+equipmentPlayerEquipAltStats[? itemEffects.lightningRes]+0.01*_willpower;
			var _damageResistances_arcane = 1+equipmentPlayerEquipAltStats[? itemEffects.arcaneRes]+0.03*_willpower-0.02*_intelligence;
			var _damageResistances_light = 1+equipmentPlayerEquipAltStats[? itemEffects.lightRes]+0.01*_willpower;
			var _damageResistances_dark = 1+equipmentPlayerEquipAltStats[? itemEffects.darkRes]+0.01*_willpower;

			var _specialResistances_bleed = 100+3*_constitution+1.5*_intelligence;

			var _alacrity = _dexterity*0.33333+_cunning*0.1+equipmentPlayerEquipAltStats[? itemEffects.alacrity];
			var _memory = _intelligence*0.66666+equipmentPlayerEquipAltStats[? itemEffects.memory];

			var _physicalPower = 0+0.25*_strength+0.25*_dexterity+equipmentPlayerEquipAltStats[? itemEffects.physPow];
			var _physicalStagger = 0.5+0.05*_strength+equipmentPlayerEquipAltStats[? itemEffects.physFor];
			var _physicalToughness = 2+0.30*_constitution+equipmentPlayerEquipAltStats[? itemEffects.physTough];
			
			var _magicalPower = 0+1*_intelligence+equipmentPlayerEquipAltStats[? itemEffects.magPow];
			var _magicalStagger = 2+0.25*_intelligence+0.25*_willpower+equipmentPlayerEquipAltStats[? itemEffects.magFor];
			var _magicalToughness = 2+0.30*_willpower+equipmentPlayerEquipAltStats[? itemEffects.magTough];

			var _physicalDefense = (_damageResistances_slash+_damageResistances_pierce+_damageResistances_blunt)/3;
			#endregion
		#endregion
		//title && page
	var textSep = ((equipmentPlayerStatsTextColumn1Y2*surfY-equipmentPlayerStatsTextColumn1Y1*surfY)-string_height(""))/equipmentPlayerStatsTextEntries;
	var col;
	var index = 0;
	draw_set_font(fnt_menu);
	draw_set_colour(c_white);
	draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Character Status");
	draw_set_halign(fa_right);
	draw_text(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,"Page "+string(equipmentPlayerStatsPage+1));
	draw_set_halign(fa_left);
	index++;
	switch equipmentPlayerStatsPage
	{
		case 0: #region Page 1: HP, MP, AP and Attributes
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Health"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Mana"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Ability Points"); index++;
			index++;	//empty space
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Strength"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Constitution"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Dexterity"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Cunning"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Intelligence"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Willpower"); index++;
			
			index = 1; //reset
			draw_set_halign(fa_right);
			
			if _hpMax == PlayerStats.hpMax col = c_white;
			else if _hpMax > PlayerStats.hpMax col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_hpMax)),col,col,col,col,1.0); index++;
			
			if _mpMax == PlayerStats.mpMax col = c_white;
			else if _mpMax > PlayerStats.mpMax col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_mpMax)),col,col,col,col,1.0); index++;
			
			if _apMax == PlayerStats.apMax col = c_white;
			else if _apMax > PlayerStats.apMax col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_apMax)),col,col,col,col,1.0); index++;
			
			index++;	//empty Space
			
			if _strength == PlayerStats.strength col = c_white;
			else if _strength > PlayerStats.strength col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(_strength),col,col,col,col,1.0); index++;
			
			if _constitution == PlayerStats.constitution col = c_white;
			else if _constitution > PlayerStats.constitution col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(_constitution),col,col,col,col,1.0); index++;
			
			if _dexterity == PlayerStats.dexterity col = c_white;
			else if _dexterity > PlayerStats.dexterity col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(_dexterity),col,col,col,col,1.0); index++;
			
			if _cunning == PlayerStats.cunning col = c_white;
			else if _cunning > PlayerStats.cunning col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(_cunning),col,col,col,col,1.0); index++;
			
			if _intelligence == PlayerStats.intelligence col = c_white;
			else if _intelligence > PlayerStats.intelligence col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(_intelligence),col,col,col,col,1.0); index++;
			
			if _willpower == PlayerStats.willpower col = c_white;
			else if _willpower > PlayerStats.willpower col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(_willpower),col,col,col,col,1.0); index++;
			
			draw_set_halign(fa_left);
			
			break; #endregion
		case 1: #region Page 2: Alacrity, Damage+Force and toughnesses.
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Alacrity"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Memory"); index++;
			index++;	//empty space
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Physical Power"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Physical Force"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Physical Toughness"); index++;
			index++;	//empty space
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Magical Power"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Magical Force"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Magical Toughness"); index++;
			
			index = 1; //reset
			draw_set_halign(fa_right);
			
			if _alacrity == PlayerStats.alacrity col = c_white;
			else if _alacrity > PlayerStats.alacrity col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_alacrity)),col,col,col,col,1.0); index++;
			
			if _memory == PlayerStats.memory col = c_white;
			else if _memory > PlayerStats.memory col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_memory)),col,col,col,col,1.0); index++;
			
			index++;	//empty space
			
			if _physicalPower == PlayerStats.physicalPower col = c_white;
			else if _physicalPower > PlayerStats.physicalPower col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_physicalPower)),col,col,col,col,1.0); index++;
			
			if _physicalStagger == PlayerStats.physicalStagger col = c_white;
			else if _physicalStagger > PlayerStats.physicalStagger col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_physicalStagger)),col,col,col,col,1.0); index++;
			
			if _physicalToughness == PlayerStats.physicalToughness col = c_white;
			else if _physicalToughness > PlayerStats.physicalToughness col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_physicalToughness)),col,col,col,col,1.0); index++;
			
			
			index++;	//empty space
			
			if _magicalPower == PlayerStats.magicalPower col = c_white;
			else if _magicalPower > PlayerStats.magicalPower col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_magicalPower)),col,col,col,col,1.0); index++;
			
			if _magicalStagger == PlayerStats.magicalStagger col = c_white;
			else if _magicalStagger > PlayerStats.magicalStagger col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_magicalStagger)),col,col,col,col,1.0); index++;
			
			if _magicalToughness == PlayerStats.magicalToughness col = c_white;
			else if _magicalToughness > PlayerStats.magicalToughness col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_magicalToughness)),col,col,col,col,1.0); index++;
			
			draw_set_halign(fa_left);
			
			break; #endregion
		case 2: #region Page 3: Physical Defences and Elemental Resistances
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Physical Defence"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Slash Defence"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Blunt Defence"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Pierce Defence"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Fire Resistance"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Ice Resistance"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Lightning Resistance"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Arcane Resistance"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Light Resistance"); index++;
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Dark Resistance"); index++;
			
			index = 1;	//reset
			draw_set_halign(fa_right);
			
			if _physicalDefense == PlayerStats.physicalDefense col = c_white;
			else if _physicalDefense > PlayerStats.physicalDefense col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_physicalDefense)),col,col,col,col,1.0); index++;
			
			if _damageResistances_slash == PlayerStats.damageResistances[damageType.slash] col = c_white;
			else if _damageResistances_slash > PlayerStats.damageResistances[damageType.slash] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_slash)),col,col,col,col,1.0); index++;
			
			if _damageResistances_pierce == PlayerStats.damageResistances[damageType.pierce] col = c_white;
			else if _damageResistances_pierce > PlayerStats.damageResistances[damageType.pierce] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_pierce)),col,col,col,col,1.0); index++;
			
			if _damageResistances_blunt == PlayerStats.damageResistances[damageType.blunt] col = c_white;
			else if _damageResistances_blunt > PlayerStats.damageResistances[damageType.blunt] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_blunt)),col,col,col,col,1.0); index++;
			
			if _damageResistances_fire == PlayerStats.damageResistances[damageType.fire] col = c_white;
			else if _damageResistances_fire > PlayerStats.damageResistances[damageType.fire] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_fire*100-100))+"%",col,col,col,col,1.0); index++;
			
			if _damageResistances_ice == PlayerStats.damageResistances[damageType.ice] col = c_white;
			else if _damageResistances_ice > PlayerStats.damageResistances[damageType.ice] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_ice*100-100))+"%",col,col,col,col,1.0); index++;
			
			if _damageResistances_lightning == PlayerStats.damageResistances[damageType.lightning] col = c_white;
			else if _damageResistances_lightning > PlayerStats.damageResistances[damageType.lightning] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_lightning*100-100))+"%",col,col,col,col,1.0); index++;
			
			if _damageResistances_arcane == PlayerStats.damageResistances[damageType.arcane] col = c_white;
			else if _damageResistances_arcane > PlayerStats.damageResistances[damageType.arcane] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_arcane*100-100))+"%",col,col,col,col,1.0); index++;
			
			if _damageResistances_light == PlayerStats.damageResistances[damageType.light] col = c_white;
			else if _damageResistances_light > PlayerStats.damageResistances[damageType.light] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_light*100-100))+"%",col,col,col,col,1.0); index++;
			
			if _damageResistances_dark == PlayerStats.damageResistances[damageType.dark] col = c_white;
			else if _damageResistances_dark > PlayerStats.damageResistances[damageType.dark] col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_damageResistances_dark*100-100))+"%",col,col,col,col,1.0); index++;
			
			draw_set_halign(fa_left);
			
			break; #endregion
		case 3: #region Page 4: Special Defenses and Misc (Not fully filled yet)
			draw_text(equipmentPlayerStatsTextColumn1X*surfX,equipmentPlayerStatsTextColumn1Y1*surfY+index*textSep,"Bleed Resistance"); index++;
			
			index = 1; //reset
			draw_set_halign(fa_right);
			
			if _specialResistances_bleed == PlayerStats.specialResistances[specialType.bleed] col = c_white;
			else if _specialResistances_bleed > PlayerStats.specialResistances[specialType.bleed]  col = c_green;
			else col = c_red;
			draw_text_color(equipmentPlayerStatsTextColumn2X*surfX,equipmentPlayerStatsTextColumn2Y1*surfY+index*textSep,string(round(_specialResistances_bleed)),col,col,col,col,1.0); index++;
			
			draw_set_halign(fa_left);
			
			break; #endregion
		case 4: #region Page 5: List of all abilities from Items + a view window (not done)
			//names
			
			index = 0; //reset
			draw_set_halign(fa_right);
			//data? prob wont be any, maybe an icon indicating source???
			draw_set_halign(fa_left);
			
			break; #endregion
	}
	#endregion
	#region Info Data: Equipment Stats
	var equipID;
	if slotExpanded equipID = equipmentSlotCache[| sX];
	else
	{
		equipID = ItemCache.equipment[? selection];
		if selection == equipmentSlot.rune equipID = equipID[| sExpY];
		else if selection == equipmentSlot.item equipID = equipID[| sY];
	}
	
	var name = item_get_data(equipmentSelectionItemType,equipID,itemStats.name);
	var desc = item_get_data(equipmentSelectionItemType,equipID,itemStats.description);
	var effectsCache = item_get_data(equipmentSelectionItemType,equipID,itemStats.effectsCache);
	ds_list_clear(equipmentStatsCache);
	if equipID == noone || equipID == undefined
	{
		ds_list_add(equipmentStatsCache,"Empty Slot");
	}
	else
	{
		ds_list_add(equipmentStatsCache,name);
		if desc != undefined ds_list_add(equipmentStatsCache,desc);
		if effectsCache == undefined && selection != equipmentSlot.rune && selection != equipmentSlot.item ds_list_add(equipmentStatsCache,"NO DATA FOR THIS ITEM");
		else if effectsCache != undefined
		{
			var effectID = ds_map_find_first(effectsCache);
			var count = 0;
			while(effectID != undefined)
			{
				var value = effectsCache[? effectID];
				if sign(value) == 1 var s = "+"
				else var s = "-";
				var response = equipment_get_effect_name(effectID);
				if response != undefined response = response+": "+s+string(abs(value));
				ds_list_add(equipmentStatsCache,response);
				effectID = ds_map_find_next(effectsCache,effectID);
			}
		}
	}
	var i = 0; //x,
	var j = 0; //y,
	var index = 0;
	while (i <= equipmentItemStatsTextMaxEntriesHor && index < ds_list_size(equipmentStatsCache))
	{		
		var text = equipmentStatsCache[| index]
		if text != undefined
		{
			draw_text(equipmentItemStatsTextX*surfX+equipmentItemStatsTextHorizontalSeparation*surfX*i,equipmentItemStatsTextY1*surfY+equipmentItemStatsTextVerticalSeparation*surfY*j,text)
			j++;
		}
		index++;
		if j >= equipmentItemStatsTextMaxEntriesVer
		{
			i++;
			j = 1;
		}
	}
	#endregion
surface_reset_target();
#endregion
#region Expanded Slots
surface_set_target(equipmentSurfaceSlot);
	if slotExpanded
	{
	#region Selection Textbox Back
		draw_clear_alpha(c_black,0);
		var col, iconX, iconY;
		switch selection
		{
			case equipmentSlot.head:
				iconX = equipmentHeadX1*surfX;
				iconY = equipmentHeadY1*surfY;
				scr_draw_textbox(equipmentHeadX1*surfX,equipmentHeadY1*surfY,equipmentHeadX2*surfX,equipmentHeadY2*surfY,equipmentHeadType,equipmentHeadScale,equipmentSelectionColour);
				break;
			case equipmentSlot.chest:
				iconX = equipmentChestX1*surfX;
				iconY = equipmentChestY1*surfY;
				scr_draw_textbox(equipmentChestX1*surfX,equipmentChestY1*surfY,equipmentChestX2*surfX,equipmentChestY2*surfY,equipmentChestType,equipmentChestScale,equipmentSelectionColour);
				break;
			case equipmentSlot.hands:
				iconX = equipmentHandsX1*surfX;
				iconY = equipmentHandsY1*surfY;
				scr_draw_textbox(equipmentHandsX1*surfX,equipmentHandsY1*surfY,equipmentHandsX2*surfX,equipmentHandsY2*surfY,equipmentHandsType,equipmentHandsScale,equipmentSelectionColour);
				break;
			case equipmentSlot.legs:
				iconX = equipmentLegsX1*surfX;
				iconY = equipmentLegsY1*surfY;
				scr_draw_textbox(equipmentLegsX1*surfX,equipmentLegsY1*surfY,equipmentLegsX2*surfX,equipmentLegsY2*surfY,equipmentLegsType,equipmentLegsScale,equipmentSelectionColour);
				break;
			case equipmentSlot.main1:
				iconX = equipmentMain1X1*surfX;
				iconY = equipmentMain1Y1*surfY;
				scr_draw_textbox(equipmentMain1X1*surfX,equipmentMain1Y1*surfY,equipmentMain1X2*surfX,equipmentMain1Y2*surfY,equipmentMain1Type,equipmentMain1Scale,equipmentSelectionColour);
				break;
			case equipmentSlot.main2:
				iconX = equipmentMain2X1*surfX;
				iconY = equipmentMain2Y1*surfY;
				scr_draw_textbox(equipmentMain2X1*surfX,equipmentMain2Y1*surfY,equipmentMain2X2*surfX,equipmentMain2Y2*surfY,equipmentMain2Type,equipmentMain2Scale,equipmentSelectionColour);
				break;
			case equipmentSlot.off1:
				iconX = equipmentOff1X1*surfX;
				iconY = equipmentOff1Y1*surfY;
				scr_draw_textbox(equipmentOff1X1*surfX,equipmentOff1Y1*surfY,equipmentOff1X2*surfX,equipmentOff1Y2*surfY,equipmentOff1Type,equipmentOff1Scale,equipmentSelectionColour);
				break;
			case equipmentSlot.off2:
				iconX = equipmentOff2X1*surfX;
				iconY = equipmentOff2Y1*surfY;
				scr_draw_textbox(equipmentOff2X1*surfX,equipmentOff2Y1*surfY,equipmentOff2X2*surfX,equipmentOff2Y2*surfY,equipmentOff2Type,equipmentOff2Scale,equipmentSelectionColour);
				break;
			case equipmentSlot.rune:
				iconX = (equipmentRunesCenterX-equipmentRunesWidth/2)*surfX;
				iconY = equipmentRunesCenterY*surfY-equipmentRunesRadius*surfX-equipmentRunesHeight/2*surfY;
				scr_draw_textbox(iconX,iconY,iconX+equipmentRunesWidth*surfX,iconY+equipmentRunesHeight*surfY,equipmentRunesType,equipmentRunesScale,equipmentSelectionColour);
				break;
			case equipmentSlot.item:
				iconX = (equipmentItemCenterX-equipmentItemWidth/2+(sY-1.5)*equipmentItemHorSep)*surfX;
				iconY = (equipmentItemCenterY-equipmentItemHeight/2)*surfY;
				scr_draw_textbox(iconX,iconY,iconX+equipmentItemWidth*surfX,iconY+equipmentItemHeight*surfY,equipmentItemType,equipmentItemScale,equipmentSelectionColour);
				break;
		}
	#endregion
	#region Other Items
		for(var i = 0; i < ds_list_size(equipmentSlotCache); i++)
		{
			var step = i-sXDisplay;
			if abs(step) <= equipmentSlotNum + 1
			{
				var a = 1-abs(step)/equipmentSlotNum;
				var equipID, xGap, yGap, name;
				var sprite = spr_icon_item_TEMPLATE;
				var equipCache = ItemCache.equipment;
				if selection == equipmentSlot.item
				{
					xGap = (equipmentItemWidth*surfX-equipmentIconScale*sprite_get_width(sprite))/2;
					yGap = (equipmentItemHeight*surfY-equipmentIconScale*sprite_get_height(sprite))/2;
				}
				else
				{
					xGap = ((equipmentHeadX2-equipmentHeadX1)*surfX-equipmentIconScale*sprite_get_width(sprite))/2;
					yGap = ((equipmentHeadY2-equipmentHeadY1)*surfY-equipmentIconScale*sprite_get_height(sprite))/2;
				}
				
				equipID = equipmentSlotCache[| i];
				if equipID == noone sprite = spr_icon_item_TEMPLATE;
				else sprite = item_get_data(equipmentSelectionItemType,equipID,itemStats.icon);
				
				if equipmentSlotTypeIsHor
				{
					var drawX = iconX+xGap+step*equipmentSlotSep*surfX;
					var drawY = iconY+yGap;
				}
				else
				{
					var drawX = iconX+xGap;
					var drawY = iconY+yGap+step*equipmentSlotSep*surfX;
				}
				
				draw_sprite_ext(sprite,0,drawX,drawY,equipmentIconScale,equipmentIconScale,0,c_white,a);
			}
		}
	#endregion
	#region Active Indicator
		if equipmentSlotActiveItem != noone
		{
			var step = equipmentSlotActiveItem-sXDisplay;
			var a = 1-abs(step)/equipmentSlotNum;
			var sprite = spr_icon_select;
			var xGap = ((equipmentHeadX2-equipmentHeadX1)*surfX-equipmentIconScale*sprite_get_width(sprite))/2;
			var yGap = ((equipmentHeadY2-equipmentHeadY1)*surfY-equipmentIconScale*sprite_get_height(sprite))/2;
			if equipmentSlotTypeIsHor
			{
				var drawX = iconX+xGap+step*equipmentSlotSep*surfX;
				var drawY = iconY+yGap;
			}
			else
			{
				var drawX = iconX+xGap;
				var drawY = iconY+yGap+step*equipmentSlotSep*surfX;
			}
				
			draw_sprite_ext(sprite,0,drawX,drawY,equipmentIconScale,equipmentIconScale,0,c_white,a);
		}
	#endregion
	}
surface_reset_target();
#endregion

#region final draw
	var fadeAmount = 1-equipmentSurfaceMinAlpha;
	var fadePerFrame = fadeAmount/(equipmentFadeDuration*room_speed);
	var darkFadePerFrame = 1/(equipmentFadeDuration*room_speed);
	if selection == equipmentSlot.rune
	{
		equipmentRunesDarkGlowAlpha = clamp(equipmentRunesDarkGlowAlpha+darkFadePerFrame,0,1);
		equipmentSurfaceMainAlpha = clamp(equipmentSurfaceMainAlpha-fadePerFrame/2,1-(1-equipmentSurfaceMinAlpha)/2,1);
		if !slotExpanded equipmentSurfaceRunesAlpha = clamp(equipmentSurfaceRunesAlpha+fadePerFrame,1-(1-equipmentSurfaceMinAlpha)/2,1);
		else equipmentSurfaceRunesAlpha = clamp(equipmentSurfaceRunesAlpha-fadePerFrame/2,1-(1-equipmentSurfaceMinAlpha)/2,1);
		draw_surface_ext(equipmentSurfaceMain,0,0,1,1,0,c_white,1);
		draw_surface_ext(equipmentSurfaceRunes,0,0,1,1,0,c_white,1);
	}
	else
	{
		surface_set_target(equipmentSurfaceRunes);
			gpu_set_blendmode(bm_subtract);
				draw_surface(equipmentSurfaceRunesCutout,0,0);
			gpu_set_blendmode(bm_normal);
		surface_reset_target();
		equipmentRunesDarkGlowAlpha = clamp(equipmentRunesDarkGlowAlpha-darkFadePerFrame,0,1);
		equipmentSurfaceRunesAlpha = clamp(equipmentSurfaceRunesAlpha-fadePerFrame/2,1-(1-equipmentSurfaceMinAlpha)/2,1);
		if !slotExpanded equipmentSurfaceMainAlpha = clamp(equipmentSurfaceMainAlpha+fadePerFrame/2,1-(1-equipmentSurfaceMinAlpha)/2,1);
		else equipmentSurfaceMainAlpha = clamp(equipmentSurfaceMainAlpha-fadePerFrame/2,1-(1-equipmentSurfaceMinAlpha)/2,1);
		draw_surface_ext(equipmentSurfaceRunes,0,0,1,1,0,c_white,1);
		draw_surface_ext(equipmentSurfaceMain,0,0,1,1,0,c_white,1);
	}
	
	equipmentSurfaceInfoAlpha = clamp(equipmentSurfaceInfoAlpha+fadePerFrame,equipmentSurfaceMinAlpha,1);
	draw_surface_ext(equipmentSurfaceInfo,0,0,1,1,0,c_white,equipmentSurfaceInfoAlpha);
	
	if slotExpanded
	{
		equipmentSurfaceSlotAlpha = clamp(equipmentSurfaceSlotAlpha+1/(equipmentFadeDuration*room_speed),0,1);
	}
	else
	{
		equipmentSurfaceSlotAlpha = clamp(equipmentSurfaceSlotAlpha-1/(equipmentFadeDuration*room_speed),0,1);
	}
	draw_surface_ext(equipmentSurfaceSlot,0,0,1,1,0,c_white,equipmentSurfaceSlotAlpha);
	#endregion