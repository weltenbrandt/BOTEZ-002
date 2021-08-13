if (dir == 1)
{
	depth = oTwatchChat.depth + 1;
}
else
{
	depth = oTwatchChat.depth - 1;
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_alpha(alpha);

draw_text(x, y, "Word");

draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
