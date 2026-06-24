#region GRAVITY
// Gravity
if (!place_meeting(x, y + 1, obj_platform) and !place_meeting(x, y + 1, obj_destroyingplatform) and !is_dashing and !place_meeting(x, y + 1, obj_vertical_platform) and !place_meeting(x, y + 1, obj_horizontal_platform)) {
    vspeed += 0.5; // Adjust gravity strength here
} else if (is_dashing) {
	vspeed = 0;
} else {
    vspeed = 0; // Stop falling when on the ground
}
#endregion

#region NORMAL MOVEMENT (no dash)
// Normal movement logic (without dashing)
if (!is_dashing && !global.input_locked) {
    if (global.Right or global.RightGP or global.RightGPB) {
        x += 4; // Move right
        facing_right = true;
	}
    else if (global.Left or global.LeftGP or global.LeftGPB) {
        x -= 4; // Move left
        facing_right = false;
    }
}
#endregion

#region DASHING
// Dash logic
if (global.can_dash && !is_dashing && !global.input_locked) {
    if (global.Dash or global.DashGP) {  // Dash when Shift is pressed
        // Start the dash
        is_dashing = true;
		if (global.sound_on) {
			audio_play_sound(snd_dash_sound, 1, false);
		}
        dash_timer = dash_duration;  // Set the dash duration
        global.can_dash = false;            // Disable dashing until cooldown

        // Set the target position based on the direction (right or left)
        if (facing_right) {
            dash_target_x = x + dash_distance;	// Target position to the right
			image_index = 1;
			alarm[0] = 20
		} else {
            dash_target_x = x - dash_distance;  // Target position to the left
			image_index = 2;
			alarm[0] = 20
		}

        // Calculate how much to move per frame (distance / duration)
        dash_step = (dash_target_x - x) / dash_duration;
    }
}

// Gradually move towards the dash target while dashing
if (is_dashing) {
    x += dash_step;  // Move towards the target
    dash_timer -= 1;
	if (facing_right) {
		fade_timer_right--;
			
		if (fade_timer_right <= 0) {
			fade_timer_right = fade_time;
	
			part_particles_create(obj_Dash_Right_Setup.particle_system_dash, x, y, obj_Dash_Right_Setup.particle_type_dash_effect, 1);
		}
	} else 	if (!facing_right) {
		fade_timer_left--;
			
		if (fade_timer_left <= 0) {
			fade_timer_left = fade_time;
	
			part_particles_create(obj_Dash_Left_Setup.particle_system_dash, x, y, obj_Dash_Left_Setup.particle_type_dash_effect, 1);
		}
	}

    // End the dash when the timer runs out or the target is reached
    if (dash_timer <= 0 || abs(x - dash_target_x) <= abs(dash_step)) {
        x = dash_target_x;  // Ensure the player ends exactly at the target position
        is_dashing = false; // End the dash
        cooldown_timer = dash_cooldown; // Start cooldown
    }
}

if (is_dashing) { // Replace with your dashing condition
    var _x_offset = random_range(-5, 5); // Random X offset
    var _y_offset = random_range(2, 6);  // Random Y offset behind the player
    part_particles_create(trail_particle_system, x - _x_offset, y + _y_offset, trail_particle_type, 1);
}


// Cooldown timer
if (cooldown_timer > 0) {
    cooldown_timer -= 1;
    if (cooldown_timer <= 0) {
        global.can_dash = true;  // Enable dashing again after cooldown
    }
}
#endregion

#region JUMPING
// Jumping
if ((global.Jump or global.JumpGP) and coyote_time > 0 and jump_cooldown == 0 and !global.input_locked) {
    // Regular jump (during coyote time)
    for (var i = 0; i < 10; i++) {
        var _x_offset = random_range(-10, 10); // Horizontal spread
        var _y_offset = random_range(5, 15);  // Vertical spread below the player
        part_particles_create(jump_dust_particle_system, x + _x_offset, y + sprite_height / 2 + _y_offset, jump_dust_particle_type, 1);
    } 
	coyote_time = 0;  // Consume coyote time
    vspeed = -8;
    image_index = 3;
    alarm[0] = 20;
	jump_cooldown = 7;
    can_double_jump = true;  // Allow double jump after coyote jump
} else if ((global.Jump or global.JumpGP) and can_double_jump) {
    // Double jump after leaving the ground
    vspeed = -8;
    image_index = 3;
    alarm[0] = 20;
    can_double_jump = false;  // Disable further double jumps
}
if (jump_cooldown > 0) {
    jump_cooldown--;  // Decrease cooldown by 1 each frame
}

