#region Enemy Movesets

function closestPlayer(_coord) {
	var _dist = MAP_H*MAP_W;
	var _dest = [0,0];
	for(var tx=0; tx<MAP_W; tx++) {
		for(var ty=0; ty<MAP_H; ty++) {
			if isPlayer([tx,ty]) {
				var _mob = global.Mobs[# tx,ty];
				with _mob {
					if distance([tx,ty],_coord) < _dist {
						_dist = distance([tx,ty],_coord);
						_dest = [tx,ty];
					}
				}
			}
		}
	}
	_dist = MAP_W*MAP_W;
	var _cell = [gx,gy];
	for(var tx=0; tx<MAP_W; tx++) {
		for(var ty=0; ty<MAP_H; ty++) {
			with global.Mobs[# _coord[0],_coord[1]] {
				if inSpeed([gx,gy],[tx,ty],spd) and distance([tx,ty],_dest) < _dist and not isOccupied([tx,ty]) {
					_dist = distance([tx,ty],_dest);
					_cell = [tx,ty];
				}
			}
		}
	}
	moveMob(_coord,_cell);
}
function randomCell(_coord) {
	var _dest = _coord;
	with global.Mobs[# _coord[0],_coord[1]] {
		_iter = 0;
		while true {
			if _iter >= 50 { break; }
			var _x = irandom(MAP_W);
			var _y = irandom(MAP_H);
			if inSpeed(_coord,[_x,_y],spd) and not isOccupied([_x,_y]){ 
				_dest=[_x,_y];
				break;
			}
			_iter++;
		}
	}
	if not array_equals(_coord,_dest) { moveMob(_coord,_dest); }
}
#endregion
#region Enemy attack sets
// Attack sets will return ds_list populated with grid cells
// All attack sets take in _coord of enemy and list (to populate)
// Return list, access other info through util

function rook(_coord,list) {
	ds_list_clear(list);
	var closest = getClosest(_coord,true);
	var dir = [sign(closest[0]-_coord[0]),sign(closest[1]-_coord[1])];
	var _x = _coord[0];
	var _y = _coord[1];
	show_debug_message(dir);
	while validGridLocation([_x,_y]) {
		if not array_equals([_x,_y],_coord) {
			ds_list_add(list,[_x,_y]);
		}
		if dir[0] != 0 {
			_x += dir[0];
		} else {
			_y += dir[1];
		}
	}
	return list;
}
function bishop(_coord,list) {
	ds_list_clear(list);
	var closest = getClosest(_coord,true);
	var dir = [sign(closest[0]-_coord[0]),sign(closest[1]-_coord[1])];
	var _x = _coord[0];
	var _y = _coord[1];
	show_debug_message(dir);
	while validGridLocation([_x,_y]) {
		if not array_equals([_x,_y],_coord) {
			ds_list_add(list,[_x,_y]);
		}
		_x += dir[0];
		_y += dir[1];
	}
	return list;
}
#endregion