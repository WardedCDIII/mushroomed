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