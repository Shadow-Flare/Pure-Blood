var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

event_inherited();

	//switch enum initializers
enum menuCurrent {main, inventory, weaponry, equipment, abilities, status, map, settings};
enum inventoryTabType {item, weapon, equipment, rune, key, alchemy};
enum abilityTabType {combat, movement, support};
enum equipmentSlot {rune,head,chest,legs,hands,main1,main2,off1,off2,item};

InputManager.startInput = false;

//shut down all object in room save technicals
instance_deactivate_all(1);
	//Data stores
instance_activate_object(objCacheParent);
	//Controllers
instance_activate_object(GameManager);
instance_activate_object(InputManager);
instance_activate_object(EffectsManager);
instance_activate_object(AmbienceController);
instance_activate_object(MapManager);

//format menus
menu_main[0, 0] = "Inventory";
menu_main[0, 1] = "Weaponry";
menu_main[0, 2] = "Equipment";
menu_main[0, 3] = "Status";
menu_main[0, 4] = "Abilities";
menu_main[0, 5] = "Map";
menu_main[0, 6] = "Settings";
menu_main[0, 7] = "Return to main menu";

menu_inventory[0, 0] = inventoryTabType.item;
menu_inventory[1, 0] = inventoryTabType.weapon;
menu_inventory[2, 0] = inventoryTabType.equipment;
menu_inventory[3, 0] = inventoryTabType.rune;
menu_inventory[4, 0] = inventoryTabType.key;
menu_inventory[5, 0] = inventoryTabType.alchemy;
menu_inventory[0, 1] = inventoryTabType.item;
menu_inventory[1, 1] = inventoryTabType.weapon;
menu_inventory[2, 1] = inventoryTabType.equipment;
menu_inventory[3, 1] = inventoryTabType.rune;
menu_inventory[4, 1] = inventoryTabType.key;
menu_inventory[5, 1] = inventoryTabType.alchemy;

menu_weaponry[0, 0] = "" //Fill this with all known weapon classes

menu_equipment[0, 0] = "" //formality

menu_abilities[0, 0] = abilityTabType.combat;
menu_abilities[1, 0] = abilityTabType.movement;
menu_abilities[2, 0] = abilityTabType.support;
menu_abilities[0, 1] = abilityTabType.combat;
menu_abilities[1, 1] = abilityTabType.movement;
menu_abilities[2, 1] = abilityTabType.support;

menu_status[0, 0] = "Strength";
menu_status[0, 1] = "Constitution";
menu_status[0, 2] = "Dexterity";
menu_status[0, 3] = "Cunning";
menu_status[0, 4] = "Intelligence";
menu_status[0, 5] = "Willpower";
menu_status[0, 6] = "Accept"

menu_settings[0, 0] = "Lighting"
menu_settings[0, 1] = "Blood"
menu_settings[0, 2] = "Rain"
menu_settings[0, 3] = "Fog"
menu_settings[0, 4] = "V-Sync"
menu_settings[0, 5] = "Music Enabled"
menu_settings[0, 6] = "Attack Hit Boxes"
menu_settings[0, 7] = "Actor Hit Boxes"

//initialize
menu = menuCurrent.main;
current_menu_options = menu_main;
slot_options = [];
slot_grid = ds_grid_create(0,0);
sX = 0;
sY = 0;
sExpY = 0;
sExpX = 0;
moveTimer = 0;
targetTimer = 0;
movedH = 0;
slotExpanded = 0;
endingGame = false;
endingPause = false;

//background textbox
backTextboxType = 3;
backTextboxScale = 4;
var backTextboxScaleBorderGap = 0;		//measured in surfW
backTextboxX1 = 0+backTextboxScaleBorderGap;
backTextboxY1 = 0+backTextboxScaleBorderGap*surfW/surfH;
backTextboxX2 = 1-backTextboxScaleBorderGap;
backTextboxY2 = 1-backTextboxScaleBorderGap*surfW/surfH;
backTextboxMod = c_white;
var backTextboxHorSpace = (surfW-sprite_get_width(spr_textbox_3)*backTextboxScale*2)/surfW;
var backTextboxVertSpace = (surfH-sprite_get_height(spr_textbox_3)*backTextboxScale*2)/surfH;

#region Main Data
	//boundaries
mainBoundaryScale = 4;
		//1 is vert
mainBoundary1X = backTextboxX1+(290*4)/surfW;
mainBoundary1Y1 = backTextboxY1+(32*4)/surfH;
mainBoundary1Y2 = backTextboxY1+(172*4)/surfH;
		//2 is vert
