var _msg = "Find the chest to open the door";

if other.stage != 999 {
	//get layer id
	var layer_id = layer_get_id("Stage" + string(other.stage));

	//activate layer
	instance_activate_layer(layer_id);

	//destroy trigger
	instance_destroy(other);

	//close door
	if other.stage == 5 and !obj_chest.open {
		
		var layer_id = layer_get_id("Door");
		if layer_get_visible(layer_id) audio_play_sound(snd_door_opening_closing, 50, false);
		layer_set_visible(layer_id, false);
		instance_activate_layer("Door");
		//give player a msg
		show_msg(_msg, 4);
	}
} else {
	//change room
	if obj_chest.open {
		//if !active {
			fade_to_room(target_rm, target_x, target_y, 1, c_black);
		//	active = true;
		//}
	} else {
		//give player a msg
		show_msg(_msg, 4);
	}
}