draw_set_font(fnt_default_font_bigger);

if (time_screen) {
	draw_set_color(c_black);
	draw_text(room_width / 2 - 50, room_height / 2 - 100, "Attempts: " + string(global.total_attempts));
	
    draw_set_color(c_black);
    draw_text(room_width / 2 - 50, room_height / 2 - 50, global.saved_time);
} else if (screen1) {
    draw_set_color(c_yellow);
    draw_text(room_width / 2 - 50, room_height / 2 - 100, "Game creator");

    draw_set_color(global.text_color);
    draw_text(room_width / 2 - 50, room_height / 2 - 50, "Paul8711gamezz");
} else if (screen2) {
    draw_set_color(c_yellow);
    draw_text(room_width / 2 - 50, room_height / 2 - 100, "Font");
    
    draw_set_color(global.text_color);
    draw_text(room_width / 2 - 400, room_height / 2 - 50, "Fontstruction 'Lubbartz' by 'rhinja'");
    draw_text(room_width / 2 - 400, room_height / 2, "(https://www.fontstruct.com/fontstructions/show/112909)");
    
    draw_text(room_width / 2 - 400, room_height / 2 + 50, "Licensed under a Creative Commons Attribution No Derivatives license");
    draw_text(room_width / 2 - 400, room_height / 2 + 100, "(http://creativecommons.org/licenses/by-nd/3.0/)");
    
    draw_text(room_width / 2 - 400, room_height / 2 + 150, "(The links to these sites are also on the store page of this game)");
} else if (screen3) {
    draw_set_color(c_yellow);
    draw_text(room_width / 2 - 50, room_height / 2 - 100, "Music");
    
    draw_set_color(global.text_color);
    draw_text(room_width / 2 - 150, room_height / 2 - 50, "By Paul8711gamezz (made in Beepbox.co)"); 
} else if (screen4) {
    draw_text(room_width / 2 - 150, room_height / 2, "Created with GameMaker");
}
