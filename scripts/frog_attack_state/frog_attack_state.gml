function frog_attack_state(){
//check health
check_enemy_hp();
// Get inputs


// Calculate movement
calc_entity_movement();

// Modify state
// Attack warning
if image_index = 2 and !inhale {
	inhale = true;
	alarm [INHALE] = inhale_timer;
	image_speed = 0;
}

if attack {
	if image_index >= 5 and image_index <=6 {
		//create hitbox
		var _inst = instance_create_layer(x, y, "Enemy", obj_frog_attack_hitbox);
		//ensure hitbox faces the way the frog that created it is facing
		_inst.image_xscale = facing;
		//sound
		if image_index == 5 audio_play_sound(snd_frog_attack, 15, false);
	}
	// Set tongue depth
	depth = layer_get_depth(layer_get_id("Player")) - 1;

	if image_index >= image_number - sprite_get_speed(sprite_index)/room_speed {
		state = FROG_STATES.IDLE;
		alarm[CAN_ATTACK] = attack_delay;
		depth = layer_get_depth(layer_get_id("Enemy"));
		inhale = false;
		attack = false;
	}
}

// Apply movement
collision();

// Animations
frog_anim();
}