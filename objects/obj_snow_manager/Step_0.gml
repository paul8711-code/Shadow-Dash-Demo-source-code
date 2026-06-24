// Get the current month from the datetime
var _month = date_get_month(date_current_datetime());

if (global.northern_hemisphere) {
	if ((_month == 12 || _month == 1 || _month == 2) && global.snow_on) { // December, January, Ferbuary ("official" winter months)
		winter();
	} else {
		global.text_color = c_white;
		global.season_winter = false;
	    if (variable_global_exists("snow_system") && global.snow_system != undefined) {
	        part_system_destroy(global.snow_system);
	        global.snow_system = undefined;
		}
	}
} else if (!global.northern_hemisphere) {
	if ((_month == 6 || _month == 7 || _month == 8) && global.snow_on) { // June, july, august ("official" winter months) (imagine living in australia)
		winter();
	} else {
		global.text_color = c_white;
		global.season_winter = false;
	    if (variable_global_exists("snow_system") && global.snow_system != undefined) {
	        part_system_destroy(global.snow_system);
	        global.snow_system = undefined;
		}
	}
}

