// Draw Event of a HUD or controller object
draw_set_font(fnt_default_font)
if (room != rm_menu and room != rm_credits) { // Replace with your room name
    draw_set_color(c_black);  // Set text color
	draw_text(20, 20, "Level " + string(level));  // Display the total attempts
}
