instance_create_layer(0,0,"Instances",obj_cogumelo);
instance_create_layer(0,0,"Instances",obj_irm_perdido);
instance_create_layer(0,0,"Instances",obj_formiga);
instance_create_layer(0,0,"Instances",obj_boss_folclore);
audio_stop_all(); // Parar de tocar som anterior.
audio_play_sound(snd_ambiente2, 1, true); // Play na musica.
audio_sound_gain(snd_ambiente2, 0.050, 0); // Volume da Musica.
