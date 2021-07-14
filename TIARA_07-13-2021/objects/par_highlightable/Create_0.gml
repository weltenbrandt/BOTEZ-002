highlighted = false; 

linethickness=2;

upixelH = shader_get_uniform(shd_outline,"pixelH");
upixelW = shader_get_uniform(shd_outline,"pixelW");
texelW = linethickness*texture_get_texel_width(sprite_get_texture(sprite_index,0));
texelH = linethickness*texture_get_texel_height(sprite_get_texture(sprite_index,0));