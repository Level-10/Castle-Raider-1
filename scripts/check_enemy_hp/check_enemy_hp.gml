function check_enemy_hp(){
//die
if hp <= 0 {
	//hp drop
	var _chance = random(1);
	if _chance <= hp_drop_chance {
		instance_create_layer(x, bbox_top, "Gems", obj_hp);
		audio_play_sound(snd_hp_spawning, 15, false);
	}
	//play death sound
	audio_play_sound(snd_enemy_dying, 10, false);
	//play gem spawn sound once
	audio_play_sound(snd_gems_spawning, 15, false);
	repeat(death_gem_value) {
		instance_create_layer(x, bbox_top, "Gems", obj_gem);
		//generate particles
		repeat (obj_game.enemy_sparks) {
			var inst = instance_create_depth(x, (bbox_bottom + bbox_top)/2, depth-1, obj_spark);
			switch(object_index) {
				case obj_frog:
					if choose(0, 1, 1) {
						//gray
						inst.color_head = c_gray;
						inst.col_tail = c_dkgray;
					} else {
						//white
						inst.col_head = c_white;
						inst.col_tail = c_ltgray;
					}
				break;
						case obj_bug:
					if choose(0, 1, 1) {
						//gray
						inst.color_head = c_red;
						inst.col_tail = c_maroon;
					} else {
						//white
						inst.col_head = c_lime;
						inst.col_tail = c_green;
					}
				break;
			}
		}
	}
	
	//score
	switch object_index {
		case obj_frog:
			score += 50;
		break;
		case obj_bug:
			score += 100;
		break;
	}
	
	//screen shake
	scr_screen_shake(.15, -1);
	instance_destroy();
}
}