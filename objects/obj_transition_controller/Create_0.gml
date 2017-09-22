/// @description Insert description here
// You can write your code in this editor

timer = 0;
roomFrom = global.roomTrans.roomFrom;
roomTo = global.roomTrans.roomTo;

global.paused = 1;

instance_deactivate_all(1);
instance_activate_object(obj_comboCache);
//instance_activate_object(obj_controller);

new = 0;

if instance_exists(obj_camera)
{
	camX = camera_get_view_x(obj_camera.cam);
	camY = camera_get_view_y(obj_camera.cam);
	camW = camera_get_view_width(obj_camera.cam);
	camH = camera_get_view_height(obj_camera.cam);
}
else
{
	camX = 1;
	camY = 1;
	camW = 1;
	camH = 1;
}