// Create Event
state = "idle"; // idle, chase, attack

// Create Event (adicione estas variáveis)
wander_timer = 0;
wander_delay = 90; // Troca de direção a cada 90 frames (3 segundos)
current_wander_dir = random(360); // Direção inicial aleatória

// Sistema de depth para 2.5D
depth = 0; // Objetos com Y maior aparecem atrás

// Create Event
image_xscale = 2;
image_yscale = 2;
z = 10; // Altura