/// @description 
draw_set_alpha(1);

draw_sprite(spr_modes,con_controller.mode+1,x,y);

if not array_equals(con_controller.selected,[-1,-1]) {
	var _mob = global.Mobs[# con_controller.selected[0],con_controller.selected[1]];
	with _mob {
		if moved or ap==0 { draw_sprite(spr_x,con_controller.mode!=0,other.x,other.y); }
		if attacked or ap==0 { draw_sprite(spr_x,con_controller.mode!=1,other.x+32,other.y); }
		if healed or ap==0 { draw_sprite(spr_x,con_controller.mode!=2,other.x+64,other.y); }
	}
}






















