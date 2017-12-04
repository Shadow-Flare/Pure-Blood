if driveMove != 0
{
	var yMod = 0;
	while place_free(x+driveMove*(bbox_right-bbox_left),y+yMod) && y+yMod <= room_height yMod++
	if y+yMod == room_height+1 driveMove = 0;
	//if place_free(x+driveMove*(bbox_right-bbox_left),y+1) driveMove = 0;
}

if target != noone && target.y-y >= 16 && dropThroughPlatforms = true;
else dropThroughPlatforms = false;

var yMod = 0;
while place_free(x,y+yMod) && y+yMod <= room_height yMod++
if y+yMod == room_height+1 dropThroughPlatforms = false;