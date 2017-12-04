var GUIWidth = surface_get_width(application_surface);
var GUIHeight = surface_get_height(application_surface);
spriteTimer++;

#region Top Left HuD
if !surface_exists(topLeftSurf) topLeftSurf = surface_create(GUIWidth/topLeftResolutionScale,hpR1*2+topLeftBorder*2);
if !surface_exists(hpSurf) hpSurf = surface_create(GUIWidth/topLeftResolutionScale,hpR1*2+topLeftBorder*2);
if !surface_exists(hpSurfB) hpSurfB = surface_create(GUIWidth/topLeftResolutionScale,hpR1*2+topLeftBorder*2);
if !surface_exists(mpSurf) mpSurf = surface_create(GUIWidth/topLeftResolutionScale,hpR1*2+topLeftBorder*2);

	#region Mp
surface_set_target(mpSurf);
draw_clear_alpha(c_white,0);

var mp = floor(PlayerStats.mp);
var mpMax = PlayerStats.mpMax;

		#region Back
draw_set_colour(mpBackColour);

var p1x = mpXI-mpBorder;
var p1y = mpYI-mpBorder;
var p2x = p1x+(mpMax/mpPP)+mpBorder*2;
var p2y = p1y+mpBarHeight+mpBorder*2;

if p1x != p2x draw_rectangle(p1x,p1y,p2x,p2y,0);
		#endregion	
		#region fill
draw_set_colour(mpColour);
	//base fill
var p1x = mpXI;
var p1y = mpYI;
var p2x = p1x+(mp/mpPP);
var p2y = p1y+mpBarHeight;

if p1x != p2x draw_rectangle(p1x,p1y,p2x,p2y,0);

	//animate
gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_color,bm_dest_alpha,bm_dest_alpha);
var scale = mpBarHeight/sprite_get_height(spr_mpAnim);
var lb = mp / mpPP;
var ls = (sprite_get_width(spr_mpAnim));
var n = lb / ls;

for(var i=0; i<n; i++)
{	
	draw_sprite_stretched_ext(spr_mpAnim,floor(spriteTimer*(sprite_get_speed(spr_mpAnim)/room_speed)),p1x+ls*i+1,p1y,sprite_get_width(spr_mpAnim),mpBarHeight+1,c_white,1);
}
gpu_set_blendmode(bm_normal);
		#endregion		

draw_set_colour(c_white);
surface_reset_target();
	#endregion
	#region Hp
surface_set_target(hpSurfB);
draw_clear_alpha(c_white,0);
		#region Back	
var hpMax = PlayerStats.hpMax;
			#region preliminaries
var v = hpPP*pi*hpR1;
var barHp= max(hpMax-v,0);
var curveHp= clamp(hpMax,0,v);
var hpd = 270*(curveHp/v);
		
draw_set_colour(hpBackColour);
			#endregion
			#region draw circle-triangle
var d=360;
for(var i=0; i<hpA; i++;)
{
	var p1x= hpXI;
	var p1y= hpYI;
	var p2x= hpXI + dcos(d)*(hpR1+hpBorder);
	var p2y= hpYI - dsin(d)*(hpR1+hpBorder);
	d -= hpd/hpA;
	var p3x= hpXI + dcos(d)*(hpR1+hpBorder);
	var p3y= hpYI - dsin(d)*(hpR1+hpBorder);
	draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
}
			#endregion
			#region draw circle-triangle cutout
d = 360;
gpu_set_blendmode(bm_subtract)
for(var i=0; i<hpA; i++;)
{
	var p1x= hpXI;
	var p1y= hpYI;
	var p2x= hpXI + dcos(d)*(hpR2-hpBorder);
	var p2y= hpYI - dsin(d)*(hpR2-hpBorder);
	d -= 270/hpA;
	var p3x= hpXI + dcos(d)*(hpR2-hpBorder);
	var p3y= hpYI - dsin(d)*(hpR2-hpBorder);
	draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
}
gpu_set_blendmode(bm_normal)
			#endregion
			#region draw bar hp + start Cap
//bar
var p1x = hpXI;
var p1y = hpYI-hpR1-hpBorder+1;
var p2x = p1x+(barHp/hpPP)+hpBorder;
var p2y = hpYI-hpR2+hpBorder;

if p1x != p2x draw_rectangle(p1x,p1y,p2x,p2y,0);
//cap
var p1x = hpXI+hpR2-hpBorder+1;
var p1y = hpYI-hpBorder+1;
var p2x = hpXI+hpR1+hpBorder;
var p2y = hpYI;

if p1x != p2x draw_rectangle(p1x,p1y,p2x,p2y,0);
draw_set_colour(c_white);
	#endregion
		#endregion
