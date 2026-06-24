function initializeKeystringKB() {
//     __ __           __                         __
//    / //_/__  __  __/ /_  ____  ____ __________/ /
//   / ,< / _ \/ / / / __ \/ __ \/ __ `/ ___/ __  / 
//  / /| /  __/ /_/ / /_/ / /_/ / /_/ / /  / /_/ /  
// /_/ |_\___/\__, /_.___/\____/\__,_/_/   \__,_/   
//           /____/                            
	return [
	    [9, "Tab"],
	    [8, "Backspace"],
	    [160, "Left Shift"],
	    [162, "Left Control"],
	    [164, "Left Alt"],
	    [165, "Right Alt"],
	    [92, "Right Windows Key"],
	    [163, "Right Control"],
	    [161, "Right Shift"],
	    [12, "Num 5"], // This is actual Num 5 but when Numlock is off, even Wiki says it "Does Nothing"
	    [13, "Enter"],
	    [16, "Shift"],
	    [17, "Control"],
	    [18, "Alt"],
	    [19, "Pause"],
	    [20, "Capslock"],
	    [32, "Space"],
	    [33, "Page up"],
	    [34, "Page down"],
	    [35, "End"],
	    [36, "Home"],
	    [27, "Escape"],
	    [37, "Left Arrow"],
	    [38, "Up Arrow"],
	    [39, "Right Arrow"],
	    [40, "Down Arrow"],
	    [45, "Insert"],
	    [46, "Delete"],
	    [48, "0"],
	    [49, "1"],
	    [50, "2"],
	    [51, "3"],
	    [52, "4"],
	    [53, "5"],
	    [54, "6"],
	    [55, "7"],
	    [56, "8"],
	    [57, "9"],
	    [65, "A"],
	    [66, "B"],
	    [67, "C"],
	    [68, "D"],
	    [69, "E"],
	    [70, "F"],
	    [71, "G"],
	    [72, "H"],
	    [73, "I"],
	    [74, "J"],
	    [75, "K"],
	    [76, "L"],
	    [77, "M"],
	    [78, "N"],
	    [79, "O"],
	    [80, "P"],
	    [81, "Q"],
	    [82, "R"],
	    [83, "S"],
	    [84, "T"],
	    [85, "U"],
	    [86, "V"],
	    [87, "W"],
	    [88, "X"],
	    [89, "Y"],
	    [90, "Z"],
	    [91, "Windows Key"],
	    [93, "Context Menu"],
	    [96, "Num 0"],
	    [97, "Num 1"],
	    [98, "Num 2"],
	    [99, "Num 3"],
	    [100, "Num 4"],
	    [101, "Num 5"],
	    [102, "Num 6"],
	    [103, "Num 7"],
	    [104, "Num 8"],
	    [105, "Num 9"],
	    [106, "Num *"],
	    [107, "Num +"],
	    [109, "Num -"],
	    [110, "Num ."],
	    [111, "Num /"],
	    [112, "F1"],
	    [113, "F2"],
	    [114, "F3"],
	    [115, "F4"], // Was left blank
	    [116, "F5"], // Was left blank
	    [117, "F6"], // Was left blank
	    [118, "F7"],
	    [119, "F8"],
	    [120, "F9"], // Was left blank
	    [121, "F10"],
	    [122, "F11"],
	    [123, "F12"], // Was left blank
	    [144, "NUMLOCK"],
	    [173, "Mute"], // Duplicate entries for Volume Down and Volume Up removed
	    [186, ";"],
	    [187, "="],
	    [188, ","],
	    [189, "-"],
	    [190, "."],
	    [191, "/"],
	    [192, "`"], // Actually `
	    [223, "`"] // Actually ` but needs to be escaped
	    // Uncomment the following if needed:
	    // [219, "["],
	    // [220, "\\"],
	    // [221, "]"],
	    // [222, "#"] // Actually # but needs to be escaped
	];
}
function initializeKeystringGP() {
//    ______                                     __
//   / ____/___ _____ ___  ___  ____  ____ _____/ /
//  / / __/ __ `/ __ `__ \/ _ \/ __ \/ __ `/ __  / 
// / /_/ / /_/ / / / / / /  __/ /_/ / /_/ / /_/ /  
// \____/\__,_/_/ /_/ /_/\___/ .___/\__,_/\__,_/   
//                          /_/                    
	return [
		// Buttons
        [gp_face1, "A Button"], // Face button 1 (e.g., A on Xbox, X on PlayStation)
        [gp_face2, "B Button"], // Face button 2 (e.g., B on Xbox, Circle on PlayStation)
        [gp_face3, "X Button"], // Face button 3 (e.g., X on Xbox, Square on PlayStation)
        [gp_face4, "Y Button"], // Face button 4 (e.g., Y on Xbox, Triangle on PlayStation)
        [gp_shoulderlb, "Left Bumper"], // Left bumper
        [gp_shoulderrb, "Right Bumper"], // Right bumper
        [gp_shoulderl, "Left Trigger"], // Left trigger
        [gp_shoulderr, "Right Trigger"], // Right trigger
        [gp_select, "Select"], // Select/Back button
        [gp_start, "Start"], // Start/Options button
        [gp_stickl, "Left Stick Press"], // Pressing the left analog stick
        [gp_stickr, "Right Stick Press"], // Pressing the right analog stick
        [gp_padu, "D-Pad Up"], // D-Pad Up
        [gp_padd, "D-Pad Down"], // D-Pad Down
        [gp_padl, "D-Pad Left"], // D-Pad Left
        [gp_padr, "D-Pad Right"], // D-Pad Right

        // Axes
        [gp_axislh, "Left Stick Horizontal"], // Horizontal axis for left stick
        [gp_axislv, "Left Stick Vertical"], // Vertical axis for left stick
        [gp_axisrh, "Right Stick Horizontal"], // Horizontal axis for right stick
        [gp_axisrv, "Right Stick Vertical"], // Vertical axis for right stick
	];
}