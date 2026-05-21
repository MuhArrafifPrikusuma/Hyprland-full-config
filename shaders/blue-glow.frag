precision highp float; // Upgraded to high precision to stop math micro-stutters
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time; // Grab the system clock uniform

void main() {
    vec4 color = texture2D(tex, v_texcoord);
    
    -- Smooth out the wave step by dividing time down significantly (0.002)
    float smoothTime = time * 0.002;
    float wave = sin(v_texcoord.x * 2.5 + smoothTime) * 0.5 + 0.5;
    
    // Your beautiful blue spectrum colors
    vec3 deepBlue  = vec3(0.0, 0.17, 0.36); // #002b5b
    vec3 brightBlue = vec3(0.0, 0.50, 1.0);  // #007fff
    vec3 neonCyan  = vec3(0.0, 0.94, 1.0);  // #00f0ff
    
    // Triple-mix interpolation creates a much softer color transition
    vec3 midGradient = mix(deepBlue, brightBlue, wave);
    vec3 finalGradient = mix(midGradient, neonCyan, sin(smoothTime * 0.5) * 0.5 + 0.5);
    
    if (color.a > 0.0) {
        gl_FragColor = vec4(finalGradient * color.rgb, color.a);
    } else {
        gl_FragColor = color;
    }
}
