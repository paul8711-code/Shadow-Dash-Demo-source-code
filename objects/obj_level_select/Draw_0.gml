draw_set_font(fnt_default_font_bigger)

draw_set_color(global.text_color);
draw_text(room_width / 2 - 100, room_height / 2 - 200, "Level Select");

    draw_set_color(selected_option == 1 ? c_yellow : global.text_color);
    draw_text(room_width / 2 - 100, room_height / 2 - 150, mode_selected ? "Challenge mode levels" : "Normal mode levels");

draw_set_color(global.text_color);
if (selected_option == 2) draw_set_color(c_yellow); // Highlight selected option
if (page == 1) {
	draw_text(room_width / 2 - 100, room_height / 2 - 100, "Level 1");
} else if (page == 2) {
	draw_text(room_width / 2 - 100, room_height / 2 - 100, "Level 6");
}

draw_set_color(global.text_color);
if (selected_option == 3) draw_set_color(c_yellow); // Highlight selected option
if (page == 1) {
	draw_text(room_width / 2 - 100, room_height / 2 - 50, "Level 2");
} else if (page == 2) {
	draw_text(room_width / 2 - 100, room_height / 2 - 50, "Level 7");
}

draw_set_color(global.text_color);
if (selected_option == 4) draw_set_color(c_yellow); // Highlight selected option
if (page == 1) {
	draw_text(room_width / 2 - 100, room_height / 2, "Level 3");
} else if (page == 2) {
	draw_text(room_width / 2 - 100, room_height / 2, "Level 8");
}

draw_set_color(global.text_color);
if (selected_option == 5) draw_set_color(c_yellow); // Highlight selected option
if (page == 1) {
	draw_text(room_width / 2 - 100, room_height / 2 + 50, "Level 4");
} else if (page == 2) {
	draw_text(room_width / 2 - 100, room_height / 2 + 50, "Level 9");
}

draw_set_color(global.text_color);
if (selected_option == 6) draw_set_color(c_yellow); // Highlight selected option
if (page == 1) {
	draw_text(room_width / 2 - 100, room_height / 2 + 100, "Level 5");
} else if (page == 2) {
	draw_text(room_width / 2 - 100, room_height / 2 + 100, "Level 10");
}

draw_set_color(global.text_color);
if (selected_option == 7) draw_set_color(c_yellow); // Highlight selected option
if (page == 2) {
	draw_text(room_width / 2 - 100, room_height / 2 + 150, "< Previous");
}

draw_set_color(global.text_color);
if (selected_option == 7) draw_set_color(c_yellow); // Highlight selected option
if (page == 1) {
	draw_text(room_width / 2 - 100, room_height / 2 + 200, "Next >");
}

draw_set_color(global.text_color);
if (selected_option == 8) draw_set_color(c_yellow); // Highlight selected option
draw_text(room_width / 2 - 100, room_height / 2 + 250, "Back");
