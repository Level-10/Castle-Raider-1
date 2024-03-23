function bug_patrol_state(){
//check health
check_enemy_hp();

//set speed 
h_speed = _speed * facing;
v_speed = 0;

//change state
if abs(start_x - x) > patrol_distance {
	state = BUG_STATES.IDLE;
}

//turn around if a wall found
if facing var _side = bbox_right else var _side = bbox_left;
var _t1 = tilemap_get_at_pixel(global.map, _side + sign(h_speed), y);
if _t1 == SOLID state = BUG_STATES.IDLE;

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