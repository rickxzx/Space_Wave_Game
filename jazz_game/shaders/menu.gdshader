shader_type canvas_item;

uniform vec4 color : source_color = vec4(1.0, 0.75, 0.8, 1.0); // rosa aconchegante
uniform float radius = 24.0; // raio do arredondamento (em pixels)
uniform vec2 rect_size = vec2(400.0, 200.0); // tamanho do ColorRect

void fragment() {
    // Converte UV em coordenadas de pixel
    vec2 pos = UV * rect_size;

    // Calcula distância até o retângulo arredondado
    vec2 half_size = rect_size / 2.0;
    vec2 dist = abs(pos - half_size) - (half_size - vec2(radius));
    float outside = length(max(dist, 0.0)) - radius;

    // Cria borda suave e aplica cor
    float alpha = 1.0 - smoothstep(0.0, 1.0, outside);
    COLOR = vec4(color.rgb, color.a * alpha);
}
