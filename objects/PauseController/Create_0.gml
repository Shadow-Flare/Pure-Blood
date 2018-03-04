var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

event_inherited();

	//switch enum initializers
enum menuCurrent {main, inventory, weaponry, equipment, abilities, status, map, settings};
enum inventoryTabType {item, weapon, equipment, accessory, key, alchemy};
enum abilityTabType {combat, movement, support};

InputManager.startInput = false;

//shut down all object in room save technicals
instance_deactivate_all(1);
	//Data stores
instance_activate_object(objCacheParent);
	//Controllers
instance_activate_object(GameManager);
instance_activate_object(InputManager);
instance_activate_object(EffectsManager);
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
menu_inventory[3, 0] = inventoryTabType.accessory;
menu_inventory[4, 0] = inventoryTabType.key;
menu_inventory[5, 0] = inventoryTabType.alchemy;
menu_inventory[0, 1] = inventoryTabType.item;
menu_inventory[1, 1] = inventoryTabType.weapon;
menu_inventory[2, 1] = inventoryTabType.equipment;
menu_inventory[3, 1] = inventoryTabType.accessory;
menu_inventory[4, 1] = inventoryTabType.key;
menu_inventory[5, 1] = inventoryTabType.alchemy;

menu_weaponry[0, 0] = "weapon 1";
menu_weaponry[0, 1] = "weapon 2";
menu_weaponry[0, 2] = "offhand 1";
menu_weaponry[0, 3] = "offhand 2";

menu_equipment[0, 0] = "" //fill this horizontally with all owned offhands

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
menu_settings[0, 5] = "Attack Hit Boxes"
menu_settings[0, 6] = "Actor Hit Boxes"

//initialize
menu = menuCurrent.main;
current_menu_options = menu_main;
slot_options = [];
sX = 0;
sY = 0;
sExpY = 0;
sExpX = 0;
moveTimer = 0;
movedH = 0;
slotExpanded = 0;
endingGame = false;
endingPause = false;

	//Pretend data for testing that should be removed
PRETENDDATATRINKETNUM = 10;
PRETENDDATATRINKETANGLEMOD = 0;

#region Inventory Data
	//scroll
inventoryPanelScroll = 0;
inventoryPanelNum = 10;
	//category title
inventoryCategoryTextX = 0.275;
inventoryCategoryTextY = 0.025;
	//tabSprites cache
inventoryTabSprites = ds_list_create();
inventoryTabSprites[| 0] = spr_item_tab_item;
inventoryTabSprites[| 1] = spr_item_tab_weapon;
inventoryTabSprites[| 2] = spr_item_tab_equipment;
inventoryTabSprites[| 3] = spr_item_tab_accessory;
inventoryTabSprites[| 4] = spr_item_tab_key;
inventoryTabSprites[| 5] = spr_item_tab_alchemy;
	//tab data
inventoryTabImageScale = 4;
inventoryTabX = 0.125;
inventoryTabXInc = 0.06;
inventoryTabY = 0.14;
inventoryTabYSelectMod = -0.03;
inventoryTabSelectionSprite = spr_item_tab_selection;
	//textbox data
inventoryTextbox1Type = 0;
inventoryTextbox1Scale = 4;
inventoryTextbox1X1 = 0.1;
inventoryTextbox1Y1 = 0.15;
inventoryTextbox1X2 = 0.45-4/1920;
inventoryTextbox1Y2 = 0.9;
inventoryTextbox1Mod = noone;
inventoryTextbox1Colour = c_blue;
	//scroll bar
inventoryScrollBarX = inventoryTextbox1X1 - 0.04;
inventoryScrollBarY1 = inventoryTextbox1Y1;
inventoryScrollBarY2 = inventoryTextbox1Y2;
inventoryScrollBarType = 0;
inventoryScrollBarScale = 4;
inventoryScrollBarColour = c_blue;
inventoryScrollCursorSprite = spr_scrollcursor_0;
inventoryScrollCursorColour = make_colour_rgb(64,64,255);
	//panel data