mainBoundary2X = mainBoundary1X+(40*4)/surfW;
mainBoundary2Y1 = mainBoundary1Y2;
mainBoundary2Y2 = backTextboxY2-(32*4)/surfH;
		//3 is hor
mainBoundary3X1 = (137*4)/surfW;
mainBoundary3X2 = backTextboxX2-(32*4)/surfW;
mainBoundary3Y = mainBoundary1Y2;
		//4 is vert
mainBoundary4X = mainBoundary3X1;
mainBoundary4Y1 = backTextboxY1+(32*4)/surfH;
mainBoundary4Y2 = backTextboxY2-(32*4)/surfH;
	//panels
mainPanelsSprite = spr_menu_panel;
mainPanelsScale = 4;
mainPanelsFont = fnt_alagard;
var sprH = sprite_get_height(mainPanelsSprite);
mainPanelsX = (36*4)/surfW;
mainPanelsY =  (36*4)/surfH;
mainPanelsYSep = ((sprH+4)*4)/surfH
mainPanelsTextX = (5*4)/surfW;
mainPanelsTextY = (4*4)/surfH;
	//Map
	
	//Details
	
	//Player Stats
var playerStatsX1 = mainBoundary4X+(8*4)/surfW;
var playerStatsX2 = mainBoundary2X-(7*4)/surfW;
var playerStatsY1 = mainBoundary3Y+(8*4)/surfH;
var playerStatsY2 = backTextboxY2-(32*4)/surfH;
		//Hp
mainPlayerStatsTextSep = (8*4)/surfW;
mainPlayerStatsNumSep = (16*4)/surfW;
mainPlayerHpX1 = playerStatsX1+(16*4)/surfW;
mainPlayerHpX2 = playerStatsX2-(32*4)/surfW;
mainPlayerHpY = playerStatsY1+(4*4)/surfH;
mainPlayerHpThickness = (7*4)/surfH;
mainPlayerHpScale = 4;
mainPlayerHpColour = c_green;
mainPlayerHpTextColour = merge_colour(c_black,c_green,0.75);
		//Mp
mainPlayerMpX1 = playerStatsX1+(16*4)/surfW;
mainPlayerMpX2 = playerStatsX2-(32*4)/surfW;
mainPlayerMpY = mainPlayerHpY+mainPlayerHpThickness+(4*4)/surfH;
mainPlayerMpThickness = (7*4)/surfH;
mainPlayerMpScale = 4;
mainPlayerMpColour = c_blue;
mainPlayerMpTextColour = merge_colour(c_black,c_blue,0.75);
		//Ap
mainPlayerApX1 = playerStatsX1+(16*4)/surfW;
mainPlayerApX2 = playerStatsX2-(32*4)/surfW;
mainPlayerApY = mainPlayerMpY+mainPlayerMpThickness+(4*4)/surfH;
mainPlayerApThickness = (7*4)/surfH;
mainPlayerApScale = 4;
mainPlayerApColour = c_yellow;
mainPlayerApTextColour = merge_colour(c_black,c_yellow,0.75);
		//EXP to next
mainPlayerExpX = mainPlayerHpX1-mainPlayerStatsTextSep;
mainPlayerExpY = playerStatsY2-(8*4)/surfW;
mainPlayerExpValueSep = (12*4)/surfW;
mainPlayerExpColour = c_yellow
		//gold
mainPlayerGoldX = (playerStatsX1+playerStatsX1*2)/3;
mainPlayerGoldY = playerStatsY2-(8*4)/surfW;
mainPlayerGoldValueSep = (12*4)/surfW;
mainPlayerGoldColour = c_yellow;
	//Weaponry
	
#endregion
#region Inventory Data
	//scroll
inventoryPanelScroll = 0;
	//category title
inventoryCategoryTextX = (36*4)/surfW;
inventoryCategoryTextY = (2*4)/surfW;
	//tabSprites cache
inventoryTabSprites = ds_list_create();
inventoryTabSprites[| 0] = spr_item_tab_item;
inventoryTabSprites[| 1] = spr_item_tab_weapon;
inventoryTabSprites[| 2] = spr_item_tab_equipment;
inventoryTabSprites[| 3] = spr_item_tab_rune;
inventoryTabSprites[| 4] = spr_item_tab_key;
inventoryTabSprites[| 5] = spr_item_tab_alchemy;
	//tab Colours
