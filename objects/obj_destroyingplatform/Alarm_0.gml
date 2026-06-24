if (global.season_winter == false) {
	image_index = 1;
} else {
	image_index = 3;
}
if (global.sound_on) {
	audio_play_sound(snd_obj_destroyingplatform_break, 1, false);
}
alarm[1] = 20;