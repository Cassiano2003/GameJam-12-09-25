if (other.vida <= 0){
	instance_create_layer(0,0,"Instances",other.object_index);
	instance_destroy(other);
}else{
	other.vida --;
}