if (touching_ground() && (global.Jumpheld or global.JumpheldGP) and coyote_time > 0 and jump_cooldown == 0 and !global.input_locked) {
	for (var i = 0; i < 10; i++) {
        var _x_offset = random_range(-10, 10); // Horizontal spread
        var _y_offset = random_range(5, 15);  // Vertical spread below the player
        part_particles_create(jump_dust_particle_system, x + _x_offset, y + sprite_height / 2 + _y_offset, jump_dust_particle_type, 1);
    } 
	// Regular jump (during coyote time)
    coyote_time = 0;  // Consume coyote time
    vspeed = -8;
    image_index = 3;
    alarm[0] = 20;
	jump_cooldown = 7;
    can_double_jump = true;  // Allow double jump after coyote jump
}
#endregion

#region TRAMPOLINE FUNCTIONALITY
// trampoline
if (place_meeting(x, y + 1, obj_trampoline)) {
	for (var i = 0; i < 10; i++) {
        var _x_offset = random_range(-10, 10); // Horizontal spread
        var _y_offset = random_range(5, 15);  // Vertical spread below the player
        part_particles_create(jump_dust_particle_system, x + _x_offset, y + sprite_height / 2 + _y_offset, jump_dust_particle_type, 1);
    } 
	vspeed = -12;
	image_index = 3;
	alarm[0] = 20
}
#endregion

#region DYING WHEN FALLING OUT OF BOUNDS
// Check if the player is below the room's bottom
if (y > room_height) {
    // Restart the current room (level)
    room_restart();
	global.total_attempts += 1
	show_debug_message(global.total_attempts)
	if (global.sound_on) {
		audio_play_sound(snd_player_death, 1, false);
		show_debug_message("played death sound")
	}
	global.player_died = true;
}
#endregion

#region SPECIAL PLATFORMS
// Debugging to ensure vspeed and place_meeting are correct
if (place_meeting(x, y + 1, obj_destroyingplatform) && vspeed >= 0) {
    with (obj_destroyingplatform) {
		if (!alarm_triggered) {	
			alarm_triggered = true;
			alarm[0] = 20;
		}
    }
}
if (place_meeting(x, y + 1, obj_horizontal_platform)) {
    var _platform = instance_place(x, y + 1, obj_horizontal_platform);
    if (_platform != noone) {
        x += _platform.speed_platform;  // Adjust position based on platform speed
    }
}
// this is so bad code pls dont change... i mean at least it works
// i spent HOURS on this
var _platform = noone; // Initialize the platform variable

// Loop through a range of distances
for (var offset = 2; offset <= 5; offset++) { // Check 2 to 5 pixels below the player
    _platform = instance_place(x, y + offset, obj_vertical_platform); // Check for platform at offset
}
if (_platform != noone) {
    // Platform detected, apply logic
    coyote_time = coyote_time_max;
    // Align player with platform
    y = _platform.y - 28;  // Adjust this based on your player size

    // Match vertical speed
    if (vspeed >= 0) {
        vspeed = _platform.vertical_speed;
    }
}
#endregion

#region RETRY AND RESTART
// Restart level keybind
if ((global.Retry or global.RetryGP) && !global.input_locked) {
	room_restart()
	global.total_attempts += 1
	if (global.sound_on) {
		audio_play_sound(snd_player_death, 1, false);
	}
	global.player_died = true;
}
if ((global.Restart or global.RestartGP) && !global.from_selectscreen && !global.input_locked) {
	if (global.mode == 1) {
		room_goto(rm_level1);
		instance_activate_all();
		obj_timer.timer = 0;
		global.total_attempts = 1;
	} else if (global.mode == 2) {
		room_goto(rm_level1_challengemode);
		instance_activate_all();
		obj_timer.timer = 0;
		global.total_attempts = 1;
	}
} else if ((global.Restart or global.RestartGP) && global.from_selectscreen && !global.input_locked) {
	instance_activate_all();
	obj_timer.timer = 0;
	global.total_attempts = 1;
	room_restart();
}
#endregion

#region COYOTE TIME
// Coyote timings :)
CoyoteTime();
#endregion

#region DEATH EFFECT
if (image_index == 8 && sprite_index == spr_deatheffect) {
	sprite_index = spr_player;
	global.input_locked = false;
}
#endregion
