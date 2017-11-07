event_inherited();

enum cameraState {idle, player}

cam = camera_create_view(0, 0, 320, 176, 0, -1, -1, -1, 0, 0);
camera_set_view_pos(cam,0,0);
view_set_camera(0,cam);
room_set_view_enabled(room,1);
room_set_viewport(room,0,1,0,0,1920,1080);

xTo = x;
yTo = y;
xPos = 0;
yPos = 0;