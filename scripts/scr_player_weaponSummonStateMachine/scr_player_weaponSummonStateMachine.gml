var WSPPrev = weaponSummonPhase;
var cueSummon = GameManager.battlePhase = battleState.battle || phase == state.attacking || phase == state.blocking || mainWeaponEquipmentChange;
switch weaponSummonPhase
{
	case weaponSummonState.unsummoned:
			//transition
		if cueSummon
		{
			weaponSummonPhase = weaponSummonState.summoning;
		}
		break;
	case weaponSummonState.summoning:
			//shift alpha
		var shift = 0;
		shift = 1/(room_speed*weaponSummonFadeInDuration);
		weaponSpriteAlpha = clamp(weaponSpriteAlpha+shift,0,1);
			//determine intensity of effects
		var rev = weaponSpriteAlpha
		if sign(shift) == -1 rev = 1-rev;
		if rev <= 1/3
		{
			weaponSpriteEffectIntensity = rev*rev-0.5*rev;
		}
		else
		{
			weaponSpriteEffectIntensity = 1-rev;
		}
		weaponSpriteEffectIntensityGlow = weaponSpriteEffectIntensity;
		weaponSpriteEffectIntensity *= weapon_get_stat(PlayerStats.currentWeaponID, weaponStats.particleVolume)*(1-other.weaponSpriteAlpha);
		weaponSpriteEffectIntensityBuffer += weaponSpriteEffectIntensity%1
		weaponSpriteEffectIntensity = floor(weaponSpriteEffectIntensity+floor(weaponSpriteEffectIntensityBuffer));
		weaponSpriteEffectIntensityBuffer -= floor(weaponSpriteEffectIntensityBuffer);
			//transitions
		if mainWeaponEquipmentChange
		{
			var follow = false;
			weaponSummonPhase = weaponSummonState.summoning;
			var weaponEffect = create_effect(follow,x,y,depth-1,weaponSpriteIndex,weaponSummonFadeOutDuration,image_xscale,image_yscale);
			with weaponEffect
			{
				visible = false;	//draw manually in player event
				image_speed = 0;
				image_index = other.image_index;
				image_alpha = other.weaponSpriteAlpha;
				weaponIndex = other.equipmentSwitchWeaponIndex;
				weaponSpriteEffectIntensity = 0;
				weaponSpriteEffectIntensityBuffer = 0;
				weaponSpriteEffectIntensityGlow = 0;
				alphaAdd = -1/(room_speed*other.weaponSummonFadeOutDuration);
			}
			ds_list_add(weaponSummonFadeList,weaponEffect);
			weaponSpriteAlpha = 0;
		}
		if weaponSpriteAlpha == 1
		{
			weaponSummonPhase = weaponSummonState.summoned;
			weaponSummonTimer = 0;
		}
		break;
	case weaponSummonState.summoned:
			//transition and create effect after timer
		if GameManager.battlePhase = battleState.peace
		{
			weaponSummonTimer++
			if cueSummon weaponSummonTimer = 0;
			if weaponSummonTimer >= round(room_speed*weaponSummonDuration) || mainWeaponEquipmentChange
			{
				if mainWeaponEquipmentChange
				{
					var follow = false;
					var wepID = equipmentSwitchWeaponIndex;
					weaponSummonTimer = 0;
					weaponSummonPhase = weaponSummonState.summoning;
				}
				else
				{
					var follow = true;
					var wepID = PlayerStats.currentWeaponID;
					weaponSummonPhase = weaponSummonState.unsummoned;
				}
				weaponSpriteAlpha = 0;
				var weaponEffect = create_effect(follow,x,y,depth-1,weaponSpriteIndex,weaponSummonFadeOutDuration,image_xscale,image_yscale);
				with weaponEffect
				{
					trackFollowedXScale = follow;
					visible = false;	//draw manually in player event
					image_speed = 0;
					image_index = other.image_index;
					weaponIndex = wepID;
					weaponSpriteEffectIntensity = 0;
					weaponSpriteEffectIntensityBuffer = 0;
					weaponSpriteEffectIntensityGlow = 0;
					alphaAdd = -1/(room_speed*other.weaponSummonFadeOutDuration);
				}
				ds_list_add(weaponSummonFadeList,weaponEffect);
			}
		}
		break;
}

if WSPPrev != weaponSummonPhase weaponSummonPhaseChange = true;

equipmentSwitchWeaponIndex = noone;