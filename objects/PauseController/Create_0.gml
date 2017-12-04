event_inherited();

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

//initialize
menu = menuCurrent.main;
current_menu_options = menu_main;
sX = 0;
sY = 0;
sExpY = 0;
moveTimer = 0;
movedH = 0;
slotExpanded = 0;
endingGame = false;