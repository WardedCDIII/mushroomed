/// @description Handle mouse clicks

var _mx = roomToTileX(mouse_x,mouse_y);
var _my = roomToTileY(mouse_x,mouse_y);
hover = [_mx,_my];

if mouse_check_button_pressed(mb_left) and turn%2 == 0 {
	if validGridLocation(hover) {
		// No tile is previously selected
		if array_equals(selected,[-1,-1]) and isPlayer(hover) {
			if isOccupied(hover) {selected = hover;}	
		}
		// Clicked tile is same as selected tile
		else if array_equals(hover,selected) {
			selected = [-1,-1];
		}
		// Clicked tile is different than selected tile
		else {
			// move is valid and unobstructed
			if isOccupied(selected) and not isOccupied(hover) {
				if inSpeed(selected,hover,getSpeed(selected)) {
					moveMob(selected,hover);
					selected = [-1,-1];
				}
			}
		}
	} else {
		selected = [-1,-1];
	}
}






















