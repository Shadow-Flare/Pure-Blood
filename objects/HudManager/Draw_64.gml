	//initials
var GUIWidth = surface_get_width(application_surface);
var GUIHeight = surface_get_height(application_surface);
var camX = camera_get_view_x(Camera.cam);
var camY = camera_get_view_y(Camera.cam);
spriteTimer++;

#region Damage Numbers

if !surface_exists(damageNumberSurf) damageNumberSurf = surface_create(GUIWidth,GUIHeight);

surface_set_target(damageNumberSurf);
	draw_clear_alpha(c_black,0);
	for (var i = 0; i < ds_list_size(damageNumbers); i++)
	{
		var cache = damageNumbers[| i];
		var num = cache[| 0];
		var col = cache[| 1];
		var xx = cache[| 2];
		var yy = cache[| 3];
		var xMod = cache[| 4];
		var yMod = cache[| 5];
		var alpha = clamp(cache[| 6]/40,0,1)*clamp((120-cache[| 6])/10,0,1);
		var angle = darctan(yMod/xMod);
		
		if angle < 0 angle = -(angle+90)/4;
		else if angle >= 0 angle = -(abs(angle)-90)/4;
		var xRel = (xx-camX)*(1920/320);
		var yRel = (yy-camY)*(1080/176);
		
		var textString = string(abs(num));						//will implement a system for healing numbers at some point, for now if damage is negative just lie ans say positive
		if sign(num) == -1 textString = "000"+textString;		//add "000" to start for debugging purposes
		var textSize = string_length(textString);
		var textSpr = sprPixelNumbers;
		var textW = sprite_get_width(textSpr);
		var textH = sprite_get_height(textSpr);
		var textSep = textW-1;			//pixels
		var textScale = 4;
			
		var textX = xRel-(textW*textSize/2)*dsin(angle);
		var textY = yRel-(textH/2)*dcos(angle);
			
		for(var j = 0; j < textSize; j++)
		{
			var ind;
			var char = string_char_at(textString,j+1);
			switch char
			{
				case "0": ind = 0; break;
				case "1": ind = 1; break;
				case "2": ind = 2; break;
				case "3": ind = 3; break;
				case "4": ind = 4; break;
				case "5": ind = 5; break;
				case "6": ind = 6; break;
				case "7": ind = 7; break;
				case "8": ind = 8; break;
				case "9": ind = 9; break;
			}
			draw_sprite_ext(textSpr,ind,textX,textY,textScale,textScale,angle,col,alpha);
			textX+=textSep*textScale*dcos(angle);
			textY-=textSep*textScale*dsin(angle);
		}
		
		cache[| 2] += xMod;
		cache[| 3] += yMod;
		cache[| 4] -= xMod/32;
		cache[| 5] -= yMod/64;
		
		cache[| 6]--;
		if cache[| 6] == 0
		{
			ds_list_destroy(cache);
			ds_list_delete(damageNumbers,i);
			i--;
		}
	}
surface_reset_target();

draw_surface(damageNumberSurf,0,0);

#endregion

#region Testers, remove these in final
		//level up indication TESTER
	if PlayerStats.statPoints != 0 draw_circle_color(20,20,15,c_yellow,c_yellow,false);
	
		//interaction button TESTER
	if instance_exists(objPlayer) && objPlayer.interactionInstance != noone
	{
		var x1 = (objPlayer.x-camera_get_view_x(Camera.cam))/320;
		var y1 = (objPlayer.y-24-camera_get_view_y(Camera.cam))/176
		draw_sprite_ext(spr_b_prompt,floor(current_time/60),x1*GUIWidth,y1*GUIHeight,4,4,0,c_white,hudAlpha);
	}
#endregion