var inventoryTabColoursBase = c_white;
inventoryTabColours = ds_list_create();
inventoryTabColours[| 0] = merge_color(c_green,inventoryTabColoursBase,0.5);
inventoryTabColours[| 1] = merge_color(c_red,inventoryTabColoursBase,0.5);
inventoryTabColours[| 2] = merge_color(c_orange,inventoryTabColoursBase,0.5);
inventoryTabColours[| 3] = merge_color(c_blue,inventoryTabColoursBase,0.5);
inventoryTabColours[| 4] = merge_color(c_yellow,inventoryTabColoursBase,0.5);
inventoryTabColours[| 5] = merge_color(c_purple,inventoryTabColoursBase,0.5);
inventoryColourScheme = inventoryTabColours[| 0];
	//main items texbox
inventoryTextbox1Type = 2;
inventoryTextbox1Scale = 4;
inventoryTextbox1X1 = (36*4)/surfW;
inventoryTextbox1Y1 = (54*4)/surfH;
inventoryTextbox1X2 = (278*4)/surfW;
inventoryTextbox1Y2 = 1-(37*4)/surfH;
inventoryTextbox1Mod = noone;
	//tab data
var inventoryTabBorderWidth = (12*4)/surfW;
var spriteBase = spr_item_tab_item;
inventoryTabSelectionSprite = spr_item_tab_selection;
inventoryTabAmount = 6;
inventoryTabImageScale = 4;
inventoryTabX = inventoryTextbox1X1+inventoryTabBorderWidth;
inventoryTabXInc = (inventoryTextbox1X2-inventoryTextbox1X1-inventoryTabBorderWidth*2-(sprite_get_width(spriteBase)*inventoryTabImageScale)/surfW)/(inventoryTabAmount-1);
inventoryTabY = inventoryTextbox1Y1-(8*4)/surfH;
inventoryTabYSelectMod = (-11*4)/surfH;
	//scroll bar
inventoryScrollBarX = inventoryTextbox1X1+(8*4)/surfW;
inventoryScrollBarY1 = inventoryTextbox1Y1+(17*4)/surfH;
inventoryScrollBarY2 = inventoryTextbox1Y2-(16*4)/surfH;
inventoryScrollBarType = 1;
inventoryScrollBarScale = 4;
inventoryScrollBarColour = c_white;
	//panel data
inventoryGridWidth = 6;
inventoryGridHeight = 4;
inventoryPanelSprite = spr_item_panel;
inventoryPanelXBegin = inventoryTextbox1X1 + (21*4)/surfW;
inventoryPanelXEnd = inventoryTextbox1X2 - (9*4)/surfW;
inventoryPanelYBegin = inventoryTextbox1Y1 + (17*4)/surfH;
inventoryPanelYEnd = inventoryTextbox1Y2 - (16*4)/surfH;
inventoryPanelScale = 4;
inventoryPanelNumSprite = spr_item_num_glow;
inventoryPanelNumScale = (126*4)/sprite_get_width(spr_select);
inventoryPanelNumXOffset = (sprite_get_width(inventoryPanelSprite)*inventoryPanelScale-8)/surfW;
inventoryPanelNumYOffset = (sprite_get_height(inventoryPanelSprite)*inventoryPanelScale-8)/surfH;
inventoryPanelIconScale = 4;
	//details texbox
inventoryTextbox2Type = 5;
inventoryTextbox2Scale = 4;
inventoryTextbox2X1 = inventoryTextbox1X2+(8*4)/surfW;
inventoryTextbox2Y1 = (36*4)/surfH;
inventoryTextbox2X2 = 1-(36*4)/surfW;
inventoryTextbox2Y2 = 1-(36*4)/surfH;
inventoryTextbox2Mod = noone;
	//description data
var maxDescLines = 16;
inventoryItemNameFont = fnt_alagard;
inventoryItemNameX = (inventoryTextbox2X2+inventoryTextbox1X2)/2;
inventoryItemNameY = inventoryTextbox2Y1 + (20*4)/surfH;
inventoryItemDescriptionFont = fnt_small_pixel;
draw_set_font(inventoryItemNameFont);
var descLineHeight = string_height(" ")
inventoryItemDescriptionX = inventoryTextbox2X1+(20*4)/surfW;
inventoryItemDescriptionY = inventoryTextbox2Y1+(60*4)/surfH;
inventoryItemDescriptionSep = ((inventoryTextbox2Y2-inventoryTextbox2Y1)-((80*4)-descLineHeight)/surfW)/maxDescLines;
inventoryItemDescriptionWidth = (inventoryTextbox2X2-inventoryTextbox2X1)-(40*4)/surfW;
#endregion
#region Weaponry Data
weaponryGroundComboSelected = true;
weaponryComboList = ds_list_create();
weaponryExpandValue = 0;
weaponryExpandDuration = 0.25;	//seconds
weaponryClassDisplaySy = 0;

	//class textbox Text data
