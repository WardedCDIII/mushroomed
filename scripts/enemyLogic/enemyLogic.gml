#region Enemy Movesets
// Will return cell to move to, but will not move the mob
// All moves take in _coord of enemy

function closestPlayer(_coord) {
	var _closest = getClosest(_coord,true);
	var _cell = getCellinRange(_coord,_closest,getSpeed(_coord));
	if isOccupied(_cell) { return _coord; }
	return _cell;
}
function randomCell(_coord) {
	var r = getSpeed(_coord);
	var _cell = [irandom_range(_coord[0]-r,_coord[0]+r),irandom_range(_coord[1]-r,_coord[1]+r)];
	while not validGridLocation(_cell) {
		if between(_coord[0],0,MAP_W) and between(_coord[1],0,MAP_W) and isOccupied(_cell) {
			_cell = [irandom_range(_coord[0]-r,_coord[0]+r),irandom_range(_coord[1]-r,_coord[1]+r)];
		}
	}
	show_debug_message("R "+string(_cell));
	return _cell;
}
function slide(_coord) {
	var _closest = getClosest(_coord,true);
	var i = irandom(1);
	var _cell = _coord;
	_cell[i] = _closest[i];
	var n = _closest[i];
	while not validGridLocation(_cell) or isOccupied(_cell){
		n -= sign(_closest[i]-_coord[i]);
		_cell[i] = _closest[i]
	}
	return _cell;
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