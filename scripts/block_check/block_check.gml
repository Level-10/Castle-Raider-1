function block_check(){
if block {
	if down state = STATES.CROUCH_BLOCK;
	else state = STATES.BLOCK;
	h_speed = 0;
} else {
	// Leave the block state
	if down {
		state = STATES.CROUCH;
		h_speed = 0;
	} else {
		if h_speed != 0 {
			if !on_ground() state = STATES.JUMP else state = STATES.WALK;
		} else {
			state = STATES.IDLE;
		}
	}
}
}