/// @description 
if action and !other.open and hp > 0 and (bbox_bottom == other.bbox_bottom) {
	with(other) {
		image_speed = 1;
		open = true;
		alarm[OPEN] = 1;
	}
	audio_play_sound(snd_open_chest, 50, false);
	//open door in boss room
	if room == rm_02 or room == rm_01 {
		var layer_id = layer_get_id("Door");
		layer_set_visible(layer_id, true);
		show_msg("You hear a door slide open in the distance...", 4);
		audio_play_sound(snd_door_opening_closing, 60, false);
	}
}

if !other.open and bbox_bottom == other.bbox_bottom {
	if gamepad_is_connected(0) {
		show_msg("Press X to open", 3);
	} else {
		show_msg("Press E to open", 3);
	}
}


