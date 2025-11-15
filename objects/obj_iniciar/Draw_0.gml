// Detecta hover
hover = point_in_rectangle(mouse_x, mouse_y,
    x - sprite_width/2, y - sprite_height/2,
    x + sprite_width/2, y + sprite_height/2);

// Desenha sombra (sempre atrás)
/*if (hover) {
    draw_sprite_ext(spr_jogo_fundo, image_index, x, y, image_xscale+0.6, image_yscale+0.2, 0, c_gray, 1);
}*/

// Desenha botão principal
draw_sprite(sprite_index, image_index, x, y);