// If the speed isn't changed on the editor, this code changes it basing on the direction of this object
if (horizontal_force == 0.01)
{
	horizontal_force = lengthdir_x(1, image_angle) * 5;
}

if (vertical_force == 0.01)
{
	vertical_force = lengthdir_y(1, image_angle) / 2;
}
