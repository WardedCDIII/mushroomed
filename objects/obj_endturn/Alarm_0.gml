/// @description Enemy turn handling?

var done = true;

with obj_enemy {
	if not attacked { attack(); }
	sleep(250);
	if not moved {
		move();
		done = false;
		break;
	}
}
if not done {
	alarm[0] = 1;	
} else {
	alarm[1] = 1;	
}
























