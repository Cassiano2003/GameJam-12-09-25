depth = - y;

// Step Event
var _target = instance_find(obj_player_head, 0);
var _distance = point_distance(x, y, _target.x, _target.y);

// Máquina de estados
switch(state) {
	  case "idle":
	    if (_distance < detection_range) {
	        state = "chase";
	    } else {
	        // Sistema de vagar aleatoriamente
	        wander_timer += 1;
        
	        // Trocar direção periodicamente
	        if (wander_timer >= wander_delay) {
	            wander_timer = 0;
	            current_wander_dir = random(360); // Nova direção aleatória
	            wander_delay = 60 + irandom(60); // Delay entre 2-4 segundos
	        }
        
	        // Mover na direção atual
	        hspeed = lengthdir_x(move_speed, current_wander_dir);
	        vspeed = lengthdir_y(move_speed, current_wander_dir);
	    }
	    break;
        
    case "chase":
        if (_distance > detection_range) {
            state = "idle";
        } else if (_distance < attack_range) {
            state = "attack";
        } else {
            // Seguir jogador
            var _dir = point_direction(x, y, _target.x, _target.y);
            hspeed = lengthdir_x(move_speed+1, _dir);
            vspeed = lengthdir_y(move_speed+1, _dir);
        }
        break;
        
    case "attack":
        // Aqui vai o código de ataque
        if (_distance > attack_range) {
            state = "chase";
        }
        break;
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