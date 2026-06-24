#region NORMAL MENU
// Navigate the menu
if (room == rm_options && !controller_binds && !keybinds_screen && !page2 && (global.Down or global.DownGPB or (global.DownGP and global.yaxis == 0) or (global.DownheldGP and global.yaxis_held == 0) or (global.DownheldGPB and global.yaxis_held == 0) or (global.Downheld and global.yaxis_held == 0))) {
    global.yaxis = 1;
	selected_option += 1;
    if (selected_option > 7) selected_option = 1; // Loop to the first option
}

if (room == rm_options && !controller_binds && !keybinds_screen && !page2 && (global.Up or global.UpGPB or (global.UpGP and global.yaxis == 0) or (global.UpheldGP and global.yaxis_held == 0) or (global.UpheldGPB and global.yaxis_held == 0) or (global.Upheld and global.yaxis_held == 0))) {
    global.yaxis = 1;
	selected_option -= 1;
    if (selected_option < 1) selected_option = 7; // Loop to the last option
}

// Handle selection
if (room == rm_options && !controller_binds && !keybinds_screen && !page2 && (global.Confirm or global.ConfirmGP)) {
    switch (selected_option) {
        case 1: // Sound toggle
            global.sound_options_selected = !global.sound_options_selected;
            global.sound_on = !global.sound_on;// Sync the sound state
			save_settings(global.sound_on, global.music_on, global.timer_on, global.snow_on, global.northern_hemisphere);
            break;

        case 2: // Music toggle
            global.music_options_selected = !global.music_options_selected;
            global.music_on = !global.music_on;
			save_settings(global.sound_on, global.music_on, global.timer_on, global.snow_on, global.northern_hemisphere);

            // Manage music playback
            if (global.music_on && !global.multiple_audio_playing) {
                audio_stop_all();
                audio_play_sound(snd_menu_loop, 1, true);
                global.multiple_audio_playing = true;
            } else if (!global.music_on) {
                audio_stop_all();
                global.multiple_audio_playing = false;
            }
            break;

        case 3: // Timer toggle
            global.timer_options_selected = !global.timer_options_selected;
            global.timer_on = !global.timer_on; // Sync the timer state
			save_settings(global.sound_on, global.music_on, global.timer_on, global.snow_on, global.northern_hemisphere);
            break;

        case 4: // Back to menu wrong
			global.snow_options_selected = !global.snow_options_selected;
            global.snow_on = !global.snow_on; // Sync the timer state
			save_settings(global.sound_on, global.music_on, global.timer_on, global.snow_on, global.northern_hemisphere);
            break;
		
		case 5: // Back to menu wrong
			global.hemisphere_options_selected = !global.hemisphere_options_selected;
			global.northern_hemisphere  = !global.northern_hemisphere ; // Sync the timer state
			save_settings(global.sound_on, global.music_on, global.timer_on, global.snow_on, global.northern_hemisphere);
            break;
			
		case 6: 
			keybinds_screen = true;
			triggered = false;
			ignore_input = true;
			selected_option2 = 1;
			getAllBindNamesAndKeysKB();
			getAllBindNamesAndKeysGP();
			getAllBindNamesAndKeysGPA();
            break;
			
		case 7: // Back to menu
			global.multiple_audio_playing = false;
            room_goto(rm_menu);
            break;
    }
}
#endregion

#region KEYBOARD BINDS
// 10 keyboard binds + back button + controller switch button + heading = 13 lines
// Navigate the menu
if (room == rm_options && !controller_binds && keybinds_screen && !input_locked && !page2 && (global.Down or global.DownGPB or (global.DownGP and global.yaxis == 0) or (global.DownheldGP and global.yaxis_held == 0) or (global.DownheldGPB and global.yaxis_held == 0) or (global.Downheld and global.yaxis_held == 0))) {
    global.yaxis = 1;
	selected_option2 += 1;
    if (selected_option2 > 13) selected_option2 = 1; // Loop to the first option
}

if (room == rm_options && !controller_binds && keybinds_screen && !input_locked && !page2 && (global.Up or global.UpGPB or (global.UpGP and global.yaxis == 0) or (global.UpheldGP and global.yaxis_held == 0) or (global.UpheldGPB and global.yaxis_held == 0) or (global.Upheld and global.yaxis_held == 0))) {
    global.yaxis = 1;
	selected_option2 -= 1;
    if (selected_option2 < 1) selected_option2 = 13; // Loop to the last option
}

