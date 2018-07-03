var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

weaponryClassDisplaySy += (sY-weaponryClassDisplaySy)/4;
if abs(weaponryClassDisplaySy-sY) <= 0.005 weaponryClassDisplaySy = sY

#region Main Classes
		//scroll bar
	scr_draw_scroll_bar(surfW*weaponryScrollBarX, surfH*weaponryScrollBarY1,surfH*weaponryScrollBarY2,true,sY,weaponryMaxSY-2,weaponryScrollBarType,weaponryScrollBarScale,weaponryScrollBarColour);

		//sections and text
	if slotExpanded	weaponryExpandValue = clamp(weaponryExpandValue+1/(weaponryExpandDuration*room_speed),0,1);
	else weaponryExpandValue = clamp(weaponryExpandValue-1/(weaponryExpandDuration*room_speed),0,1);
	
	var dPrev = weaponrySExpYDisplayDifference;
	weaponrySExpYDisplayDifference -= sign(weaponrySExpYDisplayDifference)/(weaponrySExpYDisplayShiftDuration*room_speed);
	if sign(dPrev) != sign(weaponrySExpYDisplayDifference) weaponrySExpYDisplayDifference = 0;
	if abs(weaponrySExpYDisplayDifference) > 1 weaponrySExpYDisplayDifference = sign(weaponrySExpYDisplayDifference);
	
	surface_set_target(weaponryMainSurf);
		draw_clear_alpha(c_black,0);
	surface_reset_target();

	for(var i = 0; i < array_length_2d(current_menu_options,0); i++)
	{
		var sep = i-weaponryClassDisplaySy;
		var class = current_menu_options[0, i];
		var classCache = ComboCache.playerClass[? class];
		if class != noone
		{
				//text box
			var isMain = class_get_stat(class,weaponClassStats.isMain);
			if i == sY var col = weaponryClassTextboxSelectionColour;
			else if isMain var col = weaponryClassTextboxMainColour;
			else var col = weaponryClassTextboxOffColour;
			
			var y1Mod = 0;
			if i > sY y1Mod = weaponryExpandValue*weaponryClassTextboxExpandedHeight*surfH;
			
			var y2Mod = 0
			if i == sY y2Mod = weaponryExpandValue*weaponryClassTextboxExpandedHeight*surfH;
			
			y1Mod+=weaponryExpandValue*weaponryClassTextboxYExpandedShift*surfH;
			
			var x1 = weaponryClassTextboxX*surfW;
			var y1 = weaponryClassTextboxY*surfH+sep*weaponryClassTextboxYSep*surfH+y1Mod;
			var x2 = x1+weaponryClassTextboxWidth*surfW;
			var y2 = y1+weaponryClassTextboxHeight*surfH+y2Mod;
			//draw textbox near end to conserve "surface_set"s
			
				//text & class details surface	
					//stencil
			surface_set_target(weaponryClassDetailSurfStencil);
				draw_clear(c_white);
				gpu_set_blendmode(bm_subtract)
					draw_rectangle(weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth,weaponryClassTextboxWidth*surfW-weaponryClassDetailSurfBorderWidth,weaponryClassTextboxHeight*surfH+y2Mod-weaponryClassDetailSurfBorderWidth/4,false);
				gpu_set_blendmode(bm_normal);
			surface_reset_target();
				
					//draw details
			surface_set_target(weaponryClassDetailSurf);
				draw_clear_alpha(c_black,0);
				var tempCurrentClass = current_menu_options[0, sY];
				var tempIsMain = class_get_stat(tempCurrentClass,weaponClassStats.isMain);
	#region Main Weapons	
				if tempIsMain
				{
					draw_set_font(weaponryClassNameFont);
					draw_text(weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth,class_get_stat(class,weaponClassStats.name));
					draw_text((weaponryClassTextboxWidth*surfW-weaponryClassDetailSurfBorderWidth)*0.6,weaponryClassDetailSurfBorderWidth,"Exp: "+string(classCache[? playerClassStats.xp])+"/"+string(classCache[? playerClassStats.xpNeeded]));
					draw_set_halign(fa_right);
						draw_text(weaponryClassTextboxWidth*surfW-weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth,"Lv: "+string(classCache[? playerClassStats.level]));
			
					draw_set_halign(fa_left);
				
					if slotExpanded && sY == i
					{
						for(var j = 0; j < 4; j++)	//go through all 4 combo types (ground/aerial + combo/finisher)
						{
							var isGround = (j <= 1);
							for(var k = 0; k < combo_get_length(class,j); k++)
							{
								var comID = combo_get_id(class,j,k);							
								var xSep = k;
								if j%2 == 1 xSep += combo_get_length(class,j-1)
							
								var xPos = weaponryClassDetailSurfBorderWidth+weaponryComboX*surfW+weaponryComboXSep*surfW*xSep;
								var yPos = weaponryComboY*surfH+weaponryComboYSep*surfH*floor(j/2)+1;
							
								var mCol = c_white;
								var nameToDraw = combo_get_stat(comID,comboStats.name)
								if isGround = weaponryGroundComboSelected && sX == xSep
								{
									mCol = c_blue;
									yPos += weaponryComboYExpSep*weaponrySExpYDisplayDifference
									for( var l = 0; l < ds_list_size(weaponryComboList); l++)
									{
										var eCol = c_white;
										if sExpY == l	//dont draw selected, have it draw in regular main line, but alter the text
										{
											nameToDraw = combo_get_stat(weaponryComboList[| l],comboStats.name)
										}
										else
										{
											if weaponryComboList[| l] = comID eCol = c_aqua;
											var name = combo_get_stat(weaponryComboList[| l],comboStats.name);
											var ySep = l-sExpY;
											draw_text_colour(xPos,yPos+weaponryComboYExpSep*surfH*ySep,name,eCol,eCol,eCol,eCol,1.0);
										}
									}
								}
							
								draw_text_colour(xPos,yPos,nameToDraw,mCol,mCol,mCol,mCol,1.0);
							}
						}
					}
				}
	#endregion
	#region Offhand Weapons
				else
				{
						//surfaces
					draw_set_font(weaponryClassNameFont);
					draw_text(weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth,class_get_stat(class,weaponClassStats.name));
					draw_text((weaponryClassTextboxWidth*surfW-weaponryClassDetailSurfBorderWidth)*0.6,weaponryClassDetailSurfBorderWidth,"Exp: "+string(classCache[? playerClassStats.xp])+"/"+string(classCache[? playerClassStats.xpNeeded]));
					draw_set_halign(fa_right);
						draw_text(weaponryClassTextboxWidth*surfW-weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth,"Lv: "+string(classCache[? playerClassStats.level]));
			
					draw_set_halign(fa_left);
				
					if slotExpanded && sY == i
					{
						//draw slots
							//subtypes
								//initials
						var initialX = weaponryClassDetailSurfBorderWidth+weaponrySubtypeX*surfW;
						var initialY = weaponryClassDetailSurfBorderWidth+weaponrySubtypeY*surfH;
						var sepX = weaponrySubtypeXSep*surfW;
						var sepY = weaponrySubtypeYSep*surfH;
						
						for (var j = 0; j < 12; j++)
						{
							var xInd = j%weaponrySubtypeIconRowSize;
							var yInd = floor(j/weaponrySubtypeIconRowSize);
							
							var blend = c_gray;
							if j == sExpX && weaponryGroundComboSelected blend = c_white;
							draw_sprite_ext(spr_weaponry_slot,0,initialX+sepX*xInd,initialY+sepY*yInd,weaponrySubtypeIconScale,weaponrySubtypeIconScale,0,blend,1.0);
						}
							//actives
								//initials
						var initialX = weaponryClassDetailSurfBorderWidth+weaponryActiveX*surfW;
						var initialY = weaponryClassDetailSurfBorderWidth+weaponryActiveY*surfH;
						var sepX = weaponryActiveXSep*surfW;
						var sepY = weaponryActiveYSep*surfH;
						
						for (var j = 0; j < 12; j++)
						{
							var xInd = j%weaponryActiveIconRowSize;
							var yInd = floor(j/weaponryActiveIconRowSize);
							
							var blend = c_gray;
							if j == sExpX && !weaponryGroundComboSelected blend = c_white;
							draw_sprite_ext(spr_weaponry_slot,0,initialX+sepX*xInd,initialY+sepY*yInd,weaponryActiveIconScale,weaponryActiveIconScale,0,blend,1.0);
						}
						
						//subtypes
							//title
						var strH = string_height(" ");
						draw_set_font(fnt_alagard);
						draw_text(weaponryClassDetailSurfBorderWidth+weaponrySubtypeTitleX*surfW,weaponryClassDetailSurfBorderWidth+weaponrySubtypeTitleY*surfH,"Subtype");
						draw_set_halign(fa_right);
							draw_text((weaponryClassTextboxWidth-weaponrySubtypeTitleX)*surfW-weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth+weaponrySubtypeTitleY*surfH,"Memory: "+string(weaponrySubtypeMemoryUsage)+"/"+string(weaponryMaxMemory));
						draw_set_halign(fa_left);
							//slots
								//initials
						var initialX = weaponryClassDetailSurfBorderWidth+weaponrySubtypeX*surfW;
						var initialY = weaponryClassDetailSurfBorderWidth+weaponrySubtypeY*surfH;
						var sepX = weaponrySubtypeXSep*surfW;
						var sepY = weaponrySubtypeYSep*surfH;
						
						var count = 0;
								//get data and draw
						for(var j = 0; j < ds_list_size(weaponrySubtypeList); j++)
						{
							var xInd = count%weaponrySubtypeIconRowSize;
							var yInd = floor(count/weaponrySubtypeIconRowSize);
							var subtypeID = weaponrySubtypeList[| j];
							var indexNum = weaponrySubtypeIndexList[| j];
							//var selectX = sExpX%weaponrySubtypeIconRowSize;
							//var selectY = floor(sExpX/weaponrySubtypeIconRowSize);
							
							var blend = c_gray;
							if indexNum != -1 blend = c_white;
							if subtypeID != noone var subIcon = subtype_get_stat(subtypeID,offhandSubtypeStats.icon);
							else var subIcon = spr_icon_unknown;
							
							draw_sprite_ext(subIcon,0,initialX+sepX*xInd,initialY+sepY*yInd,weaponrySubtypeIconScale,weaponrySubtypeIconScale,0,blend,1.0);
							if count == sExpX && weaponryGroundComboSelected draw_sprite_ext(spr_icon_select_2,0,initialX+sepX*xInd,initialY+sepY*yInd,weaponrySubtypeIconScale,weaponrySubtypeIconScale,0,c_white,1.0);
							draw_set_font(fnt_small_pixel);
							draw_set_halign(fa_right);
								if indexNum != -1 draw_text(initialX+sprite_get_width(spr_icon_template_2)*weaponrySubtypeIconScale+sepX*xInd,initialY+sepY*yInd,string(indexNum+1));
							draw_set_valign(fa_bottom);
								if subtypeID != noone draw_text(initialX+sprite_get_width(spr_icon_template_2)*weaponrySubtypeIconScale+sepX*xInd,initialY+sprite_get_height(spr_icon_template_2)*weaponrySubtypeIconScale+sepY*yInd,string(subtype_get_stat(subtypeID,offhandSubtypeStats.memoryUsage)));		//change this
							draw_set_halign(fa_left);
							draw_set_valign(fa_top);
							
							count++;
						}
						
						//Actives
							//title
						var strH = string_height(" ");
						draw_set_font(fnt_alagard);
						draw_text(weaponryClassDetailSurfBorderWidth+weaponryActiveTitleX*surfW,weaponryClassDetailSurfBorderWidth+weaponryActiveTitleY*surfH,"Active Abilities");
						draw_set_halign(fa_right);
							draw_text((weaponryClassTextboxWidth-weaponryActiveTitleX)*surfW-weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth+weaponryActiveTitleY*surfH,"Memory: "+string(weaponryActiveMemoryUsage)+"/"+string(weaponryMaxMemory));
						draw_set_halign(fa_left);
							//slots
								//initials
						var initialX = weaponryClassDetailSurfBorderWidth+weaponryActiveX*surfW;
						var initialY = weaponryClassDetailSurfBorderWidth+weaponryActiveY*surfH;
						var sepX = weaponryActiveXSep*surfW;
						var sepY = weaponryActiveYSep*surfH;
						
						var count = 0;
								//get data and draw
						for(var j = 0; j < ds_list_size(weaponryActiveList); j++)
						{
							var xInd = count%weaponryActiveIconRowSize;
							var yInd = floor(count/weaponryActiveIconRowSize);
							var activeID = weaponryActiveList[| j];
							var indexNum = weaponryActiveIndexList[| j];
							//var selectX = sExpX%weaponryActiveIconRowSize;
							//var selectY = floor(sExpX/weaponryActiveIconRowSize);
							
							var blend = c_gray;
							if indexNum != -1 blend = c_white;
							if activeID != noone var subIcon = activeAbility_get_stat(activeID,activeAbilityStats.icon);
							else var subIcon = spr_icon_unknown;
							
							draw_sprite_ext(subIcon,0,initialX+sepX*xInd,initialY+sepY*yInd,weaponryActiveIconScale,weaponryActiveIconScale,0,blend,1.0);
							if count == sExpX && !weaponryGroundComboSelected draw_sprite_ext(spr_icon_select_2,0,initialX+sepX*xInd,initialY+sepY*yInd,weaponryActiveIconScale,weaponryActiveIconScale,0,c_white,1.0);
							draw_set_font(fnt_small_pixel);
							draw_set_halign(fa_right);
								if indexNum != -1 draw_text(initialX+sprite_get_width(spr_icon_template_2)*weaponryActiveIconScale+sepX*xInd,initialY+sepY*yInd,string(indexNum+1));
							draw_set_valign(fa_bottom);
								if activeID != noone draw_text(initialX+sprite_get_width(spr_icon_template_2)*weaponryActiveIconScale+sepX*xInd,initialY+sprite_get_height(spr_icon_template_2)*weaponryActiveIconScale+sepY*yInd,string(activeAbility_get_stat(activeID,activeAbilityStats.memoryUsage)));		//change this
							draw_set_halign(fa_left);
							draw_set_valign(fa_top);
							
							count++;
						}
					}
				}
	#endregion
						//apply cutout
				gpu_set_blendmode(bm_subtract);
					draw_surface(weaponryClassDetailSurfStencil,0,0);
				gpu_set_blendmode(bm_normal);
			surface_reset_target();
			
					//draw details
						//mod points
			x1 -= weaponryMainSurfXOffset*surfW;
			x2 -= weaponryMainSurfXOffset*surfW;
			y1 -= weaponryMainSurfYOffset*surfH;
			y2 -= weaponryMainSurfYOffset*surfH;
						//draw
			surface_set_target(weaponryMainSurf);
				scr_draw_textbox(x1,y1,x2,y2,weaponryClassTextboxType,weaponryClassTextboxScale,col)
				draw_surface(weaponryClassDetailSurf,x1,y1);
			surface_reset_target();
		}	
	}
	draw_surface(weaponryMainSurf,weaponryMainSurfXOffset*surfW,weaponryMainSurfYOffset*surfH);