#region Top Left HuD
		#region setup surfaces
	if !surface_exists(topLeftSurf) topLeftSurf = surface_create(GUIWidth/topLeftResolutionScale,hpRMax*2+topLeftBorder*2);
	if !surface_exists(hpSurf) hpSurf = surface_create(GUIWidth/topLeftResolutionScale,hpRMax*2+topLeftBorder*2);
	if !surface_exists(hpSurfA) hpSurfA = surface_create(GUIWidth/topLeftResolutionScale,hpRMax*2+topLeftBorder*2);
	if !surface_exists(hpSurfB) hpSurfB = surface_create(GUIWidth/topLeftResolutionScale,hpRMax*2+topLeftBorder*2);
	if !surface_exists(hpSurfC) hpSurfC = surface_create(GUIWidth/topLeftResolutionScale,hpRMax*2+topLeftBorder*2);
	if !surface_exists(mpSurf) mpSurf = surface_create(GUIWidth/topLeftResolutionScale,hpRMax*2+topLeftBorder*2);
	if !surface_exists(mpSurfA) mpSurfA = surface_create(GUIWidth/topLeftResolutionScale,hpRMax*2+topLeftBorder*2);
		#endregion
		
		#region Mp
	surface_set_target(mpSurf);
	draw_clear_alpha(c_white,0);

	var mp = floor(PlayerStats.mp);
	var mpMax = PlayerStats.mpMax;

			#region Back
				#region draw bar mp + caps
	//bar
	var size = (mpMax/mpPP);
	var sprW = sprite_get_width(spr_mp_base_bar);
	var sprH = sprite_get_height(spr_mp_base_bar);
	var n = size/sprW;
	for(var i = 0; i < n; i++)
	{
		var xPart = min(n-i,1);
		draw_sprite_part(spr_mp_base_bar,0,0,0,sprW*xPart,sprH,mpXI+1+i*sprW,mpYI);
	}
	//start cap
	draw_sprite_ext(spr_mp_base_cap,1,mpXI,mpYI+8,1,1,90,c_white,1.0);
	//end cap
	var cX = mpXI+2+mpMax/mpPP;
	var cY = mpYI+8;
	draw_sprite_ext(spr_mp_base_cap,0,cX,cY,1,1,-90,c_white,1.0);
		#endregion
			#endregion	
			#region fill
				#region draw bar mp
	//bar
	var size = (mp/mpPP);
	var sprW = sprite_get_width(spr_mp_fill_bar);
	var sprH = sprite_get_height(spr_mp_fill_bar);
	var n = size/sprW;
	for(var i = 0; i < n; i++)
	{
		var xPart = min(n-i,1);
		draw_sprite_part_ext(spr_mp_fill_bar,0,0,0,sprW*xPart,sprH,mpXI+1+i*sprW,mpYI+5,1,1,mpColour,1.0);
	}
		#endregion
			#endregion		
	surface_reset_target();
	surface_set_target(mpSurfA);
	draw_clear_alpha(c_white,0);
			#region Animation
	//preliminaries
	mpAnimTimer++;
	var subID = floor(mpAnimTimer/mpAnimStep);
	//bar
	var size = (mp/mpPP);
	var sprW = sprite_get_width(spr_mp_anim_bar);
	var sprH = sprite_get_height(spr_mp_anim_bar);
	var n = size/sprW;
	for(var i = 0; i < n; i++)
	{
		var xPart = min(n-i,1);
		draw_sprite_part(spr_mp_anim_bar,subID,0,0,sprW*xPart,sprH,mpXI+1+i*sprW,mpYI+5);
	}
			#endregion
	surface_reset_target();
	draw_set_colour(c_white);

		#endregion
		#region Hp
	var v = hpPP*pi*(hpR1+hpR1)/2*(4/3);
	surface_set_target(hpSurfB);
	draw_clear_alpha(c_white,0);
			#region Back	
	var hpMax = PlayerStats.hpMax;
				#region preliminaries
	var barHp= max(hpMax-v,0);
	var curveHp= clamp(hpMax,0,v);
	var hpd = 270*(curveHp/v);
		
	draw_set_colour(hpBackColour);
				#endregion
				#region draw circle-triangle
	draw_sprite(spr_hp_base_curve_0,0,hpXI+1,hpYI+1);
	draw_sprite(spr_hp_base_curve_1,0,hpXI,hpYI+1);
	draw_sprite(spr_hp_base_curve_2,0,hpXI,hpYI);
				#endregion
				#region draw circle-triangle cutout
	d = 90;
	gpu_set_blendmode(bm_subtract)
	for(var i=0; i<hpA; i++;)
	{
		var p1x= hpXI;
		var p1y= hpYI;
		var p2x= hpXI + dcos(d)*(hpRMax);
		var p2y= hpYI - dsin(d)*(hpRMax);
		d += (270-hpd)/hpA;
		var p3x= hpXI + dcos(d)*(hpRMax);
		var p3y= hpYI - dsin(d)*(hpRMax);
		draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
	}
	gpu_set_blendmode(bm_normal)
				#endregion
				#region draw bar hp + caps
	//bar
	var size = (barHp/hpPP);
	var sprW = sprite_get_width(spr_hp_base_bar);
	var sprH = sprite_get_height(spr_hp_base_bar);
	var n = size/sprW;
	for(var i = 0; i < n; i++)
	{
		var xPart = min(n-i,1);
		draw_sprite_part(spr_hp_base_bar,0,0,0,sprW*xPart,sprH,hpXI+1+i*sprW,hpYI-34);
	}
	//start cap
	var dst = 25;
	draw_sprite_ext(spr_hp_base_cap,0,hpXI+1+dst,hpYI,1,1,0,c_white,1.0);
	//end cap
	if hpMax < v
	{
		var cX = hpXI+1+dcos(hpd)*dst;
		var cY = hpYI+1+dsin(hpd)*dst;
		draw_sprite_ext(spr_hp_base_cap,1,cX,cY,1,1,180-hpd,c_white,1.0);
	}
	else 
	{
		var cX = hpXI+1+barHp/hpPP;
		var cY = hpYI+1-dst;
		draw_sprite_ext(spr_hp_base_cap,1,cX,cY,1,1,-90,c_white,1.0);
	}
		#endregion
			#endregion
	surface_reset_target();
			#region Fill
				#region preliminaries
		if PlayerStats.hpMax < hpDamageDisplay hpDamageDisplay = PlayerStats.hpMax;
				
		if PlayerStats.hp > hpDamageDisplay
		{
			hpDamageTarget = PlayerStats.hp;
			hpDamageDisplay = PlayerStats.hp;
		}
		else if PlayerStats.hp == hpDamageTarget
		{
			hpDamageDisplay += (PlayerStats.hp-hpDamageDisplay)/8;
		}
		else
		{
			hpDamageDelayTimer++;
			if hpDamageDelayTimer >= round(hpDamageDelay*room_speed)
			{
				hpDamageTarget = PlayerStats.hp;
				hpDamageDelayTimer = 0;
			}
		}

		var hp = PlayerStats.hp;
		var hpDam = hpDamageDisplay;
					#endregion
				#region draw damage portion
					#region preliminaries
	var barHp= max(hpDam-v,0);
	var curveHp= clamp(hpDam,0,v);
	var hpd = 270*(curveHp/v);
		
	draw_set_colour(hpBackColour);
					#endregion
					surface_set_target(hpSurfC);
					draw_clear_alpha(c_white,0);
					#region draw circle-triangle
		hpAnimTimer++;
		draw_sprite_ext(spr_hp_fill_curve_0,0,hpXI+1,hpYI+1,1,1,0,hpDamageColour,1.0);
		draw_sprite_ext(spr_hp_fill_curve_1,0,hpXI,hpYI+1,1,1,0,hpDamageColour,1.0);
		draw_sprite_ext(spr_hp_fill_curve_2,0,hpXI,hpYI,1,1,0,hpDamageColour,1.0);
					#endregion
					#region draw circle-triangle cutout
		d = 90;
		gpu_set_blendmode(bm_subtract)
		for(var i=0; i<hpA; i++;)
		{
			var p1x = hpXI;
			var p1y = hpYI;
			var p2x = hpXI + dcos(d)*(hpRMax);
			var p2y = hpYI - dsin(d)*(hpRMax);
			d += (270-hpd)/hpA;
			var p3x = hpXI + dcos(d)*(hpRMax);
			var p3y = hpYI - dsin(d)*(hpRMax);
			draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
		}
		gpu_set_blendmode(bm_normal)
					#endregion
					#region draw bar hp
	//bar
	var size = (barHp/hpPP)-1;
	var sprW = sprite_get_width(spr_hp_fill_bar);
	var sprH = sprite_get_height(spr_hp_fill_bar);
	var n = size/sprW;
	for(var i = 0; i < n; i++)
	{
		var xPart = min(n-i,1);
		draw_sprite_part_ext(spr_hp_fill_bar,0,0,0,sprW*xPart,sprH,hpXI+1+i*sprW,hpYI-28,1,1,hpDamageColour,1.0);
	}
		#endregion
					surface_reset_target();
				#endregion
				#region draw main hp portion
					#region preliminaries
	var barHp= max(hp-v,0);
	var curveHp= clamp(hp,0,v);
	var hpd = 270*(curveHp/v);
		
	draw_set_colour(hpBackColour);
					#endregion
					surface_set_target(hpSurf);
					draw_clear_alpha(c_white,0);
					#region draw circle-triangle
		hpAnimTimer++;
		draw_sprite_ext(spr_hp_fill_curve_0,0,hpXI+1,hpYI+1,1,1,0,hpColour,1.0);
		draw_sprite_ext(spr_hp_fill_curve_1,0,hpXI,hpYI+1,1,1,0,hpColour,1.0);
		draw_sprite_ext(spr_hp_fill_curve_2,0,hpXI,hpYI,1,1,0,hpColour,1.0);
					#endregion
					#region draw circle-triangle cutout
		d = 90;
		gpu_set_blendmode(bm_subtract)
		for(var i=0; i<hpA; i++;)
		{
			var p1x = hpXI;
			var p1y = hpYI;
			var p2x = hpXI + dcos(d)*(hpRMax);
			var p2y = hpYI - dsin(d)*(hpRMax);
			d += (270-hpd)/hpA;
			var p3x = hpXI + dcos(d)*(hpRMax);
			var p3y = hpYI - dsin(d)*(hpRMax);
			draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
		}
		gpu_set_blendmode(bm_normal)
					#endregion
					#region draw bar hp
	//bar
	var size = (barHp/hpPP)-1;
	var sprW = sprite_get_width(spr_hp_fill_bar);
	var sprH = sprite_get_height(spr_hp_fill_bar);
	var n = size/sprW;
	for(var i = 0; i < n; i++)
	{
		var xPart = min(n-i,1);
		draw_sprite_part_ext(spr_hp_fill_bar,0,0,0,sprW*xPart,sprH,hpXI+1+i*sprW,hpYI-28,1,1,hpColour,1.0);
	}
		#endregion
					surface_reset_target();
				#endregion
				#region animation
					#region preliminaries
	var animHP = max(hpDamageDisplay,hp);
	var barHp= max(animHP-v,0);
	var curveHp= clamp(animHP,0,v);
	var hpd = 270*(curveHp/v);
	
	hpAnimTimer++;
	var subID = floor(hpAnimTimer/hpAnimStep);
		
	draw_set_colour(hpBackColour);
					#endregion
					surface_set_target(hpSurfA);
					draw_clear_alpha(c_white,0.0);
					#region draw circle-triangle
		draw_sprite(spr_hp_anim_curve_0,subID,hpXI+1,hpYI+1);
		draw_sprite(spr_hp_anim_curve_1,subID,hpXI,hpYI+1);
		draw_sprite(spr_hp_anim_curve_2,subID,hpXI,hpYI);
					#endregion
					#region draw circle-triangle cutout
		d = 90;
		gpu_set_blendmode_ext(bm_one,bm_inv_src_alpha);
		draw_set_colour(c_white);
		for(var i=0; i<hpA; i++;)
		{
			var p1x = hpXI;
			var p1y = hpYI;
			var p2x = hpXI + dcos(d)*(hpRMax);
			var p2y = hpYI - dsin(d)*(hpRMax);
			d += (270-hpd)/hpA;
			var p3x = hpXI + dcos(d)*(hpRMax);
			var p3y = hpYI - dsin(d)*(hpRMax);
			draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
		}
		gpu_set_blendmode(bm_normal)
					#endregion
					#region draw bar hp
	//bar
	var size = (barHp/hpPP)-1;
	var sprW = sprite_get_width(spr_hp_anim_bar);
	var sprH = sprite_get_height(spr_hp_anim_bar);
	var n = size/sprW;
	for(var i = 0; i < n; i++)
	{
		var xPart = min(n-i,1);
		draw_sprite_part(spr_hp_anim_bar,subID,0,0,sprW*xPart,sprH,hpXI+1+i*sprW,hpYI-28);
	}
		#endregion
					surface_reset_target();
				#endregion
			#endregion
		#endregion

		#region final draw
	surface_set_target(topLeftSurf);
		draw_clear_alpha(c_white,0);
		draw_surface(mpSurf,0,0);
		gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_colour,bm_zero,bm_one);
		draw_surface(mpSurfA,0,0);
		gpu_set_blendmode(bm_normal);
		draw_surface(hpSurfB,0,0);
		draw_surface(hpSurfC,0,0);
		draw_surface(hpSurf,0,0);
		gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_colour,bm_zero,bm_one);
		draw_surface(hpSurfA,0,0);
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface_ext(topLeftSurf,0,0,topLeftResolutionScale,topLeftResolutionScale,0,c_white,hudAlpha);
		#endregion
	#endregion

