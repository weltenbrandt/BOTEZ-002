if (ds_exists(collisionList, ds_type_list))
{
	ds_list_destroy(collisionList); 
}

if (ds_exists(onHitSoundList, ds_type_list))
{
	ds_list_destroy(onHitSoundList); 
}