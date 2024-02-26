/// @description Draw GUI
// You can write your code in this editor

// Draw the background of the GUI
draw_sprite(spr_gui_background, 0, 0, 0);

draw_set_font(fnt_stats);
draw_set_valign(fa_top);
// Display the score on the top right
draw_set_halign(fa_right);
draw_text(window_get_width(), 0, player_score);

// Display the remaining turn points on the top left
draw_set_halign(fa_left);
draw_text(0, 0, remaining_action_points);

// Display team hp on the top middle
draw_set_halign(fa_center);
draw_text(window_get_width() / 2, 0, player_score);

// Won and lost text
draw_set_valign(fa_middle);
draw_set_font(fnt_gameover);
if (won) {
	draw_text(window_get_width() / 2, window_get_height() / 2, "You Win!");
} else if (lost) {
	draw_text(window_get_width() / 2, window_get_height() / 2, "Game Over");
}