#region Map
		var str = room_get_name(room);
		if hudMapEnabled && string_pos("rmRoom",str) != 0
		{
			if !surface_exists(hudMapSurf) hudMapSurf = surface_create(hudMapWidth,hudMapHeight);
			if !surface_exists(hudMapDetails) hudMapDetails = surface_create(hudMapWidth,hudMapHeight);
			surface_set_target(hudMapDetails);
				draw_clear_alpha(hudMapBorderColour,1.0);
				gpu_set_blendmode(bm_subtract);
					draw_rectangle(hudMapBorderWidth,hudMapBorderWidth,hudMapWidth-hudMapBorderWidth-1,hudMapHeight-hudMapBorderWidth-1,0)
				gpu_set_blendmode(bm_normal);
				if instance_exists(objPlayer)
				{
					var playerX = objPlayer.x/room_width;
					var playerY = objPlayer.y/room_height;
				
					var cellInitialX = surface_get_width(HudManager.hudMapSurf)/2;
					var cellInitialY = surface_get_height(HudManager.hudMapSurf)/2;
					var cellW = MapManager.mapCellW*hudMapPixelScale;
					var cellH = MapManager.mapCellH*hudMapPixelScale;
				
					var roomCellW = RoomCache.rmWidths[? room];
					var roomCellH = RoomCache.rmHeights[? room];
				
					var pX = cellInitialX+roomCellW*cellW*(playerX-0.5)-1;
					var pY = cellInitialY+roomCellH*cellH*(playerY-0.5)-1;
					draw_sprite_ext(sprPlayerMarker,0,pX,pY,hudMapDetailScale,hudMapDetailScale,0,c_white,1);
				}
			surface_reset_target();
		
			var xi = GUIWidth-(hudMapWidth)*hudMapPixelScale-mean(GUIWidth,GUIHeight)/20;
			var yi = mean(GUIWidth,GUIHeight)/20;
		
			surface_set_target(hudMapSurf);
				var roomX = int64(string_copy(str,8,3));
				var roomY = int64(string_copy(str,12,3));
				var roomW = RoomCache.rmWidths[? room];
				var roomH = RoomCache.rmHeights[? room];
				draw_clear_alpha(c_white,0.0);
				var xM = hudMapWidth/2-(roomX+0.5*roomW)*hudMapPixelScale*MapManager.mapCellW;
				var yM = hudMapHeight/2-(roomY+0.5*roomH)*hudMapPixelScale*MapManager.mapCellH;
				draw_surface_ext(MapManager.mapSurface,xM,yM,hudMapPixelScale,hudMapPixelScale,0,c_white,1.0);
			surface_reset_target();
		
			draw_surface_ext(hudMapSurf,xi,yi,hudMapPixelScale,hudMapPixelScale,0,c_white,hudAlpha);
			draw_surface_ext(hudMapDetails,xi,yi,hudMapPixelScale,hudMapPixelScale,0,c_white,hudAlpha);
		}
	#endregion

