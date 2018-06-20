var vertInput = InputManager.dDInput-InputManager.dUInput;
var selectInput = InputManager.aInput;

#region Dialog State Machine, controlled movement and disablement
switch dialogCurrentState
{
	case dialogState.closed:
		showHud = true;
		dialogDraw = false;
		interactionActive = false;
		playerCanActDialog = true;
		break;
	case dialogState.opening:
		showHud = false;
		dialogDraw = true;
		interactionActive = false;
		playerCanActDialog = false;
		dialogTransitionTimer++;
		if dialogTransitionTimer >= round(dialogTransitionDuration*room_speed)
		{
			dialogTransitionTimer = 0;
			dialogCurrentState = dialogState.dialog;
		}
		break;
	case dialogState.closing:
		showHud = true;
		dialogDraw = true;
		interactionActive = false;
		playerCanActDialog = false;
		dialogTransitionTimer++;
		if dialogTransitionTimer >= round(dialogTransitionDuration*room_speed)
		{
			dialogTransitionTimer = 0;
			dialogCurrentState = dialogState.closed;
		}
		break;
	case dialogState.dialog:
		showHud = false;
		dialogDraw = true;
		interactionActive = true;
		playerCanActDialog = false;
		break;
}
#endregion

#region dialog choices refresh
ds_list_clear(dialogChoiceOptions);
if dialogCurrentType = dialogType.choice
{
	var cache = DialogCache.choices[| dialogIndex];
	ds_list_copy(dialogChoiceOptions,cache[| dialogIndexSub]);
}
#endregion
#region text crawl for dialog
if dialogCurrentType == dialogType.speech
{
	draw_set_font(fnt_dialog);
	draw_set_colour(c_white);
	draw_set_alpha(1.0);
			
	var cache = DialogCache.dialog[| dialogIndex];
	var subCache = cache[| dialogIndexSub];
	var currentDialog = subCache[| dialogTextID];
	
	var dialogMod = string_copy(currentDialog,0,dialogCrawlIndex);
	var textSingleLineHeight = string_height("test");
	var textW = surface_get_width(dialogTextSurf)-dialogTextLeftShiftUse*dialogTextLeftShift;
	var textTotalLineHeight = string_height_ext(dialogMod,textSingleLineHeight,textW)/textSingleLineHeight;
	
	dialogScrollMax = max(string_height_ext(currentDialog,textSingleLineHeight,textW)/textSingleLineHeight-dialogTextMaxLines,0);
	
	dialogCrawlMax = string_length(currentDialog);
	if dialogCrawlIndex < dialogCrawlMax
	{
		dialogCrawlTimer++;
		if dialogCrawlTimer >= floor((1/dialogCrawlCharactersPerSecond)*room_speed)
		{
			dialogCrawlIndex++;
			dialogCrawlTimer = 0;
		}
	}
	
	dialogMod = string_copy(currentDialog,0,dialogCrawlIndex);
	if textTotalLineHeight != string_height_ext(dialogMod,textSingleLineHeight,textW)/textSingleLineHeight && textTotalLineHeight > dialogTextMaxLines-1 dialogScrollIndex++;
}
#endregion

