draw_set_font(fnt_default_font_bigger);
draw_set_color(c_black);
draw_text(room_width / 2 - 50, room_height / 2 - 100, "Attempts: " + string(global.total_attempts));
	
draw_set_color(c_black);
draw_text(room_width / 2 - 50, room_height / 2 - 50, "Time: " + string(global.saved_time));