// Only set the alarm when needed
if (alarm[0] == -1) {
	alarm[0] = 100;
}

// Check if the current screen's time has passed
if (alarm[0] <= 0) {
	room_goto(rm_levelselect);
	global.timer_reset = false;
}