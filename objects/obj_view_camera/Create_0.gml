cam = view_camera[0];
x_to = noone;
y_to = noone;
target = obj_player;
view_width = camera_get_view_width(cam);
view_height = camera_get_view_height(cam);

normal_width = view_width;
normal_height = view_height;

zoom_width = 320;
zoom_height = 180;

// Screen Shake
shake_time = 0;
shake_lenght = 0;