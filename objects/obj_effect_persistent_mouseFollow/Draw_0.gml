event_inherited();

surface_set_target(application_surface);
draw_set_color(c_white);
	draw_text(100,60,"Control using mouse wheel");
	draw_text(100,100,"Intensity:   "+string(intensity));
	draw_text(100,140,"Radius:      "+string(radius));
surface_reset_target();