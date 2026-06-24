// Start playing the music
if (global.music_on) {
	audio_stop_all();
	audio_play_sound(snd_menu_loop, 1, true);
	global.multiple_audio_playing = true;
}