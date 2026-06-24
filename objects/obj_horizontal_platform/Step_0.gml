if (x >= max_x) {
    moving_left = true;
    moving_right = false;
} else if (x <= min_x) {
    moving_right = true;
    moving_left = false;
}

if (moving_left) {
    x -= platform_speed;
    speed_platform = -platform_speed;
} else if (moving_right) {
    x += platform_speed;
    speed_platform = platform_speed;
}