weaponryMaxSY = 0;
weaponryClassDetailSurfBorderWidth = (4+sprite_get_height(spr_textbox_1))*4;
weaponryClassNameFont = fnt_menu;
draw_set_font(fnt_menu);
weaponryClassNameHeight = string_height(" ");
weaponryComboNameFont = fnt_dialog;
draw_set_font(fnt_menu);
weaponryComboNameHeight = string_height(" ");
	//class Text boxes
weaponryClassTextboxSelectionColour = c_red;
weaponryClassTextboxMainColour = c_blue;
weaponryClassTextboxOffColour = c_yellow;
weaponryClassTextboxHeight = (weaponryClassNameHeight+weaponryClassDetailSurfBorderWidth*2)/surfH;
weaponryClassTextboxExpandedHeight = backTextboxVertSpace-(4*4*2)/surfH-weaponryClassTextboxHeight;
weaponryClassTextboxYSep = weaponryClassTextboxHeight+(4*4)/surfH;
weaponryClassTextboxX = ((40+sprite_get_width(spr_scrollbar_1_v))*4)/surfW;
weaponryClassTextboxY = 0.5-weaponryClassTextboxHeight/2;
weaponryClassTextboxYExpandedShift = (36*4)/surfH-weaponryClassTextboxY;
weaponryClassTextboxWidth = (232*4)/surfW;
weaponryClassTextboxScale = 4;
weaponryClassTextboxType = 1;		//metal chains
	//surfaces
weaponryMainSurf = surface_create(surfW-sprite_get_width(spr_textbox_3)*4*2,surfH-sprite_get_height(spr_textbox_3)*4*2);
weaponryClassDetailSurf = surface_create(weaponryClassTextboxWidth*surfW,(weaponryClassTextboxHeight+weaponryClassTextboxExpandedHeight)*surfH);
weaponryClassDetailSurfStencil = surface_create(weaponryClassTextboxWidth*surfW,(weaponryClassTextboxHeight+weaponryClassTextboxExpandedHeight)*surfH);
weaponryMainSurfXOffset = (sprite_get_width(spr_textbox_3)*4)/surfW;
weaponryMainSurfYOffset = (sprite_get_height(spr_textbox_3)*4)/surfH;
	//scroll bar
weaponryScrollBarX = (36*4)/surfW;
weaponryScrollBarY1 = (36*4)/surfH;
weaponryScrollBarY2 = 1-(36*4)/surfH;
weaponryScrollBarType = 1;
weaponryScrollBarScale = 4;
weaponryScrollBarColour = c_white;
weaponryScrollCursorColour = make_colour_rgb(64,64,255);
	//class textbox data 2
weaponrySExpYDisplayDifference = 0;
weaponrySExpYDisplayShiftDuration = 0.1;
weaponryComboX = (12*4)/surfW;
weaponryComboY = (weaponryClassTextboxHeight+weaponryClassTextboxExpandedHeight)/3;
weaponryComboXSep = weaponryClassTextboxWidth/7;
weaponryComboYSep = (weaponryClassTextboxHeight+weaponryClassTextboxExpandedHeight-weaponryClassDetailSurfBorderWidth/surfH-weaponryComboNameHeight/surfH)/3;		//switch class name height for some combo name height if using different fonts
weaponryComboYExpSep = weaponryComboNameHeight/surfH*1.2;
	//details texbox
weaponryDetailsType = 5;
weaponryDetailsScale = 4;
weaponryDetailsColour = c_white;
weaponryDetailsX1 = inventoryTextbox1X2+(8*4)/surfW;
weaponryDetailsY1 = (36*4)/surfH;
weaponryDetailsX2 = 1-(36*4)/surfW;
weaponryDetailsY2 = 1-(36*4)/surfH;
	//details data
		//name
var maxDescLines = 16;
weaponryDetailsNameFont = fnt_alagard;
weaponryDetailsNameX = (weaponryDetailsX1+weaponryDetailsX2)/2;
weaponryDetailsNameY = weaponryDetailsY1 + (20*4)/surfH;
		//Animation
weaponryDetailsAnimationX = (weaponryDetailsX1+weaponryDetailsX2)/2;
weaponryDetailsAnimationY = weaponryDetailsY1 + (58*4)/surfH;
weaponryDetailsAnimationScale = 4;
weaponryDetailsAnimationTimer = 0;
		//description
