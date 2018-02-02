radius -= initialRadius/(duration*room_speed);
lightSize = radius;

if radius <= 0 instance_destroy();

var camX = camera_get_view_x(Camera.cam);
var camY = camera_get_view_y(Camera.cam);
var camW = camera_get_view_width(Camera.cam);
var camH = camera_get_view_height(Camera.cam);
var distanceToCam = point_distance(x,y,camX,camY);
var cameraLargestDist = sqrt(camW*camW+camH*camH);

if distanceToCam > cameraLargestDist+maxLightSize enabled = false;
else enabled = true;