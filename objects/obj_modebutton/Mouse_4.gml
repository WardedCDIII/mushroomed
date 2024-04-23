/// @description Change mode

var _x = mouse_x - x;

if _x >= 0 and _x <= 32 {
	con_controller.mode = 0;
} 
else if _x > 32 and _x <= 64 {
	con_controller.mode = 1;
}
else if _x > 64 and _x <= 96 {
	con_controller.mode = 2;
}

image_index = con_controller.mode + 1;






