#region Messages
	if ds_list_size(messageFeed) != 0
	{
		var deleteMessage = false;
		messageTop -= messageMovePerFrame;
		if messageTop < 0 messageTop = 0;
		for (var i = 0; i < ds_list_size(messageFeed); i++)
		{
			messageTimers[| i]++;			
			if i != 0 messageTimers[| i] = clamp(messageTimers[| i],0,messageFadeDuration*room_speed);
			var tim = messageTimers[| i];
			if tim <= round(messageFadeDuration*room_speed) draw_set_alpha(tim/(messageFadeDuration*room_speed));
			else if tim >= round((messageFadeDuration+messageShowDuration)*room_speed) draw_set_alpha(1-((tim-((messageShowDuration+messageFadeDuration)*room_speed))/(messageFadeDuration*room_speed)));
			else draw_set_alpha(1);
			if i == 0 && messageTimers[| i] = round((messageFadeDuration*2+messageShowDuration)*room_speed)
			{
				deleteMessage = true;
			}
			draw_set_font(fnt_menu);
			draw_set_colour(c_white);
			draw_set_halign(fa_right);
			draw_text_color(GUIWidth-20,20+messageTop+i*messageDivider,messageFeed[| i],c_white,c_white,c_white,c_white,hudAlpha);
			draw_set_halign(fa_left);
			draw_set_alpha(1);
		}
		if deleteMessage
		{
			ds_list_delete(messageFeed,0);
			ds_list_delete(messageTimers,0);
			messageTop += messageDivider;
		}
	}
