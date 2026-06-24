instance_destroy();
if (global.sound_on) {
	audio_play_sound(snd_obj_destroyingplatform_break, 1, false);
}