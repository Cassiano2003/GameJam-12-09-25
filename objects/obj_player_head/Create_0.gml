// Create Event
move_speed = 4;
hspeed = 0;
vspeed = 0;

//Gera o corpo
tamanho_inicial = 3;
distancia_dos_corpos = 50;
corpo = [];
crecimento_pendente = 0;

for (var i=0; i < tamanho_inicial;i++){
	var seg_x = x - (i * distancia_dos_corpos);
	var seg_y = y;
	
	var novo_gomo = instance_create_layer(seg_x,seg_y,"Instances",obj_player_bory);
	
	novo_gomo.indce = i;
	
	array_push(corpo,novo_gomo);
}

//Historico de movimentaçao
historico_move = [];
qnt_historico = 100;

