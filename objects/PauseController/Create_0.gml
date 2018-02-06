event_inherited();

	//switch enum initializers
enum menuCurrent {main, inventory, weaponry, equipment, abilities, status, settings};
enum tabType {all, item, weapon, equipment, accessory, key, alchemy};

InputManager.startInput = false;

//shut down all object in room save technicals
instance_deactivate_all(1);
	//Data stores
instance_activate_object(PlayerStats);
instance_activate_object(ItemCache);
instance_activate_object(ComboCache);
instance_activate_object(RoomCache);
	//Controllers
instance_activate_object(GameManager);
instance_activate_object(InputManager);
instance_activate_object(EffectsManager);

//format menus
menu_main[0, 0] = "Inventory";
menu_main[0, 1] = "Weaponry";
menu_main[0, 2] = "Equipment";
menu_main[0, 3] = "Status";
menu_main[0, 4] = "Abilities (Disabled)";
menu_main[0, 5] = "Settings";
menu_main[0, 6] = "Return to main menu";

menu_inventory[0, 0] = tabType.all;
menu_inventory[1, 0] = tabType.item;
menu_inventory[2, 0] = tabType.weapon;
menu_inventory[3, 0] = tabType.equipment;
menu_inventory[4, 0] = tabType.accessory;
menu_inventory[5, 0] = tabType.key;
menu_inventory[6, 0] = tabType.alchemy;
menu_inventory[0, 1] = tabType.all;
menu_inventory[1, 1] = tabType.item;
menu_inventory[2, 1] = tabType.weapon;
menu_inventory[3, 1] = tabType.equipment;
menu_inventory[4, 1] = tabType.accessory;
menu_inventory[5, 1] = tabType.key;
menu_inventory[6, 1] = tabType.alchemy;

menu_weaponry[0, 0] = "weapon 1"
menu_weaponry[0, 1] = "weapon 2"
menu_weaponry[0, 2] = "equipment"

menu_equipment[0, 0] = "" //fill this horizontally with all owned offhands

//menu_abilities[0, 0] = 

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
sX = 0;
sY = 0;
sExpY = 0;
sExpX = 0;
moveTimer = 0;
movedH = 0;
slotExpanded = 0;
endingGame = false;

#region Inventory Data
	//tabSprites cache
tabSprites = ds_list_create();
tabSprites[| 0] = spr_item_tab_all;
tabSprites[| 1] = spr_item_tab_item;
tabSprites[| 2] = spr_item_tab_weapon;
tabSprites[| 3] = spr_item_tab_equipment;
tabSprites[| 4] = spr_item_tab_accessory;
tabSprites[| 5] = spr_item_tab_key;
tabSprites[| 6] = spr_item_tab_alchemy;
	//tab data
inventoryTabImageScale = 4;
inventoryTabX = 0.125;
inventoryTabXInc = 0.05;
inventoryTabY = 0.14;
inventoryTabYSelectMod = -0.03;
inventoryTabSelectionSprite = spr_item_tab_selection;
	//texbox data
inventoryTextbox1 = noone;
inventoryTextbox1X1 = 0.1;
inventoryTextbox1Y1 = 0.15;
inventoryTextbox1X2 = 0.45;
inventoryTextbox1Y2 = 0.9;
inventoryTextbox1Mod = noone;
inventoryTextbox1Colour = [0,0,1];
	//panel data
inventoryPanelSprite = spr_item_panel;
inventoryPanelBlend = make_color_rgb(inventoryTextbox1Colour[0]*255,inventoryTextbox1Colour[1]*255,inventoryTextbox1Colour[2]*255);
inventoryPanelNum = 10;
inventoryPanelX = inventoryTextbox1X1 + 0.06;
inventoryPanelYBegin = inventoryTextbox1Y1 + 0.03;
inventoryPanelYEnd = inventoryTextbox1Y2 - 0.03;
inventoryPanelScale = 4;
inventoryPanelNumSprite = spr_item_panelNum;
inventoryPanelNumX = inventoryTextbox1X2 - 0.0175 - (sprite_get_width(inventoryPanelNumSprite)*inventoryPanelScale)/surface_get_width(application_surface);
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