var leaveCall = false;
if interactionActive
{
		//inputs
	#region (A)				Select
	var response = noone;
	if selectInput switch dialogCurrentType
	{
		case dialogType.choice:
			response = dialogChoiceSelectionIndex;
			break
		case dialogType.speech:
			var cache = DialogCache.dialog[| dialogIndex];
			var len = ds_list_size(cache[| dialogIndexSub]);
			if dialogCrawlIndex != dialogCrawlMax
			{
				dialogCrawlIndex = dialogCrawlMax;
				dialogScrollIndex = dialogScrollMax;
			}
			else if dialogTextID < len-1 
			{
				dialogTextID++;
				dialogCrawlIndex = 0;
				dialogScrollIndex = 0;
			}
			else response = 0; //continue
			dialogCrawlTimer = 0;
			break;
	}
	#endregion
	#region (Dpad up/Down)	Navigate
	if vertInput != 0 switch dialogCurrentType
	{
		case dialogType.choice:
			var maxOptions = ds_list_size(dialogChoiceOptions);
			dialogChoiceSelectionIndex += vertInput;
			if dialogChoiceSelectionIndex < 0 dialogChoiceSelectionIndex = maxOptions-1;
			if dialogChoiceSelectionIndex >= maxOptions dialogChoiceSelectionIndex = 0;
			while dialogChoiceSelectionIndex-dialogScrollIndex > dialogChoiceScrollOptions-1 dialogScrollIndex++;
			while dialogChoiceSelectionIndex-dialogScrollIndex < -dialogChoiceScrollOptions+(dialogTextMaxLines) dialogScrollIndex--;
			break;
		case dialogType.speech:
			if dialogCrawlIndex = dialogCrawlMax
			{
				dialogScrollIndex = clamp(dialogScrollIndex+vertInput,0,dialogScrollMax);
			}
			break;
	}
	#endregion
	
	#region respond and manage on input
	if response != noone
	{
		dialogScrollIndex = 0;
		dialogCrawlIndex = 0;
		switch dialogIndex
		{
			case 0: #region test dialog
				switch dialogCurrentType
				{
					case dialogType.choice:
						switch dialogIndexSub
						{
							case 0: #region Initial choice
								switch response
								{
									case 0: //"Proc for small dialog text."
										dialogIndexSub = 0;
										dialogTextID = 0;
										dialogCurrentType = dialogType.speech;
										break;
									case 1: //"Proc for large dialog text."
										dialogIndexSub = 1;
										dialogTextID = 0;
										dialogCurrentType = dialogType.speech;
										break;
									case 2: //"Proc for math problem."
										dialogIndexSub = 2;
										dialogTextID = 0;
										dialogCurrentType = dialogType.speech;
										var cache = DialogCache.dialog[| dialogIndex];
										var subCache = cache[| dialogIndexSub];
										subCache[| 0] = "Answer this equation: ";
										
										var num1 = irandom(9)+1;
										var num2 = irandom(9)+1;
										var operation = irandom(2);
										var answer;
										switch operation
										{	
											case 0: subCache[| 0] += string(num1)+" + "+string(num2)+ " = ?"; answer = num1+num2; break;
											case 1: subCache[| 0] += string(num1)+" - "+string(num2)+ " = ?"; answer = num1-num2; break;
											case 2: subCache[| 0] += string(num1)+" * "+string(num2)+ " = ?"; answer = num1*num2; break;
										}
										
										cache = DialogCache.data[| dialogIndex];
										cache[| 0] = answer;
										
										cache = DialogCache.choices[| dialogIndex];
										var subCache = cache[| 1]; //math choices cache
										var ansInd = irandom(9);
										for(var i = 0; i < 10; i++)
										{
											var rep = true;
											if i == ansInd
											{
												rep = false;
												subCache[| i] = string(answer);
											}
											while(rep)
											{
												var num = 0;
												num = round(random_range(-10,10)*answer);
												if ds_list_find_index(subCache,num) == -1 && num != answer
												{
													subCache[| i] = string(num);
													rep = false;
												}
											}
										}
										break;
									case 3: //"Leave"
										leaveCall = true;
										break;
								}
								break;
								#endregion
							case 1: #region Math Response
								var cache = DialogCache.choices[| dialogIndex];
								var subCache = cache[| dialogIndexSub];
								response = int64(subCache[| response]);
								cache = DialogCache.data[| dialogIndex];
								answer = cache[| 0]; //equation answer
								dialogTextID = 0;
								dialogCurrentType = dialogType.speech;
								if response == answer dialogIndexSub = 3;
								else dialogIndexSub = 4;
								break;
							#endregion
						}
						break;
					case dialogType.speech:
						switch dialogIndexSub
						{
							case 0: #region Small Dialog: return to initial
								dialogIndexSub = 0;
								dialogTextID = 0;
								dialogCurrentType = dialogType.choice;
								break;
							#endregion
							case 1: #region Large Dialog: return to initial
								dialogIndexSub = 0;
								dialogTextID = 0;
								dialogCurrentType = dialogType.choice;
								break;
							#endregion
							case 2: #region Math Problem: go to answer choice
								dialogIndexSub = 1;
								dialogTextID = 0;
								dialogCurrentType = dialogType.choice;
								break;
							#endregion
							case 3: #region Math Problem: Correct response
								dialogIndexSub = 0;
								dialogTextID = 0;
								dialogCurrentType = dialogType.choice;
								break;
							#endregion
							case 4: #region Math Problem: Failure response
								dialogIndexSub = 0;
								dialogTextID = 0;
								dialogCurrentType = dialogType.choice;
								break;
							#endregion
						}
						break;
				}
				break;
			#endregion
		}
		dialogChoiceSelectionIndex = 0;
	}
	#endregion
}

if leaveCall
{
	interactionActive = false;
	dialogCurrentState = dialogState.closing
	dialogIndex = noone;
	dialogIndexSub = noone;
	dialogTextID = noone;
	dialogCurrentType = noone;
}

