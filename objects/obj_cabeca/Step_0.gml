event_inherited();
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
	andando = true;
}

// Limitar dentro da sala
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

array_push(historico_move,[x,y,direction]);
if(array_length(historico_move) > qnt_historico){
	array_delete(historico_move,0,1);
}

//Funçao de crecimento 
if(crecimento_pendente > 0){
	var ultimo_gomo = corpo[array_length(corpo)- 1];
	var gomo_x = ultimo_gomo.x;
	var gomo_y = ultimo_gomo.y;
	
	var novo_gomo = instance_create_layer(gomo_x,gomo_y,"Instances",obj_corpo_livre);
	
	novo_gomo.indce = array_length(corpo);
	
	array_push(corpo,novo_gomo);
	
	crecimento_pendente --;
}

// Cada segmento pega uma posição específica do histórico
if (andando){
	for (var i = 0; i < array_length(corpo); i++) {
		var index_historico = array_length(historico_move) - ((i+1) * 5) - 1 ;
		index_historico = clamp(index_historico, 0, array_length(historico_move) - 1);
    
		var dados = historico_move[index_historico];
		corpo[i].x = dados[0] ;
		corpo[i].y = dados[1];
		corpo[i].direction = dados[2];  // Direção naquel direçao
	}
}

// Controle de invulnerabilidade
if (invulneravel) {
    timer_invulneravel--;
    
    // Efeito de piscar (opcional)
    image_alpha = (timer_invulneravel mod 10 < 5) ? 0.5 : 1.0;
    
    if (timer_invulneravel <= 0) {
        invulneravel = false;
        image_alpha = 1.0; // Volta ao normal
    }
}


// Tiro
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}

if (keyboard_check_pressed(vk_space) && shoot_cooldown <= 0) {
    var bullet = instance_create_layer(x, y, "Instances", obj_tiro);
	
    with (bullet) {
        // Direção e velocidade
        direction = other.direction;
		x = other.x;
		y = other.y;
        speed = 8;
    }
    
    shoot_cooldown = shoot_delay;
}



//Funçlao de morte
if (array_last(corpo) < tamanho_inicial){
	room_restart();
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