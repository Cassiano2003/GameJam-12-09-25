// cor do botão dependendo do hover
if (hover){ 
	draw_set_color(cor_hover);
}else{
	draw_set_color(cor_normal);
}
// retângulo
draw_rectangle(x - largura/2, y - altura/2, x + largura/2, y + altura/2, false);

// texto
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, texto);
