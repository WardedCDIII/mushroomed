/// @description Turn change handling

turn++;

for(var tx=0; tx<MAP_W; tx++) {
	for(var ty=0; ty<MAP_H; ty++) {
		var _mob = global.Mobs[# tx, ty];
		with _mob {
			reset();	
		}
	}
}
alarm[1] = 1;























