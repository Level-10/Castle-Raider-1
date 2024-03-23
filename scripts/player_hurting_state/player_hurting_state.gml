function player_hurting_state(){
// Get input
get_input();

// Calculate movement
v_speed += global.grav;

	// Drag
	h_speed = lerp(h_speed, 0, drag);

	// Stop
	if abs(h_speed) <= 0.1 h_speed = 0;

// Ckeck state
//set to firts frame and stop if animation has played once
if on_ground() {
	if image_index >= image_number - sprite_get_speed(sprite_index)/room_speed {
		image_index = 0;
		image_speed = 0;
	}
}

var _recover_time = 0.4;	//1 = instant recover
if alarm[HURT] < hurt_time * _recover_time {
	if on_ground() {
		 state = STATES.IDLE;
	} else {
		state = STATES.JUMP;
	}
	image_speed = 1;
}

// Apply movement
collision();

//chech players hp
check_player_hp();

// Apply animations
anim();
}