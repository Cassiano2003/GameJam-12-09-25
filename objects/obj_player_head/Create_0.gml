// Create Event
move_speed = 4;
hspeed = 0;
vspeed = 0;
direction = 0;
// Sistema de depth para 2.5D
depth = 0; // Objetos com Y maior aparecem atrás
// Create Event
sprite_index = spr_player;
image_xscale = 1;
image_yscale = 1;
z = 10; // Altura

//Gera o corpo
tamanho= 3;
distancia_dos_corpos = 50;
corpo = [];
crecimento_pendente = 0;

for (var i=0; i < tamanho;i++){
	var seg_x = x - (i * distancia_dos_corpos);
	var seg_y = y;
	
	var novo_gomo = instance_create_layer(seg_x,seg_y,"Instances",obj_player_bory);
	
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