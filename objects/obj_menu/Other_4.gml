if (room == rm_menu) global.total_attempts = 1;
selected_option = 1; // Start with the first option selected
if (room == rm_menu or room == rm_levelselect) {
	audio_stop_all()
}

if (!global.multiple_audio_playing and (room == rm_menu or room == rm_levelselect) and global.music_on) {
	audio_play_sound(snd_menu_loop, 1, true);
	global.multiple_audio_playing = true;
}