#endregion
#region Details

	//textbox
scr_draw_textbox(surfW*weaponryDetailsX1,surfH*weaponryDetailsY1,surfW*weaponryDetailsX2,surfH*weaponryDetailsY2,weaponryDetailsType,weaponryDetailsScale,weaponryDetailsColour);

if slotExpanded
{
	var main1ID = ItemCache.equipment[? equipmentSlot.main1];
	var main2ID = ItemCache.equipment[? equipmentSlot.main2];
	var main1Class = weapon_get_stat(main1ID,weaponStats.type);
	var main2Class = weapon_get_stat(main2ID,weaponStats.type);
	var off1ID = ItemCache.equipment[? equipmentSlot.off1];
	var off2ID = ItemCache.equipment[? equipmentSlot.off2];
	var off1Class = weapon_get_stat(off1ID,weaponStats.type);
	var off2Class = weapon_get_stat(off2ID,weaponStats.type);
	
	var class = current_menu_options[0, sY];
	var isMain = class_get_stat(class,weaponClassStats.isMain);
	
	if isMain
	{
		#region Main
			//pre
		var selectedComboID = weaponryComboList[| sExpY];
	
		if selectedComboID != undefined && selectedComboID != noone
		{
			//name
			var comboName = combo_get_stat(selectedComboID,comboStats.name);
			draw_set_font(weaponryDetailsNameFont);
			draw_set_halign(fa_center);
			draw_set_colour(c_white);
			draw_text(weaponryDetailsNameX*surfW,weaponryDetailsNameY*surfH,comboName);
			draw_set_halign(fa_left);
				//animation
					//pre
			var comboAnim = combo_get_stat(selectedComboID,comboStats.animation);
			var comboAnimDuration = combo_get_stat(selectedComboID,comboStats.duration) + combo_get_stat(selectedComboID,comboStats.cooldown);
			weaponryDetailsAnimationTimer++;
			var frameTimer = weaponryDetailsAnimationTimer%((comboAnimDuration)*room_speed);
			var animX = weaponryDetailsAnimationX*surfW;
			var animY = weaponryDetailsAnimationY*surfH;
					//body
			var frameStep = round(comboAnimDuration*room_speed/sprite_get_number(comboAnim));
			draw_sprite_ext(comboAnim,floor(frameTimer/frameStep),animX,animY,weaponryDetailsAnimationScale,weaponryDetailsAnimationScale,0,c_white,1.0);
					//weapon
			var weaponID = noone;
			     if class == main1Class weaponID = ItemCache.equipment[? equipmentSlot.main1];
			else if class == main2Class weaponID = ItemCache.equipment[? equipmentSlot.main2];
			else if class == off1Class weaponID = ItemCache.equipment[? equipmentSlot.off1];
			else if class == off1Class weaponID = ItemCache.equipment[? equipmentSlot.off2];
			
			if weaponID == noone weaponID = class_get_stat(class,weaponClassStats.defaultWeaponID);
			var weaponStr = item_get_data(itemType.weapon,weaponID,itemStats.name);
			var weaponCatStr = class_get_stat(class,weaponClassStats.name);
			
			var weaponSpriteName = string_replace(sprite_get_name(comboAnim),"Body","Weapon");
			weaponSpriteName = string_replace(weaponSpriteName,weaponCatStr,weaponStr);
			weaponSpriteName = string_replace(weaponSpriteName,"Default",weaponStr);
			if asset_get_type(weaponSpriteName) == asset_sprite var comboAnimWeapon = asset_get_index(weaponSpriteName);
			else var comboAnimWeapon = noone;
			if comboAnimWeapon != noone draw_sprite_ext(comboAnimWeapon,floor(frameTimer/frameStep),weaponryDetailsAnimationX*surfW,weaponryDetailsAnimationY*surfH,weaponryDetailsAnimationScale,weaponryDetailsAnimationScale,0,c_white,1.0);
					//effect
			var effectSpriteName = string_replace(sprite_get_name(comboAnim),"Body","Effect");
			var hitStartList = combo_get_stat(selectedComboID,comboStats.hitStart);
			var hitDurationList = combo_get_stat(selectedComboID,comboStats.hitDuration);
			if asset_get_type(effectSpriteName) == asset_sprite for (var i = 0; i < ds_list_size(hitStartList); i++)
			{
				var hitStart = hitStartList[| i];
				var hitDuration = hitDurationList[| i];
				if frameTimer >= round(hitStart*room_speed) && frameTimer < round((hitStart+hitDuration)*room_speed)
				{
					var effectFrameStep = hitDuration*room_speed/sprite_get_number(asset_get_index(effectSpriteName));
					var subImg = floor((frameTimer-round(hitStart*room_speed))/effectFrameStep);
					if i == weaponryDetailsSelectedHit var alpha = 1.0;
					else var alpha = 0.5;
					draw_sprite_ext(asset_get_index(effectSpriteName),subImg,animX,animY,weaponryDetailsAnimationScale,weaponryDetailsAnimationScale,0,c_white,alpha);
				}
			}
				//description
			var comboDesc = combo_get_stat(selectedComboID,comboStats.description);
			draw_set_font(weaponryDetailsDescriptionFont);
			draw_text_ext(weaponryDetailsDescriptionX*surfW,weaponryDetailsDescriptionY*surfH,comboDesc,weaponryDetailsDescriptionSep*surfH,weaponryDetailsDescriptionWidth*surfW);	
				//data
			draw_set_font(weaponryDetailsDataFont);
			var comboDamModList = combo_get_stat(selectedComboID,comboStats.damMod);
			var comboDamTypeList = combo_get_stat(selectedComboID,comboStats.damType);
			var comboForModList = combo_get_stat(selectedComboID,comboStats.forMod);
			var comboKnockbackList = combo_get_stat(selectedComboID,comboStats.knockback);
			var comboSpecTypeList = combo_get_stat(selectedComboID,comboStats.specType);
			var comboSpecDamList = combo_get_stat(selectedComboID,comboStats.specDam);
			var comboSpecialsList = combo_get_stat(selectedComboID,comboStats.specials);
					//selected hit-number
			var hitnum = ds_list_size(comboDamModList);
			if hitnum > 1
			{
					//descriptor
				draw_text(weaponryDetailsSelectedHitDescriptorX*surfW,weaponryDetailsSelectedHitDisplayY*surfH,"Hit Number:");
					//data
				weaponryDetailsSelectedHitDisplay += (weaponryDetailsSelectedHit-weaponryDetailsSelectedHitDisplay)/8;
				draw_set_font(weaponryDetailsSelectedHitFont);
				draw_set_halign(fa_center);
				for(var i = 0; i < hitnum; i++)
				{
					var col = c_gray;
					if i == weaponryDetailsSelectedHit col = c_white;
					var sep = i-weaponryDetailsSelectedHitDisplay;
					draw_text_color((weaponryDetailsSelectedHitDisplayX+sep*weaponryDetailsSelectedHitDisplayXSep)*surfW,(weaponryDetailsSelectedHitDisplayY)*surfH,string(i+1),col,col,col,col,abs(1-sep/2));
				}
				draw_set_halign(fa_left);
			}
					//basics
			ds_list_clear(weaponryDetailsDataList);
			ds_list_add(weaponryDetailsDataList,"Damage Modifier:");
			ds_list_add(weaponryDetailsDataList,"Damage Type:");
			ds_list_add(weaponryDetailsDataList,"Force Modifier:");
			ds_list_add(weaponryDetailsDataList,"Knockback:");
	
			ds_list_clear(weaponryDetailsDataValuesList);
			ds_list_add(weaponryDetailsDataValuesList,comboDamModList[| weaponryDetailsSelectedHit]);
			ds_list_add(weaponryDetailsDataValuesList,comboDamTypeList[| weaponryDetailsSelectedHit]);
			ds_list_add(weaponryDetailsDataValuesList,comboForModList[| weaponryDetailsSelectedHit]);
			ds_list_add(weaponryDetailsDataValuesList,comboKnockbackList[| weaponryDetailsSelectedHit]);
					//effects & specials
			var extraCount = 0;
			switch comboSpecTypeList[| weaponryDetailsSelectedHit]
			{
				case specialType.none:
					//do nothing
					break;
				case specialType.bleed:
					ds_list_insert(weaponryDetailsDataList,extraCount,"Bleed:");
					ds_list_insert(weaponryDetailsDataValuesList,extraCount,comboSpecDamList[| weaponryDetailsSelectedHit]);
					extraCount++;
					break;
			}
			switch comboSpecialsList[| weaponryDetailsSelectedHit]
			{
				case comboSpecial.none:
					//do nothing
					break;
				case comboSpecial.blink:
					ds_list_insert(weaponryDetailsDataList,extraCount,"Blink");
					ds_list_insert(weaponryDetailsDataValuesList,extraCount,noone);
					extraCount++;
					break;
				case comboSpecial.thunderbolt:
					ds_list_insert(weaponryDetailsDataList,extraCount,"Thunder Bolt");
					ds_list_insert(weaponryDetailsDataValuesList,extraCount,noone);
					extraCount++;
					break;
			}
					//draw
			draw_set_valign(fa_bottom);
			for(var i = ds_list_size(weaponryDetailsDataList)-1; i >= 0; i--)
			{
				var iValue = (ds_list_size(weaponryDetailsDataList)-1)-i;
				draw_set_halign(fa_left);
				draw_text(weaponryDetailsDataX*surfW,(weaponryDetailsDataY+weaponryDetailsDataSep*i)*surfH,weaponryDetailsDataList[| iValue]);
				draw_set_halign(fa_right);
				if weaponryDetailsDataValuesList[| iValue] != noone draw_text(weaponryDetailsDataValuesX*surfW,(weaponryDetailsDataY+weaponryDetailsDataSep*i)*surfH,weaponryDetailsDataValuesList[| iValue]);
			}
			draw_set_valign(fa_top);
			draw_set_halign(fa_left);
		}
		#endregion
	}
	else
	{
		#region Offhands
				//initial
			if weaponryGroundComboSelected var targetID = weaponrySubtypeList[| sExpX];
			else var targetID = weaponryActiveList[| sExpX];
		
			if targetID != noone && targetID != undefined
			{
				if weaponryGroundComboSelected
				{
					var targetName = subtype_get_stat(targetID,offhandSubtypeStats.name);
					var targetAnim = subtype_get_stat(targetID,offhandSubtypeStats.baseAnimation);
					var targetEffect = subtype_get_stat(targetID,offhandSubtypeStats.boundEffect);
				}
				else
				{
					var targetName = activeAbility_get_stat(targetID,activeAbilityStats.name);
					var targetAnim = activeAbility_get_stat(targetID,activeAbilityStats.baseAnimation);
					var targetEffect = activeAbility_get_stat(targetID,activeAbilityStats.boundEffect);
				}
					//name
				draw_set_font(weaponryDetailsNameFont);
				draw_set_halign(fa_center);
				draw_set_colour(c_white);
				draw_text(weaponryDetailsNameX*surfW,weaponryDetailsNameY*surfH,targetName);
				draw_set_halign(fa_left);
					//animation
				var animX = weaponryDetailsAnimationX*surfW;
				var animY = weaponryDetailsAnimationY*surfH;
						//bound effect
				if targetEffect != noone
				{
					if(weaponryBoundEffectSim == noone || !instance_exists(weaponryBoundEffectSim) || weaponryBoundEffectSim.boundEffect != targetEffect)
					{
						part_system_clear(ParticleController.pSysOveride); part_system_clear(ParticleController.pSysOveride2);
						instance_destroy(weaponryBoundEffectSim);
						instance_activate_object(Camera);
						weaponryBoundEffectSim = instance_create_depth(animX/4,animY/4,ParticleController.depth+1,obj_effect_persistent_simulation);
						
						with weaponryBoundEffectSim
						{
							boundEffect = targetEffect;
							switch class
							{
								case weaponClass.crossbow:
									x+=other.weaponryDetailsAnimationOffScale/4/2;
									radius = 2.4;
									intensity = 0.6;
									break;
								case weaponClass.grimoire:
									radius = 4;
									intensity = 1;
									break;
							}
						}
						instance_deactivate_object(Camera);
				
					}
			
					with ParticleController 
					{
						var effectID = other.weaponryBoundEffectSim;
						var toForce = effectID.forceInvert;
						forceInvert = !toForce;
				
						draw_surface_ext(particleSurfSim,0,0,4,4,0,c_white,1.0);
					}
				}
						//base sprite
				if targetAnim != noone && targetAnim != undefined
				{
					var animDuration = sprite_get_number(targetAnim)/sprite_get_speed(targetAnim);
					weaponryDetailsAnimationTimer++;
					var frameTimer = weaponryDetailsAnimationTimer%((animDuration)*room_speed);
					var frameStep = round(animDuration*room_speed/sprite_get_number(targetAnim));
					
					if weaponryGroundComboSelected var scale = weaponryDetailsAnimationOffScale;
					else var scale = weaponryDetailsAnimationOffScale;
					
					draw_sprite_ext(targetAnim,floor(frameTimer/frameStep),animX,animY,weaponryDetailsAnimationOffScale,weaponryDetailsAnimationOffScale,0,c_white,1.0);
				}
					//description
				if weaponryGroundComboSelected var desc = subtype_get_stat(targetID,offhandSubtypeStats.description);
				else var desc = activeAbility_get_stat(targetID,activeAbilityStats.description);
				draw_set_font(weaponryDetailsDescriptionFont);
				draw_text_ext(weaponryDetailsDescriptionX*surfW,weaponryDetailsDescriptionY*surfH,desc,weaponryDetailsDescriptionSep*surfH,weaponryDetailsDescriptionWidth*surfW);	
					//stats
				ds_list_clear(weaponryDetailsDataList);
				ds_list_clear(weaponryDetailsDataValuesList);
				if weaponryGroundComboSelected
				{
					ds_list_add(weaponryDetailsDataList,"Damage Modifier:");
					ds_list_add(weaponryDetailsDataList,"Damage Type:");
					ds_list_add(weaponryDetailsDataList,"Force Modifier:");
					ds_list_add(weaponryDetailsDataList,"Knockback:");
	
					ds_list_add(weaponryDetailsDataValuesList,subtype_get_stat(targetID,offhandSubtypeStats.damMod));
					ds_list_add(weaponryDetailsDataValuesList,subtype_get_stat(targetID,offhandSubtypeStats.damType));
					ds_list_add(weaponryDetailsDataValuesList,subtype_get_stat(targetID,offhandSubtypeStats.forMod));
					ds_list_add(weaponryDetailsDataValuesList,subtype_get_stat(targetID,offhandSubtypeStats.knockback));
					
					if subtype_get_stat(targetID,offhandSubtypeStats.manaCost) != 0
					{
						ds_list_add(weaponryDetailsDataList,"Mana Cost:");
						ds_list_add(weaponryDetailsDataValuesList,subtype_get_stat(targetID,offhandSubtypeStats.manaCost));
					}
					if subtype_get_stat(targetID,offhandSubtypeStats.ammoItem) != noone
					{
						ds_list_add(weaponryDetailsDataList,"Ammunition:");
						ds_list_add(weaponryDetailsDataValuesList,item_get_data(itemType.item,subtype_get_stat(targetID,offhandSubtypeStats.ammoItem),itemStats.name));
					}
				}
				else
				{
					if subtype_get_stat(targetID,offhandSubtypeStats.manaCost) != 0
					{
						ds_list_add(weaponryDetailsDataList,"Mana Cost:");
						ds_list_add(weaponryDetailsDataValuesList,subtype_get_stat(targetID,offhandSubtypeStats.manaCost));
					}
				}
						//draw
				draw_set_valign(fa_bottom);
				for(var i = ds_list_size(weaponryDetailsDataList)-1; i >= 0; i--)
				{
					var iValue = (ds_list_size(weaponryDetailsDataList)-1)-i;
					draw_set_halign(fa_left);
					draw_text(weaponryDetailsDataX*surfW,(weaponryDetailsDataY+weaponryDetailsDataSep*i)*surfH,weaponryDetailsDataList[| iValue]);
					draw_set_halign(fa_right);
					if weaponryDetailsDataValuesList[| iValue] != noone draw_text(weaponryDetailsDataValuesX*surfW,(weaponryDetailsDataY+weaponryDetailsDataSep*i)*surfH,weaponryDetailsDataValuesList[| iValue]);
				}
				draw_set_valign(fa_top);
				draw_set_halign(fa_left);
			}
		#endregion
	}
}
#endregion