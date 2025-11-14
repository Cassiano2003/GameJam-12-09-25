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
		right = vazioC_right;
		left = vazioC_left;
	break;
}
sprite_index = right;