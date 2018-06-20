event_inherited();

var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

	//switch enum initializers
enum pauseMessageState {pedestalItem};
enum pauseMessageData {state,arg1,arg2};

canProceed = false;
proceed = false;
ending = false;
timer = 0;
initialized = false;

pauseMessagePhase = noone;
pauseMessageStack = ds_stack_create();
pauseMessageData1 = noone;
pauseMessageData2 = noone;

fadeDuration = 0.7;		//seconds

#region Pedestal Data
pedestalImageScale = 16;
pedestalImageCenterX = 0.5;				//smackbang center
pedestalImageCenterY = 500/surfH;
pedestalTitleFont = fnt_alagard;
pedestalTitleCenterX = 0.5;				//smackbang center
pedestalTitleBottomY = 250/surfH;
pedestalDescFont = fnt_alagard;
pedestalDescCenterX = 0.5;				//smackbang center
pedestalDescStartY = 800/surfH;
pedestalDescTextSep = 100/surfH;
pedestalDescTextWidth = 1600/surfW;
#endregion