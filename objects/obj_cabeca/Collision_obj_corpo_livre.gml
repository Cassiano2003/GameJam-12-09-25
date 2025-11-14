if (!invulneravel) {
    var quantos_gomos = array_length(corpo);
    var segmento_batido = other.indice;
    
    show_debug_message("=== COLISÃO DETECTADA ===");
    show_debug_message("Invulneravel: " + string(invulneravel));
    show_debug_message("Quantos gomos: " + string(quantos_gomos));
    show_debug_message("Segmento batido: " + string(segmento_batido));
    show_debug_message("Condição: " + string(quantos_gomos > 0 && segmento_batido > 2));
    
    if (quantos_gomos > 0 && segmento_batido > 2) {
        show_debug_message(">>> REMOVENDO SEGMENTO!");
        
        // 1. Destruir a instância do objeto
        var ultimo_segmento = corpo[quantos_gomos-1];
        instance_destroy(ultimo_segmento);

        // Ativa invulnerabilidade
        invulneravel = true;
        timer_invulneravel = tempo_invulneravel;

        // 2. Remover do array
        array_delete(corpo, quantos_gomos-1, 1);
        
        show_debug_message(">>> Segmento removido! Restam: " + string(array_length(corpo)));
    }
}