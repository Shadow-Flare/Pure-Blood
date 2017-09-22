global.time++;

if !instance_exists(obj_inputManager) instance_create_depth(0,0,0,obj_inputManager)

////item tester
//if mouse_check_button_pressed(mb_left) with instance_create_layer(mouse_x,mouse_y,layer_get_id("lay_entities"),obj_item_test)
//{
//	xSpd = random_range(-10,10);
//}

//add arena controllers if in arena
if string_delete(room_get_name(room),9,string_width(room_get_name(room))-9) == "rm_arena" && !instance_exists(obj_arena_controller)
{
	instance_create_layer(0,0,"lay_technicals",obj_arena_controller);
}

//room settings
var RM = room_get_name(room)
switch (RM)
{
	case "rm_room1":
		darknessStr = 0.8;
		fogLevel = 1;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 0.8
		break;
	case "rm_room2":
		darknessStr = 0.9;
		fogLevel = 2;
		rain = 1;
		paraASpd = 0.9;
		paraBSpd = 1.1;
		backgroundSpeed = 0.8
		break;
	case "rm_room3":
		darknessStr = 0.95;
		fogLevel = 3;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 1;
		break;
	case "rm_arena1":
		darknessStr = 0.8;
		fogLevel = 0;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 1;
		break;
	case "rm_arena2":
		darknessStr = 0.9;
		fogLevel = 0;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 1;
		break;
	case "rm_arena3":
		darknessStr = 0.8;
		fogLevel = 3;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 1;
		break;
	case "rm_arena4":
		darknessStr = 0.7;
		fogLevel = 3;
		rain = 1;
		paraASpd = 0.9;
		paraBSpd = 1.1;
		backgroundSpeed = 0.8;
		break;
}

switch (fogLevel) //sprites per 1000
{
	case 0:
		fogSpriteNumbers = [0,0,0];
		break;
	case 1:
		fogSpriteNumbers = [15,0,0];
		break;
	case 2:
		fogSpriteNumbers = [15,5,0];
		break;
	case 3:
		fogSpriteNumbers = [10,5,3];
		break;
}

//Console step
scr_console_step();

if !global.paused
{
	//Up input change
	if instance_exists(obj_inputManager)
	{
		if obj_inputManager.dUInput
		{
			dU = 0;
		}
	}

	if dU != -1
	{
		dU++;
		if !obj_inputManager.dUInputHeld
		{
			if player.phase != "offhand" && player.phase != "ability"
			{
				for (var i = 0; i < array_length_1d(global.ownedOffhands); i++)
				{
					if global.ownedOffhands[i] = global.activeOffhandID
					{
						ownedID = i;
						break;
					}
				}
				for (var i = 0; i < array_length_2d(global.ownedSubtypes,ownedID); i++)
				{
					if global.ownedSubtypes[ownedID,i] = global.activeOffhandSubtypeID
					{
						ownedSubtypeID = i;
						break;
					}
				}
				for (var i = 0; i < array_length_1d(global.ownedActivatables); i++)
				{
					if global.ownedActivatables[ownedID,i] = global.activeOffhandActivatableID
					{
						activeOwnedID = i;
						break;
					}
				}
				ownedSubtypeID++;
				if ownedSubtypeID >= array_length_2d(global.ownedSubtypes,ownedID) ownedSubtypeID = 0;
				global.activeOffhandSubtypeID = global.ownedSubtypes[ownedID,ownedSubtypeID];
			}
			dU = -1;
		}
		else if dU = floor(room_speed*0.5)
		{
			if player.phase != "offhand" && player.phase != "ability" && player.phase != "hooked"
			{
				for (var i = 0; i < array_length_1d(global.ownedOffhands); i++)
				{
					if global.ownedOffhands[i] = global.activeOffhandID
					{
						ownedID = i;
						break;
					}
				}
				ownedID++;
				if ownedID >= array_length_1d(global.ownedOffhands) ownedID = 0;
				global.activeOffhandID = global.ownedOffhands[ownedID];
				global.activeOffhandSubtypeID = global.ownedSubtypes[ownedID,0];
				global.activeOffhandActivatableID = global.ownedActivatables[ownedID,0];
			}
			dU = -1;
		}
	}

	//Right input change
	if instance_exists(obj_inputManager)
	{
		if obj_inputManager.dRInput
		{
			dR = 0;
		}
	}

	if dR != -1
	{
		dR++;
		if !obj_inputManager.dRInputHeld
		{
			if player.phase != "ability" && player.phase != "hooked"
			{
				for (var i = 0; i < array_length_1d(global.ownedOffhands); i++)
				{
					ownedID = 0;
					if global.ownedOffhands[i] = global.activeOffhandID
					{
						ownedID = i;
						break;
					}
				}
				for (var i = 0; i < array_length_2d(global.ownedActivatables,ownedID); i++)
				{
					activeOwnedID = 0;
					if global.ownedActivatables[ownedID,i] = global.activeOffhandActivatableID
					{
						activeOwnedID = i;
						break;
					}
				}
				activeOwnedID++;
				if activeOwnedID >= array_length_2d(global.ownedActivatables,ownedID) activeOwnedID = 0;
				global.activeOffhandActivatableID = global.ownedActivatables[ownedID,activeOwnedID];
			}
			dR = -1;
		}
		else if dR = floor(room_speed*1)
		{
			dR = -1;
		}
	}
}

