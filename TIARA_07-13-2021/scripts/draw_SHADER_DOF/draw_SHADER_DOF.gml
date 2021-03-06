function draw_SHADER_DOF(argument0) {
	var enabled = argument0;

	//ANIMATION
	/*
	    ideally this should be moved out the draw event
	    for better control...
	*/
	var timeMult = 0.0025; //make the animation slower or faster...
	var time = current_time * timeMult;
	var oscillatorValue = sin(time);
	var oscillatorValueAbs = abs(sin(time));

	//SHADER SETUP
	if enabled = true
	{
	    // Display setup ---------------------------------------------------------------------------
	    display_set_gui_size(room_width, room_height);

	    if os_type == os_android
	    {     
	        vRatio = display_get_gui_width() / display_get_gui_height(); //distort the sampler uvs according to the screen ratio in the mobile devices...
	    }else{
	        vRatio = 1.0;
	    }
    
	    // Samplers / Textures ---------------------------------------------------------------------
	    dof_map0 = smp_dof;
    
	    // Shader setup ----------------------------------------------------------------------------
	    var shader    = shader_DOF;
	    var u_vRatio  = shader_get_uniform(shader, "u_vRatio");
	    var u_scale = shader_get_uniform(shader, "u_scale");
	    var sampler0  = shader_get_sampler_index(shader, "sampler0")
	    var texture0  = background_get_texture(dof_map0);
    
	    var scale = 0.015;
    
	    shader_set(shader);
	        shader_set_uniform_f(u_vRatio, vRatio);
	        shader_set_uniform_f(u_scale, scale);
	        texture_set_repeat_ext(sampler0, true);
	        texture_set_stage(sampler0,texture0);
	        draw_surface(application_surface,0,0);
	    shader_reset();
	}



}
