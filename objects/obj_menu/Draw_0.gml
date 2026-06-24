// In the Draw Event, highlight the selected option
if (room = rm_menu) {
	draw_set_font(fnt_default_font_bigger)

	draw_set_color(global.text_color);
	draw_text(room_width / 2 - 100, room_height / 2 - 100, "Shadow Dash Demo");

	draw_set_color(global.text_color);
	if (selected_option == 1) draw_set_color(c_yellow); // Highlight selected option
	draw_text(room_width / 2 - 100, room_height / 2, "Start Normal Game");

	draw_set_color(global.text_color);
	if (selected_option == 2) draw_set_color(c_yellow); // Highlight selected option
	draw_text(room_width / 2 - 100, room_height / 2 + 50, "Start Challenge Mode");

	draw_set_color(global.text_color);
	if (selected_option == 3) draw_set_color(c_yellow); // Highlight selected option
	draw_text(room_width / 2 - 100, room_height / 2 + 100, "Level Select");

	draw_set_color(global.text_color);
	if (selected_option == 4) draw_set_color(c_yellow); // Highlight selected option
	draw_text(room_width / 2 - 100, room_height / 2 + 150, "Options");

	draw_set_color(global.text_color);
	if (selected_option == 5) draw_set_color(c_yellow); // Highlight selected option
	draw_text(room_width / 2 - 100, room_height / 2 + 200, "Quit Game");
	
	draw_set_color(global.text_color);
	load();
	draw_text(room_width / 2 - 100, room_height / 2 + 300, "Best time: " + string(global.times));
	
	draw_set_color(global.text_color);
	draw_text(room_width / 2 - 650, room_height / 2 + 300, "1.0.1.1");
}