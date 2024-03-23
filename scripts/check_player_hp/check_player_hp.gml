function check_player_hp(){
///check player hp
if hp <= 0 {
	state = STATES.DIE;
	image_index = 0;
	image_speed = 1;
	scale_x = 1;
	scale_y = 1;
	lives--;
	//sound
	audio_play_sound(snd_player_die, 15, false);
}
}