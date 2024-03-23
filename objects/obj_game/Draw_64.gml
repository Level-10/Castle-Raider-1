//720x360
//get GUI dimensions
var gw = display_get_gui_width();
var gh = display_get_gui_height();

if room != rm_menu {
	if room != rm_game_end {
		//Gems
		#region
		draw_set_font(fnt_stats);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		var _color = make_color_rgb(173, 144, 159);
		draw_set_color(_color);

		//set draw location
		var _xx = gw - 50;
		var _yy = 25;
		draw_sprite(spr_gem_gui, 0, _xx, _yy);

		//text
		var _text_xx = -35;
		var _text_yy = 0;
		draw_set_color(c_black);
		draw_text(_xx + _text_xx + 1, _yy + _text_yy + 1, obj_player.gems);
		draw_set_color(_color);
		draw_text(_xx + _text_xx, _yy + _text_yy, obj_player.gems);
		#endregion

		//HP bar
		#region
		_xx = 48;
		_yy = 25;
		draw_sprite(spr_hp_bar, 1, _xx, _yy);
		draw_sprite_ext(spr_hp_bar, 2, _xx, _yy, obj_player.hp/obj_player.max_hp, 1, 0, c_white, image_alpha);
		draw_sprite(spr_hp_bar, 0, _xx, _yy);
		#endregion

		//lives
		#region
		_xx = 60;
		_yy = 45;
		var _gap = 22;
		if lives > 0 {
			//draw number of lives
			for (var i = 0; i < lives; i++) {
				draw_sprite(spr_lives, 0, _xx + i * _gap, _yy);
			}
		}
		#endregion

		//score
		#region
		_xx = gw / 2;
		_yy = 11;
		draw_sprite(spr_score, 0, _xx, _yy);
		draw_set_halign(fa_right);
		_text_xx = 54;
		_text_yy = 14;
		//draw shadow
		draw_set_color(c_black);
		draw_text(_xx + _text_xx + 1, _yy + _text_yy + 1, score);
		//draw text
		draw_set_color(_color);
		draw_text(_xx + _text_xx, _yy + _text_yy, score);
		#endregion
	}
//game over
#region
if game_over_lose or (game_over_won and game_over_won_delay <= 0) {
	//center GUI
	if game_over_won {
		var mx = gw/4;
		var my = gh/2;
	} else {
		var mx = gw/2;
		var my = gh/2;
	}
	//draw game over
	draw_sprite(spr_game_over, 0, mx, my);
	if game_over_lose var _index = 0 else var _index = 1;
	draw_sprite(spr_game_over_text, _index, mx, my);
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	
	//create array of text to output
	var text;
	
	//line 1
	//gems value | gems | gems total
	text[0] = string(obj_player.gems_value) + "x";
	text[1] = obj_player.gems;
	var _gems_total = obj_player.gems * obj_player.gems_value;
	text[2] = _gems_total;
	
	//line 2
	//lives value | lives | lives total
	text[3] = string(obj_player.lives_value) + "x";
	text[4] = lives;
	var _lives_total = lives * obj_player.lives_value;
	text[5] = _lives_total;
	
	//line 3
	//blank | "Score" | score
	text[6] = "";
	text[7] = "Score";
	text[8] = score;
	
	//line 4
	//blank |`"Total score" | total score
	text[9] = "";
	text[10] = "Total score";
	var _score_total = score + _gems_total + _lives_total;
	text[11] = _score_total;
	
	//update highscore
	if _score_total > highscore {
		highscore = _score_total;
		ini_open(savename);
		ini_write_real("Score", "Highscore", highscore);
	}
	
	//set starting pos
	var xx = mx - 10;
	var yy = my - 32;
	//set gaps
	var gap_c = 50;
	var gap_r = 30;
	//what line we are on
	var line = 0;
	var rows = 4;
	var columns = 3;
	for (var j = 0; j < rows; j++) {
		for (var i = 0; i < columns; i++) {
			draw_text(xx + i * gap_c, yy, text[i + line * columns]);
		}
		yy += gap_r;
		line++;
		//move down extra for the last line
		if j = 2 yy += gap_r/3;
	}
}
#endregion
} else {
	//draw main menu and fade to first level
	//draw bounce
	var start_y = 350;	//how far the animation moves
	var factor = start_y;
	
	var max_frames = 60;
	if current_frame < max_frames {
		current_frame++;
		var move = EaseOutBounce(current_frame, 0, 1.52, max_frames);
	} else {
		move = 1.52; //idk why if 1 it's to high
		//alow game start as menu has dropped
		if (keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0, gp_face1)) and
		!instance_exists(obj_fade) {
			//sound
			audio_play_sound(snd_game_start, 15, false);
			fade_to_room(rm_00, 0, 0, 1, c_black);
		}
	}
	draw_sprite(spr_main_menu, 0, 365, (move * factor) - start_y);
	
	//draw highscore
	if current_frame == max_frames {
		draw_set_halign(fa_right);
		draw_set_font(fnt_highscore);
		draw_text_ext_color(gw - 10, 28, highscore, 5, 100, c_aqua, c_aqua, c_gray, c_gray, 1);
	}
}

//fade screen in
if fade_in {
	alpha = lerp(alpha, 0, fade_spd);
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, gw, gh, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}

//display msg
if alarm[DISPLAY_MSG] > 0 {
	draw_set_halign(fa_center);
	draw_set_font(fnt_highscore);
	draw_set_color(c_black);
	draw_text(gw / 2 + 1, gh * .85 + 1, msg);
	draw_set_color(c_white);
	draw_text(gw / 2, gh * .85, msg);
}