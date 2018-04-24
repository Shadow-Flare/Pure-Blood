if instance_exists(objPlayer) with objPlayer
{
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
				//if target is an enemy
			if object_is_ancestor(lockOnTarget.object_index,objEnemyParent)
			{
				if scr_player_ability_get(abilityType.support,supportAbility.hp_scan,playerAbilityStats.numberActivated) >= 1
				{
					with lockOnTarget
					{
							//initial variables
						var width = statCache.hpMax/2;
						var hpRemaining = statCache.hp/statCache.hpMax
						var x1 = x-sprite_xoffset+sprite_width/2-width/2-1;
						var y1 = y-sprite_yoffset+sprite_get_bbox_top(sprite_index)-7;
							//translation
						x1 = (x1-camera_get_view_x(Camera.cam))/320*surface_get_width(application_surface);
						y1 = (y1-camera_get_view_y(Camera.cam))/176*surface_get_height(application_surface);
						width = width/320*surface_get_width(application_surface);
							//draw
						surface_set_target(application_surface);
							draw_sprite_ext(sprEnemyHpBar,0,x1,y1,6,6,0,c_white,1.0);
							draw_sprite_ext(sprEnemyHpBar,1,x1+6,y1,width,6,0,c_white,1.0);
							draw_sprite_ext(sprEnemyHpBar,2,x1+6+width,y1,6,6,0,c_white,1.0);
							draw_sprite_ext(sprEnemyHpBarFill,0,x1+6,y1,width*hpRemaining,6,0,c_red,1.0);
						surface_reset_target();
					}
				}
				if scr_player_ability_get(abilityType.support,supportAbility.mp_scan,playerAbilityStats.numberActivated) >= 1
				{
					with lockOnTarget if statCache.mpMax != 0
					{
							//initial variables
						var width = statCache.mpMax/2;
						var mpRemaining = statCache.mp/statCache.mpMax
						var x1 = x-sprite_xoffset+sprite_width/2-width/2-1;
						var y1 = y-sprite_yoffset+sprite_get_bbox_top(sprite_index)-4;
							//translation
						x1 = (x1-camera_get_view_x(Camera.cam))/320*surface_get_width(application_surface);
						y1 = (y1-camera_get_view_y(Camera.cam))/176*surface_get_height(application_surface);
						width = width/320*surface_get_width(application_surface);
							//draw
						draw_sprite_ext(sprEnemyMpBar,0,x1,y1,1,1,0,c_white,1.0);
						draw_sprite_ext(sprEnemyMpBar,1,x1+1,y1,width,1,0,c_white,1.0);
						draw_sprite_ext(sprEnemyMpBar,2,x1+1+width,y1,1,1,0,c_white,1.0);
						draw_sprite_ext(sprEnemyMpBarFill,0,x1+1,y1,width*mpRemaining,1,0,c_blue,1.0);
					}
				}
			}
			break;
	}
	switch PlayerStats.currentOffhandActivatableID
	{
		case activeAbilityID.crossbow_rope_shot:
			if ropeShotTarget != noone && ropeShotTargetID != lockOnTarget
			{
				other.ropeShotTargetAngle++;
				draw_sprite_ext(spr_hook_target_reticule,0,ropeShotTarget[0],ropeShotTarget[1],1,1,other.ropeShotTargetAngle,c_white,1);
			}
			else
			{
				other.ropeShotTargetAngle = 0;
			}
			break;
	}
}
