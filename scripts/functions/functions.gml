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
	show_debug_message(_coord);
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
	return _mobData != undefined;
}
function getSprite(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	return object_get_sprite(_mobData.object_index);
}
function getSpeed(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	with (_mobData) { return spd; }
}
function inSpeed(_coord,_target,spd) {
	return abs(_coord[0]-_target[0]) <= spd and abs(_coord[1]-_target[1]) <= spd;	
}
function moveMob(_coord1,_coord2) {
	var _mobData1 = global.Mobs[# _coord1[0],_coord1[1]];
	var _temp = _mobData1;
	global.Mobs[# _coord1[0],_coord1[1]] = undefined;
	global.Mobs[# _coord2[0],_coord2[1]] = _temp;
}

#endregion