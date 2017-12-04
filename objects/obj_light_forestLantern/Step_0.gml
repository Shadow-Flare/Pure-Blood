lifeTime++

sizeMod = sin((lifeTime*pi*2)/(room_speed/iterationsPerSec))*variance
flicker = clamp(flicker+choose(-0.01,0,0.01),0.9,1.1);

lightSize = (radius+sizeMod)*flicker;

var camX = camera_get_view_x(Camera.cam);
var camY = camera_get_view_y(Camera.cam);
var camW = camera_get_view_width(Camera.cam);
var camH = camera_get_view_height(Camera.cam);
var distanceToCam = point_distance(x,y,camX,camY);
var cameraLargestDist = sqrt(camW*camW+camH+camH);

if distanceToCam > cameraLargestDist+maxLightSize enabled = false;
else enabled = true;