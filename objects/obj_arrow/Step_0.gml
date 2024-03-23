/// @description 

//movement
h_speed = _speed * facing;
image_xscale = sign(h_speed);

//stop if dead
if die h_speed = 0;

var _t1 = 0, _t2 = 0;
//destroy at wall if moved more than 1 tile
if abs(xstart - x) > global.tile_size {
	if sign(h_speed) var side = bbox_right else var side = bbox_left;
	_t1 = tilemap_get_at_pixel(global.map, side + sign(h_speed), bbox_top);
	_t2 = tilemap_get_at_pixel(global.map, side + sign(h_speed), bbox_bottom);
	if (_t1 == SOLID or _t1 == -1)  or (_t2 == SOLID or _t2 == -1) {
		die = true;
	}
	collision();
} else {
	x += h_speed;
}

//play animation
if die {
		//jump to image index 1 the first time we run die
	if image_speed != 1 image_index = 1;
	image_speed = 1;
	//play arrow die sound only if arrow is on screen
	if on_screen(40) {
		if image_index == 1 audio_play_sound(snd_arrow_die, 20, false);
	}
}

//destroy if leaving room
if _t1 == -1 or _t2 == -1 instance_destroy();