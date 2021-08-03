varying vec2 v_uv0;
varying vec2 v_uv0Ratio;

uniform float u_amplitude;

void main()
{
    float piNum = 3.14159265359;
    float circle = 2.0 * piNum;
    
    vec4 lightShaft = vec4(0.0,0.0,0.0,0.0);
    
    int SAMPLES = 16;
    
    float stp = (1.0 / float(SAMPLES));
    
    vec2 unit = vec2(1.0,1.0);
    
    for (int i = 0; i < SAMPLES; i++)
    {
        float amp = (u_amplitude / float(SAMPLES)) * float(i);
        
        float shift_x = amp;
        float shift_y = amp;
        
        vec2 shiftUV =  v_uv0 + (vec2(shift_x, shift_y) * ((1.0 - v_uv0) * 2.0 -1.0));
        
        vec4 DF = vec4(1.0) - texture2D(gm_BaseTexture, shiftUV);
        DF =  smoothstep(0.8, 1.0, DF) * (1.0 - (float(i) / float(SAMPLES)));        

        lightShaft += DF / float(SAMPLES); 
    }
    
    vec4 Complete = texture2D(gm_BaseTexture, v_uv0) + (lightShaft * 2.0);
    
    gl_FragColor = vec4(Complete.rgb, 1.0);
}

