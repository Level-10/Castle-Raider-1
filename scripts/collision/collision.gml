function collision(){
if h_speed == 0 h_speed_decimal = 0;
if v_speed == 0 v_speed_decimal = 0;

// Apply carried over decimals
h_speed += h_speed_decimal;
v_speed += v_speed_decimal;

// Floor decimal
// Save and substract decimal
h_speed_decimal = h_speed - (floor(abs(h_speed)) * sign(h_speed));
h_speed -= h_speed_decimal;
v_speed_decimal = v_speed - (floor(abs(v_speed)) * sign(v_speed));
v_speed -= v_speed_decimal;

// Horizontal collision
var _side;
// Determine which side to test
if h_speed > 0 _side = bbox_right else _side = bbox_left;

// Check top and bottom
var _t1 = tilemap_get_at_pixel(global.map, _side + h_speed, bbox_top);
var _t2 = tilemap_get_at_pixel(global.map, _side + h_speed, bbox_bottom);

if	((_t1 != VOID) and (_t1 != PLATFORM)) or
	((_t2 != VOID) and (_t2 != PLATFORM)) {
	// Collision found
	if (h_speed > 0) x = x - (x mod global.tile_size) + global.tile_size - 1 - (_side - x);
	else x = x - (x mod global.tile_size) - (_side - x);
	h_speed = 0;
}

x += h_speed;

// Vertical collision
var _side;
// Determine which side to test
if v_speed > 0 _side = bbox_bottom else _side = bbox_top;

// Check left and right side
var _t1 = tilemap_get_at_pixel(global.map, bbox_left, _side + v_speed);
var _t2 = tilemap_get_at_pixel(global.map, bbox_right, _side + v_speed);
var _t3 = tilemap_get_at_pixel(global.map, bbox_left, bbox_bottom);
var _t4 = tilemap_get_at_pixel(global.map, bbox_right, bbox_bottom);


if	(_t1 != VOID and (((v_speed > 0 or _t1 != PLATFORM)) and _t3 != PLATFORM) or (_t1 == SOLID and _t3 == PLATFORM)) or
	(_t2 != VOID and (((v_speed > 0 or _t2 != PLATFORM)) and _t4 != PLATFORM) or (_t2 == SOLID and _t4 == PLATFORM)) {
	// Collision found
	if (v_speed > 0) y = y - (y mod global.tile_size) + global.tile_size - 1 - (_side - y);
	else y = y - (y mod global.tile_size) - (_side - y);
	v_speed = 0;
	//death tile check
	if _t1 == DEATH or _t2 == DEATH or y > room_height {
		hp = 0;
	}
}
y += v_speed;
}