/// @description 

hp = 2;
atk = 1;
range = 2;
spd = 1.5;
moveType = closestPlayer;
attackType = closest;
ap = 100;
gx = -1;
gy = -1;
moved = false;
attacked = false;

// Methods
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
	attackType([gx,gy]);
	attacked = true;
}


















