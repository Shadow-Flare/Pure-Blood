timer = 0;
roomFrom = global.roomTrans.roomFrom;
roomTo = global.roomTrans.roomTo;

global.paused = 1;

instance_deactivate_all(1);
instance_activate_object(ComboCache);
//instance_activate_object(obj_controller);

new = 0;

if instance_exists(Camera)
{
	camX = camera_get_view_x(Camera.cam);
	camY = camera_get_view_y(Camera.cam);
	camW = camera_get_view_width(Camera.cam);
	camH = camera_get_view_height(Camera.cam);
}
else
{
	camX = 1;
	camY = 1;
	camW = 1;
	camH = 1;
}