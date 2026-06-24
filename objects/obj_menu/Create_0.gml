// In the Create Event
selected_option = 1; // Start with the first option selected
window_set_caption("Shadow Dash Demo");
global.initialized = false;
// In a persistent controller object
if (!global.initialized) {
	global.from_selectscreen = false;
    global.sound_options_selected = false;
    global.music_options_selected = false;
    global.timer_options_selected = false;
    global.multiple_audio_playing = false;
    global.initialized = true;
	global.mode = 0;
	global.player_died = false;
	global.input_locked = false;
	global.initialized_settings = false;
	load_settings();
	global.snow_options_selected = false;
	global.hemisphere_options_selected = false;
	global.gamepad = 0;
	global.yaxis = 0;
	global.yaxis_held = 0;
	joystick_down_timer = 0; // Time the joystick has been held down
	joystick_hold_threshold = 15; // 1 second, assuming 60 FPS
	// Recheck if the file was created
	if (!file_exists("keybinds.shadowdash")) {
        show_debug_message("Error: Failed to create default keybinds.");
		save_default_keybinds();
	} else {
        show_debug_message("Default keybinds created successfully. Reloading...");
		load_keybinds(); // Reload newly created file
	}
}
persistent = true;

audio_group_load(audiogroup_bg_music);

global.multiple_audio_playing = false;
