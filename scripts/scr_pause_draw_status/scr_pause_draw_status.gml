#region initializer
var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);
#endregion

#region draw stat page boxes
	//textbox 1
scr_draw_textbox(statusTextbox1X1*surfW,statusTextbox1Y1*surfH,statusTextbox1X2*surfW,statusTextbox1Y2*surfH,statusTextbox1Type,statusTextbox1Scale,statusTextbox1Blend);
	//textbox 2
scr_draw_textbox(statusTextbox2X1*surfW,statusTextbox2Y1*surfH,statusTextbox2X2*surfW,statusTextbox2Y2*surfH,statusTextbox2Type,statusTextbox2Scale,statusTextbox2Blend);
	//textbox 3
scr_draw_textbox(statusTextbox3X1*surfW,statusTextbox3Y1*surfH,statusTextbox3X2*surfW,statusTextbox3Y2*surfH,statusTextbox3Type,statusTextbox3Scale,statusTextbox3Blend);
	//textbox 4
scr_draw_textbox(statusTextbox4X1*surfW,statusTextbox4Y1*surfH,statusTextbox4X2*surfW,statusTextbox4Y2*surfH,statusTextbox4Type,statusTextbox4Scale,statusTextbox4Blend);

#endregion
#region primary stats
	#region get data
var str = PlayerStats.strength;
var con = PlayerStats.constitution;
var dex = PlayerStats.dexterity;
var cun = PlayerStats.cunning;
var int = PlayerStats.intelligence;
var wil = PlayerStats.willpower
var bStr = PlayerStats.strengthBase;
var bCon = PlayerStats.constitutionBase;
var bDex = PlayerStats.dexterityBase;
var bCun = PlayerStats.cunningBase;
var bInt = PlayerStats.intelligenceBase;
var bWil = PlayerStats.willpowerBase;

var index = 0;

draw_set_font(fnt_alagard);
var strH = string_height(" ");
var ySep = ((statusPrimaryY2-statusPrimaryY1)*surfH-strH)/(statusPrimaryStatNum);
	#endregion
	#region draw selection Glow
	var xx = statusPrimaryX1*surfW;
	if selection != noone && selection != 0 var drawBool = true;
	switch selection
	{
		case "Strength":		var index = 1;	break;
		case "Constitution":	var index = 2;	break;
		case "Dexterity":		var index = 3;	break;
		case "Cunning":			var index = 4;	break;
		case "Intelligence":	var index = 5;	break;
		case "Willpower":		var index = 6;	break;
	}
	var yy = (statusPrimaryY1)*surfH+ySep*index;
	var sprW = sprite_get_width(statusPrimarySelectionSprite);
	var sprH = sprite_get_height( statusPrimarySelectionSprite);
	draw_sprite_ext(statusPrimarySelectionSprite,0,xx,yy,statusPrimarySelectionSpriteW/sprW,statusPrimarySelectionSpriteH/sprH,0,statusPrimarySelectionSpriteBlend,statusPrimarySelectionSpriteAlpha);
	#endregion
	#region draw Data names
draw_set_colour(statusPrimaryColour);
var index = 0;
draw_set_halign(fa_left);
draw_text(statusPrimaryX1*surfW,(statusPrimaryY1)*surfH+ySep*index,"  Primary Stats"); index++;
draw_text(statusPrimaryX1*surfW,(statusPrimaryY1)*surfH+ySep*index,"Strength"); index++;
draw_text(statusPrimaryX1*surfW,(statusPrimaryY1)*surfH+ySep*index,"Constitution"); index++;
draw_text(statusPrimaryX1*surfW,(statusPrimaryY1)*surfH+ySep*index,"Dexterity"); index++;
draw_text(statusPrimaryX1*surfW,(statusPrimaryY1)*surfH+ySep*index,"Cunning"); index++;
draw_text(statusPrimaryX1*surfW,(statusPrimaryY1)*surfH+ySep*index,"Intelligence"); index++;
draw_text(statusPrimaryX1*surfW,(statusPrimaryY1)*surfH+ySep*index,"WillPower"); index++;
	#endregion
	#region data values
index = 0;		//reset
draw_set_halign(fa_center);
var arrRight = false;
if PlayerStats.statPoints != 0 arrRight = true;

	//stat points data
