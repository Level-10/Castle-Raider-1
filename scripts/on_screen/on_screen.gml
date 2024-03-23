function on_screen(_buffer){
/// @desc on_screen(buffer);
/// is object on screen
_buffer = argument[0];
var _left = global.cx - _buffer;
var _right = global.cx + global.cw + _buffer;
var _top = global.cy - _buffer;
var _bottom = global.cy + global.ch + _buffer;

if x > _left and x < _right and y > _top and y < _bottom
return true else return false;
}