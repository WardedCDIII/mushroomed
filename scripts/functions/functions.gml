#region tileToScreen

function tileToRoomX(_x,_y){
	return ((_x-_y) * (TILE_W * 0.5)) + (ROOM_W * 0.5);
}
function tileToRoomY(_x,_y){
	return ((_x+_y) * (TILE_H * 0.5)) + (ROOM_H * 0.25);
}

#endregion