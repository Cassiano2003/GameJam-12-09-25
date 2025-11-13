// Decrementar tempo de vida
life_timer--;
if (life_timer <= 0) {
    instance_destroy();
}

// Para 2.5D: atualizar profundidade
depth = -y;