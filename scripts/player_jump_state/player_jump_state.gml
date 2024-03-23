function player_jump_state(){
// Get input
get_input();

// Calculate movement
calc_movement();

// Ckeck state
if on_ground() {
	//apply stretch
	scale_x = scale_max;
	scale_y = scale_min;
	if h_speed != 0 state = STATES.WALK else state = STATES.IDLE;
	// Create dust if landing
	if v_speed > 0 {
		instance_create_layer(x, y, "Dust", obj_player_dust_land);
		//sound
		audio_play_sound(snd_landing, 20, false);
	}
}

if attack {
	state = STATES.ATTACK;
	image_index = 0;
}

// Enable double jumps
if jump {
	jumped();
}

// Enable smaller jumps
if v_speed < 0 and !jump_held v_speed = max (v_speed, jump_speed / jump_dampner);

// Apply movement
collision();

//chech players hp
check_player_hp();

// Apply animations
anim();

}