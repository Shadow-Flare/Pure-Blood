/*
shader_set(shd_bloom);
shader_set_uniform_f(bloomIntensity,darknessStr/3); //0 = off, 1 = a bit, 80 = extremely intense
shader_set_uniform_f(bloomblurSize,1/512);
draw_surface(application_surface, 0, 0);
shader_reset();
*/

//Console draw
scr_console_draw();

if !global.paused
{
	//Stats
		//HP
	hp = ceil(player.hp);
	maxHp = global.hpMax;
	draw_set_font(fnt_menu_large);
	draw_set_colour(make_color_rgb(255-(hp/maxHp*255),hp/maxHp*255,0));
	draw_text(40,40,string(floor(hp))+"/"+string(floor(maxHp)));
		//MP
	mp = floor(player.mp);
	maxMp = global.mpMax;
	draw_set_font(fnt_menu_large);
	draw_set_colour(make_color_rgb(255-(mp/maxMp*255),0,mp/maxMp*255));
	draw_text(40,80,string(floor(mp))+"/"+string(floor(maxMp)));

	//equipment
		//Offhand && Subtype
	activeAbilityName = obj_comboCache.offhandActivatableNames[obj_comboCache.activeOffhandActivatableID];
	offhandName = obj_comboCache.offhandNames[obj_comboCache.activeOffhandID];
	offhandSubtypeName = obj_comboCache.offhandSubtypeNames[obj_comboCache.activeOffhandSubtypeID];
	draw_set_font(fnt_menu);
	draw_set_colour(c_orange);
	draw_set_valign(fa_bottom);
	draw_text(40,1080-120,offhandName);
	draw_text(60,1080-80,offhandSubtypeName);
	draw_text(80,1080-40,activeAbilityName);
	draw_set_valign(fa_top);
}