inventoryPanelSprite = spr_item_panel;
inventoryPanelBlend = inventoryTextbox1Colour;
inventoryPanelX = inventoryTextbox1X1 + 0.06;
inventoryPanelYBegin = inventoryTextbox1Y1 + 0.03;
inventoryPanelYEnd = inventoryTextbox1Y2 - 0.03;
inventoryPanelScale = 4;
inventoryPanelNumSprite = spr_item_panelNum;
inventoryPanelNumX = inventoryTextbox1X2 - 0.0155 - (sprite_get_width(inventoryPanelNumSprite)*inventoryPanelScale)/surface_get_width(application_surface);
	//list data
inventoryListX = inventoryPanelX - 0.04;
inventoryListY = inventoryPanelYBegin - 0.0075;
inventoryIconScale = 4;
inventoryTextXOffset = 0.05;
inventoryTextYOffset = 0.02;
inventoryNumberXOffset = 0.298;
inventoryNumberYOffset = inventoryTextYOffset;
	//description data
inventoryDescriptionX = 0.6;
inventoryDescriptionY = 0.3;
inventoryDescriptionSep = 0.02;
inventoryDescriptionWidth = 0.3;
#endregion
#region Equipment Data
	//text boxes
var eTBoxDefaultType = 0;
var eTBoxDefaultScale = 4;
var eTBoxDefaultColour = c_blue;
		//main Boxes
var eMainTBoxDefaultW = surfH*0.15;
var eMainTBoxDefaultH = eMainTBoxDefaultW;
			//Head
equipmentHeadX1 = surfW*0.3;
equipmentHeadY1 = surfH*0.2;
equipmentHeadX2 = equipmentHeadX1+eMainTBoxDefaultW;
equipmentHeadY2 = equipmentHeadY1+eMainTBoxDefaultH;
equipmentHeadType = eTBoxDefaultType;
equipmentHeadScale = eTBoxDefaultScale;
equipmentHeadColour = eTBoxDefaultColour;
			//Chest
equipmentChestX1 = surfW*0.3;
equipmentChestY1 = surfH*0.4;
equipmentChestX2 = equipmentChestX1+eMainTBoxDefaultW;
equipmentChestY2 = equipmentChestY1+eMainTBoxDefaultH;
equipmentChestType = eTBoxDefaultType;
equipmentChestScale = eTBoxDefaultScale;
equipmentChestColour = eTBoxDefaultColour;
			//Legs
equipmentLegsX1 = surfW*0.3;
equipmentLegsY1 = surfH*0.6;
equipmentLegsX2 = equipmentLegsX1+eMainTBoxDefaultW;
equipmentLegsY2 = equipmentLegsY1+eMainTBoxDefaultH;
equipmentLegsType = eTBoxDefaultType;
equipmentLegsScale = eTBoxDefaultScale;
equipmentLegsColour = eTBoxDefaultColour;
			//Main 1
equipmentMain1X1 = surfW*0.21;
equipmentMain1Y1 = surfH*0.45;
equipmentMain1X2 = equipmentMain1X1+eMainTBoxDefaultW;
equipmentMain1Y2 = equipmentMain1Y1+eMainTBoxDefaultH;
equipmentMain1Type = eTBoxDefaultType;
equipmentMain1Scale = eTBoxDefaultScale;
equipmentMain1Colour = eTBoxDefaultColour;
			//Main 2
equipmentMain2X1 = surfW*0.12;
equipmentMain2Y1 = surfH*0.45;
equipmentMain2X2 = equipmentMain2X1+eMainTBoxDefaultW;
equipmentMain2Y2 = equipmentMain2Y1+eMainTBoxDefaultH;
equipmentMain2Type = eTBoxDefaultType;
equipmentMain2Scale = eTBoxDefaultScale;
equipmentMain2Colour = eTBoxDefaultColour;
			//Off 1
