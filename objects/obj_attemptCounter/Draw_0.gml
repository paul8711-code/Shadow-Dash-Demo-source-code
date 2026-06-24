if (draw_attempt_counter) {
	draw_set_font(fnt_default_font)
    draw_set_color(c_black);  // Set text color
	draw_text(20, 60, "Attempt " + string(global.total_attempts));  // Display the total attempts
}
