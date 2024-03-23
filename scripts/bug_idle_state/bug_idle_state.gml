function bug_idle_state(){
//check health
check_enemy_hp();

//set speed 
h_speed = 0;
v_speed = 0;

//change state
if wait_time < 0 {
	facing *= -1;
	start_x = x;
	state = BUG_STATES.PATROL;
	wait_time = wait_time_initial;
} else {
	wait_time --;
}

//chase
if distance_to_object(obj_player) < chase_distance and obj_player.hp > 0 {
	state = BUG_STATES.CHASE;
	//sound
	audio_play_sound(snd_bug_sees_player, 40, false);
}

// Apply movement
collision();

// Animations
bug_anim();
}