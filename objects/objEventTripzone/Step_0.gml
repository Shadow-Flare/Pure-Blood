if triggerType = eventTripzoneType.none || triggerScript = noone
{
	instance_destroy();
}
else
{
	if triggerWorldId == noone worldCondition = true;
	else worldCondition = WorldCache.events[? triggerWorldId];
	
	var activate = false;
	if worldCondition switch triggerType
	{
		case eventTripzoneType.objectTrigger:
			if place_meeting(x,y,triggerObject)
			{
				activate = true; 
			}
			break;
		case eventTripzoneType.transientZone:
			activate = true;
			instance_destroy();
			break;
	}
	if activate
	{
			//world code
		if triggerWorldId != noone WorldCache.events[? triggerWorldId] = false;
		script_execute(triggerScript);
	}
}

visible = GameManager.cutsceneDebug