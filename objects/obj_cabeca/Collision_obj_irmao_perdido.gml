if (!invulneravel) {
    var quantos_gomos = array_length(corpo);
    var segmento_batido = other.indice;
    
    if (quantos_gomos > 0 && segmento_batido > 2) {
        
        // 1. Destruir a instância do objeto
        var ultimo_segmento = corpo[quantos_gomos-1];
        instance_destroy(ultimo_segmento);

        // Ativa invulnerabilidade
        invulneravel = true;
        timer_invulneravel = tempo_invulneravel;

       var ter_habilidades = true;
       for(var i=quantos_gomos-1; i  >  0;i--){
			if (instance_exists(corpo[i]) && corpo[i].object_index != obj_corpo_livre){
				instance_destroy(corpo[i]);
				array_delete(corpo, i, 1);
				ter_habilidades = false;
				// 🔁 ATUALIZAR OS ÍNDICES DOS OBJETOS RESTANTES
	            for (var j = i; j < array_length(corpo); j++) {
	                if (instance_exists(corpo[j])) {
	                    corpo[j].indice = j;
	                }
	            }
				break;
			}
		}
		if (ter_habilidades){
			array_delete(corpo, quantos_gomos-1, 1);
		}
    }
}