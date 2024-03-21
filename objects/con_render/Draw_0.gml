/// @description Draw tiles

var _tileData, _mobData, _screenX, _screenY, _tileIndex, _tileZ;

for(var tx = 0; tx<MAP_W; tx++) {
	for(var ty = 0; ty<MAP_H; ty++) {
		_tileData = global.Map[# tx, ty];
		_mobData = global.Mobs[# tx, ty];
		_screenX = tileToRoomX(tx,ty);
		_screenY = tileToRoomY(tx,ty);
		
		_tileIndex = _tileData[TILE.SPRITE];
		
		_tileZ = _tileData[TILE.Z];
		
		_tileZ += array_equals(con_controller.selected,[tx,ty])*3;
		
		// Final draw
		if _tileIndex {
			// DRAW TILE ALWAYS FIRST
			draw_sprite(spr_block,_tileIndex-1,_screenX,_screenY-_tileZ);
			// Tile is selected
			if not array_equals(con_controller.selected,[-1,-1]) {
				if inSpeed(con_controller.selected,[tx,ty],getSpeed(con_controller.selected)) {
					draw_sprite(spr_selection,1,_screenX,_screenY-_tileZ);	
				}
			}
			// Draw mob
			if isOccupied([tx,ty]) {
				var _mob = global.Mobs[# tx,ty];
				draw_sprite(object_get_sprite(_mob.object_index),0,_screenX,_screenY+TILE_H-_tileZ-1);
			}
		}
	}
}





















