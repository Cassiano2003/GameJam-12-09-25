var quantos_gomos = array_length(corpo);
if (!invulneravel && quantos_gomos > 0){
	// 1. Destruir a instância do objeto
	var ultimo_segmento = corpo[quantos_gomos-1];
	ultimo_segmento.image_alpha = 0.1;
	instance_destroy(ultimo_segmento);
	
	// Ativa invulnerabilidade
    invulneravel = true;
    timer_invulneravel = tempo_invulneravel;
	
	// 2. Remover do array
	array_delete(corpo, quantos_gomos-1, other.dado);
}