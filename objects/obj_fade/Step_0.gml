if (modo == "fadeout") {
    alpha += 0.05;
    if (alpha >= 1) {
        alpha = 1;
        if (proxima_room != noone) {
            room_goto(proxima_room);
        }
        modo = "fadein";
    }
}
else if (modo == "fadein") {
    alpha -= 0.05;
    if (alpha <= 0) {
        alpha = 0;
        instance_destroy();
    }
}
