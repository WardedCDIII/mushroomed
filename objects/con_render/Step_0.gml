/// @description Handle mouse clicks

if mouse_check_button_pressed(mb_left) {
	if hover[0] < 0 or hover[1] < 0 {
		selected = [-1,-1];	
	}
	else if array_equals(hover,selected) {
		selected = [-1,-1];	
	} 
	else if not array_equals(hover,selected) {
		selected = hover;	
	}
}






















