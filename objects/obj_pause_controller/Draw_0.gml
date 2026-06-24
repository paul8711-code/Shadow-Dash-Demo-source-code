// In the Draw Event of obj_pause_controller
if (is_paused && !option_screen) {
    // Draw a semi-transparent background over the game
    draw_set_alpha(0.3);  // Set transparency to 30% (adjust if needed)
    draw_rectangle_color(0, 0, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);  // Reset alpha to full

    // Draw the pause menu text
    draw_set_font(fnt_default_font_bigger);
    draw_set_color(c_white);
    draw_text(room_width / 2 - 50, room_height / 2 - 100, "PAUSED"); // PAUSED text
    draw_text(room_width / 2 - 200, room_height / 2 - 50, "Press ESC or SELECT to Resume"); // Press ESC to resume

    // Retry button text
    draw_set_color(c_white);
    if (selected_option == 1) draw_set_color(c_yellow);
    draw_text(room_width / 2 - 100, room_height / 2, "Retry");
	
	// Options button text
	if (!global.from_selectscreen) {
	    draw_set_color(c_white);
	    if (selected_option == 2) draw_set_color(c_yellow);
	    draw_text(room_width / 2 - 100, room_height / 2 + 50, "Restart mode");
	} else if (global.from_selectscreen) {
		draw_set_color(c_white);
		if (selected_option == 2) draw_set_color(c_yellow);;
		draw_text(room_width / 2 - 100, room_height / 2 + 50, "Reset time");
	}

    // Options button text
    draw_set_color(c_white);
    if (selected_option == option_option) draw_set_color(c_yellow);
    draw_text(room_width / 2 - 100, room_height / 2 + option_height, "Options");

    // Back to menu button text
    draw_set_color(c_white);
    if (selected_option == max_option) draw_set_color(c_yellow);
	if !global.from_selectscreen {
		draw_text(room_width / 2 - 100, room_height / 2 + max_option_height, "Back to menu");
	} else if global.from_selectscreen {
		draw_text(room_width / 2 - 100, room_height / 2 + max_option_height, "Back to Level select");
	}

    
} else if (is_paused && option_screen) {
    draw_set_font(fnt_default_font_bigger);
    draw_set_color(global.text_color);

    // Title
    draw_text(room_width / 2 - 100, room_height / 2 - 100, "Options");

    // Sound Option
    draw_set_color(selected_option2 == 1 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2, "Sound");

    draw_set_color(global.text_color);
    draw_text(room_width / 2, room_height / 2, global.sound_on ? "On" : "Off");

    // Music Option
    draw_set_color(selected_option2 == 2 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 50, "Music");

    draw_set_color(global.text_color);
    draw_text(room_width / 2, room_height / 2 + 50, global.music_on ? "On" : "Off");

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
    draw_set_color(selected_option2 == 3 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 100, "Time");

    draw_set_color(global.text_color);
    draw_text(room_width / 2, room_height / 2 + 100, global.timer_on ? "On" : "Off");
	
	draw_set_color(selected_option2 == 4 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 150, "Snow");

    draw_set_color(global.text_color);
    draw_text(room_width / 2, room_height / 2 + 150, global.snow_on ? "On" : "Off");
	
	draw_set_color(selected_option2 == 5 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 200, "Hemisphere");

    draw_set_color(global.text_color);
    draw_text(room_width / 2 + 100, room_height / 2 + 200, global.northern_hemisphere ? "Northern" : "Southern");

    // Back Option
    draw_set_color(selected_option2 == 6 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 + 250, "Back");
	
	draw_set_color(global.text_color);
	draw_text(room_width / 2 - 300, room_height / 2 + 300, "(Keybinds are only available from the main menu)")
}
