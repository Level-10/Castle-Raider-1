function frog_jump_state(){
//check health
check_enemy_hp();
// Get inputs

// Calculate movement
calc_entity_movement();

//horizontal movement
h_speed += _speed * facing;

// Limit speed
h_speed = min(abs(h_speed), max_h_speed) * facing;


// Modify state
// Check if on ground
if on_ground() {
	state= FROG_STATES.JUMP_LAND;
	h_speed = 0;
	image_index = 0;
	image_speed = 1;
}

// Apply state
collision();

// Animations
frog_anim();
}