scr_stateMachineCleanup(); 

/// @description Insert description here
// You can write your code in this editor
if ds_exists(hitMaterialSoundList, ds_type_list)
{
	ds_list_destroy(hitMaterialSoundList); 
}

if ds_exists(hitResponseSoundList, ds_type_list)
{
	ds_list_destroy(hitResponseSoundList); 
}

if ds_exists(deathResponseSoundList, ds_type_list)
{
	ds_list_destroy(deathResponseSoundList); 
}