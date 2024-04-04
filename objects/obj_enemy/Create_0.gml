/// @description 

hp = 2;
atk = 4;
range = 3;
spd = 0;
moveType = closestPlayer;
attackType = bishop;
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
	ds_list_copy(attackList,attackType([gx,gy],attackList));
}
attack = function() {
	var size = ds_list_size(attackList);
	for(var i=0; i < size; i++) {
		var cell = ds_list_find_value(attackList,i);
		if isOccupied(cell) {
			attackMob([gx,gy],cell);	
		}
	}
	attacked = true;
}


















