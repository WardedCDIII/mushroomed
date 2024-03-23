/// @description 

hp = 3;
atk = 1;
spd = 2;
range = 4;
gx = -1;
gy = -1;

// Action points and other game controllers
ap = 3;
moved = false;
attacked = false;

// Methods
reset = function() {
	ap = MAX_AP;
	moved = false;
	attacked = false;
}