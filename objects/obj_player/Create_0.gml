/// @description 

hp = 3;
max_hp = hp;
atk = 1;
spd = 2;
range = 4;
gx = -1;
gy = -1;

// Action points and other game controllers
ap = MAX_AP;
moved = false;
attacked = false;
healed = false;

// Methods
reset = function() {
	ap = MAX_AP;
	moved = false;
	attacked = false;
	healed = false;
}
heal = function() {
	ap--;
	hp = clamp(hp+1,0,max_hp);
	healed = true;
}