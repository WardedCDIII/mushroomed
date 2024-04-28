/// @description Enemy movement

var done = true;

with obj_enemy {
	if not moved {
		var newMove = predictMove();
		var cMove = [gx,gy];
		move();
		sleep(500);
		done = false;
		if not array_equals(newMove,cMove) || moveType==randomCell { audio_play_sound(snd_move,1,false); }
		break;
	}
}
if not done { // continue
	alarm[1] = 1;	
} else { // end phase
	alarm[2] = 1;	
}