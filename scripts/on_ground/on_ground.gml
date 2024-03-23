function on_ground(){
/// Returns true if on ground
var _side = bbox_bottom;
var _t1 = tilemap_get_at_pixel(global.map, bbox_left, _side + 1);
var _t2 = tilemap_get_at_pixel(global.map, bbox_right, _side + 1);
var _t3 = tilemap_get_at_pixel(global.map, bbox_left, _side);
var _t4 = tilemap_get_at_pixel(global.map, bbox_right, _side);

if	((_t1 == SOLID or _t1 == PLATFORM) and (_t3 != SOLID and _t3 != PLATFORM) or (_t1 == SOLID and _t3 == PLATFORM) or
	(_t2 == SOLID or _t2 == PLATFORM) and (_t4 != SOLID and _t4 != PLATFORM) or (_t2 == SOLID and _t4 == PLATFORM))
	return true else return false; 
}