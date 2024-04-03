/// @description DEBUG TEXT

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_font(fnt_debug);
var data = "";
if validGridLocation(hover) and isOccupied(hover) and not isPlayer(hover) {
	with global.Mobs[# hover[0],hover[1]] {
		data += string(gx);
		data += " ";
		data += string(gy);
	}
}
draw_text(window_get_width(),window_get_height(),data);
draw_text(window_get_width()-5,250,hover);






















