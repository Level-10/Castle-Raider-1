function process_enemy_attack(_hurt_knockback, _block_knockback){
/// @arg _hurt_knockback_def_-1
/// @arg _block_knockback_def_-1

//set some default values
if _hurt_knockback = -1 _hurt_knockback = 4;
if _block_knockback =-1 _block_knockback = 2.5;

if obj_player.hp > 0 and !hurt {
	if !block or (block and sign(x - other.x) == facing) {
		
		hurt = true;
			
		//face the enemy
		facing = sign(other.x - x);
		
		//ensure facing can never be 0
		if facing == 0 facing = 1;
		
		//ensure enemy faces player
		other.facing = -facing;
				
		//move player away
		var _knockback_dist = _hurt_knockback;
		h_speed = -facing * _knockback_dist;
			
		// Face the hitbox if on ground
		if on_ground() facing = facing;
			
		// Damage player
		hp -= 1;
			
		// Set hurt timer
		alarm[HURT] = hurt_time;
		
		//change state
		state = STATES.HURTING;
		image_index = 0;
		
		//screen shake
		scr_screen_shake(.125, -1);
		
		//sound
		audio_play_sound(snd_player_hit, 40, false);
	} else {
		//blocking damage
		if state != STATES.KNOCKBACK {
			state = STATES.KNOCKBACK;
			image_index = 0;
			image_speed = 1;
				
			//zero h_speed_decimal as precision is more important here
			h_speed_decimal = 0;
				
			//move player away from the attack
			var _knockback_dist = _block_knockback;
			h_speed = sign(x - other.x) * _knockback_dist;
			
			//screen shake
			scr_screen_shake(.125, -1);
			
			//sound
			audio_play_sound(snd_block, 40, false);
			
			//enemy gets knocked back too
			with other {
				if object_index = obj_bug {
					//zero decimal to get exact movement
					h_speed_decimal = 0;
					//knock the enemy away from the player
					h_speed = sign(x - obj_player.x) * other.knockback_dis;
					alarm[KNOCKEDBACK] = other.knockback_time;
				}
			}
		}
	}
}
}