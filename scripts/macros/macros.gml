// Various macros and enums

#macro MAP_W 12
#macro MAP_H 8
#macro TILE_W 32
#macro TILE_H 16
#macro ROOM_W 384
#macro ROOM_H 256

enum TILE {
	SPRITE = 0,
	Z = 1
}

enum MOB {
	SPRITE = 0,
	Z = 1
}

#macro SPEEDS ds_map_create()
ds_map_add(SPEEDS,0,0);
ds_map_add(SPEEDS,1,3);
ds_map_add(SPEEDS,2,4);