var vertInput = InputManager.dDInput-InputManager.dUInput;
var selectInput = InputManager.aInput;

#region State Machine, controlle movement and disablement
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