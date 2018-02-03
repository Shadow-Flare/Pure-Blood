event_inherited();

	//switch enum initializers
enum menuCurrent {main, inventory, items, offhand, combos, status, settings};
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
menu_main[0, 1] = "Combos";
menu_main[0, 2] = "Status";
menu_main[0, 3] = "Settings";
menu_main[0, 4] = "Return to main menu";

menu_inventory[0, 0] = "Items"
menu_inventory[0, 1] = "Weapons"
menu_inventory[0, 2] = "Offhand Equipment"

menu_combos[0, 0] = "weapon 1"
menu_combos[0, 1] = "weapon 2"
menu_combos[0, 2] = "equipment"

menu_status[0, 0] = "Strength";
menu_status[0, 1] = "Constitution";
menu_status[0, 2] = "Dexterity";
menu_status[0, 3] = "Cunning";
menu_status[0, 4] = "Intelligence";
menu_status[0, 5] = "Willpower";
menu_status[0, 6] = "Accept"

menu_options[0, 0] = "Lighting"
menu_options[0, 1] = "Blood"
menu_options[0, 2] = "Rain"
menu_options[0, 3] = "Fog"
menu_options[0, 4] = "V-Sync"
menu_options[0, 5] = "Attack Hit Boxes"
menu_options[0, 6] = "Actor Hit Boxes"

menu_offhand_equipment[0, 0] = ""	// fill this horizontally with all owned offhands

menu_items[0, 0] = tabType.all;
menu_items[1, 0] = tabType.item;
menu_items[2, 0] = tabType.weapon;
menu_items[3, 0] = tabType.equipment;
menu_items[4, 0] = tabType.accessory;
menu_items[5, 0] = tabType.key;
menu_items[6, 0] = tabType.alchemy;
menu_items[0, 1] = tabType.all;
menu_items[1, 1] = tabType.item;
menu_items[2, 1] = tabType.weapon;
menu_items[3, 1] = tabType.equipment;
menu_items[4, 1] = tabType.accessory;
menu_items[5, 1] = tabType.key;
menu_items[6, 1] = tabType.alchemy;

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

inventoryNum = 8;
inventoryScroll = 0;
//graphical interface initializers
tabSprites = ds_list_create();
tabSprites[| 0] = spr_item_tab_all;
tabSprites[| 1] = spr_item_tab_item;
tabSprites[| 2] = spr_item_tab_weapon;
tabSprites[| 3] = spr_item_tab_equipment;
tabSprites[| 4] = spr_item_tab_accessory;
tabSprites[| 5] = spr_item_tab_key;
tabSprites[| 6] = spr_item_tab_alchemy;