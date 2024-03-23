/// @description
var remaining_action_points = 0

if not array_equals(con_controller.selected,[-1,-1]) {
	var _selected = global.Mobs[# con_controller.selected[0],con_controller.selected[1]];
	with _selected {
		remaining_action_points = ap;
	}
}


draw_set_font(fnt_stats);
draw_set_valign(fa_top);

// Draw the background of the GUI
draw_sprite_ext(spr_gui_background, 0, 0, 0, window_get_width() / sprite_get_width(spr_gui_background), window_get_height() / sprite_get_height(spr_gui_background), 0, c_white, 1);

// Display the remaining turn points on the top left
draw_set_halign(fa_left);
draw_text(28, 5, remaining_action_points);
draw_healthbar(32, 36, 60, 232, remaining_action_points * 33.333, c_black, c_navy, c_blue, 3, true, true);

// Display the score on the top right
draw_set_halign(fa_right);
draw_text(window_get_width() - 10, 10, "Score: " + string(player_score));

// Draw player team's names, icons, and healthbars
draw_set_font(fnt_names);
draw_set_halign(fa_left);
var toadstool_hp = 0;
if (instance_exists(obj_toadstool)) {
	toadstool_hp = obj_toadstool.hp;
}
draw_healthbar(150, 85, 400, 115, toadstool_hp * 10, c_black, c_red, c_green, 0, true, true);
draw_sprite(spr_gui_toadstool, 0, 150, 10);
draw_text(220, 10, "Toadstool");
var inkcap_hp = 0;
if (instance_exists(obj_inkcap)) {
	inkcap_hp = obj_inkcap.hp;
}
draw_healthbar(500, 85, 750, 115, inkcap_hp * 10, c_black, c_red, c_green, 0, true, true);
draw_sprite(spr_gui_inkcap, 0, 500, 10);
draw_text(570, 10, "Inkcap");
var veiledlady_hp = 0;
if (instance_exists(obj_veiledlady)) {
	veiledlady_hp = obj_veiledlady.hp;
}
draw_healthbar(850, 85, 1100, 115, veiledlady_hp * 10, c_black, c_red, c_green, 0, true, true);
draw_sprite(spr_gui_veiledlady, 0, 850, 10);
draw_text(920, 10, "Veiledlady");

// Won and lost text
draw_set_valign(fa_middle);
draw_set_font(fnt_gameover);
if (won) {
	draw_text(window_get_width() / 2, window_get_height() / 2, "You Win!");
} else if (lost) {
	draw_text(window_get_width() / 2, window_get_height() / 2, "Game Over");
}




