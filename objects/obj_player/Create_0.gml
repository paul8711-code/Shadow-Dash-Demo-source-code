#region VARIABLES
// Create Event of obj_player
dash_speed = 15;          // The speed of the dash (default 15)
dash_duration = 10;       // How long the dash lasts (in frames) (default 10)
dash_cooldown = 25;       // The cooldown period between dashes (in frames) (default 30)
dash_timer = 0;           // Tracks how long the dash has been active
global.can_dash = true;          // Whether the player can dash again
is_dashing = false;       // Whether the player is currently dashing
facing_right = true;      // Tracks whether the player is facing right or left
cooldown_timer = 0;       // Tracks the dash cooldown time
dash_distance = 100;       // Distance you want the player to dash (default 100)
dash_target_x = 0;        // The target x-position the player will dash towards
dash_step = 0;            // How far to move per frame while dashing
can_double_jump = false;
coyote_time = 0;
coyote_time_max = 7;
jump_cooldown = 0;
offset = 0;
frames_after_death = 0;
fade_time = 4;
fade_timer_right = fade_time;
fade_timer_left = fade_time;
jump_buffer = 60;
#endregion

#region DEATH TRIGGER
if (global.player_died) {
	sprite_index = spr_deatheffect;
	global.player_died = false;
	global.input_locked = true;
}
#endregion

#region FUNCTIONS
function OnGround(_obj, _offset)
{
	if (place_meeting(x, y + _offset, _obj)) {
		return true;
	} else return false;
}
// pls dont expand this function
function CoyoteTime()
{
	if (coyote_time > 0) coyote_time --;
	
	if (OnGround(obj_platform, 1) || OnGround(obj_destroyingplatform, 1) || OnGround(obj_horizontal_platform, 1))
	{
		coyote_time = coyote_time_max;
	}
}

function touching_ground() 
{
	if (place_meeting(x, y + 1, obj_platform) or place_meeting(x, y + 1, obj_destroyingplatform) or place_meeting(x, y + 1, obj_horizontal_platform) or place_meeting(x, y + 2, obj_vertical_platform) or place_meeting(x, y + 3, obj_vertical_platform) or place_meeting(x, y + 4, obj_vertical_platform) or place_meeting(x, y + 5, obj_vertical_platform)) {
		return true;
	} else return false;
}

#region PARTICLES
// Particle system and type
trail_particle_system = part_system_create();
trail_particle_type = part_type_create();

// Configure the particle type
part_type_shape(trail_particle_type, pt_shape_square); // Shape of the particle
part_type_size(trail_particle_type, 0.05, 0.05, 0, 0);  // Random sizes
part_type_color1(trail_particle_type, $ffff00);        // Color of the particle
part_type_alpha3(trail_particle_type, 1, 0.5, 0);     // Fade out over time
part_type_speed(trail_particle_type, 0.5, 2, 0, 0);   // Speed of movement
part_type_direction(trail_particle_type, 0, 360, 0, 0); // Random directions
part_type_gravity(trail_particle_type, 0.1, 270);     // Slight downward pull
part_type_life(trail_particle_type, 15, 30);          // Lifespan (frames)

// Jump dust particle type
jump_dust_particle_system = part_system_create();
jump_dust_particle_type = part_type_create();

// Configure the jump dust type
part_type_shape(jump_dust_particle_type, pt_shape_square); // Dusty shape
part_type_size(jump_dust_particle_type, 0.05, 0.1, 0, 0); // Random sizes
part_type_color2(jump_dust_particle_type, c_white, c_gray); // White fading to gray
part_type_alpha3(jump_dust_particle_type, 0.8, 0.5, 0); // Fade out over time
part_type_speed(jump_dust_particle_type, 1, 3, 0, 0);  // Speedy outward movement
part_type_direction(jump_dust_particle_type, 80, 100, 0, 0); // Upward angles
part_type_gravity(jump_dust_particle_type, 0.1, 270);  // Slight downward pull
part_type_life(jump_dust_particle_type, 15, 30);       // Short lifespan
#endregion

#endregion