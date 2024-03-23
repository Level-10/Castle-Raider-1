function frog_jump_land_state(){
//check health
check_enemy_hp();
// Get inputs

// Calculate movement
calc_entity_movement();

// Modify state
if image_index >= image_number - sprite_get_speed(sprite_index) / room_speed {
	state = FROG_STATES.IDLE;
	image_index = 0;
	image_speed = 0;
}

// Apply state
collision();

// Animations
frog_anim();
}