function show_msg(message, secs_to_display){
/// show message for the required time

var _msg = argument[0];
var _time = argument[1];

with obj_game {
	alarm[DISPLAY_MSG] = _time * room_speed;
	msg = _msg;
}
}