weaponryDetailsDescriptionFont = fnt_small_pixel;
draw_set_font(weaponryDetailsDescriptionFont);
var descLineHeight = string_height(" ")
weaponryDetailsDescriptionX = weaponryDetailsX1+(20*4)/surfW;
weaponryDetailsDescriptionY = weaponryDetailsY1+(78*4)/surfH;
weaponryDetailsDescriptionSep = ((weaponryDetailsY2-weaponryDetailsY1)-((80*4)-descLineHeight)/surfW)/maxDescLines;
weaponryDetailsDescriptionWidth = (weaponryDetailsX2-weaponryDetailsX1)-(40*4)/surfW;
		//data
weaponryDetailsDataList = ds_list_create();
weaponryDetailsDataValuesList = ds_list_create();
weaponryDetailsDataFont = fnt_small_pixel;
draw_set_font(weaponryDetailsDataFont);
var descLineHeight = string_height(" ")
weaponryDetailsDataX = weaponryDetailsX1+(20*4)/surfW;
weaponryDetailsDataValuesX = weaponryDetailsX2-(20*4)/surfW;
weaponryDetailsDataY = weaponryDetailsY2-(20*4)/surfH;
weaponryDetailsDataSep = -((weaponryDetailsY2-weaponryDetailsY1)-((80*4)-descLineHeight)/surfW)/maxDescLines;
weaponryDetailsSelectedHitFont = fnt_small_pixel;
weaponryDetailsSelectedHit = 0;
weaponryDetailsSelectedHitDisplay = 0;
weaponryDetailsSelectedHitDisplayX = (weaponryDetailsX2+weaponryDetailsX1)/2;
weaponryDetailsSelectedHitDisplayY = weaponryDetailsY2-(80*4)/surfH;
weaponryDetailsSelectedHitDisplayXSep = (12*4)/surfW;
weaponryDetailsSelectedHitDescriptorX = weaponryDetailsX1+(24*4)/surfW;
#endregion
#region Equipment Data
	//temps
equipmentMainRegionX1 = (32*4)/surfW;
equipmentMainRegionX2 = (278*4)/surfW;
equipmentMainRegionY1 = (32*4)/surfH;
equipmentMainRegionY2 = 1-(32*4)/surfH;
	//surfaces
sXDisplay = 0;
equipmentSurfaceMinAlpha = 0.3;
equipmentFadeDuration = 0.4;		//seconds
equipmentSelectionItemType = itemType.equipment;

equipmentSurfaceMain = noone;
equipmentSurfaceMainAlpha = 0;
equipmentSurfaceRunes = noone;
equipmentSurfaceRunesAlpha = 0;
equipmentSurfaceRunesCutout = noone;
equipmentSurfaceInfo = noone;
equipmentSurfaceInfoAlpha = 0;
equipmentSurfaceSlot = noone;
equipmentSurfaceSlotAlpha = 0;
	//general
equipCanMove = true;
equipmentSlotCache = ds_list_create();
equipmentStatsCache = ds_list_create();
equipmentPlayerEquipAlt = ds_map_create();
equipmentPlayerEquipAltStats = ds_map_create();
equipmentPlayerEquipAlt[? equipmentSlot.rune] = ds_list_create();
	//text boxes
var eTBoxDefaultType = 4;
var eTBoxDefaultScale = 4;
var eTBoxDefaultColour = c_blue;
		//player stats Boxes
equipmentPlayerStatsX1 = equipmentMainRegionX2;
equipmentPlayerStatsY1 = equipmentMainRegionY1+(4*4)/surfH;
equipmentPlayerStatsX2 = backTextboxX2-(36*4)/surfW;
equipmentPlayerStatsY2 = equipmentMainRegionY2-(64*4)/surfH;
equipmentPlayerStatsType = 5;
equipmentPlayerStatsScale = eTBoxDefaultScale;
equipmentPlayerStatsColour = make_colour_rgb(50,18,122);
equipmentPlayerStatsPage = 0;
equipmentPlayerStatsPageMax = 5;

equipmentPlayerStatsTextColumn1X = equipmentPlayerStatsX1+(12*4)/surfW;
equipmentPlayerStatsTextColumn1Y1 = equipmentPlayerStatsY1+(14*4)/surfH;
equipmentPlayerStatsTextColumn1Y2 = equipmentPlayerStatsY2-(11*4)/surfH;
equipmentPlayerStatsTextColumn2X = equipmentPlayerStatsX2-(12*4)/surfW;
equipmentPlayerStatsTextColumn2Y1 = equipmentPlayerStatsTextColumn1Y1;
equipmentPlayerStatsTextColumn2Y2 = equipmentPlayerStatsTextColumn1Y2;
equipmentPlayerStatsTextEntries = 11;
		//equipmentStats Boxes
