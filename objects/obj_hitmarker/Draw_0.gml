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

draw_set_alpha(a);
draw_set_color(c_white);
draw_text(x-0.5,y-0.5,text);
draw_text(x+0.5,y+0.5,text);
draw_set_color(color);
draw_text(x,y,text);
	














































