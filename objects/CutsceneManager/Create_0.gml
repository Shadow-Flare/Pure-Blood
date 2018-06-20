var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

enum dialogState {closed,opening,closing,dialog};
enum dialogType {choice,speech};

enum puppetCommand {waitTillIdle, moveTo, interact, emote, emoteCyclic};
enum puppetCommandData {type, interruptible, arg1, arg2, arg3, arg4, arg5};
enum cutsceneCommand {waitTime, waitPuppet, fadeIn, fadeOut, commandPuppet, commandWorldEvent};
enum cutsceneCommandData {type, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8};
enum worldEventCommand {enemyKilled, runScript, runScriptRepeat}
enum worldEventCommandData {type, arg1, arg2, arg3, arg4, arg5}
	
	//puppet/cutscene mechanisms
puppetStackMap = ds_map_create();
mainCutsceneStack = ds_stack_create();
mainWorldEventStack = ds_stack_create();

mainWorldEventQueueMap = ds_map_create();
mainWorldEventQueueMap[? worldEventCommandData.type] = noone;
mainWorldEventQueueMap[? worldEventCommandData.arg1] = noone;
mainWorldEventQueueMap[? worldEventCommandData.arg2] = noone;
mainWorldEventQueueMap[? worldEventCommandData.arg3] = noone;
mainWorldEventQueueMap[? worldEventCommandData.arg4] = noone;
mainWorldEventQueueMap[? worldEventCommandData.arg5] = noone;

cutsceneTimer = 0;
worldEventTimer = 0;

	//dialog
playerCanActDialog = true;
playerCanActCutscene = true;
interactionActive = false;
showHud = true;

dialogIndex = noone;
dialogIndexSub = noone;
dialogTextID = noone;
dialogCurrentType = noone;
		
dialogCrawlCharactersPerSecond = 24; //Characters per second
dialogCrawlTimer = 0;
dialogCrawlIndex = 0;
drawVertMod = 0;
		//text box
dialogBoxX1 = 0.02;
dialogBoxX2 = 1-dialogBoxX1;
dialogBoxY2 = 1-dialogBoxX1*(surfW/surfH);
dialogBoxY1 = dialogBoxY2-0.3;
dialogBoxType = 0;
dialogBoxScale = 4;
dialogBoxBlend = c_navy;
		//movement
dialogTransitionTimer = 0;
dialogTransitionDuration = 0.3;
dialogCurrentState = dialogState.closed;
dialogDraw = false;
		//text draw data
dialogTextGapWidth = 32;
dialogTextLeftShift = 64;
dialogTextLeftShiftUse = false;
dialogTextTopShift = -4;
dialogTextScale = 4;
dialogTextMaxLines = 4;
dialogTextSurf = noone;
		//scroll bar
dialogScrollX1 = dialogBoxX1+0.02;
dialogScrollY1 = dialogBoxY1+0.02*(surfW/surfH);
dialogScrollY2 = dialogBoxY2-0.02*(surfW/surfH);
dialogScrollBarScale = 4;
dialogScrollBarColour = c_blue;
dialogScrollCursorColour = c_blue;

dialogScrollIndex = 0;
dialogScrollMax = 0;

		//choice
dialogChoiceSelectionIndex = 0;
dialogChoiceScrollOptions = dialogTextMaxLines;
dialogChoiceOptions = ds_list_create();