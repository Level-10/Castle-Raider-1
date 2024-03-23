//get dimensions
var dw = display_get_gui_width();
var dh = display_get_gui_height();

//fade to color
if fade_to_color {
	alpha += fade_spd;
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, dw, dh, col, col, col, col, false);
	if alpha >= 1 {
		fade_to_color = false;
		with obj_player {
			//set starting position
			room_start_pos_x = other.target_x;
			room_start_pos_y = other.target_y;
			x = room_start_pos_x;
			y = room_start_pos_y;
			
			//set facing direction
			room_start_facing = other.facing;
			facing = room_start_facing;
			
			//reset values
			h_speed = 0;
			v_speed = 0;
			h_speed_decimal = 0;
			v_speed_decimal = 0;
			scale_x = 1;
			scale_y = 1;
			//reset player if dead
			if state == STATES.DIE {
				image_speed = 1;
				hp = max_hp;
			}
			
			//ensure we stay in game end state
			if state != STATES.GAME_END {
				//change start and update animation
				state = STATES.IDLE;
				anim();
			}
		}
		//pan camera quickly
		obj_camera.camera_pan_speed = 1;
		room_goto(target_rm);
	}
} else {
	//fade from color
		alpha -= fade_spd;
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, dw, dh, col, col, col, col, false);
	if alpha <= 0 {
		//reset camera pan speed
		obj_camera.camera_pan_speed = obj_camera.camera_pan_speed_initial;
		instance_destroy();
	}
}
draw_set_alpha(1);