/// @description Draw GUI
// You can write your code in this editor

draw_set_font(fnt_stats);
draw_set_valign(fa_top);

// Draw the background of the GUI
draw_sprite(spr_gui_background, 0, 0, 0);

// Display the remaining turn points on the top left
draw_set_halign(fa_left);
draw_text(0, 0, remaining_action_points);
draw_healthbar(24, 36, 36, 164, remaining_action_points * 10, c_black, c_navy, c_blue, 3, true, true);

// Draw player team's names, icons, and healthbars
var toadstool_hp = 0;
if (instance_exists(obj_toadstool)) {
	toadstool_hp = obj_toadstool.hp;
}
draw_text(110, 0, "Toadstool");
draw_healthbar(120, 36, 280, 48, toadstool_hp * 10, c_black, c_red, c_green, 0, true, true);
draw_sprite(spr_gui_toadstool, 0, 275, 4);
var inkcap_hp = 0;
if (instance_exists(obj_inkcap)) {
	inkcap_hp = obj_inkcap.hp;
}
draw_text(315, 0, "Inkcap");
draw_healthbar(315, 36, 475, 48, inkcap_hp * 10, c_black, c_red, c_green, 0, true, true);
draw_sprite(spr_gui_inkcap, 0, 435, 4);
var veiledlady_hp = 0;
if (instance_exists(obj_veiledlady)) {
	veiledlady_hp = obj_veiledlady.hp;
}
draw_text(500, 0, "Veiledlady");
draw_healthbar(500, 36, 660, 48, veiledlady_hp * 10, c_black, c_red, c_green, 0, true, true);
draw_sprite(spr_gui_veiledlady, 0, 675, 4);

// Display the score on the top right
draw_set_halign(fa_right);
draw_text(window_get_width(), 0, player_score);

// Won and lost text
draw_set_valign(fa_middle);
draw_set_font(fnt_gameover);
if (won) {
	draw_text(window_get_width() / 2, window_get_height() / 2, "You Win!");
} else if (lost) {
	draw_text(window_get_width() / 2, window_get_height() / 2, "Game Over");
}




