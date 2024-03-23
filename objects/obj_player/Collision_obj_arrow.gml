/// @description 
var _take_damage = false;

//only do this if arrow is not set to die
if !other.die {
	//if looking away, then take damage
	if facing == other.facing {
		_take_damage = true;
	} else {
		//facing arrow
		if block {
			if down {
				//blocking and crouching
				other.die = true;
				audio_play_sound(snd_block, 15, false);
			} else {
				//blocking and not crouching
				_take_damage = true;
			}
		} else {
			//not blobking
			_take_damage = true;
		}
	}
	//don'y take damage if dead
	if hp <= 0 _take_damage = false;
	
	//process damage
	if _take_damage {
		if !hurt {
			hurt = true;
			
			//damage player
			hp -= 1;
			
			//set hurt time
			alarm[HURT] = hurt_time;
			
			//screen shake
			scr_screen_shake(.125, -1);
			
			audio_play_sound(snd_player_hit, 20, false);
		} else {
			other.die = true;
		}
	}
}