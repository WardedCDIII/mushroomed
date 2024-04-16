/// @description Draw Map

if (room == rm_level_1 || room = rm_level_2) {
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
				if isBeingAttacked([tx,ty]) {
					draw_sprite(spr_selection,4,_screenX,_screenY-_tileZ);
				}
				// Tile is selected
				if not array_equals(con_controller.selected,[-1,-1]) {
					// Draw movement range
					var mode = con_controller.mode;
					if not isPlayer([tx,ty]) {
						var atkd = false;
						if instance_exists(global.Mobs[# con_controller.selected[0],con_controller.selected[1]]) {
							with global.Mobs[# con_controller.selected[0],con_controller.selected[1]] { atkd = attacked; }
						}
						if mode==0 and inSpeed(con_controller.selected,[tx,ty],getSpeed(con_controller.selected)) {
							draw_sprite(spr_selection,1,_screenX,_screenY-_tileZ);	
						}
						else if mode==1 and not atkd and inSpeed(con_controller.selected,[tx,ty],getRange(con_controller.selected)) {
							draw_sprite(spr_selection,2,_screenX,_screenY-_tileZ);	
						}
					}
				}
				// Draw mob
				if isOccupied([tx,ty]) {
					var _mob = global.Mobs[# tx,ty];				
					// Draw selected mob transparent
					if array_equals([tx,ty],con_controller.hover) and not array_equals(con_controller.selected,con_controller.hover) {
						draw_sprite_ext(object_get_sprite(_mob.object_index),0,_screenX,_screenY+TILE_H-_tileZ-1,1,1,0,c_white,0.65);
					}
					else if array_equals([tx,ty],con_controller.selected){
						draw_sprite_ext(object_get_sprite(_mob.object_index),0,_screenX,_screenY+TILE_H-_tileZ-1,1,1,0,c_white,0.65);
					} else {
						draw_sprite(object_get_sprite(_mob.object_index),0,_screenX,_screenY+TILE_H-_tileZ-1);	
					}
				}
			}
		}
	}
}