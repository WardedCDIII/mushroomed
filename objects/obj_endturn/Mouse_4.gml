/// @description Trigger enemy turn

if image_index == 0 { 
	audio_play_sound(snd_endturn,1,false);
	image_index = 1;
	alarm[0] = room_speed*0.33; 
}

