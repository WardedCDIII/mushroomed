/// @description 

draw_set_font(fnt_hit);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

var text,color;

if num < 0 {
	text = string(num);
	color = c_red;
} else if num > 0 {
	text = "+ "+string(num);
	color = c_green;
} else {
	text = "0";
	color = c_ltgray;
}

draw_text_color(x,y,text,c_white,color,color,c_black,a);
	














































