// Step Event
// Input
var _hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var _vinput = keyboard_check(vk_down) - keyboard_check(vk_up);

// Movimento
hspeed = _hinput * move_speed;
vspeed = _vinput * move_speed;

// Limitar dentro da sala
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

// Atualizar posições dos segmentos (movimento serpenteante)
for (var i = array_length(segment_positions) - 1; i > 0; i--) {
    // Cada segmento segue o anterior
    var target_x = segment_positions[i-1][0];
    var target_y = segment_positions[i-1][1];
    
    var seg_dir = point_direction(segment_positions[i][0], segment_positions[i][1], target_x, target_y);
    segment_positions[i][0] += lengthdir_x(move_speed, seg_dir);
    segment_positions[i][1] += lengthdir_y(move_speed, seg_dir);
}

// Atualizar posição da cabeça
segment_positions[0] = [x, y, "head"];

// Crescer se tiver segmentos pendentes
if (growth_pending > 0 && segment_count < max_segments) {
    var last_seg = segment_positions[array_length(segment_positions)-1];
    array_push(segment_positions, [last_seg[0], last_seg[1], "body"]);
    segment_count++;
    growth_pending--;
    
    // Efeito visual de crescimento
    instance_create_layer(x, y, "Effects", obj_growth_effect);
}


// Impedir de sair da sala - APÓS todo o movimento
function clamp_to_room() {
    var margin = 16; // Margem de segurança
    
    // Limitar coordenadas X
    if (x < margin) {
        x = margin;
        hspeed = abs(hspeed); // Ricochete
        current_wander_dir = random_range(0, 180); // Virar para dentro
    }
    if (x > room_width - margin) {
        x = room_width - margin;
        hspeed = -abs(hspeed); // Ricochete
        current_wander_dir = random_range(180, 360); // Virar para dentro
    }
    
    // Limitar coordenadas Y
    if (y < margin) {
        y = margin;
        vspeed = abs(vspeed); // Ricochete
        current_wander_dir = random_range(90, 270); // Virar para dentro
    }
    if (y > room_height - margin) {
        y = room_height - margin;
        vspeed = -abs(vspeed); // Ricochete
        current_wander_dir = random_range(-90, 90); // Virar para dentro
    }
}

// Chamar a função no final do Step Event
clamp_to_room();