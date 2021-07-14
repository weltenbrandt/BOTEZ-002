/// @description Insert description here
// You can write your code in this editor
var _marqueeText = ""; 
switch winCondition
{
	case winConditions.collect_coins:
		_marqueeText = "Collect " + string(winValue - obj_gameDataController.coins) + " More Coins!"; 
		break; 
	case winConditions.kill_all_enemies:
		_marqueeText = "Kill Remaining Enemies: " + string(instance_number(par_enemy));
		break; 
	case winConditions.survive_time:
		_marqueeText = "Survive For " + string(winValue div 60) + " Seconds!";
		break;
	case winConditions.find_exit:
		if (winValue == NULLVALUE)
		{_marqueeText = "Find the exit!";}
		else 
		{
			_marqueeText = "Find the exit before " + string(winValue div 60) + " Seconds!";
		}
		break; 
}

draw_set_halign(fa_center); draw_set_valign(fa_top); 
draw_set_color(c_black); 
draw_text(obj_displayController.ideal_width*.5, 15, _marqueeText); 
draw_set_color(c_white); 
