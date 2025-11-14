event_inherited();

// Tiro
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}

if (keyboard_check_pressed(vk_space) && shoot_cooldown <= 0) {
    var bullet1 = instance_create_layer(x, y, "Instances", obj_tiro);
	var bullet2 = instance_create_layer(x, y, "Instances", obj_tiro);
	
	var _dir = direction;
	var dir_bullet1 = 0;
	var dir_bullet2 = 0;
	
	if (_dir == 90 || _dir == 270){ // Cima
		dir_bullet1 = 0;
		dir_bullet2 = 180;
	}else{
		dir_bullet1 = 90;
		dir_bullet2 = 270;
	}
	
	
    with (bullet1) {
        // Direção e velocidade
        direction = dir_bullet1;
		x = other.x;
		y = other.y;
        speed = 8;
    }
	with (bullet2) {
        // Direção e velocidade
        direction = dir_bullet2;
		x = other.x;
		y = other.y;
        speed = 8;
    }
    
    shoot_cooldown = shoot_delay;
}
