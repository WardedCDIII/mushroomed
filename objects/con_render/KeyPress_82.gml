/// @description Restart on loss

if instance_number(obj_player) == 0 {
	audio_stop_all();
	room_restart();	
}

