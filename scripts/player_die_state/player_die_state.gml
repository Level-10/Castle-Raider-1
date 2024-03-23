function player_die_state(){
// Get input

// Calculate movement
v_speed += global.grav;

	// Drag
	h_speed = lerp(h_speed, 0, drag);

	// Stop
	if abs(h_speed) <= 0.5 h_speed = 0;

// Ckeck state
//change state after animation
if (image_index >= image_number - 1) {
	image_speed = 0;
		if lives <= 0 {
			obj_game.game_over_lose = true;
		} else {
			//restart msg
			show_msg("Press Jump or Attack to restart", 1);
			get_input();
			if jump or attack {
				room_restart();
				fade_to_room(room, room_start_pos_x, room_start_pos_y, room_start_facing, c_black);
				//allow instant camera paning
				with (obj_camera) {
					//enable instant paning
					camera_pan_speed = 1;
					//reset camera pan speed
					alarm[CAMERA_RESET] = 3;
			}
		}
	}
}


// Apply movement
collision();

// Apply animations
anim();
}