 // Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function do_collision(tileset){

//decimal fractions of hsp are stored in hsp_f
//every frame this fraction is added back in and the new fraction removed again
//this moves us in whole integers each frame that are still representative of decimal movement
//for example, at a hsp of 0.1 you would move 1 pixel every 10 frames.
//this resolves any issues of not detecting a collision at a fractional target (ie: no collision at 3.8, when there is at 4.0)
//which sometimes caused the player after rounding, to be drawn overlapping walls by 1 pixel.
 
hsp_final = hspd;
hsp_f = hsp_final - floor(abs(hsp_final))*sign(hsp_final);
hsp_final -= hsp_f;

vsp_final = vspd;
vsp_f = vsp_final - floor(abs(vsp_final))*sign(vsp_final);
vsp_final -= vsp_f;
 

}