function jumped(){
// Standard jump off the ground
if on_ground() jumps = jumps_initial;
if jumps > 0 {
	scale_x = scale_min;
	scale_y = scale_max;
	v_speed_decimal = 0;
	state = STATES.JUMP;
	v_speed = jump_speed;
	jumps -= 1;
	jump_dust();
	//sound
	audio_play_sound(snd_jump, 15, false);
}
}