function BindKB(_name, _key) constructor {
	bindName = _name;
	key = _key
	
	pressed = false;
	held = false;
	released = false;
	
	pressedFn = function() {
		pressed = keyboard_check_pressed(key);
	}
	
	heldFn = function() {
		held = keyboard_check(key);
	}
	
	releasedFn = function() {
		released = keyboard_check_released(key);
	}
}
	
function BindGPB(_name, _key) constructor {
	bindName = _name;
	key = _key
	
	pressed = false;
	held = false;
	released = false;
	
	pressedFn = function() {
		pressed = gamepad_button_check_pressed(global.gamepad, key);
	}
	
	heldFn = function() {
		held = gamepad_button_check(global.gamepad, key);
	}
	
	releasedFn = function() {
		released = gamepad_button_check_released(global.gamepad, key);
	}
}	
	
function BindGPA(_name, _axis, _value) constructor {
	bindName = _name;
	axis = _axis;
	value = _value;
	
	pressed = false;
	held = false;
	last_held = false;
	released = false
	
	pressedFn = function() {
		if (lastHeld == false and held == true) {
			pressed = true;
		} else {
			pressed = false;
		}
	}
	
	heldFn = function() {
		lastHeld = held;
		if (value < 0) {
			held = (gamepad_axis_value(global.gamepad, axis) < value);
		} else if (value > 0) {
			held = (gamepad_axis_value(global.gamepad, axis) > value);
		} else {
			held = false;
		}
	}
	
	releasedFn = function() {
		if (lastHeld == true and held == false) {
			released = true;
		} else {
			released = false;
		}
	}
}
	
function inputUpdate() {
	with (obj_input) {
		for (var _i = 0; _i < array_length(keybinds); _i++) {
			keybinds[_i].heldFn();
			keybinds[_i].pressedFn();
			keybinds[_i].releasedFn();
		}
	}
}
	
function inputCheckPressed(_name) {
	with (obj_input) {
		for (var _i = 0; _i < array_length(keybinds); _i++) {
			if (keybinds[_i].bindName == _name) {
				return(keybinds[_i].pressed);
			}
		}
	}
}

function inputCheckHeld(_name) {
	with (obj_input) {
		for (var _i = 0; _i < array_length(keybinds); _i++) {
			if (keybinds[_i].bindName == _name) {
				return(keybinds[_i].held);
			}
		}
	}
}

function inputCheckReleased(_name) {
	with (obj_input) {
		for (var _i = 0; _i < array_length(keybinds); _i++) {
			if (keybinds[_i].bindName == _name) {
				return(keybinds[_i].released);
			}
		}
	}
}
	
function inputReplace(_name, _newKeybind) {
	for (var _i = 0; _i < array_length(obj_input.keybinds); _i++) {
		if (obj_input.keybinds[_i].bindName == _name) {
			obj_input.keybinds[_i] = _newKeybind;
			return;
		}
	}
}
	
function getKeyNameFromCode(input_code) {
    var key_array = initializeKeystringKB();
    var gamepad_array = initializeKeystringGP();

    // Search in keyboard mappings
    for (var i = 0; i < array_length(key_array); i++) {
        if (key_array[i][0] == input_code) {
            return key_array[i][1]; // Return the keyboard key name
        }
    }

    // Search in gamepad mappings
    for (var j = 0; j < array_length(gamepad_array); j++) {
        if (gamepad_array[j][0] == input_code) {
            return gamepad_array[j][1]; // Return the gamepad input name
        }
    }

    return "Unknown Input"; // Default if no match
}

// Function to get the key code associated with a keybind name
function getKeycodeFromBindName(bind_name) {
    with (obj_input) {
        for (var i = 0; i <= 9; i++) {
            var bind = keybinds[i];
            if (bind.bindName == bind_name) {
                stringkey = getKeyNameFromCode(bind.key);
				return stringkey;
            }
        }
    }
    return undefined; // Return undefined if not found
}
	
// Function to loop through all keybinds and get their names
function getAllBindNamesAndKeysKB() {
    with (obj_input) {
        // Loop through all keybinds
        for (var i = 0; i <= 9; i++) {
            var bind = keybinds[i];
            var key_code = bind.key; // Get the key code associated with the bind

            // Convert the key code to a readable key name
            var key_name = getKeyNameFromCode(key_code);
			var j = i + 1
			
            global.bind_map[? "line_" + string(j)] = key_code;
            
            // Show the bind name and the key name in the debug message
			assignglobalKB(i, key_name);
        }
    }
}
	
function assignglobalKB(num, key_name) {
	if (num == 0) global.drawRight = key_name;
	if (num == 1) global.drawLeft = key_name;
	if (num == 2) global.drawUp = key_name;
	if (num == 3) global.drawDown = key_name;
	if (num == 4) global.drawConfirm = key_name;
	if (num == 5) global.drawDash = key_name;
	if (num == 6) global.drawJump = key_name;
	if (num == 7) global.drawPause = key_name;
	if (num == 8) global.drawRetry = key_name;
	if (num == 9) global.drawRestart = key_name;
	
}
	
function getAllBindNamesAndKeysGP() {
	load_keybinds();
	with (obj_input) {
	    for (var i = 10; i <= 19; i++) {
			var bind = keybinds[i];
		    var key_code = bind.key; // Get the key code associated with the bind
			
			var key_name = getKeyNameFromCode(key_code); // Handle regular key names

		    var j = i + 1; // For mapping purposes (1-indexed)

		    // Store in bind_map for later use
		    global.bind_map[? "line_" + string(j)] = key_code;

		    // Show the bind name and the key name in the global variables
		    assignglobalGP(i, key_name);
		}
    }
}

function assignglobalGP(num, key_name) {
    // logic for assigning key names to global variables
    if (num == 10) global.drawRightGPB = key_name;
    if (num == 11) global.drawLeftGPB = key_name;
    if (num == 12) global.drawUpGPB = key_name;
    if (num == 13) global.drawDownGPB = key_name;
    if (num == 14) global.drawConfirmGP = key_name;
    if (num == 15) global.drawDashGP = key_name;
    if (num == 16) global.drawJumpGP = key_name;
    if (num == 17) global.drawPauseGP = key_name;
    if (num == 18) global.drawRetryGP = key_name;
    if (num == 19) global.drawRestartGP = key_name;
}

function getKeyNameFromCodeGPA(input_code) {
	with (obj_input) {
	    var gamepad_array = initializeKeystringGP();
	    // Search in gamepad mappings
	    for (var j = 20; j < array_length(gamepad_array); j++) {
	        if (gamepad_array[j][0] == input_code) {
				assignglobalGPA(j, gamepad_array[j][1]);
	            return gamepad_array[j][1]; // Return the gamepad input name
	        }
	    }
	}

    return "Unknown Input"; // Default if no match
}

function assignglobalGPA(num, key_name) {
	if (num == 20) global.drawlhGPA = key_name;
	if (num == 21) global.drawlvGPA = key_name;
	if (num == 22) global.drawrhGPA = key_name;
	if (num == 23) global.drawrvGPA = key_name;
}

function getAllBindNamesAndKeysGPA() {
	getKeyNameFromCodeGPA(gp_axislh);
	getKeyNameFromCodeGPA(gp_axislv);
	getKeyNameFromCodeGPA(gp_axisrh);
	getKeyNameFromCodeGPA(gp_axisrv);
}