#region Effects
if room != rm_main_menu
{
	#region Lighting Effects
	if global.FXLighting && instance_exists(obj_camera) && camera_get_view_width(obj_camera.cam) >= 1 && camera_get_view_width(obj_camera.cam) >= 1
	{
		//lighting: reset every frame && draw lights
		if shadowType == "basic" || shadowType == "dynamic"
		{
			//reset
			if !surface_exists(light)
			{
				light = surface_create(camera_get_view_width(obj_camera.cam),camera_get_view_height(obj_camera.cam));
			}
			surface_set_target(light);
				draw_clear(make_colour_rgb(darknessStr*255,darknessStr*255,darknessStr*255));
			surface_reset_target();
			//draw lights
			with(obj_light_parent)
			{
				lifeTime++
				sizeMod = sin((lifeTime*pi)/(60/iterationsPerSec))*variance

				lightSize = radius+sizeMod;

				if obj_controller.shadowType == "dynamic" scr_emit_light_dynamic(resolution,lightSize,colour,alpha);
				else if obj_controller.shadowType == "basic" scr_emit_light_basic(lightSize,colour);
			}
		}
	}
	#endregion
	#region Rain Effects
	if global.FXRain
	{
		//rain: compute
		if rain == 1 && !instance_exists(obj_rain_controller) instance_create_layer(-10,-10,layer_get_id("lay_effects1"),obj_rain_controller);
		else if  rain == 0 && instance_exists(obj_rain_controller) instance_destroy(instance_find(obj_rain_controller,0));
	}
	else if instance_exists(obj_rain_controller) instance_destroy(instance_find(obj_rain_controller,0));
	#endregion
	#region Blood Effects
	if global.FXBlood
	{
		//Blood: compute
		if (!surface_exists(tiles))
		{
			tiles = surface_create(room_width,room_height);
	
			surface_set_target(tiles);
	
			tileMapA = layer_tilemap_get_id(layer_get_id("tiles_foreground_a"));
			tileMapB = layer_tilemap_get_id(layer_get_id("tiles_foreground_b"));
			tileMapC = layer_tilemap_get_id(layer_get_id("tiles_foreground_c"));
			draw_tilemap(tileMapA,0,0);
			draw_tilemap(tileMapB,0,0);
			draw_tilemap(tileMapC,0,0);
	
			surface_reset_target();
	
			layer_set_visible(layer_get_id("Tiles_foreground_a"),0);
			layer_set_visible(layer_get_id("Tiles_foreground_b"),0);
			layer_set_visible(layer_get_id("Tiles_foreground_c"),0);
		}
		if (!surface_exists(blood)) blood = surface_create(room_width,room_height);
		if (!surface_exists(bloodyTiles)) bloodyTiles = surface_create(room_width,room_height);
		if (!surface_exists(temp)) temp = surface_create(room_width,room_height);
			//hole surface
		surface_set_target(temp);
			draw_set_colour(c_black);
			draw_rectangle(0,0,room_width,room_height,0);
			gpu_set_blendmode(bm_subtract);
			draw_surface(tiles,0,0);
			gpu_set_blendmode(bm_normal);
		surface_reset_target();
			//compose bloody tiles
		surface_set_target(bloodyTiles);
			draw_surface(tiles,0,0);
			draw_surface(blood,0,0);
				//cutt out
			gpu_set_blendmode(bm_subtract);
			draw_surface(temp,0,0);
			gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
	#endregion
	#region Fog Effects
	if global.FXFog
	{
		//fog: compute
		for (var i = 0; i < array_length_1d(fogSpriteNumbers); i++)
		{
			var num = fogSpriteNumbers[i]*round(room_width/1000);
			if !surface_exists(fogSurfaces[i]) fogSurfaces[i] = surface_create(room_width,room_height);
			if !ds_exists(fogSpriteData,ds_type_list) fogSpriteData = ds_list_create();
			if ds_list_find_value(fogSpriteData,i) == undefined
			{
				var g = ds_grid_create(num,4)
				ds_list_set(fogSpriteData,i,g)
				for (var j = 0; j < num; j++)
				{
					ds_grid_set(g,j,0,irandom(sprite_get_number(spr_fog)-1));						//sprite ID
					ds_grid_set(g,j,1,irandom(room_width/16)*16);									//x initi
					ds_grid_set(g,j,2,irandom_range((room_height-125+150*i)/16,(room_height+100+150*i)/16)*16);		//y initi
					ds_grid_set(g,j,3,random_range(0.5,1)*sign(random_range(-1000,1000)));										//xSpd initi
				}
			}
			surface_set_target(fogSurfaces[i]);
				gpu_set_blendmode(bm_subtract);
				 draw_set_colour(c_white);
					draw_rectangle(0,0,surface_get_width(fogSurfaces[i]),surface_get_height(fogSurfaces[i]),0)
				gpu_set_blendmode(bm_normal);
				for (var j = 0; j < num; j++)
				{
					var g = ds_list_find_value(fogSpriteData,i)
					if g != undefined && ds_exists(g,ds_type_grid)
					{
						var S = ds_grid_get(g,j,0);
						var Y = ds_grid_get(g,j,2);
						var Spd = ds_grid_get(g,j,3);
						var X = ds_grid_get(g,j,1) + Spd;
						if X <= -sprite_get_width(spr_fog)*8 || X >= room_width+sprite_get_width(spr_fog)*8
						{
							ds_grid_set(ds_list_find_value(fogSpriteData,i),j,3,ds_grid_get(ds_list_find_value(fogSpriteData,i),j,3)*-1);
						}
						ds_grid_set(ds_list_find_value(fogSpriteData,i),j,1,X);
						draw_sprite_ext(spr_fog,S,X,Y,32,32,0,make_color_rgb(192,192,192),1)
					}
				}
			surface_reset_target();
		}
	}
	#endregion
}
#endregion

#region Vsync Reset on change
if vsyncPrev != global.vsync display_reset(0,global.vsync)
vsyncPrev = global.vsync;
#endregion
