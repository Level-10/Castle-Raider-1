function anim(){
sprite_index = sprites_array[state];
mask_index = mask_array[state];
image_xscale = facing;

switch(state) {
	case STATES.JUMP:
		if v_speed < 0 image_index = 0 else image_index = 1;
	break;
	case STATES.ATTACK:
		if !on_ground() sprite_index = spr_player_air_attack;
		else 
		// On ground
			if h_speed != 0 sprite_index = spr_player_attack_walk
			else sprite_index = spr_player_attack;
	break;
	case STATES.HURTING:
		if !on_ground() {
			sprite_index = spr_player_jump;
			if v_speed < 0 image_index = 0 else image_index = 1;
		}
		break;
}
}