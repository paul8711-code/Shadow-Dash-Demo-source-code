function save_keybinds(_bind1, _bind2, _bind3, _bind4, _bind5, _bind6, _bind7, _bind8, _bind9, _bind10, _bind11, _bind12, _bind13, _bind14, _bind15, _bind16, _bind17, _bind18, _bind19, _bind20, _bind21) 
{

    // Open the file for writing
    var _file = file_text_open_write("keybinds.shadowdash");

	   // Write the text to the file
	file_text_write_string(_file, _bind1);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind2);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind3);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind4);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind5);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind6);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind7);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind8);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind9);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind10);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind11);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind12);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind13);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind14);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind15);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind16);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind17);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind18);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind19);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind20);
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, _bind21);
		
	file_text_close(_file);

}

function load_keybinds() {
	filename = "keybinds.shadowdash";

        // Check if the file exists
	if (file_exists(filename)) {
		var _file = file_text_open_read(filename);
        var _index = 1;
        global.bind_map = ds_map_create();

        // Read the file line by line and store them in the map
        while (!file_text_eof(_file)) {
			var line = file_text_read_string(_file);
            file_text_readln(_file); // Move to the next line
            global.bind_map[? "line_" + string(_index)] = line;
            _index++;
        }

        file_text_close(_file);
		
		if (global.bind_map[? "line_21"] == "stickl") {
			global.gp_vertical_stick = gp_axislv;
			global.gp_horizontal_stick = gp_axislh;
			global.stickl = true;
		} else if (global.bind_map[? "line_21"] == "stickr") {
			global.gp_vertical_stick = gp_axisrv;
			global.gp_horizontal_stick = gp_axisrh;
			global.stickl = false;
		}
		
		with (obj_input) {
			keybinds = [
				// keyboard
				new BindKB("Right", global.bind_map[? "line_1"]),
				new BindKB("Left", global.bind_map[? "line_2"]),
				new BindKB("Up", global.bind_map[? "line_3"]),
				new BindKB("Down", global.bind_map[? "line_4"]),
				new BindKB("Confirm", global.bind_map[? "line_5"]),
				new BindKB("Dash", global.bind_map[? "line_6"]),
				new BindKB("Jump", global.bind_map[? "line_7"]),
				new BindKB("Pause", global.bind_map[? "line_8"]),
				new BindKB("Retry", global.bind_map[? "line_9"]),
				new BindKB("Restart", global.bind_map[? "line_10"]),
				// controller
				new BindGPB("RightGPB", global.bind_map[? "line_11"]),
				new BindGPB("LeftGPB", global.bind_map[? "line_12"]),
				new BindGPB("UpGPB", global.bind_map[? "line_13"]),
				new BindGPB("DownGPB", global.bind_map[? "line_14"]),
				new BindGPB("ConfirmGP", global.bind_map[? "line_15"]),
				new BindGPB("DashGP", global.bind_map[? "line_16"]),
				new BindGPB("JumpGP", global.bind_map[? "line_17"]),
				new BindGPB("PauseGP", global.bind_map[? "line_18"]),
				new BindGPB("RetryGP", global.bind_map[? "line_19"]),
				new BindGPB("RestartGP", global.bind_map[? "line_20"]),
				new BindGPA("RightGP", global.gp_horizontal_stick, 0.3),
				new BindGPA("LeftGP", global.gp_horizontal_stick, -0.3),
				new BindGPA("UpGP", global.gp_vertical_stick, -0.3),
				new BindGPA("DownGP", global.gp_vertical_stick, 0.3),
			];
		}
	} else {
        // If no settings file exists, set defaults
        show_debug_message("Keybinds file not found, using default values.");
		global.bind_map = ds_map_create();
		initializeKeybinds();
		global.gp_vertical_stick = gp_axislv;
		global.gp_horizontal_stick = gp_axislh;
		global.stickl = true;
		getAllBindNamesAndKeysKB();
		getAllBindNamesAndKeysGP();
		getAllBindNamesAndKeysGPA();
		save_default_keybinds();

	}
}
function save_default_keybinds() {
    // Open the file for writing
    var _file = file_text_open_write("keybinds.shadowdash");

	   // Write the text to the file
	file_text_write_string(_file, string(vk_right));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(vk_left));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(vk_up));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(vk_down));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(vk_enter));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(vk_space));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(vk_up));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(vk_escape));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(ord("R")));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(ord("E")));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_padr));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_padl));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_padu));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_padd));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_start));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_shoulderrb));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_face1));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_select));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_face4));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, string(gp_face3));
	file_text_write_string(_file, "\n"); // Optionally add a newline
	file_text_write_string(_file, "stickl");
		
	file_text_close(_file);
}