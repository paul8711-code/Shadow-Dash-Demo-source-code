function inputChangeKeybind(_name, _forcontroller) {
	if (!_forcontroller) {
		var _keybind = inputChangeKeyboard(_name);
		return(_keybind);
	}
	if (_forcontroller) {
		var _keybind = inputChangeGamepad(_name);
		return(_keybind);
	}
}

function inputChangeKeyboard(_name) {
    // keyboard check, ignore the key defined in global.confirm
    if (keyboard_check_pressed(vk_anykey)) {
        show_debug_message("Key Pressed: " + string(keyboard_lastkey));
        show_debug_message("Global Confirm Key: " + string(global.Confirm));
        
        // Check if the key pressed is not the key stored in global.confirm and it's a valid key
        if (keyboard_lastkey != global.Confirm && keyboard_lastkey != vk_nokey) {
            var _struct = new BindKB(_name, keyboard_lastkey);
			global.key = string(keyboard_lastkey);
            show_debug_message("Binding Key: " + string(keyboard_lastkey));
            return _struct;
        } else {
            show_debug_message("Ignored Key: " + string(keyboard_lastkey));
        }
    }
    
    return -1;
}

function inputChangeGamepad(_name) {
	// gamepad buttons
	if (gamepad_button_check_pressed(global.gamepad, gp_padr)) {
		global.keyGP = gp_padr;
		return (new BindGPB(_name, gp_padr));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_padl)) {
		global.keyGP = gp_padl;
		return (new BindGPB(_name, gp_padl));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_padu)) {
		global.keyGP = gp_padu;
		return (new BindGPB(_name, gp_padu));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_padd)) {
		global.keyGP = gp_padd;
		return (new BindGPB(_name, gp_padd));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_face1)) {
		global.keyGP = gp_face1;
		return (new BindGPB(_name, gp_face1));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_face2)) {
		global.keyGP = gp_face2;
		return (new BindGPB(_name, gp_face2));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_face3)) {
		global.keyGP = gp_face3;
		return (new BindGPB(_name, gp_face3));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_face4)) {
		global.keyGP = gp_face4;
		return (new BindGPB(_name, gp_face4));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_start)) {
		global.keyGP = gp_start;
		return (new BindGPB(_name, gp_start));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_select)) {
		global.keyGP = gp_select;
		return (new BindGPB(_name, gp_select));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_shoulderl)) {
		global.keyGP = gp_shoulderl;
		return (new BindGPB(_name, gp_shoulderl));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_shoulderr)) {
		global.keyGP = gp_shoulderr;
		return (new BindGPB(_name, gp_shoulderr));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_shoulderlb)) {
		global.keyGP = gp_shoulderlb;
		return (new BindGPB(_name, gp_shoulderlb));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_shoulderrb)) {
		global.keyGP = gp_shoulderrb;
		return (new BindGPB(_name, gp_shoulderrb));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_stickl)) {
		global.keyGP = gp_stickl;
		return (new BindGPB(_name, gp_stickl));
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_stickr)) {
		global.keyGP = gp_stickr;
		return (new BindGPB(_name, gp_stickr));
	}
	// gamepad axis (not required)
	//if (gamepad_axis_value(global.gamepad, gp_axislh) > 0.8) {return (new BindGPA(_name, gp_axislh, 0.5))}
	//if (gamepad_axis_value(global.gamepad, gp_axislh) < -0.8) {return (new BindGPA(_name, gp_axislh, -0.5))}
	//if (gamepad_axis_value(global.gamepad, gp_axislv) > 0.8) {return (new BindGPA(_name, gp_axislv, 0.5))}
	//if (gamepad_axis_value(global.gamepad, gp_axislv) < -0.8) {return (new BindGPA(_name, gp_axislv, -0.5))}
	//if (gamepad_axis_value(global.gamepad, gp_axisrh) > 0.8) {return (new BindGPA(_name, gp_axisrh, 0.5))}
	//if (gamepad_axis_value(global.gamepad, gp_axisrh) < -0.8) {return (new BindGPA(_name, gp_axisrh, -0.5))}
	//if (gamepad_axis_value(global.gamepad, gp_axisrv) > 0.8) {return (new BindGPA(_name, gp_axisrv, 0.5))}
	//if (gamepad_axis_value(global.gamepad, gp_axisrv) < -0.8) {return (new BindGPA(_name, gp_axisrv, -0.5))}
	
	return(-1);
}