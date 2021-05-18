#define PI 3.14159265359

mat2 rotate2d(float _angle) {
    return mat2(
        cos(_angle),
        -sin(_angle),
        sin(_angle),
        cos(_angle)
    );
}

void main( void ) {
    float time = iGlobalTime;
    float t = time * 0.5;

    vec2 uv = (gl_FragCoord.xy / iResolution.xy);

    // vec4 m = iMouse / iResolution.x;


    vec2 p = vec2(0.5, 0.5) - uv;
    
    p = rotate2d(t) * p;

    float rad = length(p) * 2.0;

    float deg = atan(p.x, p.y);

    // float e = 1.0 - rad;
    // float e = sin(deg * 10.0);
    // float e = sin(rad * PI * 10.0);
    float tt = sin(t * 15.0);
    float e = sin((rad * PI * 3.0 - t * 10.0) + sin(rad * 15.0 - t + sin(rad * tt)));

    float r = e;
    float g = e;
    float b = e;

    vec4 color = vec4(r, g, b, 1.0);

    gl_FragColor = color;
}