equipmentOff1X1 = surfW*0.39;
equipmentOff1Y1 = surfH*0.45;
equipmentOff1X2 = equipmentOff1X1+eMainTBoxDefaultW;
equipmentOff1Y2 = equipmentOff1Y1+eMainTBoxDefaultH;
equipmentOff1Type = eTBoxDefaultType;
equipmentOff1Scale = eTBoxDefaultScale;
equipmentOff1Colour = eTBoxDefaultColour;
			//Off 2
equipmentOff2X1 = surfW*0.48;
equipmentOff2Y1 = surfH*0.45;
equipmentOff2X2 = equipmentOff2X1+eMainTBoxDefaultW;
equipmentOff2Y2 = equipmentOff2Y1+eMainTBoxDefaultH;
equipmentOff2Type = eTBoxDefaultType;
equipmentOff2Scale = eTBoxDefaultScale;
equipmentOff2Colour = eTBoxDefaultColour;
			//Trinkets
equipmentTrinketsCenterX = surfW*0.3+surfH*(0.15*0.5);
equipmentTrinketsCenterY = surfH*0.5;
equipmentTrinketsRadius = surfH*0.42;
equipmentTrinketsWidth = eMainTBoxDefaultW;
equipmentTrinketsHeight = eMainTBoxDefaultH;
equipmentTrinketsType = eTBoxDefaultType;
equipmentTrinketsScale = eTBoxDefaultScale;
equipmentTrinketsColour = eTBoxDefaultColour;

#endregion
#region Ability Data
abilityPanelScroll = 0;
abilityPanelNum = 10;
	//category title
abilityCategoryTextX = 0.275;
abilityCategoryTextY = 0.025;
	//tabSprites cache
abilityTabSprites = ds_list_create();
abilityTabSprites[| 0] = spr_ability_tab_combat;
abilityTabSprites[| 1] = spr_ability_tab_movement;
abilityTabSprites[| 2] = spr_ability_tab_support;
	//tab data
abilityTabImageScale = 4;
abilityTabX = 0.1565;
abilityTabXInc = 0.1175;
abilityTabY = 0.14;
abilityTabYSelectMod = -0.03;
abilityTabSelectionSprite = spr_ability_tab_selection;
	//textbox data
abilityTextbox1Type = 0;
abilityTextbox1Scale = 4;
abilityTextbox1X1 = 0.1;
abilityTextbox1Y1 = 0.15;
abilityTextbox1X2 = 0.45-4/1920;
abilityTextbox1Y2 = 0.9;
abilityTextbox1Mod = noone;
abilityTextbox1Colour = c_blue;
	//scroll bar
abilityScrollBarX = abilityTextbox1X1 - 0.04;
abilityScrollBarY1 = abilityTextbox1Y1;
abilityScrollBarY2 = abilityTextbox1Y2;
abilityScrollBarType = 0;
abilityScrollBarScale = 4;
abilityScrollBarColour = c_blue;
abilityScrollCursorSprite = spr_scrollcursor_0;
abilityScrollCursorColour = make_colour_rgb(64,64,255);
	//AP display
abilityApDisplayX = abilityCategoryTextX;
abilityApDisplayY = abilityTextbox1Y2+0.03;
	//panel data
abilityPanelSprite = spr_item_panel;
abilityPanelBlend = abilityTextbox1Colour;
abilityPanelX = abilityTextbox1X1 + 0.06;
abilityPanelYBegin = abilityTextbox1Y1 + 0.03;
abilityPanelYEnd = abilityTextbox1Y2 - 0.03;
abilityPanelScale = 4;
abilityPanelNumSprite = spr_item_panelNum;
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
	//description data
abilityDescriptionX = 0.6;
abilityDescriptionY = 0.3;
abilityDescriptionSep = 0.02;
abilityDescriptionWidth = 0.3;
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