equipmentItemStatsX1 = equipmentPlayerStatsX1;
equipmentItemStatsY1 = equipmentPlayerStatsY2-(2*4)/surfH;
equipmentItemStatsX2 = equipmentPlayerStatsX2;
equipmentItemStatsY2 = equipmentMainRegionY2-(4*4)/surfH;
equipmentItemStatsType = 5;
equipmentItemStatsScale = eTBoxDefaultScale;
equipmentItemStatsColour = make_colour_rgb(50,18,122);

equipmentItemStatsTextX = equipmentItemStatsX1+(12*4)/surfW;
equipmentItemStatsTextY1 = equipmentItemStatsY1+(14*4)/surfH;
equipmentItemStatsTextY2 = equipmentItemStatsY2-(14*4)/surfH;

equipmentItemStatsTextFont = fnt_menu;
equipmentItemStatsTextMaxEntriesHor = 2;
equipmentItemStatsTextMaxEntriesVer = 5+1;		//#+1, where # is the amount of possible datas vertically.
draw_set_font(equipmentItemStatsTextFont);
var strHeight = string_height("");
equipmentItemStatsTextHorizontalSeparation = (equipmentItemStatsX2-equipmentItemStatsX1)/equipmentItemStatsTextMaxEntriesHor;
equipmentItemStatsTextVerticalSeparation = (equipmentItemStatsTextY2-equipmentItemStatsTextY1-strHeight)/(equipmentItemStatsTextMaxEntriesVer-1);
		//main Boxes
var eMainTBoxDefaultW = (14*3*4)/surfW;
var eMainTBoxDefaultH = (14*3*4)/surfH;
equipmentSelectionColour = c_red;
runeAngleMod = 0;
equipmentIconScale = 6;
			//Head
equipmentHeadX1 = (equipmentMainRegionX1+equipmentMainRegionX2)/2-eMainTBoxDefaultW/2;
equipmentHeadY1 = equipmentMainRegionY1+(24*4)/surfH;
equipmentHeadX2 = equipmentHeadX1+eMainTBoxDefaultW;
equipmentHeadY2 = equipmentHeadY1+eMainTBoxDefaultH;
equipmentHeadType = eTBoxDefaultType;
equipmentHeadScale = eTBoxDefaultScale;
equipmentHeadColour = eTBoxDefaultColour;
			//Chest
equipmentChestX1 = (equipmentMainRegionX1+equipmentMainRegionX2)/2-eMainTBoxDefaultW/2;
equipmentChestY1 = equipmentHeadY2+(12*4)/surfH;
equipmentChestX2 = equipmentChestX1+eMainTBoxDefaultW;
equipmentChestY2 = equipmentChestY1+eMainTBoxDefaultH;
equipmentChestType = eTBoxDefaultType;
equipmentChestScale = eTBoxDefaultScale;
equipmentChestColour = eTBoxDefaultColour;
			//Hands
equipmentHandsX1 = (equipmentMainRegionX1+equipmentMainRegionX2)/2-(52*4)/surfW-eMainTBoxDefaultW/2;
equipmentHandsY1 = equipmentChestY2-(24*4)/surfH;
equipmentHandsX2 = equipmentHandsX1+eMainTBoxDefaultW;
equipmentHandsY2 = equipmentHandsY1+eMainTBoxDefaultH;
equipmentHandsType = eTBoxDefaultType;
equipmentHandsScale = eTBoxDefaultScale;
equipmentHandsColour = eTBoxDefaultColour;
			//Legs
equipmentLegsX1 = (equipmentMainRegionX1+equipmentMainRegionX2)/2+(52*4)/surfW-eMainTBoxDefaultW/2;
equipmentLegsY1 = equipmentChestY2-(24*4)/surfH;
equipmentLegsX2 = equipmentLegsX1+eMainTBoxDefaultW;
equipmentLegsY2 = equipmentLegsY1+eMainTBoxDefaultH;
equipmentLegsType = eTBoxDefaultType;
equipmentLegsScale = eTBoxDefaultScale;
equipmentLegsColour = eTBoxDefaultColour;
			//Main 1
equipmentMain1X1 = (equipmentMainRegionX1+equipmentMainRegionX2)/2-(52*4)/surfW-eMainTBoxDefaultW/2;
equipmentMain1Y1 = equipmentHeadY1+(16*4)/surfH;
equipmentMain1X2 = equipmentMain1X1+eMainTBoxDefaultW;
equipmentMain1Y2 = equipmentMain1Y1+eMainTBoxDefaultH;
equipmentMain1Type = eTBoxDefaultType;
equipmentMain1Scale = eTBoxDefaultScale;
equipmentMain1Colour = eTBoxDefaultColour;
			//Main 2
