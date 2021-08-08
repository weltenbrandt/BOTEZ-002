// Health variables
hp = 20;
hp_max = 20;

health_chunk_size = 10;
bar_x_offest = 0;
bar_y_offest = 0;

// Words variable
throw_cooldown = 5 * room_speed;

word = [
	["N word", "no"],
	["Boomer", "ok"],
	["Pog", "yes"]
]

// Do not change

enum twatchstates
{
	idle,
	word
}
state = twatchstates.word;

throw_tick = 0;

shoot_word = "";