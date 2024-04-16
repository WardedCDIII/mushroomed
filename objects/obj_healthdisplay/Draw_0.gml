/// @description 

var num = getHp(cell);

var s = 0;
var _x = tileToRoomX(cell[0],cell[1]);
var _y = tileToRoomY(cell[0],cell[1]);
repeat num {
	draw_sprite_ext(spr_health,1,_x+s,_y-10,0.25,0.25,0,c_white,1);
	s += ((sprite_get_width(spr_health)*0.25)+1);
}






















