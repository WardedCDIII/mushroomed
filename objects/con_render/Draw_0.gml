/// @description Draw tiles

var _tileData, _screenX, _screenY, _tileIndex, _tileZ;

for(var tx = 0; tx<MAP_W; tx++) {
	for(var ty = 0; ty<MAP_H; ty++) {
		_tileData = global.Map[# tx, ty];
		_screenX = tileToRoomX(tx,ty);
		_screenY = tileToRoomY(tx,ty);
		
		_tileIndex = _tileData[TILE.SPRITE];
		_tileZ = _tileData[TILE.Z];
		
		if _tileIndex {
			draw_sprite(spr_block,_tileIndex-1,_screenX,_screenY-_tileZ);
		}
	}
}





















