/// @description Handle mouse clicks

var _mx = roomToTileX(mouse_x,mouse_y);
var _my = roomToTileY(mouse_x,mouse_y);
hover = [_mx,_my];

if mouse_check_button_pressed(mb_left) and validGridLocation(hover) {
	// No tile is previously selected
	if array_equals(selected,[-1,-1]) {
		selected = hover;	
	}
	// Clicked tile is same as selected tile
	else if array_equals(hover,selected) {
		selected = [-1,-1];
	}
	// Clicked tile is different than selected tile
	else {
		
	}
}






















