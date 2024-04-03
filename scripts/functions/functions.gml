#region Convert grid coordinates to screen/room coordinates

function tileToRoomX(_x,_y){
	return ((_x-_y) * (TILE_W * 0.5)) + (ROOM_W * 0.5);
}
function tileToRoomY(_x,_y){
	return ((_x+_y) * (TILE_H * 0.5)) + (ROOM_H * 0.25);
}

#endregion
#region Convert screen to grid coordinates

function roomToTileX(_x,_y){
	_x = _x - (ROOM_W * 0.5);
	_y = _y - (ROOM_H * 0.25);
	return floor( _x / TILE_W + _y / TILE_H );
}
function roomToTileY(_x,_y){
	_x = _x - (ROOM_W * 0.5);
	_y = _y - (ROOM_H * 0.25);
	return floor( _y / TILE_H - _x / TILE_W );
}

#endregion
#region Grid Util

function validGridLocation(_coord) {
	if _coord[0] < 0 or _coord[1] < 0 or _coord[0] >= MAP_W or _coord[1] >= MAP_H {
		return false;	
	}
	var _tileData = global.Map[# _coord[0],_coord[1]];
	var _spr = _tileData[TILE.SPRITE];
	return _spr != 0;
}

#endregion
#region Mob getters and util

function isOccupied(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	return instance_exists(_mobData);
}
function isPlayer(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	if not instance_exists(_mobData) { return false; }
	return object_get_parent(_mobData.object_index) == obj_player;
}
function getSprite(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	return object_get_sprite(_mobData.object_index);
}
function getSpeed(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	with (_mobData) { 
		if ap > 0 and not moved {
			return spd; 
		} else {
			return 0;
		}
	}
}
function getRange(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	with (_mobData) { 
		if ap > 0 and not attacked {
			return range; 
		} else {
			return 0;
		}
	}	
}
function getHp(_coord) {
	var _mob = global.Mobs[# _coord[0],_coord[1]];
	if not instance_exists(_mob) { return 0; }
	with _mob {
		return hp;	
	}
}
function inSpeed(_coord,_target,spd) {
	if array_equals(_coord,_target) { return false; }
	return distance(_coord,_target) <= spd and validGridLocation(_coord);	
}
function moveMob(_coord1,_coord2) {
	var _mobData1 = global.Mobs[# _coord1[0],_coord1[1]];
	var _temp = _mobData1;
	with (_temp) {
		if ap > 0 and not moved {
			global.Mobs[# _coord1[0],_coord1[1]] = undefined;
			global.Mobs[# _coord2[0],_coord2[1]] = _temp;
			ap--;
			moved = true;
			gx = _coord2[0];
			gy = _coord2[1];
		}
	}
}
function attackMob(attacker,target) {
	var _mob = global.Mobs[# attacker[0], attacker[1]];
	var _tar = global.Mobs[# target[0], target[1]];
	with _mob {
		if ap > 0 {
			with _tar {
				hp -= other.atk;
			}
			attacked = true;
			ap--;
		}
	}
}
function isBeingAttacked(_coord) {
		with obj_enemy {
			var size = ds_list_size(attackList);
			for(var i=0; i<size; i++) {
				if array_equals(ds_list_find_value(attackList,i),_coord) {
					return true;	
				}
			}
		}
	return false;
}
#endregion
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
// Attack sets will add attacking cells to the list

function line(_coord,list) {
	ds_list_clear(list);
	for(var i=_coord[0]-1; i >= 0; i--) {
		var cell = [i, _coord[1]];
		if validGridLocation(cell) {
			ds_list_add(list,[i,_coord[1]]);	
		}
	}
	return list;
}
#endregion