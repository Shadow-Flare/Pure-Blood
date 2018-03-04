var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

drawVertMod = (1-dialogBoxY1+0.2);
if dialogDraw
{
	if !surface_exists(dialogTextSurf) dialogTextSurf = surface_create(((dialogBoxX2-dialogBoxX1)*surfW-dialogTextGapWidth*2)/dialogTextScale,((dialogBoxY2-dialogBoxY1)*surfH-dialogTextGapWidth*2-dialogTextTopShift)/dialogTextScale);
	
	switch dialogCurrentState
	{
		case dialogState.closed: {drawVertMod = (1-dialogBoxY1+0.2); break;}
		case dialogState.opening: {drawVertMod = (1-dialogBoxY1+0.2)*(1-(dialogTransitionTimer/round(dialogTransitionDuration*room_speed))); break;}
		case dialogState.closing: {drawVertMod = (1-dialogBoxY1+0.2)*(dialogTransitionTimer/round(dialogTransitionDuration*room_speed)); break;}
		case dialogState.dialog: {drawVertMod = 0; break;}
	}
		//textbox
	scr_draw_textbox(dialogBoxX1*surfW,(dialogBoxY1+drawVertMod)*surfH,dialogBoxX2*surfW,(dialogBoxY2+drawVertMod)*surfH,dialogBoxType,dialogBoxScale,dialogBoxBlend);
	
		//text
	switch dialogCurrentType
	{
		case dialogType.choice:
			draw_set_font(fnt_dialog);
			draw_set_alpha(1.0);
			
			var textSingleLineHeight = string_height("test");
			var textSep = (surface_get_height(dialogTextSurf)-(dialogTextMaxLines*textSingleLineHeight))/(dialogTextMaxLines-1)+textSingleLineHeight;
			var textW = surface_get_width(dialogTextSurf)-dialogTextLeftShiftUse*dialogTextLeftShift;
			
			surface_set_target(dialogTextSurf);
				var line = 0;
				draw_clear_alpha(c_white,0.0);
				for(var i = 0; i < ds_list_size(dialogChoiceOptions); i++)
				{
					draw_set_colour(c_gray);
					if i == dialogChoiceSelectionIndex draw_set_colour(c_white);
					
					var text = string(i+1)+". "+dialogChoiceOptions[| i];
					draw_text_ext(0,(-dialogScrollIndex+line)*(textSep),text,textSep,textW);
					
					var textTotalLineHeight = string_height_ext(text,textSingleLineHeight,textW)/textSingleLineHeight;
					line += textTotalLineHeight;
				}
			surface_reset_target();
			
			draw_surface_ext(dialogTextSurf,dialogBoxX1*surfW+dialogTextGapWidth+dialogTextLeftShift*dialogTextLeftShiftUse,(dialogBoxY1+drawVertMod)*surfH+dialogTextGapWidth+dialogTextTopShift,dialogTextScale,dialogTextScale,0,c_white,1.0);
			
			break
		case dialogType.speech:
			draw_set_font(fnt_dialog);
			draw_set_colour(c_white);
			draw_set_alpha(1.0);
		
			var cache = DialogCache.dialog[| dialogIndex];
			var subCache = cache[| dialogIndexSub];
			var currentDialog = subCache[| dialogTextID];
			currentDialog = string_copy(currentDialog,0,dialogCrawlIndex);
		
			var textSingleLineHeight = string_height("test");
			var textSep = (surface_get_height(dialogTextSurf)-(dialogTextMaxLines*textSingleLineHeight))/(dialogTextMaxLines-1)+textSingleLineHeight;
			var textW = surface_get_width(dialogTextSurf)-dialogTextLeftShiftUse*dialogTextLeftShift;
			var textTotalLineHeight = string_height_ext(currentDialog,textSingleLineHeight,textW)/textSingleLineHeight;
		
			surface_set_target(dialogTextSurf);
				draw_clear_alpha(c_white,0.0);
				draw_text_ext(0,-dialogScrollIndex*(textSep),currentDialog,textSep,textW);
			surface_reset_target();
		
			draw_surface_ext(dialogTextSurf,dialogBoxX1*surfW+dialogTextGapWidth+dialogTextLeftShift*dialogTextLeftShiftUse,(dialogBoxY1+drawVertMod)*surfH+dialogTextGapWidth+dialogTextTopShift,dialogTextScale,dialogTextScale,0,c_white,1.0);
		
				//scroll bar
			if dialogScrollMax != 0
			{
				dialogTextLeftShiftUse = true;
					//back
				scr_draw_scroll_bar(surfW*dialogScrollX1,surfH*(dialogScrollY1+drawVertMod),surfH*(dialogScrollY2+drawVertMod),0,4,c_blue);
					//cursor
				var scrollYMod = abs(dialogScrollY2-dialogScrollY1-(sprite_get_height(dialogScrollCursorSprite)*dialogScrollBarScale/surfH))*(dialogScrollIndex/dialogScrollMax);
				draw_sprite_ext(dialogScrollCursorSprite,0,surfW*dialogScrollX1,surfH*(dialogScrollY1+scrollYMod+drawVertMod),dialogScrollBarScale,dialogScrollBarScale,0,dialogScrollCursorColour,1);
			}
			else dialogTextLeftShiftUse = false;
		break;
	}
}

Camera.forceY = ((1-dialogBoxY1+0.2)-drawVertMod)/1.43*176;