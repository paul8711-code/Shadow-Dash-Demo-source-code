global.can_dash = true;
if (global.sound_on) {
	audio_play_sound(snd_obj_extradash_pickup, 1, false);
}
instance_destroy();