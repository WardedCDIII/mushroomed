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
#region Mob getters

function isOccupied(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	var _spr = _mobData[MOB.SPRITE];
	return _spr != 0;	
}
function getSprite(_coord) {
	var _mobData = global.Mobs[# _coord[0],_coord[1]];
	var _spr = _mobData[MOB.SPRITE];
	return _spr;
}

#endregion