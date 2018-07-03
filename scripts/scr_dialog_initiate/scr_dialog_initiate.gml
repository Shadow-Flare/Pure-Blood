///@arg index
///@arg subIndex
///@arg dialogState.ENUM
var index = argument0;
var subIndex = argument1;
var dialogPhase = argument2;

with CutsceneManager
{	
	if dialogCurrentState == dialogState.closed || dialogCurrentState == dialogState.closing
	{
		dialogCurrentState = dialogState.opening;
	}
	
	dialogIndex = index;
	dialogIndexSub = subIndex;
	dialogCurrentType = dialogPhase;
	dialogTextID = 0;

	var cache = DialogCache.choices[| dialogIndex];
	if cache != undefined
	{
		var subCache = cache[| dialogIndexSub];
		if subCache != undefined ds_list_copy(dialogChoiceOptions,subCache);
	}
}