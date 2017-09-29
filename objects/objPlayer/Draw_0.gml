//draw auxiliaries
if auxSpriteIndex != noone draw_sprite_ext(auxSpriteIndex,image_index,x+facing*auxSpriteXOffset,y+auxSpriteYOffset,auxSpriteXScale,auxSpriteYScale,auxSpriteRotation,c_white,1);

//draw self
draw_self();

//draw weapon
if weaponSpriteIndex != noone draw_sprite_ext(weaponSpriteIndex,image_index,x,y,facing,1,0,c_white,1);

//draw effect
if effectSpriteIndex != noone draw_sprite_ext(effectSpriteIndex,image_index,x,y,facing,1,0,c_white,1);

#region OLD CODE
if global.g = "im a nerd"
{
#region draw crossbow
if phase == "offhand"
{
	 if subPhase == "offhandDrawing" draw_sprite_ext(spr_player_crossbow_drawing_crossbow,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "offhandDrawn" || subPhase = "holdingDrawn"
{
	while sign(armAngle) = -1 armAngle += 360;
	while sign(armAngle-360) = 1 armAngle -= 360;
	if abs(aimDir-armAngle) < 180 armAngle += (aimDir-armAngle)/4;
	else if aimDir < 90 armAngle += (aimDir-(armAngle-360))/4;
	else armAngle += (aimDir-360-armAngle)/4;
	var handAngle = armAngle;
	if facing == -1 handAngle -= 180
	if !recoil draw_sprite_ext(spr_player_crossbow_drawn_crossbow,image_index,x+facing*41,y-23,facing,1,handAngle,c_white,1);
	else
	{
		draw_sprite_ext(spr_player_crossbow_drawnFire_crossbow,image_index,x+facing*41,y-23,facing,1,handAngle,c_white,1);
		if image_index = sprite_get_number(sprite_index)-1 recoil = 0;
	}
}
else if subPhase == "offhandHolster" draw_sprite_ext(spr_player_crossbow_holster_crossbow,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedOffhandDrawing" {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedOffhandDrawn" && !recoil {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedOffhandDrawn" && recoil {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedOffhandHolster" {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedHoldingDrawn" {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
}
#endregion

#region draw weapons
//weapons
if phase == "idle"
{
	draw_sprite_ext(spr_player_idle_weapon,image_index,x,y,facing,1,0,c_white,1);
}

else if phase == "running"||phase == "walking"
{
	draw_sprite_ext(spr_player_run_weapon,image_index,x,y,facing,1,0,c_white,1);
}

else if phase == "airborne"
{
	draw_sprite_ext(spr_player_airborne_weapon,image_index,x,y,facing,1,0,c_white,1);
}

else if phase == "dodging"
{
	draw_sprite_ext(spr_player_dodging_weapon,image_index,x,y,facing,1,0,c_white,1);
}

else if phase == "aerialDodging"
{
	draw_sprite_ext(spr_player_aerialDodging_weapon,image_index,x,y,facing,1,0,c_white,1);
}

else if phase == "staggered"
{
	if subPhase == "deflected" draw_sprite_ext(spr_player_stagger_weapon,image_index,x,y,facing,1,0,c_white,1);
	else if subPhase == "stagger" draw_sprite_ext(spr_player_stagger_weapon,image_index,x,y,facing,1,0,c_white,1);
	else if subPhase == "flung" draw_sprite_ext(spr_player_flung_weapon,image_index,x,y,facing,1,0,c_white,1);
	else if subPhase == "prone" draw_sprite_ext(spr_player_prone_weapon,image_index,x,y,facing,1,0,c_white,1);
}

else if phase == "blocking"
{
	 if subPhase == "" draw_sprite_ext(spr_player_blocking_weapon,image_index,x,y,facing,1,0,c_white,1);
//else if subPhase == "end" draw_sprite_ext(spr_player_blockingEnd_weapon,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "reaction" draw_sprite_ext(spr_player_blockingReaction_weapon,image_index,x,y,facing,1,0,c_white,1);
}

else if phase == "hooked"
{
	if subPhase == "stop" draw_sprite_ext(spr_player_hookedStop_weapon,image_index,x,y,facing,1,image_angle,c_white,1);
}

else if phase == "attacking"
{
	if subPhase == "ground" && comboSize%2 == attackNum%2 && attackNum != comboSize && attackAnimationWep = spr_player_slice_weapon
	{
		draw_sprite_ext(spr_player_slice2_weapon,image_index,x,y,facing,1,0,c_white,1);
		draw_sprite_ext(spr_player_slice2_effect,image_index,x,y,facing,1,0,merge_color(c_white,c_gray,0.25),0.5);
	}
	else if subPhase == "aerial" && aerialComboSize%2 == attackNum%2 && attackNum != aerialComboSize
	{
		draw_sprite_ext(spr_player_aerialSlash2_weapon,image_index,x,y,facing,1,0,c_white,1);
		draw_sprite_ext(spr_player_aerialSlash2_effect,image_index,x,y,facing,1,0,merge_color(c_white,c_gray,0.25),0.5);
	}
	else
	{
		draw_sprite_ext(attackAnimationWep,image_index,x,y,facing,1,0,c_white,1);
		draw_sprite_ext(attackAnimationEffect,image_index,x,y,facing,1,0,merge_color(c_white,c_gray,0.25),0.5);
	}
}

else if phase == "offhand"
{
	 if subPhase == "offhandDrawing" draw_sprite_ext(spr_player_crossbow_drawing_weapon,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "offhandDrawn" && !recoil draw_sprite_ext(spr_player_crossbow_drawn_weapon,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "offhandDrawn" && recoil draw_sprite_ext(spr_player_crossbow_drawnFire_weapon,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "offhandHolster" draw_sprite_ext(spr_player_crossbow_holster_weapon,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "holdingDrawn" draw_sprite_ext(spr_player_crossbow_drawn_weapon,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedOffhandDrawing" {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedOffhandDrawn" && !recoil {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedOffhandDrawn" && recoil {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedOffhandHolster" {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "hookedHoldingDrawn" {}//draw_sprite_ext(spr_player_crossbow_,image_index,x,y,facing,1,0,c_white,1);
else if subPhase == "quickfire"
	{
		//if global.activeOffhandID == 0 draw_sprite_ext(spr_player_crossbow_quickfire_weapon,image_index,x,y,facing,1,0,c_white,1);
		if global.activeOffhandID == 1 draw_sprite_ext(spr_player_spells_quickfire_weapon,image_index,x,y,facing,1,0,c_white,1);
	}
else if subPhase == "holding"
	{
		//if global.activeOffhandID == 0 draw_sprite_ext(spr_player_crossbow_holding_weapon,image_index,x,y,facing,1,0,c_white,1);
		//if global.activeOffhandID == 1 draw_sprite_ext(spr_player_spells_holding_weapon,image_index,x,y,facing,1,0,c_white,1);
	}
else if  subPhase == "uppercut"
	{
		//if global.activeOffhandID == 0 draw_sprite_ext(spr_player_crossbow_uppercut_weapon,image_index,x,y,facing,1,0,c_white,1);
		//if global.activeOffhandID == 1 draw_sprite_ext(spr_player_spells_uppercut_weapon,image_index,x,y,facing,1,0,c_white,1);
	}
}
else if phase == "ability"
{
//	 if subPhase == "" draw_sprite_ext(spr_player_ability_cast_weapon,image_index,x,y,facing,1,0,c_white,1);
//	 else if subPhase == "holding" draw_sprite_ext(spr_player_ability_holding_weapon,image_index,x,y,facing,1,0,c_white,1);
//	 else if subPhase == "aerial" draw_sprite_ext(spr_player_ability_aerial_weapon,image_index,x,y,facing,1,0,c_white,1);
}
#endregion

#region Reticules and Targets
//grapple target draw
if hookTarget != noone && hookTargetType == "mount"
{
	draw_sprite_ext(spr_hook_target_reticule,0,hookTarget.x,hookTarget.y,3,3,0,c_white,1);
}

// aiming direction reticule
if (phase == "offhand" && (subPhase == "holding" || subPhase == "holdingDrawn" || subPhase == "hookedHoldingDrawn")) || (phase == "ability" && subPhase == "holding")
{
	var h = global.moveInput;
	var v = global.moveInputV;
	var distance = 256;
	var retAimDir = point_direction(0,0,h,v);
	var aimX = distance*cos(degtorad(retAimDir));
	var aimY = -distance*sin(degtorad(retAimDir));
	if !(h == 0 && v == 0) draw_sprite_ext(spr_hook_target_reticule,0,x + aimX,y + aimY,1,1,-retAimDir,c_white,1);
}

//lockON target draw
if (softLockOn||hardLockOn) && !instance_exists(lockOnTarget)
{
	softLockOn = 0;
	hardLockOn = 0;
	lockOnTarget = noone;
}
if hardLockOn
{
	lockImageTimer++;
	draw_sprite(spr_hard_lock,floor(lockImageTimer/(room_speed/(1*sprite_get_number(spr_hard_lock)))),lockOnTarget.x,lockOnTarget.y);
}
else if softLockOn
{
	lockImageTimer++;
	draw_sprite(spr_soft_lock,floor(lockImageTimer/(room_speed/(1*sprite_get_number(spr_soft_lock)))),lockOnTarget.x,lockOnTarget.y);
}
else lockImageTimer = 0;

if lockImageTimer >= room_speed lockImageTimer = 0;
#endregion
}
#endregion
