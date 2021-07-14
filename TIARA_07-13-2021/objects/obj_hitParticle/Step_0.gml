if (global.timeStop > 0)
{image_speed = 0;}
else
{image_speed = imageSpeed;}
if (image_index + image_speed >= image_number)
{
	instance_destroy(); 
}