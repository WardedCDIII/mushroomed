// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function distance(_coord1,_coord2){
	var x1 = _coord1[0];
	var y1 = _coord1[1];
	var x2 = _coord2[0];
	var y2 = _coord2[1];
	return sqrt(sqr(x2-x1)+sqr(y2-y1));
}

function angle(_coord1,_coord2){
	return -1
}