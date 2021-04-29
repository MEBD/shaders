void main( void ) {
    float time = iGlobalTime;
    float t = time * 0.5;

    vec2 uv = (gl_FragCoord.xy / iResolution.xx - 0.5);
    uv = uv * 8.0;

    uv.x = sin(uv.x * sin(uv.x - t) * 0.4) + sin(uv.y + t);
    uv.y = sin(uv.y + sin(uv.x) * 16.0) + t;

    uv.x = sin(uv.x * 0.5);
    uv.y = sin(uv.y * 4.0);

    float r = sin(uv.x - uv.y);
    float g = sin(uv.x - uv.y);
    float b = sin(uv.x - uv.y);

    gl_FragColor = vec4( r, g, b, 1.0 );
}
