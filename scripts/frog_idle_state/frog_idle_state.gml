function frog_idle_state(){
//check health
check_enemy_hp();
// Get inputs
breathing();

// Calculate movement
calc_entity_movement();

// Modify state
// Attack
var _detect_player_dis = 40;
var _player_alert = false;	// Player in front and within range, but attack is not ready
// Player is with detected distance and we are facing the player and we can attack
if (distance_to_object(obj_player) < _detect_player_dis) and sign(obj_player.x - x) = facing and can_attack {
	if obj_player.hp > 0 {
		if can_attack {
		// Attack
		can_attack = false;
		state = FROG_STATES.ATTACK;
		image_index = 0;
		image_speed = 1;
		}
		_player_alert = true;
	}
}

if (jump_timer < 0) and !_player_alert {
	// Reset timer
	jump_timer = jump_timer_initial;
	// Do we jump ?
	var _jump = random(1);
	if _jump > jump_chance {
		state = FROG_STATES.JUMP_START;
		// Reset breath values
		image_index = 0;
		image_speed = 1;
		max_h_speed = max_h_speed_initial;
		var _turned = false;
		// Look for solid one tile ahead
		var _t1 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size, bbox_bottom);
		if _t1 == SOLID {
			facing *= -1;
			_turned = true;
		}
		// Look for void one tile ahead
		var _t1 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size, bbox_bottom + 1);
		if _t1 == VOID {
			if !_turned facing *= -1;
		}
		// Look for void multiple tiles ahead
		for (var i = 3; i > 0; i --) {
			_t1 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size * i, bbox_bottom + 1);
			if _t1 == VOID {
				// Find furthest jump point
				var _tile_start_x = (x + sign(facing) * global.tile_size * i) -
									(x + sign(facing) * global.tile_size * i) mod global.tile_size;
				// Half of mask
				var _half_mask = (bbox_right + 1 - bbox_left)/2;
				if facing {
					var _target = _tile_start_x - _half_mask;
				} else {
					var _target = _tile_start_x + _half_mask + global.tile_size;
				}
				// Adjust max_h_speed to land at target
				// speed = distance/time
				// How long is frog in air = 48
				var _steps_in_air = 48;
				max_h_speed = abs(_target - x) / _steps_in_air;
			}
		}
	}
} else {
	jump_timer --;
}

// Apply movement
collision();

// Animations
frog_anim();
}