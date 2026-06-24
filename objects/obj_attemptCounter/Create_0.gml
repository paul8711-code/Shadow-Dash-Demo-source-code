// Create Event in a persistent controller object (or the first room)
global.attempts_initialized = false
if (!global.attempts_initialized) {
    global.total_attempts = 1;          // Initialize total attempts counter
    global.attempts_initialized = true; // Ensure it's only initialized once
	show_debug_message("death counter newly initialized");
}
global.multiple_audio_playing = false;
draw_attempt_counter = false;

persistent = true;