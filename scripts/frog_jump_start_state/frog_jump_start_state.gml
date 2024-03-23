function frog_jump_start_state(){
//check health
check_enemy_hp();
// Get inputs

// Calculate movement
calc_entity_movement();

// Modify state
if image_index >= image_number - sprite_get_speed(sprite_index) / room_speed {
	state = FROG_STATES.JUMP;
	v_speed = jump_speed;
	
	//sound
	if on_screen(40) audio_play_sound(snd_frog_jump, 20, false);
}

// Apply movement
collision();

// Animations
frog_anim();
}