#region State machine: show different interfaces/elements
canProceed = false;
timer++;
var nextData = noone;
if !ending switch pauseMessagePhase
{
	case pauseMessageState.pedestalItem:
		if timer >= round(fadeDuration*room_speed)
		{
			canProceed = true;
		}
		if proceed
		{
			proceed = false;
			if !ds_stack_empty(pauseMessageStack)
			{
				nextData = ds_stack_pop(pauseMessageStack);
			}
			else
			{
				ending = true;
				timer = 0;
			}
		}
		break;
}
else
{
	timer++;
	if timer >= round(fadeDuration*1.2*room_speed)
	{
		if initialized {instance_destroy(); instance_activate_all();}
	}
}
#endregion

#region (A)||(B)	Proceed
if canProceed && (InputManager.aInput || InputManager.bInput)
{
	InputManager.aInput = false;
	InputManager.bInput = false;
	proceed = true;
	audio_play_sound(snd_menu_select,10,0);
}
#endregion

if nextData != noone
{
	pauseMessagePhase = nextData[? pauseMessageData.state];
	pauseMessageData1 = nextData[? pauseMessageData.arg1];
	pauseMessageData2 = nextData[? pauseMessageData.arg2];
}