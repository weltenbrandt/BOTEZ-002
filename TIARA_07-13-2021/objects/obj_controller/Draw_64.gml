//DRAW SHADER =======================================================================

if global.isShaderEnabled == true
{    
    switch(shaderIndex)
    {
        case 0: //paper burn...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio  = shader_get_uniform(shader, "u_vRatio");
            var u_speed = shader_get_uniform(shader, "u_speed");
            var u_time = shader_get_uniform(shader, "u_time");
            var u_scale = shader_get_uniform(shader, "u_scale");
            var u_color1 = shader_get_uniform(shader, "u_color1");
            var u_color2 = shader_get_uniform(shader, "u_color2");
            var sampler0  = shader_get_sampler_index(shader, "sampler0")
            var texture0  = background_get_texture(paper_map0);
            var sampler1  = shader_get_sampler_index(shader, "sampler1")
            var texture1  = background_get_texture(paper_map1);
            
            var time = timeCounter;
            var spe = 0.1;
            var scale = 0.05;
            
            var color1_RGB;
            color1_RGB[0] = 0.0;
            color1_RGB[1] = 0.0;
            color1_RGB[2] = 0.01;
            
            var color2_RGB;
            color2_RGB[0] = 0.9;
            color2_RGB[1] = 0.3;
            color2_RGB[2] = 0.0;
            
            shader_set(shader);
                shader_set_uniform_f(u_vRatio, vRatio);
                shader_set_uniform_f(u_speed, spe);
                shader_set_uniform_f(u_time, time);
                shader_set_uniform_f(u_scale, scale);
                shader_set_uniform_f(u_color1, color1_RGB[0],color1_RGB[1],color1_RGB[2]);
                shader_set_uniform_f(u_color2, color2_RGB[0],color2_RGB[1],color2_RGB[2]);
                texture_set_repeat_ext(sampler0, true);
                texture_set_stage(sampler0,texture0);
                texture_set_repeat_ext(sampler1, true);
                texture_set_stage(sampler1,texture1);
                draw_surface(application_surface,0,0);
            shader_reset();
            break;
        case 1: //scanner...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio  = shader_get_uniform(shader, "u_vRatio");
            var u_speed = shader_get_uniform(shader, "u_speed");
            var u_time = shader_get_uniform(shader, "u_time");
            var u_scale = shader_get_uniform(shader, "u_scale");
            var u_color1 = shader_get_uniform(shader, "u_color1");
            var u_color2 = shader_get_uniform(shader, "u_color2");
            var sampler0  = shader_get_sampler_index(shader, "sampler0")
            var texture0  = background_get_texture(scanner_map0);
            
            var time = timeCounter;
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
            break;
        case 2: //volumetric light...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio = shader_get_uniform(shader, "u_vRatio");
            var u_amplitude = shader_get_uniform(shader, "u_amplitude");
            
           amplitude = 0.12;
            
            shader_set(shader);
                shader_set_uniform_f(u_vRatio, vRatio);
                shader_set_uniform_f(u_amplitude, amplitude);
                draw_surface(application_surface,0,0);
            shader_reset();
            break;
        case 3: //DOF... (depth of field)
            var shader    = ds_list_find_value(shaderList,shaderIndex);
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
            break;
        case 4: //glitter...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio  = shader_get_uniform(shader, "u_vRatio");
            var u_amplitude = shader_get_uniform(shader, "u_amplitude");
            
            amplitude = 0.035;
            
            shader_set(shader);
                shader_set_uniform_f(u_vRatio, vRatio);
                shader_set_uniform_f(u_amplitude, amplitude);
                draw_surface(application_surface,0,0);
            shader_reset();
            break;
    }
}


