// Draw Event
if (room != rm_menu && room != rm_credits && room != rm_options && room != rm_levelselect && room != rm_leveltimersummary && global.timer_on) {
    draw_set_font(fnt_default_font);
    draw_set_color(c_black);
    draw_text(20, 100, string_format(timer, 0, 2));
}
