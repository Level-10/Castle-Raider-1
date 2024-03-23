function bug_chase_state(){
//check health
check_enemy_hp();

//calculate target movement
if obj_player.hp > 0 {
	target_x = obj_player.xprevious;
	target_y = obj_player.yprevious - sprite_get_height(obj_player.sprite_index) / 2; //for not chase the players feet
} else {
	//return to start pos if player has died
	target_x = start_x;
	target_y = start_y;
	//return to idle once at or near start pos
	if abs(x - start_x) < 2 and abs(y - start_y) < 2 state = BUG_STATES.IDLE;
}

//calculate movement
var _dir = point_direction(x, y, target_x, target_y);
var xx = lengthdir_x(chase_speed, _dir);
var yy = lengthdir_y(chase_speed, _dir);

//if knocked back, don't advance
if !hurt and alarm[KNOCKEDBACK] < 0 {
	//move towards the player
	var _buffer = 15;	//stop flicking left/right when at players x
	if (abs(x - obj_player.x) > _buffer) or (obj_player.hp <= 0) h_speed = xx;
	v_speed = yy;
} else {
	//bug hurt
	//ensure no vertical movement when knocked back
	v_speed = 0;
	//slowdown knockback
	h_speed = lerp(h_speed, 0, drag);
}

//facing dir
if sign(h_speed) != 0 facing = sign(xx);

//sound
if !audio_is_playing(snd_bug_chase) audio_play_sound(snd_bug_chase, 30, false);

// Apply movement
collision();

// Animations
bug_anim();
}