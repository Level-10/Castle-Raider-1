/// @description 
//shoot if within view
if on_screen(global.tile_size) {
	//object is within the screen
	if can_fire {
		can_fire = false;
		
		//set spawn position from the center
		var _ypos = ((sprite_get_height(sprite_index) / 2) - 2) * spawn_pos;
		//switch position for the next arrow
		spawn_pos *= -1;
		
		//create arrow
		var _inst = instance_create_layer(x, y + _ypos, "Arrow_shoot", obj_arrow);
		_inst.facing = facing;
		
		//create spark
		if facing var _side = bbox_right else var _side = bbox_left;
		var _inst = instance_create_layer(_side, y + _ypos, "Arrow_shoot", obj_arrow_spark);
		_inst.image_xscale = facing;
		
		//sound
		audio_play_sound(snd_arrow_firing, 10, false);
		
	} else {
		fire_delay--;
		if fire_delay <= 0 {
			can_fire = true;
			fire_delay = fire_delay_initial;
		}
	}
} else {
	fire_delay--;
}
