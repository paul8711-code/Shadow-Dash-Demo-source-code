is_paused = false;
selected_option = 1;
option_screen = false;
selected_option2 = 1;
if (global.from_selectscreen) {
	max_option = 4;
	option_option = 3;
	option_height = 100;
	max_option_height = 150;
} else if (!global.from_selectscreen) {
	max_option = 4;
	option_option = 3;
	option_height = 100;
	max_option_height = 150;
}