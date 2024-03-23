function player_walk_state(){
// Get input
get_input();

// Calculate movement
calc_movement();

// Ckeck state
if h_speed == 0 state = STATES.IDLE;

// Check if falling off ledge
var _side = bbox_bottom;
var _t1 = tilemap_get_at_pixel(global.map, bbox_left, _side + 1);
var _t2 = tilemap_get_at_pixel(global.map, bbox_right, _side + 1);

if _t1 == VOID and _t2 == VOID {
	state = STATES.JUMP;
	jumps = jumps_initial;
}

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