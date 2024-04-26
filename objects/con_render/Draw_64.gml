/// @description
draw_set_alpha(1);

if (room == rm_level_1 || room == rm_level_2) {
	var remaining_action_points = 0

	if not array_equals(con_controller.selected,[-1,-1]) {
		var _selected = global.Mobs[# con_controller.selected[0],con_controller.selected[1]];
		with _selected {
			remaining_action_points = ap;
		}
	}


	draw_set_font(fnt_stats);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	// Draw the background of the GUI
	draw_sprite_ext(spr_gui_background, 0, 0, 0, window_get_width() / sprite_get_width(spr_gui_background), window_get_height() / sprite_get_height(spr_gui_background), 0, c_white, 1);

	// Display the score on the top right
	draw_set_halign(fa_left);
	draw_text(5, 5, "Score: " + string(player_score));

	// Display the remaining turn points on the top left
	draw_text(5, 35, "Action Points:");
	var y_action = 160;
	repeat (remaining_action_points) {
		draw_sprite(spr_actionpoint, image_index/8, 10, y_action);
		y_action -= 64;
	}

	// Draw player team's names, icons, and healthbars
	var team_start = (window_get_width() / 8) + 18;
	var team_width = (window_get_width() - team_start) / 3;
	draw_set_font(fnt_names);
	draw_set_halign(fa_left);
	// Draw Toadstool
	var x_action = team_start + 74;
	if (instance_exists(obj_toadstool)) {
		toadstool_hp = obj_toadstool.hp;
		repeat (obj_toadstool.hp) {
			draw_sprite(spr_health, 0, x_action, 57);
			x_action += 34;
		}
	}
	draw_sprite(spr_gui_toadstool, 0, team_start, 20);
	draw_text(team_start + 74, 10, "Toadstool");
	// Draw Inkcap
	var x_action = (team_start + (team_width)) + 74;
	if (instance_exists(obj_inkcap)) {
		repeat (obj_inkcap.hp) {
			draw_sprite(spr_health, 0, x_action, 57);
			x_action += 34;
		}
	}
	draw_sprite(spr_gui_inkcap, 0, team_start + team_width, 20);
	draw_text(team_start + team_width + 74, 10, "Inkcap");
	// Draw Veiled Lady
	var x_action = (team_start + (team_width * 2)) + 74;
	if (instance_exists(obj_veiledlady)) {
		repeat (obj_veiledlady.hp) {
			draw_sprite(spr_health, 0, x_action, 57);
			x_action += 34;
		}
	}
	draw_sprite(spr_gui_veiledlady, 0, team_start + (team_width * 2), 20);
	draw_text((team_start + (team_width * 2)) + 74, 10, "Veiled Lady");

	// Won and lost text
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_gameover);
	if (won) {
		draw_text(window_get_width() / 2, window_get_height() / 2, "You Win!");
		if room == rm_level_1 {
			draw_set_font(fnt_gameover_small);
			draw_text(window_get_width()/2,window_get_height()/2+50, "Press Enter to Continue");	
		}
	} else if (lost) {
		draw_text(window_get_width() / 2, window_get_height() / 2, "Game Over");
	}

	// Enemy health
	var hover = con_controller.hover;
	if validGridLocation(hover) and not isPlayer(hover) and isOccupied(hover) {
		if not instance_exists(obj_healthdisplay) { healthDisplay(hover); }
	}
} else {
	draw_set_font(fnt_splash);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(window_get_width()/2, 650, "Press Enter key to start");
	draw_set_font(fnt_title);
	draw_text(window_get_width()/2, 400, "Mushroomed");
}