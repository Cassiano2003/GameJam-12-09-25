if (instance_exists(target)) {
    // Calcular posição da câmera com ângulo 2.5D
    var target_x = target.x;
    var target_y = target.y;
    
    // Posição da câmera em torno do alvo (sistema 2.5D)
    var desired_x = target_x - lengthdir_x(cam_distance, cam_angle);
    var desired_y = target_y - lengthdir_y(cam_distance, cam_angle);
    
    // Aplicar suavização
    cam_x = lerp(cam_x, desired_x, cam_smoothness);
    cam_y = lerp(cam_y, desired_y, cam_smoothness);
    
    // --- LIMITES DA CÂMERA ---
    var view_width = 960;   // Largura da view
    var view_height = 540;  // Altura da view
    
    // Limitar câmera para não sair do room
    cam_x = clamp(cam_x, view_width / 2, room_width - view_width / 2);
    cam_y = clamp(cam_y, view_height / 2, room_height - view_height / 2);
    
    // Aplicar visualização 2.5D
    camera_set_view_pos(view_camera[0], cam_x - 480, cam_y - 270);
}