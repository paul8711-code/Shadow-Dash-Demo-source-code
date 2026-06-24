// Platform vertical movement
if (moving_up) {
    y -= speed_platform;
    vertical_speed = -speed_platform; // Platform is moving up
    if (y <= min_y) {
        moving_up = false;
        moving_down = false;
		alarm[0] = 1;
    }
} else if (moving_down) {
    y += speed_platform;
    vertical_speed = speed_platform; // Platform is moving down
    if (y >= max_y) {
        moving_down = false;
		moving_up = false;
		alarm[1] = 1;
    }
}
