// Collision Event with obj_player
if (room != rm_level10 and room != rm_level10_challengemode and !global.from_selectscreen) {
	room_goto_next(); // This moves to the next room in the room order
} else if ((room == rm_level10 and !global.from_selectscreen) or (room == rm_level10_challengemode and !global.from_selectscreen)) {
	room_goto(rm_credits);
} else if (global.from_selectscreen) {
	global.from_selectscreen = false;
	room_goto(rm_leveltimersummary);
}

part_type_destroy(obj_player.trail_particle_type);
part_system_destroy(obj_player.trail_particle_system);

part_type_destroy(obj_Dash_Left_Setup.particle_type_dash_effect);
part_system_destroy(obj_Dash_Right_Setup.particle_system_dash);

part_type_destroy(obj_Dash_Right_Setup.particle_type_dash_effect);
part_system_destroy(obj_Dash_Right_Setup.particle_system_dash);

part_type_destroy(obj_player.jump_dust_particle_type);
part_system_destroy(obj_player.jump_dust_particle_system);