if (global.Down or global.DownGPB or (global.DownGP and global.yaxis == 0) or (global.DownheldGPB and global.yaxis_held == 0) or (global.DownheldGP and global.yaxis_held == 0) or (global.Downheld and global.yaxis_held == 0)) {
    global.yaxis = 1;
	selected_option += 1; // Move down the menu
    if (selected_option > 8) selected_option = 1; // Loop back to the first option
	}
if (global.Up or global.UpGPB or (global.UpGP and global.yaxis == 0) or (global.UpheldGPB and global.yaxis_held == 0) or (global.UpheldGP and global.yaxis_held == 0) or (global.Upheld and global.yaxis_held == 0)) {
    global.yaxis = 1;
	selected_option -= 1; // Move up the menu
    if (selected_option < 1) selected_option = 8; // Loop back to the last option
}

if (global.Confirm or global.ConfirmGP) {
    if (selected_option >= 2 and selected_option <= 6) {
		audio_stop_all();
		global.multiple_audio_playing = false;
	}
	if (selected_option == 1) {
		mode_selected = !mode_selected; // Toggle between true and false
		// mode_selected = false: normal mode
		//mode_selected = true: challenge mode
	}
	else if (selected_option == 2) {
		if (!mode_selected) {
			global.from_selectscreen = true;
			if (page == 1) room_goto(rm_level1);
			if (page == 2) room_goto(rm_level6);
		} else if (mode_selected) {
			global.from_selectscreen = true;	
			if (page == 1) room_goto(rm_level1_challengemode);
			if (page == 2) room_goto(rm_level6_challengemode);		
		}
	}
	else if (selected_option == 3) {
		if (!mode_selected) {
			global.from_selectscreen = true;
			if (page == 1) room_goto(rm_level2);
			if (page == 2) room_goto(rm_level7);			
		} else if (mode_selected) {
			global.from_selectscreen = true;
			if (page == 1) room_goto(rm_level2_challengemode);
			if (page == 2) room_goto(rm_level7_challengemode);		
		}
	}
    else if (selected_option == 4) {
		if (!mode_selected) {
			global.from_selectscreen = true;	
			if (page == 1) room_goto(rm_level3);
			if (page == 2) room_goto(rm_level8);		
		} else if (mode_selected) {
			global.from_selectscreen = true;
			if (page == 1) room_goto(rm_level3_challengemode);
			if (page == 2) room_goto(rm_level8_challengemode);		
		}	
	}
	else if (selected_option == 5) {
		if (!mode_selected) {
			global.from_selectscreen = true;	
			if (page == 1) room_goto(rm_level4);
			if (page == 2) room_goto(rm_level9);		
		} else if (mode_selected) {
			global.from_selectscreen = true;	
			if (page == 1) room_goto(rm_level4_challengemode);
			if (page == 2) room_goto(rm_level9_challengemode);	
		}
	}
	else if (selected_option == 6) {
		if (!mode_selected) {
			global.from_selectscreen = true;	
			if (page == 1) room_goto(rm_level5);
			if (page == 2) room_goto(rm_level10);		
		} else if (mode_selected) {
			global.from_selectscreen = true;	
			if (page == 1) room_goto(rm_level5_challengemode);
			if (page == 2) room_goto(rm_level10_challengemode);	
		}
	
	}
	else if (selected_option == 7) {
		if (page == 1) {
			page = 2;
		} else if (page == 2) {
			page = 1;
		}
	}
	else if (selected_option == 8) {
		room_goto(rm_menu);	
		global.multiple_audio_playing = false;
	}
}