/// @description Insert description here
// You can write your code in this editor

switch state
{
	default:
		floatY = lerp(floatY,0,.1); 
		break; 
	case "Idle":
		t = (t + increment) mod 360;
		floatY = amplitude * dsin(t);
		break;
}

draw_sprite_ext(sprite_index,image_index,x,y + floatY,image_xscale,image_yscale,0,c_white,image_alpha); 
