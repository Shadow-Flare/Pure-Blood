var healDuration = 1.8;
var healCastTime = 1.6;

var healAmount = PlayerStats.magicalPower * 4;
var healEffectSprite = noone;
var healEffectDuration = 1.4;
var healEffectFollow = true;

if subPhase == subState.none subPhase = subState.performing;

switch subPhase
{
	case subState.performing:
		if subPhaseTimer == round(healCastTime*room_speed)
		{
			scr_heal_hp(id,healAmount);
			create_effect(healEffectFollow,x,y,depth-1,healEffectSprite,healEffectDuration,1,1);
		}
		if subPhaseTimer >= round(healDuration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer()
		}
			//speed
		xSpd -= xSpd/4;
			//Sprite
		update_sprite(sprPlayerBodyDefaultShrapnelBurst,-healDuration)
}		