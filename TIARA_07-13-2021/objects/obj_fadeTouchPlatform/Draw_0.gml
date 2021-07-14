if ethereal {image_alpha = fadeAlpha;}
else {image_alpha = 1; }

var _shakeAddX = 0; 
var _shakeAddY = 0; 

if (sprite_index == touchedSprite)
{
	var _shakeAddX = irandom(xShakeAmount); 
	var _shakeAddY = irandom(yShakeAmount);
}							

draw_set_alpha(image_alpha); 
draw_sprite(sprite_index,image_index, x + _shakeAddX, y + _shakeAddY); 
draw_set_alpha(1); 