function player_knockback_state(){
// Get input
get_input();

// Calculate movement
v_speed += global.grav;

	// Drag
	h_speed = lerp(h_speed, 0, drag);

	// Stop
	if abs(h_speed) <= 0.5 h_speed = 0;

// Ckeck state
//change state after animation
if (image_index >= image_number - sprite_get_speed(sprite_index)/room_speed) and h_speed == 0 {
	//change state
	if block {
		if down state = STATES.CROUCH_BLOCK else state = STATES.BLOCK;
	} else {
		state = STATES.IDLE;
	}
}


// Apply movement
collision();

//chech players hp
check_player_hp();

// Apply animations
anim();
}