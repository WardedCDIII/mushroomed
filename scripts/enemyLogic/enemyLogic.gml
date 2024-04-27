#region Enemy Movesets
// Will return cell to move to, but will not move the mob
// All moves take in _coord of enemy

function stationary(_coord) {
	return _coord	
}
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
	return _cell;
}
#endregion
#region Enemy attack sets
// Attack sets will return ds_list populated with grid cells
// All attack sets take in _coord of enemy and list (to populate)
// Return list, access other info through util

function passive(_coord,list) {
	ds_list_clear(list);
	return list;
}
function rook(_coord,list) {
	ds_list_clear(list);
	var closest = getClosest(_coord,true);
	var dir = [sign(closest[0]-_coord[0]),sign(closest[1]-_coord[1])];
	var _x = _coord[0];
	var _y = _coord[1];
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
	while validGridLocation([_x,_y]) {
		if not array_equals([_x,_y],_coord) {
			ds_list_add(list,[_x,_y]);
		}
		_x += dir[0];
		_y += dir[1];
	}
	return list;
}
function randomAttack(_coord,list) {
	ds_list_clear(list);
	var _cell = [0,0];
	for(var i=0; i <= irandom(getAtk(_coord)+10); i++) {
		_cell = randomCellInRange(_coord,getRange(_coord));
		if validGridLocation(_cell) and not isOccupied(_cell) {
			ds_list_add(list,_cell);	
		}
	}
	return list;
}
function circle(_coord,list) {
	ds_list_clear(list);
	var r = getRange(_coord);
	for(var i=0; i < MAP_W; i++) {
		for(var j=0; j < MAP_H; j++) {
			if validGridLocation([i,j]) and inSpeed(_coord,[i,j],r) {
				ds_list_add(list,[i,j]);	
			}
		}
	}
	return list;
}
function circleRand(_coord,list) {
	ds_list_clear(list);
	var r = getRange(_coord);
	for(var i=0; i < MAP_W; i++) {
		for(var j=0; j < MAP_H; j++) {
			if validGridLocation([i,j]) and inSpeed(_coord,[i,j],r) {
				if random(1) > 0.5 {ds_list_add(list,[i,j]); }
			}
		}
	}
	return list;
}
#endregion