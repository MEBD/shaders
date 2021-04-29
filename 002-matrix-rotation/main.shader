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
    float t = time * 1.5;

    vec2 uv = (gl_FragCoord.xy / iResolution.xx - 0.5);
    uv = uv * 4.5;

    uv = rotate2d((t * 0.05) * PI) * uv;

    uv.x = sin(uv.x * 10.0) - sin(uv.y * 5.0 - t);
    uv.y = sin(uv.y * 20.0) + sin(uv.x * 2.5 - t);

    uv.x = sin(uv.x * 1.5);
    uv.y = sin(uv.y * 1.5);

    // uv.x = smoothstep(0.1, 0.9, uv.x);
    // uv.y = smoothstep(0.1, 0.9, uv.y);

    float r = sin(uv.x - uv.y - t * 0.5);
    float g = sin(uv.y + uv.x - t * 0.5);
    float b = sin(uv.x - sin(t * 0.5));

    vec4 color = vec4( r, g, b, 0.5 );

    gl_FragColor = color;
}

