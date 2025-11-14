// Create Event
move_speed = 4;
andando = false;
habilidades = [];
array_push(habilidades,true);
array_push(habilidades,false);
array_push(habilidades,false);
array_push(habilidades,false);
array_push(habilidades,false);
hspeed = 0;
vspeed = 0;
direction = 0;
// Sistema de depth para 2.5D
depth = 0; // Objetos com Y maior aparecem atrás
// Create Event
sprite_index = sergio_right;
image_xscale = 1;
image_yscale = 1;
z = 10; // Altura

//Gera o corpo
tamanho_inicial= 4;
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
tempo_invulneravel = 90; // 1.5 segundos (60 FPS)
timer_invulneravel = 0;


shoot_cooldown = 0;
shoot_delay = 15; // frames entre tiros