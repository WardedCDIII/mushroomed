/// @description Enemy Turn

for(var tx=0; tx<MAP_W; tx++) {
	for(var ty=0; ty<MAP_H; ty++) {
		var _mob = global.Mobs[# tx,ty];
		if instance_exists(_mob) and not isPlayer([tx,ty]) {
			with _mob {
				if not moved { move(); }
				if not attacked { attack(); }
			}
		}
	}
}
for(var tx=0; tx<MAP_W; tx++) {
	for(var ty=0; ty<MAP_H; ty++) {
		var _mob = global.Mobs[# tx,ty];
		if instance_exists(_mob) and not isPlayer([tx,ty]) {
			with _mob {
				moved = false;
			}
		}
	}
}
turn++;






















