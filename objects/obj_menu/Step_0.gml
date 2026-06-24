// In the Step Event
if (global.gamepad == 0) {
	for (var i = 0; i <= 12; i++) { // GameMaker supports up to 12 controllers
	    if (gamepad_is_connected(i)) {
	        show_debug_message("Gamepad connected at index: " + string(i));
			global.gamepad = i;
	    }
	}
}
// for (var h = 0; h < 16; h++) { // Check all possible buttons
//     if (gamepad_button_check(global.gamepad, h)) {
//         show_debug_message("Button " + string(h) + " is being pressed");
//     }
// }

// for (var j = 0; j < 6; j++) { // Check all possible axes
   //  var axis = gamepad_axis_value(global.gamepad, j);
//     if (abs(axis) > 0.5) {
//         show_debug_message("Axis " + string(j) + " value: " + string(axis));
//     }
// }
if (!global.DownGP and !global.UpGP) {
	global.yaxis = 0;
}

// Check if joystick is being pressed down
if (global.UpheldGP or global.DownheldGP or global.DownheldGPB or global.UpheldGPB or global.Downheld or global.Upheld) {
    joystick_down_timer++;
	global.yaxis_held = 1;
} else {
    joystick_down_timer = 0; // Reset the timer if joystick is not down
}

// Check if the timer exceeds the threshold
if (joystick_down_timer >= joystick_hold_threshold) {
	global.yaxis_held = 0;
    joystick_down_timer = 0; // Reset or handle as needed
}
if (room = rm_menu) {
	if (global.Down or global.DownGPB or (global.DownGP and global.yaxis == 0) or (global.DownheldGP and global.yaxis_held == 0) or (global.DownheldGPB and global.yaxis_held == 0) or (global.Downheld and global.yaxis_held == 0)) { // gp_axislv
		global.yaxis = 1; 
		selected_option += 1; // Move down the menu
	    if (selected_option > 5) selected_option = 1; // Loop back to the first option
	}
	if (global.Up or global.UpGPB or (global.UpGP and global.yaxis == 0) or (global.UpheldGP and global.yaxis_held == 0) or (global.UpheldGPB and global.yaxis_held == 0) or (global.Upheld and global.yaxis_held == 0)) {
	    global.yaxis = 1;
		selected_option -= 1; // Move up the menu
	    if (selected_option < 1) selected_option = 5; // Loop back to the last option
	}

	if (global.Confirm or global.ConfirmGP) {
	    if (selected_option == 1) {
			room_goto(rm_level1); // Start Game
			global.multiple_audio_playing = false;
			global.mode = 1;
			global.from_selectscreen = false;
			show_debug_message("Mode: " + string(global.mode));
		}
		else if (selected_option == 2) {
			room_goto(rm_level1_challengemode); // Start Game
			global.multiple_audio_playing = false;
			global.mode = 2;
			global.from_selectscreen = false;
			show_debug_message("Mode: " + string(global.mode));
		}
		else if (selected_option == 3) {
			room_goto(rm_levelselect);
		}
	    else if (selected_option == 4) {
			room_goto(rm_options); // Options Menu
			load_settings()
		}
		else if (selected_option == 5) game_end(); // Quit Game
	}
}
