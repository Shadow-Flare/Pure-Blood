enum cameraState {idle, player}

monitorW = display_get_width();
monitorH = display_get_height();
monitorXOffset = ((monitorW-320)/2);
monitorYOffset = ((monitorH-180)/2);
displayResolutionX = 1920;
displayResolutionY = 1080;
vsync = 1;
display_reset(0,vsync);

if(monitorW>=displayResolutionX && monitorH>=displayResolutionY)
then
{
	surface_resize(application_surface,1920,1080)
	monitorXOffset=(monitorW-1920)/2;
	monitorYOffset=(monitorH-1080)/2;
}

cam = camera_create_view(0, 0, 320, 180, 0, -1, -1, -1, 0, 0);
camera_set_view_pos(cam,0,0);
view_set_camera(0,cam);
room_set_view_enabled(room,1);
room_set_viewport(room,0,1,0,0,1920,1080);

xTo = x;
yTo = y;
xPos = 0;
yPos = 0;