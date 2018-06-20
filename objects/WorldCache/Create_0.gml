environment = ds_map_create();
events = ds_map_create();

	//basic environment
environment[? 0] = false;				//Platform switch in rmRoomX107Y399;
environment[? 1] = false;				//secret platform switch: button: X105Y501, platform X105Y499;
	//dual buttons in room X107Y299, enables platforms
environment[? 2] = false;
environment[? 3] = false;
environment[? 4] = false;				//door and lever in X101Y301

	//events	(true indicates that it can run)
events[?   0] = true;						//main-start opening stand
events[?  10] = true;						//town first visit cutscenes
events[?  11] = true;						//
events[?  12] = true;						//