/// @description Enemy attack

var done = true;

with obj_enemy {
	if not attacked {
		attack();
		done = false;
		break;
	}
}
if not done { // continue
	alarm[0] = 1;	
} else { // next phase
	alarm[1] = (room_speed*(3.5*attackedNum()>0))+1;	
}
























