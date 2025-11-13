// Comer a comida e crescer
growth_pending += 2; // Cresce 2 segmentos
score += 100; // Pontuação

// Efeitos visuais e sonoros
instance_create_layer(x, y, "Effects", obj_eat_effect);
audio_play_sound(snd_eat, 0, false);

// Reposicionar comida ou criar nova
with (other) {
    // Ou reposiciona esta comida
    x = random(room_width - 32) + 16;
    y = random(room_height - 32) + 16;
    
    // Ou cria nova comida (escolha uma opção):
    // instance_create_layer(random(room_width), random(room_height), "Instances", obj_food);
}