particle_system_dash = part_system_create();

particle_type_dash_effect = part_type_create();

part_type_sprite(particle_type_dash_effect, spr_Dash_Right, 0, 0, 0);
part_type_size(particle_type_dash_effect, 1, 1, 0, 0);

part_type_life(particle_type_dash_effect, 30, 30);
part_type_alpha3(particle_type_dash_effect, 0.7, 0.5, .1);

part_type_color1(particle_type_dash_effect, $ffff00);

persistent = true;

