/// @description 
// Get dimensions
var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);

// Create camera
camera = camera_create_view(0, 0, _w, _h, 0, -1, -1, -1, 128, 128);
view_set_camera(0, camera);

// Camera following vars
follow = noone;
move_to_x = x;
move_to_y = y;

// How fast the camera pans
camera_pan_speed_initial = 0.15;	//lower = slowed_pan
camera_pan_speed = 1;

// Reset camera to default pan speed
alarm[CAMERA_RESET] = 3;

//screen shake
screen_shake = false;
screen_shake_amount_initial = 3;
screen_shake_amount = screen_shake_amount_initial;

// Move onto the main room
room_goto_next();

global.cx = 0;
global.cy = 0;
global.cw = 0;
global.ch = 0;