#endregion

//equipment
	//Offhand && Subtype && weapon Basic
var WeaponName = item_get_data(itemType.weapon,PlayerStats.currentWeaponID,itemStats.name);
var offhandName = item_get_data(itemType.weapon,PlayerStats.currentOffhandID,itemStats.name)
var offhandSubtypeName = subtype_get_stat(PlayerStats.currentOffhandSubtypeID,offhandSubtypeStats.name);
var offhandAmmoNum = scr_player_inventory_get(itemType.item,subtype_get_stat(PlayerStats.currentOffhandSubtypeID,offhandSubtypeStats.ammoItem));
var activeAbilityName = activeAbility_get_stat(PlayerStats.currentOffhandActivatableID,activeAbilityStats.name);
draw_set_font(fnt_menu);
draw_set_valign(fa_bottom);
draw_text_colour(20,1080-200,WeaponName,c_orange,c_orange,c_orange,c_orange,hudAlpha);
draw_text_colour(40,1080-160,offhandName,c_orange,c_orange,c_orange,c_orange,hudAlpha);
draw_text_colour(60,1080-120,offhandSubtypeName,c_orange,c_orange,c_orange,c_orange,hudAlpha);
draw_text_colour(80,1080-80,"Ammo: " + string(offhandAmmoNum),c_orange,c_orange,c_orange,c_orange,hudAlpha);
draw_text_colour(100,1080-40,activeAbilityName,c_orange,c_orange,c_orange,c_orange,hudAlpha);
draw_set_valign(fa_top);