// Handle selection
if (keybinds_screen && !controller_binds && !page2 && ignore_input && !triggered) {
	alarm[0] = 5;
	triggered = true;
}
if (room == rm_options && !controller_binds && keybinds_screen && !ignore_input && !page2 && (global.Confirm or global.ConfirmGP)) {
	input_locked = true;
	switch (selected_option2) {
        case 1: // right bind
			keyboard_lastkey = vk_nokey;
			reading_keybindmr = true;	
			break;
			
        case 2: // left bind
			keyboard_lastkey = vk_nokey;
			reading_keybindml = true;	
			break;

        case 3: // up bind
			keyboard_lastkey = vk_nokey;
			reading_keybindmu = true;	
			break;

        case 4: // down bind
			keyboard_lastkey = vk_nokey;
			reading_keybindmd = true;	
			break;
		
		case 5: // confirm bind
			keyboard_lastkey = vk_nokey;
			reading_keybindc = true;	
			break;
			
		case 6: // dash bind
			keyboard_lastkey = vk_nokey;
			reading_keybindd = true;	
			break;
			
		case 7: // jump bind
			keyboard_lastkey = vk_nokey;
			reading_keybindj = true;	
			break;
		
		case 8: // pause bind
			keyboard_lastkey = vk_nokey;
			reading_keybindp = true;	
			break;
			
		case 9: // retry bind
			keyboard_lastkey = vk_nokey;
			reading_keybindr = true;	
			break;
			
		case 10: // restart bind
			keyboard_lastkey = vk_nokey;
			reading_keybindrs = true;	
			break;
						
		case 11: // Controller binds screen
			input_locked = false;
			initializeKeybinds();
			getAllBindNamesAndKeysKB();
			getAllBindNamesAndKeysGPA();
			getAllBindNamesAndKeysGP();
			save_default_keybinds();
			global.stickl = true;
			global.gp_horizontal_stick = gp_axislh;
			global.gp_vertical_stick = gp_axislv;
			load_keybinds();
            break;
			
		case 12: // Controller binds screen
			input_locked = false;
			controller_binds = true;
			selected_option2 = 1;
			selected_option3 = 1;
			getAllBindNamesAndKeysKB();
			getAllBindNamesAndKeysGPA();
			getAllBindNamesAndKeysGP();
			triggered = false;
			ignore_input = true;
            break;
			
		case 13: // Back
			input_locked = false;
			keybinds_screen = false;
			controller_binds = false;
			selected_option2 = 1;
			selected_option = 1;
            break;
    }
}

