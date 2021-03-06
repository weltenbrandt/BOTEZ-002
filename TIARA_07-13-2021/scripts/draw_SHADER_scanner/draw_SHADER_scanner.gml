function draw_SHADER_scanner(argument0) {
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
	    scanner_map0 = smp_scanner;

	    // Shader setup ----------------------------------------------------------------------------
	    var shader    = shader_scanner;
	    var u_vRatio  = shader_get_uniform(shader, "u_vRatio");
	    var u_speed = shader_get_uniform(shader, "u_speed");
	    var u_time = shader_get_uniform(shader, "u_time");
	    var u_scale = shader_get_uniform(shader, "u_scale");
	    var u_color1 = shader_get_uniform(shader, "u_color1");
	    var u_color2 = shader_get_uniform(shader, "u_color2");
	    var sampler0  = shader_get_sampler_index(shader, "sampler0")
	    var texture0  = background_get_texture(scanner_map0);
    
	    var spe = 0.1;
	    var scale = 0.15;
    
	    var color1_RGB;
	    color1_RGB[0] = 0.5;
	    color1_RGB[1] = 1.0;
	    color1_RGB[2] = 0.7;
    
	    var color2_RGB;
	    color2_RGB[0] = 0.5;
	    color2_RGB[1] = 1.0;
	    color2_RGB[2] = 0.7;
    
	    shader_set(shader);
	        shader_set_uniform_f(u_vRatio, vRatio);
	        shader_set_uniform_f(u_speed, spe);
	        shader_set_uniform_f(u_time, time);
	        shader_set_uniform_f(u_scale, scale);
	    shader_set_uniform_f(u_color1, color1_RGB[0],color1_RGB[1],color1_RGB[2]);
	    shader_set_uniform_f(u_color2, color2_RGB[0],color2_RGB[1],color2_RGB[2]);
	    texture_set_repeat_ext(sampler0, true);
	    texture_set_stage(sampler0,texture0);
	    draw_surface(application_surface,0,0);
	    shader_reset();
	}



}
