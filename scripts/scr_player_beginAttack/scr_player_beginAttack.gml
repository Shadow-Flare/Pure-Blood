///@arg attackID

attackID = argument0;

attackName = combo_get_stat(attackID,comboStats.name);
attackDuration = combo_get_stat(attackID,comboStats.duration);
attackAnimation = combo_get_stat(attackID,comboStats.animation);
attackSpecials = combo_get_stat(attackID,comboStats.specials);
attackCooldown = combo_get_stat(attackID,comboStats.cooldown);
attackMoveDistanceX = combo_get_stat(attackID,comboStats.moveDistX);
attackMoveDistanceY = combo_get_stat(attackID,comboStats.moveDistY);
attackMoveStart = combo_get_stat(attackID,comboStats.moveStart);
attackMoveDuration = combo_get_stat(attackID,comboStats.moveDuration);

if ds_list_find_index(attackSpecials,comboSpecial.blink) != -1
{
	if lockOnType != lockOn.off && distance_to_object(lockOnTarget) <= ComboCache.blinkRange
	{
		var dir = sign(lockOnTarget.x-x);
		if dir == 0 dir = 1;
		var newX = round(lockOnTarget.x);
		var newY = round(lockOnTarget.y);
		while place_meeting(newX,newY,lockOnTarget)
		{
			newX+=dir;
		}
		if variable_instance_exists(lockOnTarget,"vPhase") && lockOnTarget.vPhase == vState.grounded
		{
			while place_free(newX,round(newY+1)) newY = round(newY+1)
		}
		var num = 0;
		while !place_free(newX,newY-num) && num < 10 num++
		newY-=num;
		if place_free(newX,newY)
		{
			x = newX;
			y = newY;
			var dir = sign(lockOnTarget.x-x);
			facing = dir;
			lockOnDir = dir;
			audio_play_sound(ComboCache.blinkSound,10,0);
			create_effect(false,x,y,depth-1,ComboCache.blinkAnimationStart,0.6,1,1);
			create_effect(false,x,y,depth-1,ComboCache.blinkAnimationEnd,0.6,1,1);
		}
	}
}