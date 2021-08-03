varying vec2 v_uv0;
varying vec2 v_uv0Ratio;

uniform float u_scale;

uniform sampler2D sampler0;

void main()
{
    float piNum = 3.14159265359;
    float circle = 2.0 * piNum;
    
    vec4 blur = vec4(0.0,0.0,0.0,0.0);
    
    int SAMPLES = 8;
    
    //1st pass...
    for (int i = 0; i < SAMPLES; i++)
    {
        highp float angle = (circle / float(SAMPLES)) * float(i);
        
        highp float shift_x = cos(angle) * u_scale;
        highp float shift_y = sin(angle) * u_scale;
        highp vec2 shiftUV =  v_uv0 + vec2(shift_x, shift_y);
        
        blur += texture2D(gm_BaseTexture, shiftUV) / (float(SAMPLES) * 2.0);
    }
    
    //2nd pass...
    for (int i = 0; i < SAMPLES; i++)
    {
        highp float angle = (circle / float(SAMPLES)) * float(i);
        
        highp float shift_x = cos(angle) * u_scale * 0.5;
        highp float shift_y = sin(angle) * u_scale * 0.5;
        highp vec2 shiftUV =  v_uv0 + vec2(shift_x, shift_y);
        
        blur += texture2D(gm_BaseTexture, shiftUV) / (float(SAMPLES) * 2.0);
    }
    
    //mix calculation
    vec4 DF = texture2D( gm_BaseTexture, v_uv0 );
    vec4 MK = texture2D( sampler0, v_uv0Ratio );
    
    vec4 Complete = mix(blur, DF, MK.r);
    
    gl_FragColor = Complete;
}