equipmentMain2X1 = equipmentMain1X1-(0*4)/surfW-eMainTBoxDefaultW;
equipmentMain2Y1 = equipmentMain1Y1
equipmentMain2X2 = equipmentMain2X1+eMainTBoxDefaultW;
equipmentMain2Y2 = equipmentMain2Y1+eMainTBoxDefaultH;
equipmentMain2Type = eTBoxDefaultType;
equipmentMain2Scale = eTBoxDefaultScale;
equipmentMain2Colour = eTBoxDefaultColour;
			//Off 1
equipmentOff1X1 = (equipmentMainRegionX1+equipmentMainRegionX2)/2+(52*4)/surfW-eMainTBoxDefaultW/2;
equipmentOff1Y1 = equipmentMain1Y1
equipmentOff1X2 = equipmentOff1X1+eMainTBoxDefaultW;
equipmentOff1Y2 = equipmentOff1Y1+eMainTBoxDefaultH;
equipmentOff1Type = eTBoxDefaultType;
equipmentOff1Scale = eTBoxDefaultScale;
equipmentOff1Colour = eTBoxDefaultColour;
			//Off 2
equipmentOff2X1 = equipmentOff1X2+(0*4)/surfW;
equipmentOff2Y1 = equipmentMain1Y1
equipmentOff2X2 = equipmentOff2X1+eMainTBoxDefaultW;
equipmentOff2Y2 = equipmentOff2Y1+eMainTBoxDefaultH;
equipmentOff2Type = eTBoxDefaultType;
equipmentOff2Scale = eTBoxDefaultScale;
equipmentOff2Colour = eTBoxDefaultColour;
			//Runes
equipmentRunesCenterX = (equipmentMainRegionX1+equipmentMainRegionX2)/2;
equipmentRunesCenterY = 0.5;
equipmentRunesRadius = (94*4)/surfW;
equipmentRunesWidth = eMainTBoxDefaultW;
equipmentRunesHeight = eMainTBoxDefaultH;
equipmentRunesType = 5;
equipmentRunesScale = eTBoxDefaultScale;
equipmentRunesColour = eTBoxDefaultColour;
equipmentRunesDarkGlowAlpha = 0;
equipmentRunesDarkGlowSprite = spr_misc_glow_large;
equipmentRunesDarkGlowScale = (1/sprite_get_width(equipmentRunesDarkGlowSprite))*(equipmentRunesRadius*surfW*2*1.8);
//equipmentRunesDarkGlowRadius = equipmentRunesRadius*1.2;
			//Items
equipmentItemWidth = eMainTBoxDefaultW;
equipmentItemHeight = eMainTBoxDefaultH+(0*4)/surfH;
equipmentItemCenterX = equipmentRunesCenterX;
equipmentItemCenterY = equipmentMainRegionY2-equipmentItemHeight/2-(4*4)/surfH;
equipmentItemHorSep = eMainTBoxDefaultW+(4*4)/surfW;
equipmentItemType = 0;
equipmentItemScale = eTBoxDefaultScale;
equipmentItemColour = eTBoxDefaultColour;

	//Expanded slot Text box
equipmentSlotTypeIsHor = true;
equipmentSlotSep = (32*4)/surfW;
equipmentSlotNum = 4;			// either side, total visible = this*2+1, alpha = zero at this+1 distance.
equipmentSlotExpandedNew = false;
equipmentSlotActiveItem = noone;
#endregion
#region Ability Data
abilityPanelScroll = 0;
abilityPanelNum = 8;
	//category title
abilityCategoryTextX = 0.275;
abilityCategoryTextY = 0.025;
	//tabSprites cache
abilityTabSprites = ds_list_create();
abilityTabSprites[| 0] = spr_ability_tab_combat;
abilityTabSprites[| 1] = spr_ability_tab_movement;
abilityTabSprites[| 2] = spr_ability_tab_support;
	//textbox data
abilityTextbox1Type = 0;
abilityTextbox1Scale = 4;
abilityTextbox1X1 = (50*4)/surfW;
abilityTextbox1Y1 = (54*4)/surfH;
abilityTextbox1X2 = (278*4)/surfW;
abilityTextbox1Y2 = 1-(36*4)/surfH;
abilityTextbox1Mod = noone;
abilityTextbox1Colour = c_blue;
	//tab data
