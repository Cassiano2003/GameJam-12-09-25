event_inherited();
// Tornar o objeto persistente
//persistent = true;
//Escolja do player
global.player = 0;
switch(global.player){
	case 0:
		front  = sergio_front;
		back = sergio_back;
		right = sergio_right;
		left = sergio_left;
	break;
	case 1:
		front  = claudio_front;
		back = claudio_back;
		right = claudio_right;
		left = claudio_left;
	break;
}

// Movimentação
move_speed = 4;
andando = false;
inimigos_mortos = 0;
hspeed = 0;
vspeed = 0;
direction = 0;

sprite_index = right;

//Gera o corpo inicial
tamanho_inicial= 1;
distancia_dos_corpos = 20;
corpo = [];
crecimento_pendente = 0;

var seg_x = x - (distancia_dos_corpos);
var seg_y = y;
var novo_gomo = instance_create_layer(seg_x,seg_y,"Instances",obj_corpo_tiro);
novo_gomo.indce = 0;
array_push(corpo,novo_gomo);

for (var i=1; i < tamanho_inicial;i++){
	seg_x = x - ((i+1) * distancia_dos_corpos);
	seg_y = y;
	
	novo_gomo = instance_create_layer(seg_x,seg_y,"Instances",obj_corpo_livre);
	
	novo_gomo.indce = i;
	
	array_push(corpo,novo_gomo);
}

//Historico de movimentaçao
historico_move = [];
qnt_historico = 100;


invulneravel = false;
tempo_invulneravel = 180; // 1.5 segundos (60 FPS)
timer_invulneravel = 0;
