//draw auxiliaries
if auxSpriteIndex != noone draw_sprite_ext(auxSpriteIndex,image_index,x+facing*auxSpriteXOffset,y+auxSpriteYOffset,auxSpriteXScale,auxSpriteYScale,auxSpriteRotation,c_white,1);

//draw self
draw_self();

//draw weapon
	//weapon
var alphaTmp = weaponSpriteAlpha;
if alphaTmp >= 1/3 && weaponSpriteIndex != noone draw_sprite_ext(weaponSpriteIndex,image_index,x,y,facing,1,0,c_white,alphaTmp);
	//effects
		#region main weapon
if weaponSummonPhase == weaponSummonState.summoning
{
	var intensity = weaponSpriteEffectIntensity;
		//glow
	shader_set(shd_white);
		if weaponSpriteIndex != noone draw_sprite_ext(weaponSpriteIndex,image_index,x,y,facing,1,0,merge_colour(c_white,c_blue,0.2),weaponSpriteEffectIntensityGlow);	
	shader_reset();
		//particles
	var spr = weaponSpriteIndex;
	var yStrt = y-sprite_get_yoffset(spr);
	var yT = sprite_get_bbox_top(spr);
	var yB = sprite_get_bbox_bottom(spr);
	if facing == 1
	{
		var xStrt = x-sprite_get_xoffset(spr);
		var xL = sprite_get_bbox_left(spr);
		var xR = sprite_get_bbox_right(spr);
	}
	else
	{
		var sprW = sprite_get_width(spr);
		var xStrt = x-(sprW-sprite_get_xoffset(spr));
		var xL = sprW-sprite_get_bbox_right(spr);
		var xR = sprW-sprite_get_bbox_left(spr);
	}
			//create temp weapon collider object
	var collider = instance_create_depth(x,y,depth,obj_weapon_particle_collider);
	collider.sprite_index = spr;
	collider.image_index = image_index;
	collider.image_xscale = facing;
			
			// perform particle generation
	with ParticleController
	{
		if !part_system_exists(pSysWeaponSummon)
		{
			pSysWeaponSummon = part_system_create();
			part_system_automatic_draw(pSysWeaponSummon,false);
			pEmitterWeaponSummon = part_emitter_create(pSysWeaponSummon);
		}
		repeat intensity
		{
			var search = true
			var searchNum = 0;
			var searchMax = 126;
			while search && searchNum < searchMax
			{
				searchNum++;
				var xRand = irandom_range(xStrt+xL,xStrt+xR);
				var yRand = irandom_range(yStrt+yT,yStrt+yB);
				
				if position_meeting(xRand,yRand,collider)
				{
					part_emitter_region(pSysWeaponSummon,pEmitterWeaponSummon,xRand,xRand,yRand,yRand,ps_shape_rectangle,ps_distr_linear);
					part_emitter_burst(pSysWeaponSummon,pEmitterWeaponSummon,other.pAura,1);
					search = false;
				}
			}
		}
	}
			//destroy temp weapon collider object
	instance_destroy(collider);
}
		#endregion
		#region weaponSummonFadeList weapons
var player = id;
for (var i = 0; i < ds_list_size(weaponSummonFadeList); i++)
{
	var effect = weaponSummonFadeList[| i];
	if instance_exists(effect)
	{
		with effect
		{
			var rev = 1-image_alpha;
			if rev <= 1/3
			{
				weaponSpriteEffectIntensity = rev*rev-0.5*rev;
			}
			else
			{
				weaponSpriteEffectIntensity = 1-rev;
			}
			weaponSpriteEffectIntensityGlow = weaponSpriteEffectIntensity;
			weaponSpriteEffectIntensity *= weapon_get_stat(weaponIndex, weaponStats.particleVolume);
			weaponSpriteEffectIntensityBuffer += weaponSpriteEffectIntensity%1;
			weaponSpriteEffectIntensity = floor(weaponSpriteEffectIntensity)+floor(weaponSpriteEffectIntensityBuffer);
			weaponSpriteEffectIntensityBuffer -= floor(weaponSpriteEffectIntensityBuffer);
			var intensity = weaponSpriteEffectIntensity;
				//default draw and glow
			var alphaTmp = image_alpha;
			if alphaTmp >= 1/3 draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,alphaTmp);
			shader_set(shd_white);
				draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,merge_colour(c_white,c_blue,0.2),weaponSpriteEffectIntensityGlow);	
			shader_reset();
				//particles
			var spr = sprite_index;
			var facingTemp = sign(image_xscale);
			var yStrt = y-sprite_get_yoffset(spr);
			var yT = sprite_get_bbox_top(spr);
			var yB = sprite_get_bbox_bottom(spr);
			if facingTemp == 1
			{
				var xStrt = x-sprite_get_xoffset(spr);
				var xL = sprite_get_bbox_left(spr);
				var xR = sprite_get_bbox_right(spr);
			}
			else
			{
				var sprW = sprite_get_width(spr);
				var xStrt = x-(sprW-sprite_get_xoffset(spr));
				var xL = sprW-sprite_get_bbox_right(spr);
				var xR = sprW-sprite_get_bbox_left(spr);
			}
		}
				// perform particle generation
		with ParticleController
		{
			if !part_system_exists(pSysWeaponSummon)
			{
				pSysWeaponSummon = part_system_create();
				part_system_automatic_draw(pSysWeaponSummon,false);
				pEmitterWeaponSummon = part_emitter_create(pSysWeaponSummon);
			}
			var volume = ceil(1*(intensity))//weapon_get_stat(effect.weaponIndex, weaponStats.particleVolume)*(1-other.image_alpha);
			repeat volume
			{
				var search = true
				var searchNum = 0;
				var searchMax = 126;
				while search && searchNum < searchMax
				{
					searchNum++;
					var xRand = irandom_range(xStrt+xL,xStrt+xR);
					var yRand = irandom_range(yStrt+yT,yStrt+yB);
				
					if position_meeting(xRand,yRand,effect)
					{
						part_emitter_region(pSysWeaponSummon,pEmitterWeaponSummon,xRand,xRand,yRand,yRand,ps_shape_rectangle,ps_distr_linear);
						part_emitter_burst(pSysWeaponSummon,pEmitterWeaponSummon,player.pAura,1);
						search = false;
					}
				}
			}
		}
	}
	else
	{
		ds_list_delete(weaponSummonFadeList,i);
		i--;
	}
}
		#endregion

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