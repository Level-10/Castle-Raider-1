function scr_screen_shake(seconds, shake_amount){
/// @descr scr_screen_shake(seconds, shake_amount);
/// @arg seconds_to_shake
/// @arg shake_amount-1def

var _time = argument[0];
var _amount = argument[1];

with obj_camera {
	//default
	if _amount == -1 _amount = screen_shake_amount_initial;
	screen_shake = true;
	alarm[SCREEN_SHAKE_TIME] = room_speed * _time;
	screen_shake_amount = _amount;
}
}