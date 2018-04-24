///@arg x1
///@arg x2
///@arg y
///@arg thickness
///@arg value
///@arg maxValue
///@arg scale
///@arg blend
var x1 = argument0;
var x2 = argument1;
var yy = argument2;
var thickness = argument3;
var value = argument4;
var maxValue = argument5;
var scale = argument6;
var blend = argument7;

var prevAlpha = draw_get_alpha();
draw_set_alpha(1);

var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

if !variable_instance_exists(id,"barTempSurface") || !surface_exists(barTempSurface) barTempSurface = surface_create(surfW,surfH);

if x1 > x2
{
	var temp = x1;
	x1 = x2;
	x2 = temp;
}
if abs(x1-x2) < 3 x2 = x1+3;
thickness = max(thickness,3*scale);
var pixelThickness = round(thickness/scale);
var pixelXFill = floor((abs(x2-x1-1)*(value/maxValue))/scale);

surface_set_target(barTempSurface);
	draw_rectangle_color(x1,yy,x2,yy+pixelThickness*scale,c_black,c_black,c_black,c_black,false);
	draw_rectangle_color(x1+scale,yy+scale,x2-scale,yy+(pixelThickness-1)*scale,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
	if value != 0 draw_rectangle_color(x1+scale,yy+scale,x1+pixelXFill*scale,yy+(pixelThickness-1)*scale,blend,blend,blend,blend,false);
surface_reset_target();

draw_surface_ext(barTempSurface,0,0,1,1,0,c_white,prevAlpha);

draw_set_alpha(prevAlpha);