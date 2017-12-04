event_inherited();

colour = make_color_rgb(colourR,colourG,colourB);

x = mouse_x;
y = mouse_y;

var camX = camera_get_view_x(Camera.cam);
var camY = camera_get_view_y(Camera.cam);
var camW = camera_get_view_width(Camera.cam);
var camH = camera_get_view_height(Camera.cam);

if abs(x-camX) > camW+maxLightSize || abs(y-camY) > camH+maxLightSize enabled = false;
else enabled = true;