if PlayerStats.statPoints != 0 || statPointsTemp != 0
{
	var sprH = sprite_get_height(statusPrimaryStatPointSprite);
	var sprW = sprite_get_width(statusPrimaryStatPointSprite);
	draw_sprite_ext(statusPrimaryStatPointSprite,0,(statusPrimaryX2)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryStatPointSpriteW/sprW,statusPrimaryStatPointSpriteH/sprH,0,c_black,1.0);
	draw_text((statusPrimaryX2)*surfW,(statusPrimaryY1)*surfH+ySep*index,string(PlayerStats.statPoints));
}
index++;

	//stats
draw_set_colour(statusPrimaryColour);
if str != strengthTemp
{
	draw_sprite_ext(statusPrimaryArrowSprite,0,(statusPrimaryX2-statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
	draw_set_colour(c_green);
}
if arrRight draw_sprite_ext(statusPrimaryArrowSprite,1,(statusPrimaryX2+statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
draw_text((statusPrimaryX2)*surfW,(statusPrimaryY1)*surfH+ySep*index,string(str)); index++;

draw_set_colour(statusPrimaryColour);
if con != constitutionTemp
{
	draw_sprite_ext(statusPrimaryArrowSprite,0,(statusPrimaryX2-statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
	draw_set_colour(c_green);
}
if arrRight draw_sprite_ext(statusPrimaryArrowSprite,1,(statusPrimaryX2+statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
draw_text((statusPrimaryX2)*surfW,(statusPrimaryY1)*surfH+ySep*index,string(con)); index++;

draw_set_colour(statusPrimaryColour);
if dex != dexterityTemp
{
	draw_sprite_ext(statusPrimaryArrowSprite,0,(statusPrimaryX2-statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
	draw_set_colour(c_green);
}
if arrRight draw_sprite_ext(statusPrimaryArrowSprite,1,(statusPrimaryX2+statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
draw_text((statusPrimaryX2)*surfW,(statusPrimaryY1)*surfH+ySep*index,string(dex)); index++;

draw_set_colour(statusPrimaryColour);
if cun != cunningTemp
{
	draw_sprite_ext(statusPrimaryArrowSprite,0,(statusPrimaryX2-statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
	draw_set_colour(c_green);
}
if arrRight draw_sprite_ext(statusPrimaryArrowSprite,1,(statusPrimaryX2+statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
draw_text((statusPrimaryX2)*surfW,(statusPrimaryY1)*surfH+ySep*index,string(cun)); index++;

draw_set_colour(statusPrimaryColour);
if int != intelligenceTemp
{
	draw_sprite_ext(statusPrimaryArrowSprite,0,(statusPrimaryX2-statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
	draw_set_colour(c_green);
}
if arrRight draw_sprite_ext(statusPrimaryArrowSprite,1,(statusPrimaryX2+statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
draw_text((statusPrimaryX2)*surfW,(statusPrimaryY1)*surfH+ySep*index,string(int)); index++;

draw_set_colour(statusPrimaryColour);
if wil != willpowerTemp
{
	draw_sprite_ext(statusPrimaryArrowSprite,0,(statusPrimaryX2-statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
	draw_set_colour(c_green);
}
if arrRight draw_sprite_ext(statusPrimaryArrowSprite,1,(statusPrimaryX2+statusPrimaryArrowXOffset)*surfW,(statusPrimaryY1)*surfH+ySep*index+strH/2,statusPrimaryArrowScale,statusPrimaryArrowScale,0,c_white,1.0);
draw_text((statusPrimaryX2)*surfW,(statusPrimaryY1)*surfH+ySep*index,string(wil)); index++;

draw_set_halign(fa_left);
	#endregion
#endregion
#region Stats Page
switch statusPage
{
	case 0: #region Weapon Information
			#region set up data
			
				//weapon damage values
		var wepID1 = scr_player_equipment_slot(equipmentSlot.main1);
		scr_player_get_weapon_damage(wepID1,PlayerStats.weaponMain1DamageDetails,PlayerStats.strength,PlayerStats.dexterity,PlayerStats.cunning,PlayerStats.intelligence);
		scr_player_get_weapon_damage(wepID1,_weaponMain1DamageDetails,strengthTemp,dexterityTemp,cunningTemp,intelligenceTemp);
		var wepID2 = scr_player_equipment_slot(equipmentSlot.main2);
		scr_player_get_weapon_damage(wepID2,PlayerStats.weaponMain2DamageDetails,PlayerStats.strength,PlayerStats.dexterity,PlayerStats.cunning,PlayerStats.intelligence);
		scr_player_get_weapon_damage(wepID2,_weaponMain2DamageDetails,strengthTemp,dexterityTemp,cunningTemp,intelligenceTemp);
		var wepID3 = scr_player_equipment_slot(equipmentSlot.off1);
		scr_player_get_weapon_damage(wepID3,PlayerStats.weaponOff1DamageDetails,PlayerStats.strength,PlayerStats.dexterity,PlayerStats.cunning,PlayerStats.intelligence);
		scr_player_get_weapon_damage(wepID3,_weaponOff1DamageDetails,strengthTemp,dexterityTemp,cunningTemp,intelligenceTemp);
		var wepID4 = scr_player_equipment_slot(equipmentSlot.off2);
		scr_player_get_weapon_damage(wepID4,PlayerStats.weaponOff2DamageDetails,PlayerStats.strength,PlayerStats.dexterity,PlayerStats.cunning,PlayerStats.intelligence);
		scr_player_get_weapon_damage(wepID4,_weaponOff2DamageDetails,strengthTemp,dexterityTemp,cunningTemp,intelligenceTemp);
		
				//textbox data
		var tX1 = statusTextbox4X1*surfW;
		var tY1 = statusTextbox4Y1*surfH;
		var tX2 = statusTextbox4X2*surfW;
		var tY2 = statusTextbox4Y2*surfH;
		var tXIcon = statusPage1WeaponIconBoxWidth*surfW;
		var tYSep = (tY2-tY1)/4;
		
				//boundaries
		var length1 = tX2-tXIcon-tX1-(statusPage1BoundaryMainGap)*2;
		var length2 = tYSep-statusPage1BoundaryMainY-(statusPage1BoundarySubGap)*2-(4*4);
		var b1X = statusPage1BoundaryMainGap;
		var b1Y = statusPage1BoundaryMainY;
		var b2X = statusPage1BoundarySubX;
		var b2Y = statusPage1BoundaryMainY+statusPage1BoundarySubGap;
		var b3X = statusPage1BoundarySubX*2;
		var b3Y = statusPage1BoundaryMainY+statusPage1BoundarySubGap;
		var bSprL = sprite_get_height(statusPage1BoundarySprite);
		
				//icon data
		var iconXOff = (tXIcon-sprite_get_width(spr_icon_item_TEMPLATE)*statusPage1WeaponIconScale)/2;
		var iconYOff = (tYSep-sprite_get_height(spr_icon_item_TEMPLATE)*statusPage1WeaponIconScale)/2;
		
				//name Data
		var nX = tX1+statusPage1NameXOffset*surfW;
		var nY = tY1+statusPage1NameYOffset*surfH;
		
				//damage Data
		draw_set_font(statusPage1DataNameFont);
		var strH = string_height(" ");
		var dXSep = statusPage1BoundarySubX;
		var dYSep = (tYSep-b1Y-strH)/(statusPage1DataColumn-1);
		var dNX = statusPage1DataXMargin*surfW+(4*4);
		var dNY = statusPage1DataXMargin*surfW;
		var dVX = statusPage1BoundarySubX-statusPage1DataXMargin*8*surfW;
		var dVY = dNY;
		var dAX = statusPage1BoundarySubX-statusPage1DataXMargin*4*surfW;
		var dAY = dNY;
		
			#endregion
			#region Textboxes
		var index = 0;
		scr_draw_textbox(tX1,tY1+index*tYSep,tX2-tXIcon,tY1+(index+1)*tYSep,statusPage1WeaponTextboxType,statusPage1WeaponTextboxScale,statusPage1WeaponTextboxMainBlend); index++;
		scr_draw_textbox(tX1,tY1+index*tYSep,tX2-tXIcon,tY1+(index+1)*tYSep,statusPage1WeaponTextboxType,statusPage1WeaponTextboxScale,statusPage1WeaponTextboxMainBlend); index++;
		scr_draw_textbox(tX1,tY1+index*tYSep,tX2-tXIcon,tY1+(index+1)*tYSep,statusPage1WeaponTextboxType,statusPage1WeaponTextboxScale,statusPage1WeaponTextboxOffBlend); index++;
		scr_draw_textbox(tX1,tY1+index*tYSep,tX2-tXIcon,tY1+(index+1)*tYSep,statusPage1WeaponTextboxType,statusPage1WeaponTextboxScale,statusPage1WeaponTextboxOffBlend); index++;
		var index = 0;
		scr_draw_textbox(tX2-tXIcon,tY1+index*tYSep,tX2,tY1+(index+1)*tYSep,statusPage1WeaponTextboxType,statusPage1WeaponTextboxScale,statusPage1WeaponTextboxIconBlend); index++;
		scr_draw_textbox(tX2-tXIcon,tY1+index*tYSep,tX2,tY1+(index+1)*tYSep,statusPage1WeaponTextboxType,statusPage1WeaponTextboxScale,statusPage1WeaponTextboxIconBlend); index++;
		scr_draw_textbox(tX2-tXIcon,tY1+index*tYSep,tX2,tY1+(index+1)*tYSep,statusPage1WeaponTextboxType,statusPage1WeaponTextboxScale,statusPage1WeaponTextboxIconBlend); index++;
		scr_draw_textbox(tX2-tXIcon,tY1+index*tYSep,tX2,tY1+(index+1)*tYSep,statusPage1WeaponTextboxType,statusPage1WeaponTextboxScale,statusPage1WeaponTextboxIconBlend); index++;
			#endregion
			#region Boundaries
			
				//boundary1
			var index = 0;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b1X,tY1+tYSep*index+b1Y,statusPage1BoundaryThickness,length1/bSprL,90,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b1X,tY1+tYSep*index+b1Y,statusPage1BoundaryThickness,length1/bSprL,90,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b1X,tY1+tYSep*index+b1Y,statusPage1BoundaryThickness,length1/bSprL,90,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b1X,tY1+tYSep*index+b1Y,statusPage1BoundaryThickness,length1/bSprL,90,c_white,1.0); index++;
				//boundary2
			var index = 0;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b2X,tY1+tYSep*index+b2Y,statusPage1BoundaryThickness,length2/bSprL,0,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b2X,tY1+tYSep*index+b2Y,statusPage1BoundaryThickness,length2/bSprL,0,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b2X,tY1+tYSep*index+b2Y,statusPage1BoundaryThickness,length2/bSprL,0,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b2X,tY1+tYSep*index+b2Y,statusPage1BoundaryThickness,length2/bSprL,0,c_white,1.0); index++;
				//boundary3
			var index = 0;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b3X,tY1+tYSep*index+b3Y,statusPage1BoundaryThickness,length2/bSprL,0,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b3X,tY1+tYSep*index+b3Y,statusPage1BoundaryThickness,length2/bSprL,0,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b3X,tY1+tYSep*index+b3Y,statusPage1BoundaryThickness,length2/bSprL,0,c_white,1.0); index++;
			draw_sprite_ext(statusPage1BoundarySprite,0,tX1+b3X,tY1+tYSep*index+b3Y,statusPage1BoundaryThickness,length2/bSprL,0,c_white,1.0); index++;		

			#endregion
			#region Icons
		var index = 0;
		var icon = item_get_data(itemType.weapon,wepID1,itemStats.icon);
		draw_sprite_ext(icon,0,tX2-tXIcon+iconXOff,tY1+tYSep*index+iconYOff,statusPage1WeaponIconScale,statusPage1WeaponIconScale,0,c_white,1.0); index++;
		var icon = item_get_data(itemType.weapon,wepID2,itemStats.icon);
		draw_sprite_ext(icon,0,tX2-tXIcon+iconXOff,tY1+tYSep*index+iconYOff,statusPage1WeaponIconScale,statusPage1WeaponIconScale,0,c_white,1.0); index++;
		var icon = item_get_data(itemType.weapon,wepID3,itemStats.icon);
		draw_sprite_ext(icon,0,tX2-tXIcon+iconXOff,tY1+tYSep*index+iconYOff,statusPage1WeaponIconScale,statusPage1WeaponIconScale,0,c_white,1.0); index++;
		var icon = item_get_data(itemType.weapon,wepID4,itemStats.icon);
		draw_sprite_ext(icon,0,tX2-tXIcon+iconXOff,tY1+tYSep*index+iconYOff,statusPage1WeaponIconScale,statusPage1WeaponIconScale,0,c_white,1.0); index++;
			#endregion
			#region Names
		draw_set_colour(statusPage1NameColour);
		draw_set_font(statusPage1NameFont);
		var index = 0;
		var name = item_get_data(itemType.weapon,wepID1,itemStats.name);
		draw_text(nX,nY+tYSep*index,name); index++;
		var name = item_get_data(itemType.weapon,wepID2,itemStats.name);
		draw_text(nX,nY+tYSep*index,name); index++;
		var name = item_get_data(itemType.weapon,wepID3,itemStats.name);
		draw_text(nX,nY+tYSep*index,name); index++;
		var name = item_get_data(itemType.weapon,wepID4,itemStats.name);
		draw_text(nX,nY+tYSep*index,name); index++;
			#endregion
			#region Damage Data
			//weapon 1
		var index = 0;
		scr_pause_status_updateWeaponsList(_weaponMain1DamageDetails,wepID1);
		for(var i = 0; i < ds_list_size(_weaponDataList); i++)
		{
			var yPos = i%2;
			var xPos = floor(i/2);
			var tXPos = tX1;
			var tYPos = tY1+b1Y+tYSep*index;
			draw_set_font(statusPage1DataNameFont);
			draw_set_colour(statusPage1DataNameColour);
				draw_text(tXPos+dNX+xPos*dXSep,tYPos+dNY+dYSep*yPos,_weaponDataList[| i]);
			draw_set_halign(fa_middle);
			draw_set_font(statusPage1DataValueFont);
			draw_set_colour(statusPage1DataValueColour);
				draw_text(tXPos+dVX+xPos*dXSep,tYPos+dVY+dYSep*yPos,_weaponDataListValuesBase[| i]);
				draw_text(tXPos+dAX+xPos*dXSep,tYPos+dAY+dYSep*yPos,_weaponDataListValues[| i]);
			draw_set_halign(fa_left);
		}

			//weapon 2
		index++;
		scr_pause_status_updateWeaponsList(_weaponMain2DamageDetails,wepID2);
		for(var i = 0; i < ds_list_size(_weaponDataList); i++)
		{
			var yPos = i%2;
			var xPos = floor(i/2);
			var tXPos = tX1;
			var tYPos = tY1+b1Y+tYSep*index;
			draw_set_font(statusPage1DataNameFont);
			draw_set_colour(statusPage1DataNameColour);
				draw_text(tXPos+dNX+xPos*dXSep,tYPos+dNY+dYSep*yPos,_weaponDataList[| i]);
			draw_set_halign(fa_middle);
			draw_set_font(statusPage1DataValueFont);
			draw_set_colour(statusPage1DataValueColour);
				draw_text(tXPos+dVX+xPos*dXSep,tYPos+dVY+dYSep*yPos,_weaponDataListValuesBase[| i]);
				draw_text(tXPos+dAX+xPos*dXSep,tYPos+dAY+dYSep*yPos,_weaponDataListValues[| i]);
			draw_set_halign(fa_left);
		}
			
			//weapon 3
		index++;
		scr_pause_status_updateWeaponsList(_weaponOff1DamageDetails,wepID3);
		for(var i = 0; i < ds_list_size(_weaponDataList); i++)
		{
			var yPos = i%2;
			var xPos = floor(i/2);
			var tXPos = tX1;
			var tYPos = tY1+b1Y+tYSep*index;
			draw_set_font(statusPage1DataNameFont);
			draw_set_colour(statusPage1DataNameColour);
				draw_text(tXPos+dNX+xPos*dXSep,tYPos+dNY+dYSep*yPos,_weaponDataList[| i]);
			draw_set_halign(fa_middle);
			draw_set_font(statusPage1DataValueFont);
			draw_set_colour(statusPage1DataValueColour);
				draw_text(tXPos+dVX+xPos*dXSep,tYPos+dVY+dYSep*yPos,_weaponDataListValuesBase[| i]);
				draw_text(tXPos+dAX+xPos*dXSep,tYPos+dAY+dYSep*yPos,_weaponDataListValues[| i]);
			draw_set_halign(fa_left);
		}
			
			//weapon 4
		index++;
		scr_pause_status_updateWeaponsList(_weaponOff2DamageDetails,wepID4);
		for(var i = 0; i < ds_list_size(_weaponDataList); i++)
		{
			var yPos = i%2;
			var xPos = floor(i/2);
			var tXPos = tX1;
			var tYPos = tY1+b1Y+tYSep*index;
			draw_set_font(statusPage1DataNameFont);
			draw_set_colour(statusPage1DataNameColour);
				draw_text(tXPos+dNX+xPos*dXSep,tYPos+dNY+dYSep*yPos,_weaponDataList[| i]);
			draw_set_halign(fa_middle);
			draw_set_font(statusPage1DataValueFont);
			draw_set_colour(statusPage1DataValueColour);
				draw_text(tXPos+dVX+xPos*dXSep,tYPos+dVY+dYSep*yPos,_weaponDataListValuesBase[| i]);
				draw_text(tXPos+dAX+xPos*dXSep,tYPos+dAY+dYSep*yPos,_weaponDataListValues[| i]);
			draw_set_halign(fa_left);
		}
		
			#endregion
		break; #endregion
	case 1: #region Defensive and misc stats
		draw_set_font(fnt_alagard);
		draw_set_colour(c_white);
			#region names
				//Phys Defence
		var xPos = 0;
		var yPos = 0;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Physical Defense:");
				//slash	
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Slash Defense:");
				//pierce
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Pierce Defense:");
				//blunt
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Blunt Defense:");
				//fire (skip 1)
		yPos++;
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Fire Resistance:");
				//ice
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Ice Resistance:");
				//lightning
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Lightning Resistance:");
				//arcane
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Arcane Resistance:");
				//light
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Light Resistance:");
				//dark
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Dark Resistance:");
				//bleed (skip 1)
		yPos++;
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Bleed Resistance:");
				//poison
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Poison Resistance:");
				//toughness	(next column, reset y)
		xPos++
		yPos = 0;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Toughness:");
				//alacrity
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Alacrity:");
				//memory
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin+statusPage2DataXSep*xPos)*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,"Memory:");
			#endregion
			#region Data
		draw_set_font(fnt_alagard);
		draw_set_colour(c_white);
		draw_set_halign(fa_right);
				//physical defense
		var xPos = 0;
		var yPos = 0;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.physicalDefense));
				//slash
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.slash]));
				//pierce
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.pierce]));
				//blunt
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.blunt]));
				//fire (skip 1)
		yPos++;
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.fire]));
				//ice
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.ice]));
				//lightning
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.lightning]));
				//arcane
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.arcane]));
				//light
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.light]));
				//dark
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.damageResistances[damageType.dark]));
				//bleed (skip 1)
		yPos++;
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.specialResistances[specialType.bleed]));
				//poison
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.specialResistances[specialType.poison]));
				//toughness (new collumn, reset yPos)
		yPos = 0;
		xPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.toughness));
				//alacrity
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.alacrity));
				//memory
		yPos++;
		draw_text((statusTextbox4X1+statusPage2DataXMargin/2+statusPage2DataXSep*(xPos+1))*surfW,(statusTextbox4Y1+statusPage2DataYMargin+statusPage2DataYSep*yPos)*surfH,string(PlayerStats.memory));
		
				//reset
		draw_set_halign(fa_left);
			#endregion
		break; #endregion
	case 2: #region Equipment + abilities + combos/subtypes/actives
			#region Equipment
		draw_set_font(fnt_alagard);
				//Title
		draw_text((statusTextbox4X1+statusPage3EquipTitleX)*surfW,(statusTextbox4Y1+statusPage3EquipTitleY)*surfH,"Equipment");
				//setup array
		var nameArray = [];
		var iconArray = [];
		var equipCache = ItemCache.equipment;
					//head
		var ind = 0;
		nameArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.head],itemStats.name);
		iconArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.head],itemStats.icon);
					//chest
		ind++;
		nameArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.chest],itemStats.name);
		iconArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.chest],itemStats.icon);
					//hands
		ind++;
		nameArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.hands],itemStats.name);
		iconArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.hands],itemStats.icon);
					//legs
		ind++;
		nameArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.legs],itemStats.name);
		iconArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.legs],itemStats.icon);
					//weapon skip
		ind++;
		nameArray[ind] = "";
		iconArray[ind] = noone;
					//main 1
		ind++;
		nameArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.main1],itemStats.name);
		iconArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.main1],itemStats.icon);
					//main 2
		ind++;
		nameArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.main2],itemStats.name);
		iconArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.main2],itemStats.icon);
					//off 1
		ind++;
		nameArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.off1],itemStats.name);
		iconArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.off1],itemStats.icon);
					//off 2
		ind++;
		nameArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.off2],itemStats.name);
		iconArray[ind] = item_get_data(itemType.equipment, equipCache[? equipmentSlot.off2],itemStats.icon);
					//rune skip
		ind++;
		nameArray[ind] = "";
		iconArray[ind] = noone;
					//runes
		var runeCache = equipCache[? equipmentSlot.rune];
		for(var i = 0; i < ds_list_size(runeCache); i++)
		{
			ind++
			nameArray[ind] = item_get_data(itemType.rune, runeCache[| i],itemStats.name);
			iconArray[ind] = item_get_data(itemType.rune, runeCache[| i],itemStats.icon);
		}
					//item skip
		ind++;
		nameArray[ind] = "";
		iconArray[ind] = noone;
					//items
		var itemCache = equipCache[? equipmentSlot.item];
		for(var i = 0; i < ds_list_size(itemCache); i++)
		{
			ind++
			nameArray[ind] = item_get_data(itemType.item, itemCache[| i],itemStats.name);
			iconArray[ind] = item_get_data(itemType.item, itemCache[| i],itemStats.icon);
		}
		
		for(var i = 0; i < array_length_1d(nameArray); i++)
		{
			draw_text((statusTextbox4X1+statusPage3DataXMargin)*surfW,(statusTextbox4Y1+statusPage3DataYMargin+statusPage3DataYSep*i)*surfH,nameArray[i]);
			if iconArray[i] != noone && iconArray[i] != undefined draw_sprite_ext(iconArray[i],0,(statusTextbox4X1+statusPage3EquipIconX)*surfW,(statusTextbox4Y1+statusPage3EquipIconY+statusPage3DataYSep*i)*surfH,statusPage3EquipIconScale,statusPage3EquipIconScale,0,c_white,1.0);
		}
		
			#endregion
			#region Abilities
		draw_set_font(fnt_alagard);
				//Title
		draw_text((statusTextbox4X1+statusPage3AbilityTitleX)*surfW,(statusTextbox4Y1+statusPage3AbilityTitleY)*surfH,"Abilities");
				//setup array
		var nameArray = [];
		var iconArray = [];
		var abilityCache = AbilityCache.playerAbilities;
					//combat
		var ind = -1;	//to fix first loop starting ahead, done just to keep format consistent
		for (var i = ds_map_find_first(abilityCache); i != undefined; i = ds_map_find_next(abilityCache,i))
		{
			var subCache = abilityCache[? i];
			var added = false;
			for (var j = ds_map_find_first(subCache); j != undefined; j = ds_map_find_next(subCache,j))
			{
				var abilityID = j;
			    var numActivated = scr_player_ability_get(i,abilityID,playerAbilityStats.numberActivated);
				var name = ability_get_data(i,abilityID,abilityStats.name);
				var icon = ability_get_data(i,abilityID,abilityStats.icon);
				repeat(numActivated)
				{
					ind++;
					nameArray[ind] = name;
					iconArray[ind] = icon;
				}
				var added = true;
			}
			if added
			{
					//skip 1 per category
				ind++
				nameArray[ind] = "";
				iconArray[ind] = noone;
			}
		}
		//ind--;		//fixes the last category draw along with this vv
		//nameArray = array_copy(nameArray,0,nameArray,0,ind);
		
		for(var i = 0; i < array_length_1d(nameArray); i++)
		{
			draw_text((statusTextbox4X1+statusPage3DataXMargin+statusPage3DataXSep)*surfW,(statusTextbox4Y1+statusPage3DataYMargin+statusPage3DataYSep*i)*surfH,nameArray[i]);
			if iconArray[i] != noone && iconArray[i] != undefined draw_sprite_ext(iconArray[i],0,(statusTextbox4X1+statusPage3EquipIconX+statusPage3DataXSep)*surfW,(statusTextbox4Y1+statusPage3EquipIconY+statusPage3DataYSep*i)*surfH,statusPage3EquipIconScale,statusPage3EquipIconScale,0,c_white,1.0);
			else if nameArray[i] != "" draw_sprite_ext(spr_icon_item_TEMPLATE,0,(statusTextbox4X1+statusPage3EquipIconX+statusPage3DataXSep)*surfW,(statusTextbox4Y1+statusPage3EquipIconY+statusPage3DataYSep*i)*surfH,statusPage3EquipIconScale,statusPage3EquipIconScale,0,c_white,1.0);
		}
			#endregion
		break; #endregion
	case 3: #region Spiral
			//initialize
		if !surface_exists(statusPage4Surface) statusPage4Surface = surface_create(statusPage4SurfaceWidth,statusPage4SurfaceHeight);
			//vortex effect
		surface_set_target(statusPage4Surface);
			draw_clear_alpha(c_black,1.0);
			shader_set(shd_vortex);
				var sample = statusPage4VortexSampleArray[floor(mouse_x/320*4.9)];
			
				var xScale = statusPage4SurfaceWidth/sprite_get_width(sample);
				var yScale = statusPage4SurfaceHeight/sprite_get_height(sample);
				
				var resoX = 1//1/xScale*0.5;//mouse_x/320;
				var resoY = 1//1/yScale*(2/7);//mouse_y/176;
				
				var shd_reso = shader_get_uniform(shd_vortex,"reso");
				var shd_time = shader_get_uniform(shd_vortex,"time");
				shader_set_uniform_f(shd_reso,resoX,resoY,1.0);
				shader_set_uniform_f(shd_time,current_time/1000);
				draw_sprite_ext(sample,0,0,0,xScale,xScale,0,c_white,1.0);
			shader_reset();
		surface_reset_target();
		
			//end draw
		draw_surface(statusPage4Surface,statusTextbox4X1*surfW+3*4,statusTextbox4Y1*surfH+3*4);
		break; #endregion
}
#endregion