if (reading_keybindmr) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Right", false);
	if (new_keybind != -1) {
		inputReplace("Right", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindmr = false;
		input_locked = false;
		save_keybinds(global.key, global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindml) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Left", false);
	if (new_keybind != -1) {
		inputReplace("Left", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindml = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.key, global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindmu) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Up", false);
	if (new_keybind != -1) {
		inputReplace("Up", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindmu = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.key, global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindmd) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Down", false);
	if (new_keybind != -1) {
		inputReplace("Down", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindmd = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.key, global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindc) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Confirm", false);
	if (new_keybind != -1) {
		inputReplace("Confirm", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindc = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.key, global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindd) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Dash", false);
	if (new_keybind != -1) {
		inputReplace("Dash", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindd = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.key, global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindj) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Jump", false);
	if (new_keybind != -1) {
		inputReplace("Jump", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindj = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.key, global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindp) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Pause", false);
	if (new_keybind != -1) {
		inputReplace("Pause", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindp = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.key, global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindr) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Retry", false);
	if (new_keybind != -1) {
		inputReplace("Retry", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindr = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.key, global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
if (reading_keybindrs) {
	load_keybinds();
	new_keybind = inputChangeKeybind("Restart", false);
	if (new_keybind != -1) {
		inputReplace("Restart", new_keybind);
		var key_name = getAllBindNamesAndKeysKB();
		reading_keybindrs = false;
		input_locked = false;
		save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.key, global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
	}
}
	
#endregion

#region CONTROLLER BINDS PAGE 1

//    ______            __             ____
//   / ____/___  ____  / /__________  / / /__  _____
//  / /   / __ \/ __ \/ __/ ___/ __ \/ / / _ \/ ___/
// / /___/ /_/ / / / / /_/ /  / /_/ / / /  __/ /
// \____/\____/_/ /_/\__/_/   \____/_/_/\___/_/

//     __    _           ___
//    / /_  (_)___  ____/ (_)___  ____ ______
//   / __ \/ / __ \/ __  / / __ \/ __ `/ ___/
//  / /_/ / / / / / /_/ / / / / / /_/ (__  )
// /_.___/_/_/ /_/\__,_/_/_/ /_/\__, /____/
//                             /____/

if (room == rm_options && controller_binds && keybinds_screen && !input_locked && !page2 && (global.Down or global.DownGPB or (global.DownGP and global.yaxis == 0) or (global.DownheldGP and global.yaxis_held == 0) or (global.DownheldGPB and global.yaxis_held == 0) or (global.Downheld and global.yaxis_held == 0))) {
    global.yaxis = 1;
	selected_option3 += 1;
    if (selected_option3 > 13) selected_option3 = 1; // Loop to the first option
}

if (room == rm_options && controller_binds && keybinds_screen && !input_locked && !page2 && (global.Up or global.UpGPB or (global.UpGP and global.yaxis == 0) or (global.UpheldGP and global.yaxis_held == 0) or (global.UpheldGPB and global.yaxis_held == 0) or (global.Upheld and global.yaxis_held == 0))) {
    global.yaxis = 1;
	selected_option3 -= 1;
    if (selected_option3 < 1) selected_option3 = 13; // Loop to the last option
}

// Handle selection
if (keybinds_screen && controller_binds && !page2 && ignore_input && !triggered) {
	alarm[0] = 5;
	triggered = true;
}
if (room == rm_options && controller_binds && keybinds_screen && !ignore_input && !page2 && (global.Confirm or global.ConfirmGP)) {
	input_locked = true;
	switch (selected_option3) {
        case 1: // right bind
			reading_keybindmrGP = true;	
			break;
			
        case 2: // left bind
			reading_keybindmlGP = true;	
			break;

        case 3: // up bind
			reading_keybindmuGP = true;	
			break;

        case 4: // down bind
			reading_keybindmdGP = true;	
			break;
		
		case 5: // confirm bind
			reading_keybindcGP = true;	
			break;
			
		case 6: // dash bind
			reading_keybinddGP = true;	
			break;
			
		case 7: // jump bind
			reading_keybindjGP = true;	
			break;
		
		case 8: // pause bind
			reading_keybindpGP = true;	
			break;
			
		case 9: // retry bind
			reading_keybindrGP = true;	
			break;
			
		case 10: // restart bind
			reading_keybindrsGP = true;	
			break;
						
		case 11: // reset binds
			input_locked = false;
			initializeKeybinds();
			getAllBindNamesAndKeysKB();
			getAllBindNamesAndKeysGPA();
			getAllBindNamesAndKeysGP();
			save_default_keybinds();
			global.stickl = true;
			global.gp_horizontal_stick = gp_axislh;
			global.gp_vertical_stick = gp_axislv;
			load_keybinds();
            break;
			
		case 12: // next page (optional)
			selected_option3 = 1;
			selected_option4 = 1;
			page2 = true;
			ignore_input = true;
			triggered = false;
            break;
			
		case 13: // Back
			input_locked = false;
			triggered = false;
			controller_binds = false;
			selected_option2 = 1;
			selected_option = 1;
			selected_option3 = 1;
            break;
    }
}

if (reading_keybindmrGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("RightGPB", true);
			if (new_keybind != -1) {
				inputReplace("RightGPB", new_keybind);
				reading_keybindmrGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.keyGP, global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybindmlGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("LeftGPB", true);
			if (new_keybind != -1) {
				inputReplace("LeftGPB", new_keybind);
				reading_keybindmlGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.keyGP, global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybindmuGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("UpGPB", true);
			if (new_keybind != -1) {
				inputReplace("UpGPB", new_keybind);
				reading_keybindmuGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.keyGP, global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybindmdGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("DownGPB", true);
			if (new_keybind != -1) {
				inputReplace("DownGPB", new_keybind);
				reading_keybindmdGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.keyGP, global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybindcGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("ConfirmGP", true);
			if (new_keybind != -1) {
				inputReplace("ConfirmGPB", new_keybind);
				reading_keybindcGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.keyGP, global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybinddGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("DashGP", true);
			if (new_keybind != -1) {
				inputReplace("DashGP", new_keybind);
				reading_keybinddGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.keyGP, global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybindjGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("JumpGP", true);
			if (new_keybind != -1) {
				inputReplace("JumpGP", new_keybind);
				reading_keybindjGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.keyGP, global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybindpGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("PauseGP", true);
			if (new_keybind != -1) {
				inputReplace("PauseGP", new_keybind);
				reading_keybindpGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.keyGP, global.bind_map[? "line_19"], global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybindrGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("RetryGP", true);
			if (new_keybind != -1) {
				inputReplace("RetryGP", new_keybind);
				reading_keybindrGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.keyGP, global.bind_map[? "line_20"], global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}
if (reading_keybindrsGP) {
	load_keybinds();
	if (!triggered_wait) {
		triggered_wait = true;
	}
	if (triggered_wait) {
		if (_wait > 0) _wait -= 1;
		if (_wait <= 0) {
			new_keybind = inputChangeKeybind("RestartGP", true);
			if (new_keybind != -1) {
				inputReplace("RestartGP", new_keybind);
				reading_keybindrsGP = false;
				input_locked = false;
				triggered_wait = false;
				_wait = 5;
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.keyGP, global.bind_map[? "line_21"])
				load_keybinds();
				getAllBindNamesAndKeysGP();
			}
		}
	}
}

#endregion

#region CONTROLLER BINDS PAGE 2
if (room == rm_options && controller_binds && keybinds_screen && page2 && (global.Down or global.DownGPB or (global.DownGP and global.yaxis == 0) or (global.DownheldGP and global.yaxis_held == 0) or (global.DownheldGPB and global.yaxis_held == 0) or (global.Downheld and global.yaxis_held == 0))) {
    global.yaxis = 1;
	selected_option4 += 1;
    if (selected_option4 > 3) selected_option4 = 1; // Loop to the first option
}

if (room == rm_options && controller_binds && keybinds_screen && page2 && (global.Up or global.UpGPB or (global.UpGP and global.yaxis == 0) or (global.UpheldGP and global.yaxis_held == 0) or (global.UpheldGPB and global.yaxis_held == 0) or (global.Upheld and global.yaxis_held == 0))) {
    global.yaxis = 1;
	selected_option4 -= 1;
    if (selected_option4 < 1) selected_option4 = 3; // Loop to the last option
}

if (keybinds_screen && controller_binds && page2 && ignore_input && !triggered) {
	alarm[0] = 5;
	triggered = true;
}

if (room == rm_options && controller_binds && keybinds_screen && page2 && !ignore_input && (global.Confirm or global.ConfirmGP)) {
	switch (selected_option4) {
		case 1: // restart bind
			show_debug_message("case 1")
			if (global.stickl) {
				global.gp_vertical_stick = gp_axisrv;
				global.gp_horizontal_stick = gp_axisrh;
				global.stickl = false;
				show_debug_message(global.stickl)
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], "stickr")
				load_keybinds();
			} else if (!global.stickl) {
				global.gp_vertical_stick = gp_axislv;
				global.gp_horizontal_stick = gp_axislh;		
				global.stickl = true;
				show_debug_message(global.stickl)
				save_keybinds(global.bind_map[? "line_1"], global.bind_map[? "line_2"], global.bind_map[? "line_3"], global.bind_map[? "line_4"], global.bind_map[? "line_5"], global.bind_map[? "line_6"], global.bind_map[? "line_7"], global.bind_map[? "line_8"], global.bind_map[? "line_9"], global.bind_map[? "line_10"], global.bind_map[? "line_11"], global.bind_map[? "line_12"], global.bind_map[? "line_13"], global.bind_map[? "line_14"], global.bind_map[? "line_15"], global.bind_map[? "line_16"], global.bind_map[? "line_17"], global.bind_map[? "line_18"], global.bind_map[? "line_19"], global.bind_map[? "line_20"], "stickl")		
				load_keybinds();
			}
			break;

		case 2: // reset binds
			input_locked = false;
			initializeKeybinds();
			getAllBindNamesAndKeysKB();
			getAllBindNamesAndKeysGPA();
			getAllBindNamesAndKeysGP();
			save_default_keybinds();
			global.stickl = true;
			global.gp_horizontal_stick = gp_axislh;
			global.gp_vertical_stick = gp_axislv;
			load_keybinds();
            break;
			
		case 3: // Back
			input_locked = false;
			triggered = false;
			page2 = false;
			selected_option2 = 1;
			selected_option = 1;
			selected_option3 = 1;
			selected_option4 = 1;
			getAllBindNamesAndKeysKB();
			getAllBindNamesAndKeysGPA();
			getAllBindNamesAndKeysGP();
            break;
    }
}
#endregion