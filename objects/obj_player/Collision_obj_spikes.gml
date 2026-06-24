room_restart()
if (global.sound_on) {
	audio_play_sound(snd_player_death, 1, false);
}
global.total_attempts += 1
global.player_died = true;