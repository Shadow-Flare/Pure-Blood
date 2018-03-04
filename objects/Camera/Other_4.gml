if variable_instance_exists(id,"cam") camera_destroy(cam);

cam = camera_create_view(0, 0, 320, 176, 0, -1, -1, -1, 0, 0);
view_set_camera(0,cam);
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1920;
view_hport[0] = 1056;