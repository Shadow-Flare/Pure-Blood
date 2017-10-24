if actionHardCooldownTimer != -1
{
	actionHardCooldownTimer++;
	if actionHardCooldownTimer >= round(actionHardCooldown*room_speed)
	{
		actionHardCooldownTimer = -1; //switch off
	}
}