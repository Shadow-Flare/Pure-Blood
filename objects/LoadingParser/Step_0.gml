transTimer++;
if transTimer >= round(transDur*room_speed)
{
	instance_destroy();
}