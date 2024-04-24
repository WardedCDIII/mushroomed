/// @description Enemy movement

var done = true;

with obj_enemy {
	if not moved {
		move();
		sleep(500);
		done = false;
		break;
	}
}
if not done { // continue
	alarm[1] = 1;	
} else { // end phase
	alarm[2] = 1;	
}