#region (OLD) draw stat data

//draw_set_font(fnt_status);
	
//draw_set_colour(c_white);
//draw_text(260,50,"Level:         " + string(PlayerStats.level));
//draw_set_colour(c_teal);
//draw_text(500,50,"Stat Points:   " + string(PlayerStats.statPoints));
//draw_set_colour(c_purple);
//draw_text(260,100,"EXP:          " + string(ceil(PlayerStats.xp))+"/" + string(PlayerStats.xpNeeded));
//draw_set_colour(c_yellow);
//draw_text(500,100,"Gold:         "  + string(PlayerStats.gold));


//draw_set_font(fnt_status);
	
//if PlayerStats.statPoints != 0 && selection == "Constitution" draw_set_colour(c_green);
//else draw_set_colour(c_white);
//draw_text(850,260,"Health:");
	
//if PlayerStats.statPoints != 0 && selection == "Willpower" draw_set_colour(c_green);
//else draw_set_colour(c_white);
//draw_text(850,290,"Mana:");
	
//if PlayerStats.statPoints != 0 && (selection == "Strength" || selection == "Dexterity") draw_set_colour(c_green);
//else draw_set_colour(c_white);
//draw_text(850,350,"Physical Power:");
	
//if PlayerStats.statPoints != 0 && (selection == "Strength")draw_set_colour(c_green);
//else draw_set_colour(c_white);
//draw_text(850,380,"Physical Stagger:");
	
