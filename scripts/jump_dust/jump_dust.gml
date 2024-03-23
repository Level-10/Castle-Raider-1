function jump_dust(){
var _inst = instance_create_layer(x, y, "Dust", obj_player_dust_jump);
_inst.image_xscale = facing;
}