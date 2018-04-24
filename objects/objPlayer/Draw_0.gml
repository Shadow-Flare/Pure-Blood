//draw auxiliaries
if auxSpriteIndex != noone draw_sprite_ext(auxSpriteIndex,image_index,x+facing*auxSpriteXOffset,y+auxSpriteYOffset,auxSpriteXScale,auxSpriteYScale,auxSpriteRotation,c_white,1);

//draw self
draw_self();

//draw weapon
if weaponSpriteIndex != noone draw_sprite_ext(weaponSpriteIndex,image_index,x,y,facing,1,0,c_white,image_alpha);

#region Reticules and Targets
// aiming direction reticule
if phase = state.offhand && subPhase = subState.aim
{
	var aimX = x+facing*5+(offhandAimGraphicDistance*dcos(aimAngle)+facing*(2*dcos(aimAngle+90)));
	var aimY = y-5-(offhandAimGraphicDistance*dsin(aimAngle)+facing*(2*dsin(aimAngle+90)));
	draw_sprite_ext(spr_hook_target_reticule,0,aimX,aimY,1,1,round(subPhaseTimer),c_white,1);
}
#endregion

//hitBox
if GameManager.actorBoxVisuals draw_hitbox(c_purple);