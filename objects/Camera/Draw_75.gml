switch fadeTypeState
{
	case fadeType.none:
		break;
	case fadeType.in:
		fadeTimer++;
		var alpha = 1-clamp(fadeTimer/(fadeDuration*room_speed),0,1);
		var surfW = surface_get_width(application_surface);
		var surfH = surface_get_height(application_surface);
		draw_set_colour(fadeColour);
		draw_set_alpha(alpha);
		draw_rectangle(0,0,surfW,surfH,0);
		draw_set_alpha(1.0);
		if fadeTimer >= round(fadeDuration*room_speed)
		{
			fadeTypeState = fadeType.none;
			fadeTimer = 0;
		}
		break;
	case fadeType.out:
		fadeTimer++;
		var alpha = fadeTimer/(fadeDuration*room_speed);
		var surfW = surface_get_width(application_surface);
		var surfH = surface_get_height(application_surface);
		draw_set_colour(fadeColour);
		draw_set_alpha(alpha);
		draw_rectangle(0,0,surfW,surfH,0);
		draw_set_alpha(1.0);
		if fadeTimer > round(fadeDuration*room_speed)
		{
			fadeTypeState = fadeType.none;
			fadeTimer = 0;
		}
	case fadeType.hold:
		fadeTimer++;
		var surfW = surface_get_width(application_surface);
		var surfH = surface_get_height(application_surface);
		draw_set_colour(fadeColour);
		draw_rectangle(0,0,surfW,surfH,0);
		if fadeTimer > round(fadeDuration*room_speed)
		{
			fadeTypeState = fadeType.none;
			fadeTimer = 0;
		}
		break;
}