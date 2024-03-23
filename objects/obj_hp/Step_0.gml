//movement
calc_entity_movement();

//bounce
if on_ground() and !bounce {
	//give vert movement
	v_speed = v_speed_initial * random_range(.7, .8);
	bounce = true;
	can_pickup = true;
}

//bouce off walls
if sign(h_speed_initial) var _side = bbox_right else var _side = bbox_left;
var _t1 = tilemap_get_at_pixel(global.map, _side + sign(h_speed_initial), bbox_bottom);
if _t1 == SOLID {
	//wall found, reverse direction
	h_speed = h_speed_initial * .75 * -1;
}

//destroy gem if fallse out of room
if y > room_height instance_destroy();

//generate sparks
if die {
		repeat(obj_game.gem_sparks) {
			var inst = instance_create_depth(x, y, depth, obj_spark);
			inst.col_head = c_white;
			inst.col_tail = c_maroon;
		}
		instance_destroy();
}
//collision
collision();

//update light collision
with (light_id) {
	x = other.x;
	y = other.y;
}