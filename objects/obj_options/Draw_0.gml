
if (room == rm_options and !keybinds_screen and !controller_binds and !page2) {
    draw_set_font(fnt_default_font_bigger);
    draw_set_color(global.text_color);

    // Title
    draw_text(room_width / 2 - 100, room_height / 2 - 150, "Options");

    // Sound Option
    draw_set_color(selected_option == 1 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 - 50, "Sound");

    draw_set_color(global.text_color);
    draw_text(room_width / 2, room_height / 2 - 50, global.sound_on ? "On" : "Off");

    // Music Option
    draw_set_color(selected_option == 2 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2, "Music");

    draw_set_color(global.text_color);
    draw_text(room_width / 2, room_height / 2, global.music_on ? "On" : "Off");

    // Handle music playback in the draw event as a backup
    if (global.music_on && !global.multiple_audio_playing) {
        audio_stop_all();
        audio_play_sound(snd_menu_loop, 1, true);
        global.multiple_audio_playing = true;
    } else if (!global.music_on && global.multiple_audio_playing) {
        audio_stop_all();
        global.multiple_audio_playing = false;
    }

    // Timer Option
    draw_set_color(selected_option == 3 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 50, "Time");

    draw_set_color(global.text_color);
    draw_text(room_width / 2, room_height / 2 + 50, global.timer_on ? "On" : "Off");
	
	draw_set_color(selected_option == 4 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 100, "Snow");

    draw_set_color(global.text_color);
    draw_text(room_width / 2, room_height / 2 + 100, global.snow_on ? "On" : "Off");
	
		draw_set_color(selected_option == 5 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 150, "Hemisphere");

    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 100, room_height / 2 + 150, global.northern_hemisphere ? "Northern" : "Southern");
    
	// keybinds Option
    draw_set_color(selected_option == 6 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 200, "Keybinds");

    // Back Option
    draw_set_color(selected_option == 7 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 250, "Back");
	
}

if (room == rm_options and keybinds_screen and !controller_binds and !page2) {
    draw_set_font(fnt_default_font_bigger);
    draw_set_color(global.text_color);

    // Title
    draw_text(room_width / 2 - 100, room_height / 2 - 350, "Keybinds");

    // Move right
    draw_set_color(selected_option2 == 1 && reading_keybindmr ? c_red : (selected_option2 == 1 && !reading_keybindmr ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 300, "Move Right");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 300, global.drawRight); // Display the current keybind

    // Move left
    draw_set_color(selected_option2 == 2 && reading_keybindml ? c_red : (selected_option2 == 2 && !reading_keybindml ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 250, "Move Left");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 250, global.drawLeft); // Display the current keybind

    // Move up
    draw_set_color(selected_option2 == 3 && reading_keybindmu ? c_red : (selected_option2 == 3 && !reading_keybindmu ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 200, "Move Up");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 200, global.drawUp); // Display the current keybind
	
	// Move down
    draw_set_color(selected_option2 == 4 && reading_keybindmd ? c_red : (selected_option2 == 4 && !reading_keybindmd ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 150, "Move Down");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 150, global.drawDown); // Display the current keybind
	
	// Confirm
    draw_set_color(selected_option2 == 5 && reading_keybindc ? c_red : (selected_option2 == 5 && !reading_keybindc ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 100, "Confirm");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 100, global.drawConfirm); // Display the current keybind
    
	// Dash
    draw_set_color(selected_option2 == 6 && reading_keybindd ? c_red : (selected_option2 == 6 && !reading_keybindd ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 50, "Dash");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 50, global.drawDash); // Display the current keybind

    // Jump
    draw_set_color(selected_option2 == 7 && reading_keybindj ? c_red : (selected_option2 == 7 && !reading_keybindj ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2, "Jump");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2, global.drawJump); // Display the current keybind
	
	// Pause
    draw_set_color(selected_option2 == 8 && reading_keybindp ? c_red : (selected_option2 == 8 && !reading_keybindp ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 + 50, "Pause");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 + 50, global.drawPause); // Display the current keybind
	
	// Retry
    draw_set_color(selected_option2 == 9 && reading_keybindr ? c_red : (selected_option2 == 9 && !reading_keybindr ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 + 100, "Retry");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 + 100, global.drawRetry); // Display the current keybind
	
	// Restart mode
    draw_set_color(selected_option2 == 10 && reading_keybindrs ? c_red : (selected_option2 == 10 && !reading_keybindrs ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 + 150, "Restart mode");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 + 150, global.drawRestart); // Display the current keybind
	
	// set to default
    draw_set_color(selected_option2 == 11 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 200, "Restore default");
	
	// Controller binds
    draw_set_color(selected_option2 == 12 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 250, "Controller binds");
	
	// Back
    draw_set_color(selected_option2 == 13 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 300, "Back");
}

