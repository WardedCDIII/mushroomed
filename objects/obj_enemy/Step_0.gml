/// @description Monitor HP

if hp <= 0 {
	global.Mobs[# gx,gy] = undefined;
	instance_destroy(self);	
}