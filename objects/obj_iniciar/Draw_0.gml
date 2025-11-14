// Detecta hover baseado na sprite
hover = point_in_rectangle(mouse_x, mouse_y,
    x - sprite_width/2, y - sprite_height/2,
    x + sprite_width/2, y + sprite_height/2);

// Sombra atrás
if (hover) {
    draw_set_alpha(0.4);
    draw_set_color(c_black);
    draw_rectangle(
        x - sprite_width/2 + 2, y - sprite_height/2 + 2,
        x + sprite_width/2 + 2, y + sprite_height/2 + 2,
        false
    );
    draw_set_alpha(1);
}

// Desenha sprite (botão)
draw_sprite(sprite_index, image_index, x, y);
