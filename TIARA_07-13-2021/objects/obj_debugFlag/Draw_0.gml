
draw_set_halign(fa_center);
draw_set_valign(fa_middle); 

draw_set_color(c_red); 
draw_circle(x,y, 25, true); 
draw_set_color(c_white); 
draw_circle(x,y, 25, true); 
draw_set_color(c_red); 
draw_point(x,y); 
draw_set_color(c_white); 
draw_text(x,y, message); 