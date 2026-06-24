function save_settings(_setting1, _setting2, _setting3, _setting4, _setting5) 
{
	// IMPORTANT:
	// _setting1: global.sound_on
	// _setting2: global.music_on
	// _setting3: global.timer_on
	// _setting4: global.snow_on
	// _setting5: global.northern_hemisphere

    // Open the file for writing
    var _file = file_text_open_write("settings.shadowdash");

	   // Write the text to the file
	file_text_write_string(_file, _setting1);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _setting2);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _setting3);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _setting4);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _setting5);
		
	file_text_close(_file);

}

function load_settings() {
	filename = "settings.shadowdash";

        // Check if the file exists
	if (file_exists(filename)) {
		var _file = file_text_open_read(filename);
        var _index = 1;
        global.settings_map = ds_map_create();

        // Read the file line by line and store them in the map
        while (!file_text_eof(_file)) {
			var line = file_text_read_string(_file);
            file_text_readln(_file); // Move to the next line
            global.settings_map[? "line_" + string(_index)] = line;
            _index++;
        }

        file_text_close(_file);

        // Assign settings to globals
        global.sound_on = global.settings_map[? "line_1"];
        global.music_on = global.settings_map[? "line_2"];
        global.timer_on = global.settings_map[? "line_3"];
        global.snow_on = global.settings_map[? "line_4"];
        global.northern_hemisphere = global.settings_map[? "line_5"];

		show_debug_message(global.music_on);
	} else {
        // If no settings file exists, set defaults
        show_debug_message("Settings file not found, using default values.");
        global.sound_on = true;
        global.music_on = true;
        global.timer_on = true;
        global.snow_on = true;
		global.northern_hemisphere = true;
		save_settings(global.sound_on, global.music_on, global.timer_on, global.snow_on, global.northern_hemisphere);
    }
}
