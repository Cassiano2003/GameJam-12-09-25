event_inherited();
switch(global.player){
	case 0:
		front  = inicialS_front;
		back = inicialS_back;
		right = inicialS_right;
		left = inicialS_left;
	break;
	case 1:
		front  = inicialC_front;
		back = inicialC_back;
		right = inicialC_right;
		left = inicialC_left;
	break;
}

sprite_index = right;