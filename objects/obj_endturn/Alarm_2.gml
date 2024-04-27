/// @description Reset characters

with obj_enemy {
	reset();	
}
with obj_player {
	reset();	
}
audio_play_sound(snd_newturn,1,false);
image_index = 0;