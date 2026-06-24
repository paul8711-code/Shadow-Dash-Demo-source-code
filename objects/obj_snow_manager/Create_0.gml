function winter() {
	global.text_color = $096100;
	global.season_winter = true;
    if (!variable_global_exists("snow_system") || global.snow_system == undefined) {
        global.snow_system = part_system_create();
        part_system_draw_order(global.snow_system, true);

        // Create the snow particle type
        global.snow_type = part_type_create();
        part_type_shape(global.snow_type, pt_shape_disk);
        part_type_size(global.snow_type, 1, 1, 0, 0);
        part_type_scale(global.snow_type, 0.3, 0.3);
        part_type_speed(global.snow_type, 5, 5, 0, 0);
        part_type_direction(global.snow_type, 270, 270, 0, 0);
        part_type_gravity(global.snow_type, 0, 270);
        part_type_orientation(global.snow_type, 0, 0, 0, 0, false);
        part_type_colour3(global.snow_type, $FFFFFF, $FFFFFF, $FFFFFF);
        part_type_alpha3(global.snow_type, 1, 1, 1);
        part_type_blend(global.snow_type, false);
        part_type_life(global.snow_type, 200, 200);

        // Create an emitter for the snow
        global.snow_emitter = part_emitter_create(global.snow_system);
        part_emitter_region(global.snow_system, global.snow_emitter, -683, 683, -32, 32, ps_shape_rectangle, ps_distr_linear);
        part_emitter_stream(global.snow_system, global.snow_emitter, global.snow_type, 1);

        // Set initial position for the particle system
        part_system_position(global.snow_system, 684, -64);
    }
}
// Mark the manager object as persistent
persistent = true;