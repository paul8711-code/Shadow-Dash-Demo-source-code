// In Step Event
if (room != rm_menu && room != rm_credits && room != rm_options && room != rm_levelselect && room != rm_leveltimersummary) 
{
    // Add time if not in the excluded rooms
    timer += delta_time / 1000000;  // Convert nanoseconds to seconds
    global.timer_reset = false;  // Reset flag to allow future save/reset
} 
else if (!global.timer_reset) 
{
    // If timer hasn't been reset yet and in a special room
    if (room == rm_credits) 
    {
        // Save the current timer and reset it for a full game run
        global.saved_time = timer;
        show_debug_message("Called save function in credits room");
        save(global.saved_time);
        show_debug_message("Saved time: " + string(global.saved_time));

        // Reset the timer and set the reset flag
        timer = 0;
        global.timer_reset = true;
        
        // Load any saved times (if necessary)
        load();
    } 
    else if (room == rm_menu) 
    {
        // Reset the timer when entering the menu
        timer = 0;
        global.timer_reset = true;

        // Load any saved times
        load();
        show_debug_message("Loaded time in menu: " + string(global.times));
    }
	else if (room == rm_leveltimersummary) {
		global.saved_time = timer;
	}
	else if (room == rm_levelselect) {
		timer = 0;
		global.timer_reset = true;
	}
}