if (room == rm_options and keybinds_screen and controller_binds and !page2) {
    draw_set_font(fnt_default_font_bigger);
    draw_set_color(global.text_color);

    // Title
    draw_text(room_width / 2 - 100, room_height / 2 - 350, "Keybinds");

    // Move right
    draw_set_color(selected_option3 == 1 && reading_keybindmrGP ? c_red : (selected_option3 == 1 && !reading_keybindmrGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 300, "Move Right");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 300, global.drawRightGPB); // Display the current keybind

    // Move left
    draw_set_color(selected_option3 == 2 && reading_keybindmlGP ? c_red : (selected_option3 == 2 && !reading_keybindmlGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 250, "Move Left");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 250, global.drawLeftGPB); // Display the current keybind

    // Move up
    draw_set_color(selected_option3 == 3 && reading_keybindmuGP ? c_red : (selected_option3 == 3 && !reading_keybindmuGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 200, "Move Up");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 200, global.drawUpGPB); // Display the current keybind
	
	// Move down
    draw_set_color(selected_option2 == 3 && reading_keybindmdGP ? c_red : (selected_option3 == 4 && !reading_keybindmdGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 150, "Move Down");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 150, global.drawDownGPB); // Display the current keybind
	
	// Confirm
    draw_set_color(selected_option3 == 5 && reading_keybindcGP ? c_red : (selected_option3 == 5 && !reading_keybindcGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 100, "Confirm");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 100, global.drawConfirmGP); // Display the current keybind
    
	// Dash
    draw_set_color(selected_option3 == 6 && reading_keybinddGP ? c_red : (selected_option3 == 6 && !reading_keybinddGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 - 50, "Dash");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 - 50, global.drawDashGP); // Display the current keybind

    // Jump
    draw_set_color(selected_option3 == 7 && reading_keybindjGP ? c_red : (selected_option3 == 7 && !reading_keybindjGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2, "Jump");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2, global.drawJumpGP); // Display the current keybind
	
	// Pause
    draw_set_color(selected_option3 == 8 && reading_keybindpGP ? c_red : (selected_option3 == 8 && !reading_keybindpGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 + 50, "Pause");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 + 50, global.drawPauseGP); // Display the current keybind
	
	// Retry
    draw_set_color(selected_option3 == 9 && reading_keybindrGP ? c_red : (selected_option3 == 9 && !reading_keybindrGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 + 100, "Retry");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 + 100, global.drawRetryGP); // Display the current keybind
	
	// Restart mode
    draw_set_color(selected_option3 == 10 && reading_keybindrsGP ? c_red : (selected_option3 == 10 && !reading_keybindrsGP ? c_yellow : global.text_color));
    draw_text(room_width / 2 - 100, room_height / 2 + 150, "Restart mode");
    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 150, room_height / 2 + 150, global.drawRestartGP); // Display the current keybind
	
	// set to default
    draw_set_color(selected_option3 == 11 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 200, "Restore default");
	
	// Controller binds
    draw_set_color(selected_option3 == 12 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 250, "Next page");
	
	// Back
    draw_set_color(selected_option3 == 13 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 300, "Back");
}

if (room == rm_options and keybinds_screen and controller_binds and page2) {
    draw_set_font(fnt_default_font_bigger);
    draw_set_color(global.text_color);

    // Title
    draw_text(room_width / 2 - 100, room_height / 2, "Keybinds");
	
	// Restart mode
    draw_set_color(selected_option4 == 1 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 150, "Joystick");
    draw_set_color(global.text_color);
	draw_text(room_width / 2 + 150, room_height / 2 + 150, global.stickl ? "Left Joystick" : "Right Joystick"); // Display the current keybind
	
	// set to default
    draw_set_color(selected_option4 == 2 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 200, "Restore default");
	
	// Controller binds
    draw_set_color(selected_option4 == 3 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 250, "Previous page");
}