var abilityTabBorderWidth = (12*4)/surfW;
var spriteBase = spr_ability_tab_combat;
abilityTabSelectionSprite = spr_ability_tab_selection;
abilityTabAmount = 3;
abilityTabImageScale = 4;
abilityTabX = abilityTextbox1X1+abilityTabBorderWidth;
abilityTabXInc = (abilityTextbox1X2-abilityTextbox1X1-abilityTabBorderWidth*2-(sprite_get_width(spriteBase)*abilityTabImageScale)/surfW)/(abilityTabAmount-1);
abilityTabY = abilityTextbox1Y1-(8*4)/surfH;
abilityTabYSelectMod = (-11*4)/surfH;
	//scroll bar
abilityScrollBarX = (36*4)/surfW;
abilityScrollBarY1 = (36*4)/surfH;
abilityScrollBarY2 = 1-(36*4)/surfH;
abilityScrollBarType = 1;
abilityScrollBarScale = 4;
abilityScrollBarColour = c_white;
	//panel data
abilityPanelSprite = spr_menu_panel;
abilityPanelBlend = abilityTextbox1Colour;
abilityPanelX = abilityTextbox1X1 + 0.06;
abilityPanelYBegin = abilityTextbox1Y1 + 0.03;
abilityPanelYEnd = abilityTextbox1Y2 - 0.03;
abilityPanelScale = 4;
abilityPanelNumSprite = spr_select;
abilityPanelNumX = abilityTextbox1X2 - 0.0155 - (sprite_get_width(abilityPanelNumSprite)*abilityPanelScale)/surface_get_width(application_surface);
	//list data
abilityIconActivated = spr_icon_ability_activated;
abilityIconDeactivated = spr_icon_ability_deactivated;
abilityListX = abilityPanelX - 0.04;
abilityListY = abilityPanelYBegin - 0.0075;
abilityIconScale = 4;
abilityTextXOffset = 0.05;
abilityTextYOffset = 0.02;
abilityNumberXOffset = 0.298;
abilityNumberYOffset = abilityTextYOffset;
	//details texbox
abilityTextbox2Type = 5;
abilityTextbox2Scale = 4;
abilityTextbox2X1 = abilityTextbox1X2+(4*4)/surfW;
abilityTextbox2Y1 = (36*4)/surfH;
abilityTextbox2X2 = 1-(36*4)/surfW;
abilityTextbox2Y2 = 1-(70*4)/surfH;
abilityTextbox2Mod = noone;
abilityTextbox2Colour = c_white;
	//description data
var maxDescLines = 16;
abilityDescriptionFont = fnt_small_pixel;
draw_set_font(abilityDescriptionFont);
var descLineHeight = string_height(" ");
abilityDescriptionX = abilityTextbox2X1+(16*4)/surfW;
abilityDescriptionY = abilityTextbox2Y1+(16*4)/surfH;
abilityDescriptionSep = ((abilityTextbox2Y2-abilityTextbox2Y1)-((80*4)-descLineHeight)/surfH)/maxDescLines;
abilityDescriptionWidth = (abilityTextbox2X2-abilityTextbox2X1)-(32*4)/surfW;
	//AP Stats textbox
abilityTextbox3Type = 5;
abilityTextbox3Scale = 4;
abilityTextbox3X1 = abilityTextbox2X1;
abilityTextbox3Y1 = abilityTextbox2Y2-(2*4)/surfH;
abilityTextbox3X2 = abilityTextbox2X2;
abilityTextbox3Y2 = 1-(36*4)/surfH;
abilityTextbox3Mod = noone;
abilityTextbox3Colour = c_white;
	//AP Stats
		//Bar (not implemented)
		
		// text
abilityApDisplayX = abilityTextbox3X2-(12*4)/surfW;
abilityApDisplayY = (abilityTextbox3Y1+abilityTextbox3Y2)/2;
#endregion
#region Map Data
mapCursorX = 0;
mapCursorY = 0;
mapCursorXDisplay = mapCursorX;
mapCursorYDisplay = mapCursorY;
mapZoomLevel = 1;
mapZoomLevelDisplay = mapZoomLevel;
mapPixelScale = 4;

mapViewSurface = noone;
mapViewBase = noone;
mapViewDetails = noone;

mapHudViewportX1 = 0.1;
mapHudViewportY1 = 0.1*surfW/surfH;
mapHudViewportX2 = 1-0.1;
mapHudViewportY2 = 1-0.1*surfW/surfH;
mapHudViewportBorderWidth = 4;
mapHudViewportBorderColour = c_orange;
mapHudViewportBaseTransparency = 0.6;
mapHudViewportBaseColour = c_black;
#endregion