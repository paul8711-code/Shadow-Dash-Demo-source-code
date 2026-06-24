// Clean up the particle system when the object is destroyed
if (global.snow_system != noone) {
    part_type_destroy(global.snow_type);
    part_emitter_destroy(global.snow_system, global.snow_emitter);
    part_system_destroy(global.snow_system);
}
