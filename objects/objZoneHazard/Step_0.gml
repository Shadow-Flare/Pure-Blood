if zoneID == noone
{
	zoneID = scr_enemy_attack(zoneFrameData,zoneFollow,zoneDuration,zoneDamageData,1,1,zonePierce,sprite_index,zoneHitSoundID,noone);
	with zoneID
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		image_angle = other.image_angle;
		visible = false;
	}
}