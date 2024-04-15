/// @description Handle mouse clicks and other setup

// Move from splash screen to level 1
if (room == rm_splash) {
	if (keyboard_check_pressed(vk_enter)) {
			room_goto_next();
		}
}

if (room == rm_level_1 || room = rm_level_2) {
	// Initialize enemies once done mapping data
	if controller_done and render_done and not initialized {
		initialized = true;
		with obj_enemy {
			init();	
		}
	
	}

	var _mx = roomToTileX(mouse_x,mouse_y);
	var _my = roomToTileY(mouse_x,mouse_y);
	hover = [_mx,_my];

	// Moving
	if mouse_check_button_pressed(mb_left) and turn%2 == 0 {
		if validGridLocation(hover) {
			// No tile is previously selected
			if array_equals(selected,[-1,-1]) and isPlayer(hover) {
				if isOccupied(hover) {selected = hover;}	
			}
			// Clicked tile is same as selected tile
			else if array_equals(hover,selected) {
				if mode == 2 and isPlayer(hover){
					with global.Mobs[# hover[0],hover[1]] {
						if ap > 0 and not healed{
							heal();
						}
					}
				}
				selected = [-1,-1];
			}
			// Clicked tile is another player character
			else if isPlayer(hover) {
				selected = hover;	
			}
			// Clicked tile is different than selected tile
			else {
				switch mode {
					case 0:	// Moving
						if isOccupied(selected) and not isOccupied(hover) {
							if inSpeed(selected,hover,getSpeed(selected)) {
								moveMob(selected,hover);
								selected = [-1,-1];
							}
						}
					break;
					case 1: // Attacking
						if isOccupied(hover) and inSpeed(selected,hover,getRange(selected)) {
							var atk;
							with global.Mobs[# selected[0],selected[1]] {
								atk = not attacked;
							}
							if atk {
								attackMob(selected,hover);
								audio_play_sound(snd_hit, 2, false);
							}
							selected = [-1,-1];	
						}
					break;
				}
				// move is valid and unobstructed
			}
		} else {
			//selected = [-1,-1];
		}
	}
}