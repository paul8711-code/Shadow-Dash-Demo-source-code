// Toggle the pause state with ESC key
if ((global.ESC or global.ESCGP) and !option_screen) {

	load_settings();
	global.input_locked = false;
    is_paused = !is_paused;  // Toggle the pause state

    if (is_paused) {
        // Deactivate all objects except the pause controller
        instance_deactivate_all(true);
		instance_activate_object(obj_menu);
		instance_activate_object(obj_input);
		instance_activate_object(obj_snow_manager);
        instance_activate_object(self);  // Keep the pause controller active
		selected_option = 1;
		selected_option2 = 1;
    } else {
        // If unpausing, activate all objects again
        instance_activate_all();
    }
}

// Only process menu inputs when the game is paused
if (is_paused and !option_screen) {
    // Menu navigation: Move down with down arrow
    if (global.Down or global.DownGPB or (global.DownGP and global.yaxis == 0) or (global.DownheldGP and global.yaxis_held == 0) or (global.DownheldGPB and global.yaxis_held == 0) or (global.Downheld and global.yaxis_held == 0)) {
		global.yaxis = 1;
        selected_option += 1; // Move down the menu
        if (selected_option > max_option) selected_option = 1; // Loop back to the first option
    }
    // Menu navigation: Move up with up arrow
    if (global.Up or global.UpGPB or (global.UpGP and global.yaxis == 0) or (global.UpheldGP and global.yaxis_held == 0) or (global.UpheldGPB and global.yaxis_held == 0) or (global.Upheld and global.yaxis_held == 0)) {
        global.yaxis = 1;
		selected_option -= 1; // Move up the menu
        if (selected_option < 1) selected_option = max_option; // Loop back to the last option
    }

    // Confirm selection with ENTER
    if (global.Confirm or global.ConfirmGP) {
        if (selected_option == 1) {
            room_restart();  // Restart the room
            is_paused = false;  // Unpause the game
			global.total_attempts += 1;
            instance_activate_all();  // Reactivate objects
        } else if (selected_option == 2 && !global.from_selectscreen) {
			if (global.mode == 1) {
				instance_activate_all();
				with obj_timer {
					timer = 0;
				}
				global.total_attempts = 1;
				room_goto(rm_level1);
			} else if (global.mode == 2) {
				instance_activate_all();
				with obj_timer {
					timer = 0;
				}
				global.total_attempts = 1;
				room_goto(rm_level1_challengemode);
			}
		} else if (selected_option == 2 && global.from_selectscreen) {
			instance_activate_all();
			with obj_timer {
				timer = 0;
			}
			global.total_attempts = 1;
			room_restart();
        } else if (selected_option == option_option) {
			option_screen = true;
			selected_option2 = 1;
		} else if (selected_option == max_option) {
			if !global.from_selectscreen {
				room_goto(rm_menu);  // Go to the main menu
			} else if global.from_selectscreen {
				room_goto(rm_levelselect);
			}
            is_paused = false;  // Unpause the game
            instance_activate_all();  // Reactivate objects
			global.timer_reset = false;
			audio_stop_all()
			global.multiple_audio_playing = false;
			global.mode = 0;
        }
    }
} else if (is_paused and option_screen) {
	// In the Step Event
	if (global.Down or global.DownGPB or (global.DownGP and global.yaxis == 0) or (global.DownheldGP and global.yaxis_held == 0) or (global.DownheldGPB and global.yaxis_held == 0) or (global.Downheld and global.yaxis_held == 0)) {
	    global.yaxis = 1;	    
		selected_option2 += 1; // Move down the menu
	    if (selected_option2 > 6) selected_option2 = 1; // Loop back to the first option
	}
	if (global.Up or global.UpGPB or (global.UpGP and global.yaxis == 0) or (global.UpheldGP and global.yaxis_held == 0) or (global.UpheldGPB and global.yaxis_held == 0) or (global.Upheld and global.yaxis_held == 0)) {
	    global.yaxis = 1;	    
		selected_option2 -= 1; // Move down the menu
	    if (selected_option2 < 1) selected_option2 = 6; // Loop back to the first option
	}
	if (global.Confirm or global.ConfirmGP) {
	    switch (selected_option2) {
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
	                audio_play_sound(snd_level_loop, 1, true);
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
				
			case 6: // Back to menu
				option_screen = false;
	    }
	}
}