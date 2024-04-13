#region Enemy Movesets
// Will return cell to move to, but will not move the mob
// All moves take in _coord of enemy

function closestPlayer(_coord) {
	var _closest = getClosest(_coord,true);
	var _cell = getCellinRange(_coord,_closest,getSpeed(_coord));
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