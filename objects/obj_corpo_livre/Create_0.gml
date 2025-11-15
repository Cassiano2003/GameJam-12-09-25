event_inherited();
switch(global.player){
	case 0:
		front  = vazioS_front;
		back = vazioS_back;
		right = vazioS_right_walk;
		left = vazioS_left_walk;
	break;
	case 1:
		front  = vazioC_front;
		back = vazioC_back;
		right = vazioC_right_walk;
		left = vazioC_left_walk;
	break;
}
sprite_index = right;

somPassos = -1;   // armazena o ID do som quando tocar
