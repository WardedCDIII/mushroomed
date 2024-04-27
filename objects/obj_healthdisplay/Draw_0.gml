/// @description 

var num = getHp(cell);

var s = 0;
var _x = tileToRoomX(cell[0],cell[1]);
var _y = tileToRoomY(cell[0],cell[1]);
repeat num {
	draw_sprite_ext(spr_health,1,_x+s,_y-10,0.25,0.25,0,c_white,1);
	s += ((sprite_get_width(spr_health)*0.25)+1);
}
var moveTo = cell;
with global.Mobs[# cell[0], cell[1]] {
	moveTo = predictMove();
	//draw_sprite_ext(sprite_index,1,px,py,1,1,0,c_lime,0.75);
}
var px = tileToRoomX(moveTo[0],moveTo[1])
var py = tileToRoomY(moveTo[0],moveTo[1])
if array_equals(moveTo,cell) {
	draw_sprite(spr_random,0,px-8,py);
} else {
	draw_sprite(spr_selection,3,px,py);
}




















