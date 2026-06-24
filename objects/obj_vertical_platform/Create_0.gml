// Initialize movement direction and vertical speed
moving_down = true;  // Default to moving down
moving_up = false;

vertical_speed = 0;  // No vertical speed initially

if (global.season_winter == false) {
	image_index = 0;
} else {
	image_index = 1;
}