//draw auxiliaries
if auxSpriteIndex != noone draw_sprite_ext(auxSpriteIndex,image_index,x+facing*auxSpriteXOffset,y+auxSpriteYOffset,auxSpriteXScale,auxSpriteYScale,auxSpriteRotation,c_white,1);

//draw self
draw_self();

//draw weapon
if weaponSpriteIndex != noone draw_sprite_ext(weaponSpriteIndex,image_index,x,y,facing,1,0,c_white,1);

//draw effect
if effectSpriteIndex != noone draw_sprite_ext(effectSpriteIndex,image_index,x,y,facing,1,0,c_white,1);

#region Reticules and Targets
//grapple target draw
if ropeShotTarget != noone
{
	switch ropeShotTargetType
	{
		case 1: /*Mount*/ draw_sprite_ext(spr_hook_target_reticule,0,ropeShotTarget[0],ropeShotTarget[1],3,3,0,c_white,1); break;
		case 2: /*not M*/ break; //do nothing
	}
}

// aiming direction reticule
if phase = state.offhand && subPhase = subState.aim
{
	var aimX = x+facing*5+(offhandAimGraphicDistance*dcos(aimAngle)+facing*(2*dcos(aimAngle+90)));
	var aimY = y-5-(offhandAimGraphicDistance*dsin(aimAngle)+facing*(2*dsin(aimAngle+90)));
	draw_sprite_ext(spr_hook_target_reticule,0,aimX,aimY,1,1,round(subPhaseTimer),c_white,1);
}

//lockON target draw
switch lockOnType
{
	case lockOn.off:
		lockImageTimer = 0;
		break;
	case lockOn.soft:
		lockImageTimer++;
		if instance_exists(lockOnTarget) draw_sprite(spr_soft_lock,floor(lockImageTimer/(room_speed/(1*sprite_get_number(spr_soft_lock)))),lockOnTarget.x,lockOnTarget.y);		
		break;
	case lockOn.hard:
		lockImageTimer++;
		if instance_exists(lockOnTarget) draw_sprite(spr_hard_lock,floor(lockImageTimer/(room_speed/(1*sprite_get_number(spr_hard_lock)))),lockOnTarget.x,lockOnTarget.y);		
		break;
}
#endregion