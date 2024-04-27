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
	if hp != max_hp {
		audio_play_sound(snd_heal, 2, false);
		hp = clamp(hp+1,0,max_hp);
		hitMarker(tileToRoomX(gx,gy),tileToRoomY(gx,gy),1)
	}
}