// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hitMarker(_x,_y,_num){
	var hm = instance_create_layer(_x,_y,"GUI",obj_hitmarker);
	with hm {
		num = _num;
	}
}

function healthDisplay(_cell) {
	var hd = instance_create_layer(0,0,"GUI",obj_healthdisplay);
	with hd {
		cell = _cell;	
	}
}