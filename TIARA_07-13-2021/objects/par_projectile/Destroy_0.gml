scr_playSoundVariant(.1,breakSound); 

if (explodeObject != NULLVALUE)
{
	instance_create_depth(x,y,depth,explodeObject);
}