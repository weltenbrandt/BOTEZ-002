// Health variables
hp = 20;
hp_max = 20;

health_chunk_size = 10;
bar_x_offest = 0;
bar_y_offest = 0;

// Words variable
throw_cooldown = 5 * room_speed;

enum wordtype
{
	word,
	no,
	ok,
	yes
}

// Every work has a score depending on where you place it at

// This is the layout:
//["The word", no, ok, yes]

word = [
	["N word", 2, -2, -4],
	["Boomer", 1, 2, 0],
	["Pog", -2, 1, 2]
]

// Do not change

enum twatchstates
{
	idle,
	word
}
state = twatchstates.word;

throw_tick = 0;
spawn_word_tick = 0;