surface_reset_target();
surface_set_target(hpSurf);
draw_clear_alpha(c_white,0);
		#region Fill
			#region preliminaries
	if PlayerStats.hp == hpDamageTarget
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
	var v = hpPP*pi*hpR1;
	var barHp= clamp(hpDam,v,hpMax)-v;
	var curveHp= clamp(hpDam,0,v);
	var hpd = 270*(curveHp/v);
		
	draw_set_colour(hpDamageColour);
				#endregion
				#region draw circle-triangle
	var d=360;
	for(var i=0; i<hpA; i++;)
	{
		var p1x= hpXI;
		var p1y= hpYI;
		var p2x= hpXI + dcos(d)*hpR1;
		var p2y= hpYI - dsin(d)*hpR1;
		d -= hpd/hpA;
		var p3x= hpXI + dcos(d)*hpR1;
		var p3y= hpYI - dsin(d)*hpR1;
		draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
	}
				#endregion
				#region draw circle-triangle cutout
	d = 360;
	gpu_set_blendmode(bm_subtract)
	for(var i=0; i<hpA; i++;)
	{
		var p1x= hpXI;
		var p1y= hpYI;
		var p2x= hpXI + dcos(d)*hpR2;
		var p2y= hpYI - dsin(d)*hpR2;
		d -= 270/hpA;
		var p3x= hpXI + dcos(d)*hpR2;
		var p3y= hpYI - dsin(d)*hpR2;
		draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
	}
	gpu_set_blendmode(bm_normal)
				#endregion
				#region draw bar hp
	var p1x = hpXI;
	var p1y = hpYI - hpR1 + 1;
	var p2x = p1x + (barHp/hpPP);
	var p2y = hpYI - hpR2;

	if p1x != p2x draw_rectangle(p1x,p1y,p2x,p2y,0);
	draw_set_colour(c_white);
		#endregion
			#endregion
			#region draw arc, bar & cut out
				#region preliminaries
	var v = hpPP*pi*hpR1;
	var barHp= clamp(hp,v,hpMax)-v;
	var curveHp= clamp(hp,0,v);
	var hpd = 270*(curveHp/v);

	draw_set_colour(hpColour);
				#endregion
				#region draw circle-triangle
	var d=360;
	for(var i=0; i<hpA; i++;)
	{
		var p1x= hpXI;
		var p1y= hpYI;
		var p2x= hpXI + dcos(d)*hpR1;
		var p2y= hpYI - dsin(d)*hpR1;
		d -= hpd/hpA;
		var p3x= hpXI + dcos(d)*hpR1;
		var p3y= hpYI - dsin(d)*hpR1;
		draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
	}
				#endregion
				#region draw circle-triangle cutout
	d = 360;
	gpu_set_blendmode(bm_subtract)
	for(var i=0; i<hpA; i++;)
	{
		var p1x= hpXI;
		var p1y= hpYI;
		var p2x= hpXI + dcos(d)*hpR2;
		var p2y= hpYI - dsin(d)*hpR2;
		d -= 270/hpA;
		var p3x= hpXI + dcos(d)*hpR2;
		var p3y= hpYI - dsin(d)*hpR2;
		draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,0);
	}
	gpu_set_blendmode(bm_normal)
				#endregion
				#region draw bar hp
	var p1x = hpXI;
	var p1y = hpYI - hpR1+1;
	var p2x = p1x + (barHp/hpPP);
	var p2y = hpYI - hpR2;

	if p1x != p2x draw_rectangle(p1x,p1y,p2x,p2y,0);
	draw_set_colour(c_white);
				#endregion
			#endregion
			#region animation
			//draw animate
gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_color,bm_dest_alpha,bm_dest_alpha);
	//bar
var scale = (hpR1-hpR2)/sprite_get_height(spr_hpAnim);
var lb = barHp / hpPP;
var ls = (sprite_get_width(spr_hpAnim)*scale);
var n = lb / ls;

for(var i=0; i<n; i++)
{	
	draw_sprite_stretched_ext(spr_hpAnim,floor(spriteTimer*(sprite_get_speed(spr_hpAnim)/room_speed)),p1x+ls*i+1,p1y,(sprite_get_width(spr_hpAnim)*scale),(hpR1-hpR2),c_white,1);
}
	//curve
for(var i=0; i<3; i++)
{
	draw_sprite_ext(spr_hpAnimCurve,floor(spriteTimer*(sprite_get_speed(spr_hpAnim)/room_speed)),hpXI+1,hpYI+1,scale,scale,-90*i,c_white,1);
}

gpu_set_blendmode(bm_normal);
			#endregion
		#endregion
surface_reset_target();
	#endregion

surface_set_target(topLeftSurf)
	draw_clear_alpha(c_white,0);
	draw_surface(mpSurf,0,0);
	draw_surface(hpSurfB,0,0);
	draw_surface(hpSurf,0,0);
surface_reset_target();
draw_surface_ext(topLeftSurf,0,0,topLeftResolutionScale,topLeftResolutionScale,0,c_white,1);
#endregion

//messages
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
		draw_text(GUIWidth-20,20+messageTop+i*messageDivider,messageFeed[| i]);
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
			
//level up indication
if PlayerStats.statPoints != 0 draw_circle_color(20,20,15,c_yellow,c_yellow,false);

//equipment
	//Offhand && Subtype && weapon
var equipmentName = weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.name)
var offhandName = ComboCache.offhandNames[? PlayerStats.activeOffhandID];
var offhandSubtypeName = ComboCache.offhandSubtypeNames[? PlayerStats.activeOffhandSubtypeID];
var activeAbilityName = ComboCache.offhandActivatableNames[? PlayerStats.activeOffhandActivatableID];
draw_set_font(fnt_menu);
draw_set_colour(c_orange);
draw_set_valign(fa_bottom);
draw_text(20,1080-160,equipmentName);
draw_text(40,1080-120,offhandName);
draw_text(60,1080-80,offhandSubtypeName);
draw_text(80,1080-40,activeAbilityName);
draw_set_valign(fa_top);