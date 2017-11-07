#region basic options draw

for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_colour(c_white);
		if current_menu_options[i,j] != "Accept" draw_text(260,260+40*j,current_menu_options[i,j]);
		var str;
		var arrLeft = false;
		switch j
		{
			case 0: 
				str = PlayerStats.strength;
				if PlayerStats.strength != strengthTemp 
				{
					arrLeft = true;
					draw_set_colour(c_green);
				}
				break;
			case 1: 
				str = PlayerStats.constitution;
				if PlayerStats.constitution != constitutionTemp
				{
					arrLeft = true;
					draw_set_colour(c_green);
				}
				break;
			case 2: 
				str = PlayerStats.dexterity;
				if PlayerStats.dexterity != dexterityTemp
				{
					arrLeft = true;
					draw_set_colour(c_green);
				}
				break;
			case 3: 
				str = PlayerStats.cunning;
				if PlayerStats.cunning != cunningTemp
				{
					arrLeft = true;
					draw_set_colour(c_green);
				}
				break;
			case 4: 
				str = PlayerStats.intelligence;
				if PlayerStats.intelligence != intelligenceTemp
				{
					arrLeft = true;
					draw_set_colour(c_green);
				}
				break;
			case 5: 
				str = PlayerStats.willpower;
				if PlayerStats.willpower != willpowerTemp
				{
					arrLeft = true;
					draw_set_colour(c_green);
				}
				break;
			case 6:
				str = "Accept";
				if !changeCheck draw_set_colour(c_dkgray);
				break;
		}
		if sX == i && sY == j draw_sprite_ext(spr_select,0,610,270+40*j,1/16,1/16,0,merge_color(c_white,c_orange,0.5),1);
		draw_text(610,270+40*j,str);
		draw_set_colour(c_yellow);
		if str != "Accept"
		{
			if arrLeft draw_text(580,270+40*j,"<");
			if PlayerStats.statPoints != 0 draw_text(640,270+40*j,">🢂🡲🡲🡲>");
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_left);
	}
}

#endregion
#region draw stat data

draw_set_font(fnt_status);
	
draw_set_colour(c_white);
draw_text(260,50,"Level:         " + string(PlayerStats.level));
draw_set_colour(c_teal);
draw_text(500,50,"Stat Points:   " + string(PlayerStats.statPoints));
draw_set_colour(c_purple);
draw_text(260,100,"EXP:          " + string(ceil(PlayerStats.xp))+"/" + string(PlayerStats.xpNeeded));
draw_set_colour(c_yellow);
draw_text(500,100,"Gold:         "  + string(PlayerStats.gold));


draw_set_font(fnt_status);
	
if PlayerStats.statPoints != 0 && selection == "Constitution" draw_set_colour(c_green);
else draw_set_colour(c_white);
draw_text(850,260,"Health:");
	
if PlayerStats.statPoints != 0 && selection == "Willpower" draw_set_colour(c_green);
else draw_set_colour(c_white);
draw_text(850,290,"Mana:");
	
if PlayerStats.statPoints != 0 && (selection == "Strength" || selection == "Dexterity") draw_set_colour(c_green);
else draw_set_colour(c_white);
draw_text(850,350,"Physical Power:");
	
if PlayerStats.statPoints != 0 && (selection == "Strength")draw_set_colour(c_green);
else draw_set_colour(c_white);
draw_text(850,380,"Physical Stagger:");
	
if PlayerStats.statPoints != 0 && (selection == "Intelligence") draw_set_colour(c_green);
else draw_set_colour(c_white);
draw_text(850,440,"Magical Power:");
	
if PlayerStats.statPoints != 0 && (selection == "Intelligence" || selection == "Willpower") draw_set_colour(c_green);
else draw_set_colour(c_white);
draw_text(850,470,"Magical Stagger:");
	
draw_set_colour(c_white);
draw_text(850,530,"Movement Speed:");
draw_text(850,590,"Bleed Resistance:");
	
draw_text(1150,260,string(ceil(PlayerStats.hp)) + "/" + string(PlayerStats.hpMax));
draw_text(1150,290,string(floor(PlayerStats.mp)) + "/" + string(PlayerStats.mpMax));
draw_text(1150,350,string(PlayerStats.physicalPower));
draw_text(1150,380,string(PlayerStats.physicalStagger));
draw_text(1150,440,string(PlayerStats.magicalPower));
draw_text(1150,470,string(PlayerStats.magicalStagger));
draw_text(1150,530,string(PlayerStats.moveSpeed));
draw_text(1150,590,string(PlayerStats.specialResistances[0]));

draw_text(1250,260,"Physical Toughness:");
draw_text(1250,290,"Magical Toughness:");
draw_text(1250,350,"Slash Resistance:");
draw_text(1250,380,"Blunt Resistance:");
draw_text(1250,410,"Pierce Resistance:");
draw_text(1250,440,"Fire Resistance:");
draw_text(1250,470,"Ice Resistance:");
draw_text(1250,500,"Lightning Resistance:");
draw_text(1250,530,"Arcane Resistance:");
draw_text(1250,560,"Light Resistance:");
draw_text(1250,590,"Dark Resistance:");
	
draw_text(1550,260,string(PlayerStats.physicalToughness));
draw_text(1550,290,string(PlayerStats.magicalToughness));
draw_text(1550,350,string(PlayerStats.damageResistances[0]));
draw_text(1550,380,string(PlayerStats.damageResistances[1]));
draw_text(1550,410,string(PlayerStats.damageResistances[2]));
draw_text(1550,440,string(PlayerStats.damageResistances[3]));
draw_text(1550,470,string(PlayerStats.damageResistances[4]));
draw_text(1550,500,string(PlayerStats.damageResistances[5]));
draw_text(1550,530,string(PlayerStats.damageResistances[6]));
draw_text(1550,560,string(PlayerStats.damageResistances[7]));
draw_text(1550,590,string(PlayerStats.damageResistances[8]));
	
#endregion