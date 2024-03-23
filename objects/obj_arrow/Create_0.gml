/// @description 
//init
h_speed = 0;
v_speed = 0;
h_speed_decimal = 0;
v_speed_decimal = 0;
_speed = 4;
facing = -1;
image_speed = 0;

//destroy object
die = false;

//change objects layer after a set time
alarm[LAYER_CHANGE] = room_speed/7;