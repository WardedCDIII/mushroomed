/// @description DEBUG TEXT

if (room == rm_level_1 || room = rm_level_2) and show_debug {
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_debug);
	var data = "";
	data += string(tileToRoomX(hover[0],hover[1]));
	data += ", ";
	data += string(tileToRoomY(hover[0],hover[1]));
	draw_text(window_get_width()-5,250,hover);
	draw_text(window_get_width()-5,300,string(display_mouse_get_x())+", "+string(display_mouse_get_y()));
}