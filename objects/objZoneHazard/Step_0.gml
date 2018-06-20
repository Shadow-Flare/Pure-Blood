if zoneID == noone
{
	zoneID = scr_enemy_attack(zoneData,1,1);
	with zoneID
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		image_angle = other.image_angle;
		visible = false;
	}
}