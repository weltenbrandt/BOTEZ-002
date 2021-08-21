// DRAWS SCORE/POINTS
draw_set_halign(fa_left); 
draw_set_valign(fa_middle); 

var _coinsDisplayX = 8; 
var _coinsDisplayY = 80; 
draw_sprite(spr_guiCoin, 0,   _coinsDisplayX, _coinsDisplayY); 
var _coinCountDisplayX = _coinsDisplayX+ sprite_get_width(spr_guiCoin); 

draw_set_font(global.numberFont); 
draw_text(_coinCountDisplayX, _coinsDisplayY, string(coins)); 

// DISPLAY TIME
var _timeDisplayX = 2; 
var _timeDisplayY = 110; 
draw_set_font(-1); 
draw_text(_timeDisplayX,_timeDisplayY, "Time: "); 
var _timeCountDisplayX = _timeDisplayX + string_width("Time: "); 
draw_set_font(global.numberFont); 
draw_text(_timeCountDisplayX, _timeDisplayY, string(timer div 60)); 


draw_set_font(-1); 

// DRAW PLAYER HEARTS
var _heartSep = 65; // X SEPARATIN OF HEARTS
var _xStart = -5; 
for (var i = 0; i < maxHearts; ++i)
{
	if (i < currentHearts)
	{
		draw_sprite(spr_guiHeart,0, _xStart + _heartSep*i,0); 
	}
	else
	{
		if (heartImageIndexArray[i] <= 8)
		{
			heartImageIndexArray[i] += .2; 
		}
		draw_sprite(spr_guiLoseHeart, heartImageIndexArray[i],_xStart +_heartSep*i,0); 
	}
}
/*
draw_text(5,64, "Time: " + string(timer div 60)
+ "\n" + "Score: " + string(points) + "\n" + 
"Coins: " + string(coins)); 
*/
// < unlock_coins

// Draws the required coins to pass a level
if (WARPER.coins_to_unlock > 0)
{
	var _x = display_get_gui_width();

	draw_set_halign(fa_center);

	draw_text(_x - 100, 30, "Remaining coins \n to unlock exit: \n");
	if (WARPER.coins_to_unlock > obj_gameDataController.coins)
	{
		draw_set_color(c_red);
	}

	draw_sprite(spr_guiCoinLeft, 0,   _x - 180, 30); 


	draw_text(_x - 100, 57, string(obj_gameDataController.coins) + "/" + string(WARPER.coins_to_unlock));
	draw_set_halign(fa_left);
	var _coinCountDisplayX = _coinsDisplayX+ sprite_get_width(spr_guiCoin); 
	
	draw_set_color(c_white);
}