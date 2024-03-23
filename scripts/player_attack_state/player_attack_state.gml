function player_attack_state(){
// Get input
get_input();

// Calculate movement
calc_movement();

// Ckeck state
if image_index >= image_number - sprite_get_speed(sprite_index) / room_speed {
	if !on_ground() state = STATES.JUMP else
	if h_speed != 0 state = STATES.WALK else state = STATES.IDLE;
}

if jump {
	jumped();
	state = STATES.ATTACK;
	
}

// Create hitbox
if image_index >= 1 and image_index <= 3 {
	var _inst = instance_create_layer(x, y, "Player", obj_player_attack_hitbox);
	_inst.image_xscale = facing;
	//sound
	if image_index == 1 audio_play_sound(snd_sword_swing, 20, false);
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