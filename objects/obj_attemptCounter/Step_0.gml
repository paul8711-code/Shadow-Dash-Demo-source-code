if (room != rm_menu and room != rm_credits and room != rm_options and room != rm_levelselect and room != rm_leveltimersummary) {
	// Start playing the music
	if (global.music_on && !global.multiple_audio_playing) {
		audio_stop_sound(snd_menu_loop);
		audio_play_sound(snd_level_loop, 1, true);
		global.multiple_audio_playing = true;
	}
}
if (room != rm_menu and room != rm_credits and room != rm_options and room != rm_levelselect and room != rm_leveltimersummary) { // Replace with your room name
	draw_attempt_counter = true;
} else {
	draw_attempt_counter = false;
}