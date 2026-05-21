// Smooth Liquid Blue Flow Shader
precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

void main() {
    vec4 color = texture2D(tex, v_texcoord);

    // Create an ultra-slow, smooth wave value based on time
    // Change 0.5 to a lower number (like 0.2) to make it even slower!
    float wave = sin(v_texcoord.x * 3.0 + time * 0.5) * 0.5 + 0.5;

    // Define our beautiful blue palette spectrum
    vec3 deepBlue  = vec3(0.0, 0.17, 0.36); // #002b5b
    vec3 neonCyan  = vec3(0.0, 0.94, 1.0);  // #00f0ff

    // Smoothly blend the colors across the surface texture matches
    vec3 finalGradient = mix(deepBlue, neonCyan, wave);

    // Only apply the effect to the active border outline pixels
    if (color.a > 0.0) {
        gl_FragColor = vec4(finalGradient * color.rgb, color.a);
    } else {
        gl_FragColor = color;
    }
}
