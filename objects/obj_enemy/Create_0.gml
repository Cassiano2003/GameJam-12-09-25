// Create Event
move_speed = 2;
detection_range = 200;
attack_range = 50;
state = "idle"; // idle, chase, attack

// Create Event (adicione estas variáveis)
wander_timer = 0;
wander_delay = 90; // Troca de direção a cada 90 frames (3 segundos)
current_wander_dir = random(360); // Direção inicial aleatória