//if PlayerStats.statPoints != 0 && (selection == "Intelligence") draw_set_colour(c_green);
//else draw_set_colour(c_white);
//draw_text(850,440,"Magical Power:");
	
//if PlayerStats.statPoints != 0 && (selection == "Intelligence" || selection == "Willpower") draw_set_colour(c_green);
//else draw_set_colour(c_white);
//draw_text(850,470,"Magical Stagger:");
	
//draw_set_colour(c_white);
//draw_text(850,530,"Movement Speed:");
//draw_text(850,590,"Bleed Resistance:");
	
//draw_text(1150,260,string(ceil(PlayerStats.hp)) + "/" + string(PlayerStats.hpMax));
//draw_text(1150,290,string(floor(PlayerStats.mp)) + "/" + string(PlayerStats.mpMax));
//draw_text(1150,350,string(PlayerStats.physicalPower));
//draw_text(1150,380,string(PlayerStats.physicalStagger));
//draw_text(1150,440,string(PlayerStats.magicalPower));
//draw_text(1150,470,string(PlayerStats.magicalStagger));
//draw_text(1150,530,string(PlayerStats.moveSpeed));
//draw_text(1150,590,string(PlayerStats.specialResistances[0]));

//draw_text(1250,260,"Physical Toughness:");
//draw_text(1250,290,"Magical Toughness:");
//draw_text(1250,350,"Slash Resistance:");
//draw_text(1250,380,"Blunt Resistance:");
//draw_text(1250,410,"Pierce Resistance:");
//draw_text(1250,440,"Fire Resistance:");
//draw_text(1250,470,"Ice Resistance:");
//draw_text(1250,500,"Lightning Resistance:");
//draw_text(1250,530,"Arcane Resistance:");
//draw_text(1250,560,"Light Resistance:");
//draw_text(1250,590,"Dark Resistance:");
	
//draw_text(1550,260,string(PlayerStats.toughness));
//draw_text(1550,350,string(PlayerStats.damageResistances[0]));
//draw_text(1550,380,string(PlayerStats.damageResistances[1]));
//draw_text(1550,410,string(PlayerStats.damageResistances[2]));
//draw_text(1550,440,string(PlayerStats.damageResistances[3]));
//draw_text(1550,470,string(PlayerStats.damageResistances[4]));
//draw_text(1550,500,string(PlayerStats.damageResistances[5]));
//draw_text(1550,530,string(PlayerStats.damageResistances[6]));
//draw_text(1550,560,string(PlayerStats.damageResistances[7]));
//draw_text(1550,590,string(PlayerStats.damageResistances[8]));
	
#endregion