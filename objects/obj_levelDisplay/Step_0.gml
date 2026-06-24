// Create arrays for levels and challenge rooms
var _level_rooms = [rm_level1, rm_level2, rm_level3, rm_level4, rm_level5, rm_level6, rm_level7, rm_level8, rm_level9, rm_level10];
var _challenge_rooms = [rm_level1_challengemode, rm_level2_challengemode, rm_level3_challengemode, rm_level4_challengemode, rm_level5_challengemode, rm_level6_challengemode, rm_level7_challengemode, rm_level8_challengemode, rm_level9_challengemode, rm_level10_challengemode];

for (var _i = 0; _i < array_length(_level_rooms); _i++) {
    if (room == _level_rooms[_i] || room == _challenge_rooms[_i]) {
        level = _i + 1;  // Set level based on index
        break;  // Exit the loop once the level is found
    }
}
