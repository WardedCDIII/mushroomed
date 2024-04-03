/// @description 

hp = 2;
atk = 1;
range = random_range(1,2);
spd = random_range(1,3);
moveType = closestPlayer;
attackType = line;
ap = 100;
gx = -1;
gy = -1;
moved = false;
attacked = false;

attackList = ds_list_create();


// Methods
init = function() {
	ds_list_copy(attackList,attackType([gx,gy],attackList));
}

reset = function() {
	ap = 1000;
	moved = false;
	attacked = false;
}
move = function() {
	moveType([gx,gy]);
	moved = true;
}
attack = function() {
	ds_list_copy(attackList,attackType([gx,gy],attackList));
	var size = ds_list_size(attackList);
	for(var i=0; i < size; i++) {
		var cell = ds_list_find_value(attackList,i);
		if isOccupied(cell) {
			attackMob([gx,gy],cell);	
		}
	}
	attacked = true;
}


















