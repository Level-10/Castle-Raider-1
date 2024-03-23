function player_game_end_state(){
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
			get_input();
			if (jump or attack) and obj_game.game_over_won_delay < -room_speed {
				game_restart();
		}
	}
}


// Apply movement
collision();

// Apply animations
anim();
}