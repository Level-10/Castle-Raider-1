function calc_entity_movement(){

v_speed += global.grav;

	// Drag
	h_speed = lerp(h_speed, 0, drag);

	// Stop
	if abs(h_speed) <= 0.1 h_speed = 0;
}