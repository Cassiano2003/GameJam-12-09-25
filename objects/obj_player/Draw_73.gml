// Desenhar todos os segmentos da centopeia
for (var i = 0; i < array_length(segment_positions); i++) {
    var seg = segment_positions[i];
    var seg_type = seg[2];
    
    // Escolher sprite baseado no tipo de segmento
    var _draw_sprite = spr_player_bory; // Sprite padrão do corpo
    
    if (seg_type == "head") {
        _draw_sprite = spr_player;
        // Direção da cabeça baseada no movimento
        var _draw_angle = point_direction(seg[0], seg[1], segment_positions[1][0], segment_positions[1][1]);
    } else if (seg_type == "body") {
        _draw_sprite = spr_player_bory;
        // Direção do corpo baseada nos segmentos adjacentes
        var _draw_angle = 0;
        if (i > 0 && i < array_length(segment_positions) - 1) {
            var prev_seg = segment_positions[i-1];
            var next_seg = segment_positions[i+1];
            _draw_angle = point_direction(prev_seg[0], prev_seg[1], next_seg[0], next_seg[1]);
        }
    }
    
    // Desenhar o segmento
    draw_sprite_ext(_draw_sprite, 0, seg[0], seg[1], 1, 1, _draw_angle, c_white, 1);
}

// Desenhar debug (opcional)
draw_set_color(c_white);
draw_text(10, 10, "Segmentos: " + string(segment_count));
draw_text(10, 30, "Score: " + string(score));