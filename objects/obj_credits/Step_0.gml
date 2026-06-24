// Only set the alarm when needed
if (alarm[0] == -1) {  // If the alarm isn't set or already triggered
	if (time_screen) {
		alarm[0] = 100;
	} else if (screen1) {
        alarm[0] = 100;
    } else if (screen2) {
        alarm[0] = 300;
    } else if (screen3) {
        alarm[0] = 200;
    } else if (screen4) {
        alarm[0] = 200;
    }
}

// Check if the current screen's time has passed
if (alarm[0] <= 0) {
	if (time_screen) {
		time_screen = false;
		screen1 = true;
	} else if (screen1) {
        screen1 = false;
        screen2 = true;
    } else if (screen2) {
        screen2 = false;
        screen3 = true;
    } else if (screen3) {
        screen3 = false;
        screen4 = true;
    } else if (screen4) {
        room_goto(rm_menu);
        screen4 = false;
		global.timer_reset = false;
    }
}

