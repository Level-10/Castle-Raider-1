function player_idle_state(){
// Get input
get_input();

// Calculate movement
calc_movement();

// Ckeck state
if h_speed != 0 state = STATES.WALK;

if attack {
	state = STATES.ATTACK;
	image_index = 0;
}

if jump {
	jumped();
}

if block {
	state = STATES.BLOCK;
	h_speed = 0;
}

if down {
	state = STATES.CROUCH;
	h_speed = 0;
}
// Apply movement
collision();

//chech players hp
check_player_hp();

// Apply animations
anim();
}