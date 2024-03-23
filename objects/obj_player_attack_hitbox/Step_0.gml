
// Cycle through all enemies andsee if they were hit
with (obj_enemy_parent) {
	
	if distance_to_object(other) < 60 {
		if place_meeting(x, y, other) {
			if !hurt {
				hurt = true;
			
				// Get sign direction from hitbox to enemy
				var _dir = sign(x - other.x);
			
				// Ensure objects are not at same x
				if _dir == 0 _dir = 1;
				
				//move away from the hitbox
				var _knockback_dist = 3;
				h_speed = _dir * _knockback_dist;
			
				// Face the hitbox if on ground
				if on_ground() facing = -_dir;
			
				// Damage enemy
				hp -= 1;
			
				// Set hurt timer
				alarm[HURT] = hurt_time;
				
				//screen shake
				scr_screen_shake(.1, 1.5);
				
				//sound
				if !audio_is_playing(snd_sword_hit) audio_play_sound(snd_sword_hit, 10, false);
				
				var _inst = instance_create_depth(x, (bbox_top + bbox_bottom)/2, depth - 1, obj_sword_hit);
				_inst.image_xscale = obj_player.facing;
				if hp <= 0 {
					var _inst = instance_create_depth(x, (bbox_top + bbox_bottom)/2, depth - 1, obj_sword_hit);
					_inst.image_xscale = obj_player.facing;
					_inst.sprite_index = spr_sword_hit2;
				}
			}
		}
	}
}

//destroy arrows that are hit
var _inst = instance_place(x, y, obj_arrow);
if _inst != noone _inst.die = true;

// Enable death at begin step
die = true;