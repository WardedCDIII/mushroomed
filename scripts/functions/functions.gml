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
	if not validGridLocation(_coord) { return true; }
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
		return range;
	}	
}
function getHp(_coord) {
	var _mob = global.Mobs[# _coord[0],_coord[1]];
	if not instance_exists(_mob) { return 0; }
	with _mob {
		return hp;	
	}
}
function getAtk(_coord) {
	var _mob = global.Mobs[# _coord[0],_coord[1]];
	if not instance_exists(_mob) { return 0; }
	with _mob {
		return atk;	
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
		hitMarker(tileToRoomX(target[0],target[1]),tileToRoomY(target[0],target[1])-6,-1*atk);
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
function getClosest(_coord,player) {
	var closest = _coord;
	var dist = MAP_W*MAP_H;
	for(var i=0; i < MAP_W; i++) {
		for(var j=0; j < MAP_H; j++) {
			if validGridLocation([i,j]) {
				if isOccupied([i,j]) and isPlayer([i,j]) == player {
					if distance(_coord,[i,j]) < dist { 
						dist = distance(_coord,[i,j]);
						closest = [i,j];
					}
				}
			}
		}
	}	
	return closest;
}
function getCellinRange(source,target,range) {
	if distance(source,target) <= range {
		return target;	
	}
	var v = [target[0]-source[0],target[1]-source[1]];
	v = [(v[0])/magnitude(v),v[1]/magnitude(v)];
	v = [source[0]+round(v[0]*range),source[1]+round(v[1]*range)];
	while isOccupied(v) {
		range -= 0.25;
		var v = [target[0]-source[0],target[1]-source[1]];
		v = [(v[0])/magnitude(v),v[1]/magnitude(v)];
		v = [source[0]+round(v[0]*range),source[1]+round(v[1]*range)];
	}
	return v;
	
}
function randomCellInRange(_coord,range) {
	var _x = irandom_range(_coord[0]-range,_coord[0]+range);
	var _y = irandom_range(_coord[1]-range,_coord[1]+range)
	var cell = [_x,_y];
	return cell;
}
#endregion