event_inherited();
var nova_direcao = direction;

if (keyboard_check(vk_right)) nova_direcao =  0;
if (keyboard_check(vk_left)) nova_direcao = 180;
if (keyboard_check(vk_down)) nova_direcao = 270;
if (keyboard_check(vk_up)) nova_direcao= 90;

if (abs (nova_direcao - direction) == 90 || abs (nova_direcao - direction) == 270){
	direction = nova_direcao;
}

// Movimento
if (keyboard_check(vk_right) || keyboard_check(vk_left) || keyboard_check(vk_down) ||  keyboard_check(vk_up)){
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
if(andando){
    var i = 0;
    while (i < array_length(corpo)) {
        // Verificar se a instância existe
        if (!instance_exists(corpo[i])) {
            // Remover instância destruída do array
            array_delete(corpo, i, 1);
            // NÃO incrementa i porque o próximo elemento veio para esta posição
        } else {
            // Só processa se a instância existir
            var index_historico = array_length(historico_move) - ((i + 1) * 5) - 1;
            index_historico = clamp(index_historico, 0, array_length(historico_move) - 1);
            
            var dados = historico_move[index_historico];
            corpo[i].x = dados[0];
            corpo[i].y = dados[1];
            corpo[i].direction = dados[2];
            
            i++; // Só incrementa se não removeu nada
        }
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

//Funcao de morte
if (array_length(corpo) < tamanho_inicial){
	//room_goto(rm_gameOver);
	room_restart();
}

// Impedir de sair da sala - APÓS todo o movimento
function clamp_to_room() {
    var margin = 16; // Margem de segurança
	var _dano = false;
    
    // Limitar coordenadas X
    if (x < margin) {
        x = margin;
        hspeed = abs(hspeed); // Ricochete
        current_wander_dir = random_range(0, 180); // Virar para dentro
		_dano = true;
    }
    if (x > room_width - margin) {
        x = room_width - margin;
        hspeed = -abs(hspeed); // Ricochete
        current_wander_dir = random_range(180, 360); // Virar para dentro
		_dano = true;
    }
    
    // Limitar coordenadas Y
    if (y < margin) {
        y = margin;
        vspeed = abs(vspeed); // Ricochete
        current_wander_dir = random_range(90, 270); // Virar para dentro
		_dano = true;
    }
    if (y > room_height - margin) {
        y = room_height - margin;
        vspeed = -abs(vspeed); // Ricochete
        current_wander_dir = random_range(-90, 90); // Virar para dentro
		_dano = true;
    }
	
	if (_dano){
		var quantos_gomos = array_length(corpo);
		if (!invulneravel && quantos_gomos > 0){
			// 1. Destruir a instância do objeto
			var ultimo_segmento = corpo[quantos_gomos-1];
			ultimo_segmento.image_alpha = 0.1;
			instance_destroy(ultimo_segmento);
	
			// Ativa invulnerabilidade
		    invulneravel = true;
			var ter_habilidades = true;
		    timer_invulneravel = tempo_invulneravel;
	
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
}

// Chamar a função no final do Step Event
clamp_to_room();