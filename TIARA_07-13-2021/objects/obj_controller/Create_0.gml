//PREPARE THE DISPLAY

amplitude = 0.12;

display_set_gui_size(room_width, room_height);

if os_type == os_android
{
    //distort the sampler uvs according to the screen ratio in the mobile devices...
    vRatio = display_get_gui_width() / display_get_gui_height();
}else{
    vRatio = 1.0;
}

enum shader
{
	paper,
	scanner,
	volumetriclight,
	depth_of_field,
	glitter
}

//SHADER LIST:
shaderIndex = 5;
shaderList = ds_list_create();
ds_list_add(shaderList, shader_paperBurn);
ds_list_add(shaderList, shader_scanner);
ds_list_add(shaderList, shader_volumeLight);
ds_list_add(shaderList, shader_DOF);
ds_list_add(shaderList, shader_glitter);

//SHADER ASSETS:
paper_map0 = smp_paper;
paper_map1 = smp_paperMask;
scanner_map0 = smp_scanner;
dof_map0 = smp_dof;

global.isShaderEnabled = true;

//EXTRAS:
timeCounter = 0;
timeStep = 0.05;
oscillatorValue = 0;
oscillatorValueAbs = 0;

