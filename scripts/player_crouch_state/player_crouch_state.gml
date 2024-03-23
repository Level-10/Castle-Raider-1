function player_crouch_state(){
// Get input
get_input();

// Calculate movement
calc_movement();

// Ckeck state
// Blocking
block_check();

if attack {
	state = STATES.ATTACK;
	image_index = 0;
}

if jump {
	jumped();
}

// Apply movement
collision();

//chech players hp
check_player_hp();

// Apply animations
anim();
}