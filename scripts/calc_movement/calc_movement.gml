function calc_movement(){
h_speed = h_speed + (right - left) * walk_speed;
v_speed += global.grav;

	// Drag
	h_speed = lerp(h_speed, 0, drag);

	// Stop
	if abs(h_speed) <= 0.1 h_speed = 0;

	// Face correct way
	if h_speed != 0 facing = sign(h_speed);

	// Limit speed
	h_speed = min(abs(h_speed), max_h_speed) * facing;
	
	//stop stretch
	scale_x = lerp(scale_x, 1, scale_decay);
	scale_y = lerp(scale_y, 1, scale_decay);
}