for (var i=0; i < array_length(corpo);i++){
	if (instance_exists(corpo[i])  && corpo[i].object_index == obj_corpo_livre){
		var index_historico = array_length(historico_move) - ((i+1) * 5) - 1 ;
		index_historico = clamp(index_historico, 0, array_length(historico_move) - 1);
    
		var dados = historico_move[index_historico];
		instance_destroy(corpo[i]);
		corpo[i] =  instance_create_layer(dados[0],dados[1],"Instances",obj_irmao_perdido);
		corpo[i].indice = i;
		 instance_destroy(other);
		 break;
	}
}