/// @description Insert description here
// You can write your code in this editor

var _winTriggered = false; 
switch winCondition
{
	case winConditions.collect_coins:
		if (obj_gameDataController.coins >= winValue){_winTriggered = true;}
		break; 
	case winConditions.kill_all_enemies:
		if (instance_number(par_enemy) <= 0) {_winTriggered = true;}
		break; 
	case winConditions.survive_time:
		winValue -= 1; 
		if (winValue <= 0)
		{_winTriggered = true;}
		break; 
	case winConditions.find_exit:
		if (winValue != NULLVALUE)
		{
			winValue -= 1; 
			if (winValue <= 0)
			{
				scr_dealDamageToPlayer(999);
			}
		}
		break; 
}

if _winTriggered
{
	show_message("YOU WIN!");
}
