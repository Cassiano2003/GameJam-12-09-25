// Detecta hover
hover = point_in_rectangle(mouse_x, mouse_y,
    x - sprite_width/2, y - sprite_height/2,
    x + sprite_width/2, y + sprite_height/2);

<<<<<<< HEAD
// Desenha sombra (sempre atrás)
if (hover) {
    draw_sprite_ext(spr_jogo_fundo, image_index, x, y, image_xscale+0.6, image_yscale+0.2, 0, c_gray, 1);
}

// Desenha botão principal
=======
// Sombra atrás
if(hover){
    draw_set_alpha(0.4);
    draw_set_color(c_black);
    draw_rectangle(
        x - sprite_width/2, y - sprite_height/3,
        (x + sprite_width/2.5) + 10, (y + sprite_height/3.5) + 10,
        false
    );
    draw_set_alpha(1);
}

// Desenha sprite (botão)
>>>>>>> 26b67e6 (-11-2025_20-53-Kim)
draw_sprite(sprite_index, image_index, x, y);