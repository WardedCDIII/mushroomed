/// @description Game state monitoring

if (room != rm_splash) {
	if instance_number(obj_player) == 0 {
		lost = true;
		//room_goto(rm_splash);
	}
	if (room == rm_level_1) {
		if instance_number(obj_enemy) == 0 {
			won = true;
			alarm[0] = room_speed * 3;
		}
	} else {
		if instance_number(obj_enemy) == 0 {
			won = true;
		}
	}
}