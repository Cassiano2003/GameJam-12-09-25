// Desenhar considerando altura Z
if (atirou){
	 if(direction == 90){// Subir
		x -= 15;
		y -= 25;
	}else if  (direction == 270){// Decer
		x += 40;
		y += 2;
	}else if  (direction == 180){// Esquerda
		y += 20;
	}else{// Direita
		y -= 20;
	}
	atirou = false;
}
image_angle = direction;
draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);