playerCanActCutscene = true;
showHud = true;
#region World Event Machine
var run = true;
while run
{
	if !ds_stack_empty(mainWorldEventStack)
	{
		//playerCanActCutscene = false;
		//showHud = false;
		run = false;
		var finished = false;
		var submap = ds_stack_top(mainWorldEventStack);
		var type = submap[? worldEventCommandData.type];
		switch type
		{
			case worldEventCommand.enemyKilled:			#region
					//do nothing
					//end if enemy killed
				var enemy = submap[? worldEventCommandData.arg1];
				if !instance_exists(enemy) || enemy.isDead
				{
					finished = true;
				}
				break;									#endregion
			case worldEventCommand.runScript:			#region
					//execute script
				var script = submap[? worldEventCommandData.arg1];
				script_execute(script);
					//end instantly
				finished = true;
				break;									#endregion
			case worldEventCommand.runScriptRepeat:			#region
					//execute script, end is based on script's return
				var script = submap[? worldEventCommandData.arg1];
				var finished = script_execute(script);
				break;									#endregion
		}
	
		if finished
		{
			run = true;	//re-run
			worldEventTimer = 0
			ds_stack_pop(mainWorldEventStack);
			ds_map_destroy(submap);
			
			if mainWorldEventQueueMap[? worldEventCommandData.type] != noone
			{
				scr_worldEventCommand_add(mainWorldEventQueueMap[? worldEventCommandData.type], mainWorldEventQueueMap[? worldEventCommandData.arg1], mainWorldEventQueueMap[? worldEventCommandData.arg2], mainWorldEventQueueMap[? worldEventCommandData.arg3], mainWorldEventQueueMap[? worldEventCommandData.arg4], mainWorldEventQueueMap[? worldEventCommandData.arg5]);
				mainWorldEventQueueMap[? worldEventCommandData.type] = noone;
				mainWorldEventQueueMap[? worldEventCommandData.arg1] = noone;
				mainWorldEventQueueMap[? worldEventCommandData.arg2] = noone;
				mainWorldEventQueueMap[? worldEventCommandData.arg3] = noone;
				mainWorldEventQueueMap[? worldEventCommandData.arg4] = noone;
				mainWorldEventQueueMap[? worldEventCommandData.arg5] = noone;
			}
		}
	}
	else run = false;
}
#endregion
#region Cutscene Machine
run = true;
while run 
{
	if !ds_stack_empty(mainCutsceneStack)
	{
		playerCanActCutscene = false;
		showHud = false;
		run = false
		var finished = false;
		var submap = ds_stack_top(mainCutsceneStack);
		var type = submap[? cutsceneCommandData.type];
		switch type
		{
			case cutsceneCommand.fadeIn:				#region
				var colour = submap[? cutsceneCommandData.arg1];
				var duration = submap[? cutsceneCommandData.arg2];
				Camera.fadeTypeState = fadeType.in;
				Camera.fadeColour = colour;
				Camera.fadeDuration = duration;
				Camera.fadeTimer = 0;
				finished = true;
				break;									#endregion
			case cutsceneCommand.fadeOut:				#region
				var colour = submap[? cutsceneCommandData.arg1];
				var duration = submap[? cutsceneCommandData.arg2];
				Camera.fadeTypeState = fadeType.out;
				Camera.fadeColour = colour;
				Camera.fadeDuration = duration;
				Camera.fadeTimer = 0;
				finished = true;
				break;									#endregion
			case cutsceneCommand.waitTime:				#region
				var timerDuration = submap[? cutsceneCommandData.arg1];
				cutsceneTimer++;
				if cutsceneTimer >= round(timerDuration*room_speed)
				{
					finished = true;
				}
				break;									#endregion
			case cutsceneCommand.waitPuppet:			#region
				var instanceId = submap[? cutsceneCommandData.arg1];
				if puppetStackMap[? instanceId] == undefined || !ds_exists(puppetStackMap[? instanceId],ds_type_stack)
				{
					finished = true;
				}
				var timerDuration = submap[? cutsceneCommandData.arg2];
				if timerDuration > 0
				{
					cutsceneTimer++;
					if cutsceneTimer >= round(timerDuration*room_speed)
					{
						finished = true;
					}
				}
				break;									#endregion
			case cutsceneCommand.commandPuppet:			#region
				var instanceId = submap[? cutsceneCommandData.arg1];
				var commandType = submap[? cutsceneCommandData.arg2];
				var override = submap[? cutsceneCommandData.arg3];
				var arg1 = submap[? cutsceneCommandData.arg4];
				var arg2 = submap[? cutsceneCommandData.arg5];
				var arg3 = submap[? cutsceneCommandData.arg6];
				var arg4 = submap[? cutsceneCommandData.arg7];
				var arg5 = submap[? cutsceneCommandData.arg8];
				scr_puppetCommand_add(instanceId,commandType,false,override,arg1,arg2,arg3,arg4,arg5);
				finished = true;
				break;									#endregion
			case cutsceneCommand.commandWorldEvent:		#region
				var commandType = submap[? cutsceneCommandData.arg1];
				var arg1 = submap[? cutsceneCommandData.arg2];
				var arg2 = submap[? cutsceneCommandData.arg3];
				var arg3 = submap[? cutsceneCommandData.arg4];
				var arg4 = submap[? cutsceneCommandData.arg5];
				var arg5 = submap[? cutsceneCommandData.arg6];
				scr_worldEventCommand_add(commandType,arg1,arg2,arg3,arg4,arg5);
				finished = true;
				break;									#endregion
		}
		
		if finished
		{
			run = true;	//re-run
			playerCanActCutscene = true;
			showHud = true;
			cutsceneTimer = 0
			ds_stack_pop(mainCutsceneStack);
			ds_map_destroy(submap);
		}
	}
	else run = false;
}
#endregion
#region Puppet Machine
var instanceIndex = ds_map_find_first(puppetStackMap);
while instanceIndex != undefined
{
	with instanceIndex
	{
		var stack = other.puppetStackMap[? instanceIndex];
		run = true;
		while run 
		{
			if stack != undefined && ds_exists(stack,ds_type_stack)
			{
				if object_index == objPlayer other.playerCanActCutscene = false;
				run = false;
				var currentCommand = ds_stack_top(stack);
				var commandType = currentCommand[| puppetCommandData.type];
				var commandInterruptible = currentCommand[| puppetCommandData.interruptible];
				var commandArg1 = currentCommand[| puppetCommandData.arg1];
				var commandArg2 = currentCommand[| puppetCommandData.arg2];
				var commandArg3 = currentCommand[| puppetCommandData.arg3];
				var commandArg4 = currentCommand[| puppetCommandData.arg4];
				var commandArg5 = currentCommand[| puppetCommandData.arg5];
		
				var finished = false;
				switch commandType
				{
					case puppetCommand.waitTillIdle:	#region waitTillIdle
							//action
						//do nothing
							//endConditions
								//time (optional)
						var maxTime = commandArg1;
						if maxTime > 0
						{
							puppetTimer++;
							if puppetTimer >= round(maxTime*room_speed)
							{
								finished = true;
							}
						}
								//instance is idle
						if phase = state.base && subPhase = subState.idle
						{
							finished = true;
						}
						break;							#endregion
					case puppetCommand.moveTo:			#region Move to
							//action
						if abs(commandArg2-x) > abs(xSpd)*1.05
						{
							var dir = sign(commandArg2-x);
							driveMove = dir;
							facing = commandArg3;
						}
							//endConditions
								//reach target
						else
						{
							if place_free(commandArg2,y) x = commandArg2;
							finished = true;
							driveMove = 0;
						}
						break;						#endregion
					case puppetCommand.interact:		#region Interact
							//action
						if puppetTimer = 0
						{
							phase = state.interact;
							phaseTimer = 0;
							subPhase = subState.performing;
							subPhaseTimer = 0;
					
							interactSprite = commandArg1;
							interactAnimDuration = commandArg2;
							interactUseDuration = commandArg3;
							interactScript = commandArg4;
							currentInteractionInstance = commandArg5;
						}
							//endConditions
								//end after duration
						puppetTimer++;
						if puppetTimer >= round(interactAnimDuration*room_speed)
						{
							finished = true;
						}
						break;						#endregion
					case puppetCommand.emote:			#region Emote
							//action
						if puppetTimer = 0
						{
							phase = state.emote;
							phaseTimer = 0;
							subPhase = subState.performing;
							subPhaseTimer = 0;
					
							emoteSprite = commandArg1;
							emoteStateDuration = commandArg2;
							emoteAnimSpeed = -emoteStateDuration;
						}
							//endConditions
						puppetTimer++;
						if puppetTimer >= round(emoteStateDuration*room_speed)
						{
							finished = true;
						}
						break;						#endregion
					case puppetCommand.emoteCyclic:		#region Emote Cyclic
							//action
						if puppetTimer = 0
						{
							phase = state.emote;
							phaseTimer = 0;
							subPhase = subState.performing;
							subPhaseTimer = 0;
					
							emoteSprite = commandArg1;
							emoteStateDuration = commandArg2;
							emoteAnimSpeed = 1;
						}
							//endConditions
						puppetTimer++;
						if puppetTimer >= round(emoteStateDuration*room_speed)
						{
							finished = true;
						}
						break;						#endregion
				}
			
				if finished
				{
					run = true;	//re-run
					puppetTimer = 0;
					ds_list_destroy(currentCommand);
					ds_stack_pop(stack);
					if ds_stack_empty(stack)
					{
						ds_stack_destroy(stack);
						ds_map_delete(other.puppetStackMap,instanceIndex);
					}
				}
			}
			else run = false;
		}
	}
	instanceIndex = ds_map_find_next(puppetStackMap,instanceIndex);
}
#endregion