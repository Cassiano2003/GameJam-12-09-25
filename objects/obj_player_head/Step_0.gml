var nova_direcao = direction;

if ( keyboard_check(vk_right) ) nova_direcao =  0;
if ( keyboard_check(vk_left)) nova_direcao = 180;
if (keyboard_check(vk_down)) nova_direcao = 270;
if ( keyboard_check(vk_up)) nova_direcao= 90;

if (abs (nova_direcao - direction) == 90 || abs (nova_direcao - direction) == 270){
	direction = nova_direcao;
}

// Movimento
if ( keyboard_check(vk_right) || keyboard_check(vk_left) || keyboard_check(vk_down) ||  keyboard_check(vk_up)){
	hspeed = lengthdir_x(move_speed,direction);
	vspeed = lengthdir_y(move_speed,direction);
}

// Limitar dentro da sala
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

array_push(historico_move,[x,y,direction]);
if(array_length(historico_move) > qnt_historico){
	array_delete(historico_move,0,1);
}

// Cada segmento pega uma posição específica do histórico
for (var i = 0; i < array_length(corpo); i++) {
    var index_historico = array_length(historico_move) - (i * 10) - 1 ;
    index_historico = clamp(index_historico, 0, array_length(historico_move) - 1);
    
    var dados = historico_move[index_historico];
    corpo[i].x = dados[0];
    corpo[i].y = dados[1];
    corpo[i].direction = dados[2]; // Direção naquele momento
}

/*
// Movimento orgânico do corpo
for (var i = 0; i < array_length(corpo); i++) {
    var alvo_x, alvo_y;
    
    if (i == 0) {
        // Primeiro segmento segue a cabeça
        alvo_x = x;
        alvo_y = y;
    } else {
        // Segmentos seguem o anterior
        alvo_x = corpo[i-1].x;
        alvo_y = corpo[i-1].y;
    }
    
    // Movimento suave em direção ao alvo
    corpo[i].x = lerp(corpo[i].x, alvo_x, 0.3) - lengthdir_x(distancia_dos_corpos,direction);
    corpo[i].y = lerp(corpo[i].y, alvo_y, 0.3) - lengthdir_y(distancia_dos_corpos,direction);
}*/

//Funçao de crecimento 

if(crecimento_pendente > 0){
	var ultimo_gomo = corpo[array_length(corpo)- 1];
	var gomo_x = ultimo_gomo.x;
	var gomo_y = ultimo_gomo.y;
	
	var novo_gomo = instance_create_layer(gomo_x,gomo_y,"Instances",obj_player_bory);
	
	novo_gomo.indce = array_length(corpo);
	
	array_push(corpo,novo_gomo);
	
	crecimento_pendente --;
}


// Impedir de sair da sala - APÓS todo o movimento
function clamp_to_room() {
    var margin = 16; // Margem de segurança
    
    // Limitar coordenadas X
    if (x < margin) {
        x = margin;
        hspeed = abs(hspeed); // Ricochete
        current_wander_dir = random_range(0, 180); // Virar para dentro
    }
    if (x > room_width - margin) {
        x = room_width - margin;
        hspeed = -abs(hspeed); // Ricochete
        current_wander_dir = random_range(180, 360); // Virar para dentro
    }
    
    // Limitar coordenadas Y
    if (y < margin) {
        y = margin;
        vspeed = abs(vspeed); // Ricochete
        current_wander_dir = random_range(90, 270); // Virar para dentro
    }
    if (y > room_height - margin) {
        y = room_height - margin;
        vspeed = -abs(vspeed); // Ricochete
        current_wander_dir = random_range(-90, 90); // Virar para dentro
    }
}

// Chamar a função no final do Step Event
clamp_to_room();