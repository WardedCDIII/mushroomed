/// @description Handle mouse clicks

if mouse_check_button_pressed(mb_left) {
	if hover[0] < 0 or hover[1] < 0 {
		selected = [-1,-1];	
	}
	else if array_equals(hover,selected) {
		selected = [-1,-1];	
	} 
	if array_equals(selected,[-1,-1]) {
		selected = hover;	
	}
	else if not array_equals(hover,selected) {
		var _tileData1 = global.Map[# selected[0],selected[1]];
		var _tileData2 = global.Map[# hover[0],hover[1]];
		var _occ1 = _tileData1[TILE.OCC];
		var _occ2 = _tileData2[TILE.OCC];
		if _occ1 {
			global.Map[# selected[0],selected[1]] = [1,0,0];
			global.Map[# hover[0],hover[1]] = [2,0,1];
		}
		
		selected = [-1,-1];
	}
}






















