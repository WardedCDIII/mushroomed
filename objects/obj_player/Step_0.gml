/// @description Monitor HP

if hp <= 0 {
	global.Mobs[# gx,gy] = undefined;
	instance_destroy(self);	
	instance_create_layer(tileToRoomX(gx,gy),tileToRoomY(gx,gy),"GUI",obj_destroyAnim);
}