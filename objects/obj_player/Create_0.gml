// Create Event
move_speed = 4;
hspeed = 0;
vspeed = 0;


// Sistema de crescimento
segment_count = 3; // Começa com 3 segmentos
max_segments = 20; // Máximo de segmentos
segment_positions = []; // Array para posições dos segmentos
growth_pending = 0; // Segmentos para crescer
segment_distance = 16; // Distância entre segmentos

// Inicializar segmentos
for (var i = 0; i < segment_count; i++) {
    array_push(segment_positions, [x - i * segment_distance, y, "body"]);
}
// A cabeça é o primeiro segmento
segment_positions[0][2] = "head";