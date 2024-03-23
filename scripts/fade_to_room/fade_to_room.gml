function fade_to_room(target_room, _target_x, _target_y, _facing, color){
var _fade = instance_create_layer(x, y, "Fade", obj_fade);
with _fade {
	target_rm	= argument[0];
	target_x	= argument[1];
	target_y	= argument[2];
	facing		= argument[3];
	col			= argument[4];
}
}