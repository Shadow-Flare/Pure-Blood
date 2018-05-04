var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

#region Main Map Draw
var mapSurfW = (surfW)*(mapHudViewportX2-mapHudViewportX1);
var mapSurfH = (surfH)*(mapHudViewportY2-mapHudViewportY1);
var mapBaseW = mapSurfW+mapHudViewportBorderWidth*2;
var mapBaseH = mapSurfH+mapHudViewportBorderWidth*2;

var mapViewPixelScale = power(2,4-mapZoomLevelDisplay);
var cursorX = round(mapCursorXDisplay*mapViewPixelScale)/mapViewPixelScale;
var cursorY = round(mapCursorYDisplay*mapViewPixelScale)/mapViewPixelScale;

if !surface_exists(mapViewSurface)
{
	mapViewSurface = surface_create(mapSurfW,mapSurfH);
}
if !surface_exists(mapViewBase)
{
	mapViewBase = surface_create(mapBaseW,mapBaseH);
	surface_set_target(mapViewBase);
		draw_set_colour(mapHudViewportBorderColour);
			draw_rectangle(0,0,mapBaseW-1,mapBaseH-1,0);
		gpu_set_blendmode(bm_subtract);
			draw_rectangle(mapHudViewportBorderWidth,mapHudViewportBorderWidth,mapBaseW-mapHudViewportBorderWidth-1,mapBaseH-mapHudViewportBorderWidth-2,0);
		gpu_set_blendmode(bm_normal);
		draw_set_colour(mapHudViewportBaseColour);
		draw_set_alpha(mapHudViewportBaseTransparency);
			draw_rectangle(mapHudViewportBorderWidth,mapHudViewportBorderWidth,mapBaseW-mapHudViewportBorderWidth-1,mapBaseH-mapHudViewportBorderWidth-2,0);
		draw_set_alpha(1.0);
	surface_reset_target();
}
if !surface_exists(mapViewDetails)
{
	mapViewDetails = surface_create(mapSurfW,mapSurfH);
}

surface_set_target(mapViewSurface);
	draw_clear_alpha(c_white,0.0);
	var x1 = round(mapSurfW/2-cursorX*mapViewPixelScale);
	var y1 = round(mapSurfH/2-cursorY*mapViewPixelScale);
	draw_surface_ext(MapManager.mapSurface,x1,y1,mapViewPixelScale,mapViewPixelScale,0,c_white,1.0);
surface_reset_target();

surface_set_target(mapViewDetails);
	draw_clear_alpha(c_black,0.0);
	var coordinates = string_replace(room_get_name(room),"rmRoom","");
	var coordX = int64(string_copy(coordinates,2,3));
	var coordY = int64(string_copy(coordinates,6,3));
	instance_activate_object(objPlayer);
	var playerX = objPlayer.x/room_width;
	var playerY = objPlayer.y/room_height;
	instance_deactivate_object(objPlayer);
	var rmCW = RoomCache.rmWidths[? room];
	var rmCH = RoomCache.rmHeights[? room];
	var xPM = MapManager.mapCellW*(coordX+(playerX*rmCW));
	var yPM = MapManager.mapCellH*(coordY+(playerY*rmCH));
	var xPV = mapSurfW/2+(xPM-cursorX)*mapViewPixelScale;
	var yPV = mapSurfH/2+(yPM-cursorY)*mapViewPixelScale;
	draw_sprite_ext(sprPlayerMarker,0,xPV,yPV,4,4,0,c_white,1);
	draw_sprite_ext(sprMapCursor,0,mapSurfW/2,mapSurfH/2,4,4,0,c_white,1.0);
surface_reset_target();

draw_surface(mapViewBase,surfW*mapHudViewportX1-mapHudViewportBorderWidth,surfH*mapHudViewportY1-mapHudViewportBorderWidth);
draw_surface(mapViewSurface,surfW*mapHudViewportX1,surfH*mapHudViewportY1);
draw_surface(mapViewDetails,surfW*mapHudViewportX1,surfH*mapHudViewportY1);

draw_set_font(fnt_small_text);
draw_set_colour(c_white);
draw_text(20,20,"Cursor X:");
	draw_text(100,20,string(mapCursorX));
draw_text(20,40,"Cursor Y:");
	draw_text(100,40,string(mapCursorY));
draw_text(20,60,"Zoom Level:");
	draw_text(100,60,string(mapZoomLevel));
#endregion
#region Title and Coord
	//Area name and coord;
var areaName = "{AREA NAME}";
draw_set_font(fnt_alagard);
	draw_text_colour(mapAreaNameX*surfW,mapAreaNameY*surfH,areaName,mapAreaNameColour,mapAreaNameColour,mapAreaNameColour,mapAreaNameColour,1.0);
draw_set_halign(fa_right);
	draw_text_colour(mapCoordX*surfW,mapCoordY*surfH,"("+string(coordX)+","+string(coordY)+")",mapCoordColour,mapCoordColour,mapCoordColour,mapCoordColour,1.0);
draw_set_halign(fa_left);
#endregion
#region Legend
scr_draw_textbox(mapDetailsTextboxX1*surfW,mapDetailsTextboxY1*surfH,mapDetailsTextboxX2*surfW,mapDetailsTextboxY2*surfH,mapDetailsTextboxType,mapDetailsTextboxScale,mapDetailsTextboxBlend);
#endregion