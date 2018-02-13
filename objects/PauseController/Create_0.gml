event_inherited();

	//switch enum initializers
enum menuCurrent {main, inventory, weaponry, equipment, abilities, status, settings};
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

//format menus
menu_main[0, 0] = "Inventory";
menu_main[0, 1] = "Weaponry";
menu_main[0, 2] = "Equipment";
menu_main[0, 3] = "Status";
menu_main[0, 4] = "Abilities";
menu_main[0, 5] = "Settings";
menu_main[0, 6] = "Return to main menu";

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

menu_weaponry[0, 0] = "weapon 1"
menu_weaponry[0, 1] = "weapon 2"
menu_weaponry[0, 2] = "equipment"

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
inventoryTextbox1 = noone;
inventoryTextbox1Type = 0;
inventoryTextbox1Scale = 4;
inventoryTextbox1X1 = 0.1;
inventoryTextbox1Y1 = 0.15;
inventoryTextbox1X2 = 0.45-4/1920;
inventoryTextbox1Y2 = 0.9;
inventoryTextbox1Mod = noone;
inventoryTextbox1Colour = [0,0,1];
	//scroll bar
inventoryScrollBarX = inventoryTextbox1X1 - 0.04;
inventoryScrollBarY1 = inventoryTextbox1Y1;
inventoryScrollBarY2 = inventoryTextbox1Y2;
inventoryScrollBarType = 0;
inventoryScrollBarScale = 4;
inventoryScrollBarColour = make_colour_rgb(0,0,255);
inventoryScrollCursorSprite = spr_scrollcursor_0;
inventoryScrollCursorColour = make_colour_rgb(64,64,255);
	//panel data
inventoryPanelSprite = spr_item_panel;
inventoryPanelBlend = make_color_rgb(inventoryTextbox1Colour[0]*255,inventoryTextbox1Colour[1]*255,inventoryTextbox1Colour[2]*255);
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
#region ability Data
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
abilityTextbox1 = noone;
abilityTextbox1Type = 0;
abilityTextbox1Scale = 4;
abilityTextbox1X1 = 0.1;
abilityTextbox1Y1 = 0.15;
abilityTextbox1X2 = 0.45-4/1920;
abilityTextbox1Y2 = 0.9;
abilityTextbox1Mod = noone;
abilityTextbox1Colour = [0,0,1];
	//scroll bar
abilityScrollBarX = abilityTextbox1X1 - 0.04;
abilityScrollBarY1 = abilityTextbox1Y1;
abilityScrollBarY2 = abilityTextbox1Y2;
abilityScrollBarType = 0;
abilityScrollBarScale = 4;
abilityScrollBarColour = make_colour_rgb(0,0,255);
abilityScrollCursorSprite = spr_scrollcursor_0;
abilityScrollCursorColour = make_colour_rgb(64,64,255);
	//AP display
abilityApDisplayX = abilityCategoryTextX;
abilityApDisplayY = abilityTextbox1Y2+0.03;
	//panel data
abilityPanelSprite = spr_item_panel;
abilityPanelBlend = make_color_rgb(abilityTextbox1Colour[0]*255,abilityTextbox1Colour[1]*255,abilityTextbox1Colour[2]*255);
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