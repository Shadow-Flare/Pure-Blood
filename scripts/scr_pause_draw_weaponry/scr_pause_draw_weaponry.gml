#region Main Classes
	if slotExpanded	weaponryExpandValue = clamp(weaponryExpandValue+1/(weaponryExpandDuration*room_speed),0,1);
	else weaponryExpandValue = clamp(weaponryExpandValue-1/(weaponryExpandDuration*room_speed),0,1);
	
	var dPrev = weaponrySExpYDisplayDifference;
	weaponrySExpYDisplayDifference -= sign(weaponrySExpYDisplayDifference)/(weaponrySExpYDisplayShiftDuration*room_speed);
	if sign(dPrev) != sign(weaponrySExpYDisplayDifference) weaponrySExpYDisplayDifference = 0;
	if abs(weaponrySExpYDisplayDifference) > 1 weaponrySExpYDisplayDifference = sign(weaponrySExpYDisplayDifference);

	for(var i = 0; i < array_length_2d(current_menu_options,0); i++)
	{
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
			if i > sY y1Mod = weaponryExpandValue*weaponryClassTextboxExpandedHeight;
			
			var y2Mod = 0
			if i == sY y2Mod = weaponryExpandValue*weaponryClassTextboxExpandedHeight;
			
			var x1 = weaponryClassTextboxX;
			var y1 = weaponryClassTextboxY+i*weaponryClassTextboxYSep+y1Mod;
			var x2 = x1+weaponryClassTextboxWidth;
			var y2 = y1+weaponryClassTextboxHeight+y2Mod;
			scr_draw_textbox(x1,y1,x2,y2,weaponryClassTextboxType,weaponryClassTextboxScale,col)
			
				//text & class details surface	
					//stencil
			surface_set_target(weaponryClassDetailSurfStencil);
				draw_clear(c_white);
				gpu_set_blendmode(bm_subtract)
					draw_rectangle(weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth,weaponryClassTextboxWidth-weaponryClassDetailSurfBorderWidth,weaponryClassTextboxHeight+y2Mod-weaponryClassDetailSurfBorderWidth,false);
				gpu_set_blendmode(bm_normal);
			surface_reset_target();
				
					//draw details
			surface_set_target(weaponryClassDetailSurf);
				draw_clear_alpha(c_black,0);
				
				draw_set_font(fnt_menu);
				draw_text(weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth,class_get_stat(class,weaponClassStats.name));
				draw_text((weaponryClassTextboxWidth-weaponryClassDetailSurfBorderWidth)*0.6,weaponryClassDetailSurfBorderWidth,"Exp: "+string(classCache[? playerClassStats.xp])+"/"+string(classCache[? playerClassStats.xpNeeded]));
				draw_set_halign(fa_right);
					draw_text(weaponryClassTextboxWidth-weaponryClassDetailSurfBorderWidth,weaponryClassDetailSurfBorderWidth,"Lv: "+string(classCache[? playerClassStats.level]));
			
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
							
							var xPos = weaponryClassDetailSurfBorderWidth+weaponryComboX+weaponryComboXSep*xSep;
							var yPos = weaponryComboY+weaponryComboYSep*floor(j/2)+1;
							
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
										draw_text_colour(xPos,yPos+weaponryComboYExpSep*ySep,name,eCol,eCol,eCol,eCol,1.0);
									}
								}
							}
							
							draw_text_colour(xPos,yPos,nameToDraw,mCol,mCol,mCol,mCol,1.0);
						}
					}
				}
						//apply cutout
				gpu_set_blendmode(bm_subtract);
					draw_surface(weaponryClassDetailSurfStencil,0,0);
				gpu_set_blendmode(bm_normal);
			surface_reset_target();
			
					//draw details
			draw_surface(weaponryClassDetailSurf,x1,y1);
		}	
	}
#endregion