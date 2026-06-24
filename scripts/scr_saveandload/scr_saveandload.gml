function save(_time) 
{
    // Check if the file exists
    if (file_exists("times.shadowdash")) 
    {
        // Open the file for reading
        var _readfile = file_text_open_read("times.shadowdash");
        var _timefromfile = file_text_read_real(_readfile);
        file_text_close(_readfile);  // Close the read file after reading

        show_debug_message("File exists, read time: " + string(_timefromfile));

        // Open the file for writing
        var _file = file_text_open_write("times.shadowdash");

        // Compare times and save the smaller one
        if (_timefromfile >= _time) 
        {
            file_text_write_real(_file, _time);
            show_debug_message("Saved new _time: " + string(_time));
        } 
        else 
        {
            file_text_write_real(_file, _timefromfile);
            show_debug_message("Kept _timefromfile: " + string(_timefromfile));
        }
        
        file_text_close(_file);  // Always close the file after writing
    }
    else 
    {
        // If the file does not exist, create and write _time
        var _file = file_text_open_write("times.shadowdash");
        file_text_write_real(_file, _time);
        file_text_close(_file);
        
        show_debug_message("Created file and saved _time: " + string(_time));
    }
}

function load() 
{
    if (file_exists("times.shadowdash")) 
    {
        var _file = file_text_open_read("times.shadowdash");
        global.times = file_text_read_real(_file);
        file_text_close(_file);
    }
	else if (file_exists("times.pfgt"))
	{
		var _file = file_text_open_write("times.shadowdash");
		var _fileread = file_text_open_read("times.pfgt");
		var _timesold = file_text_read_real(_fileread);
		file_text_write_real(_file, _timesold);
		file_text_close(_fileread);
		file_delete("times.pfgt");
		file_text_close(_file);
		load();
	}
}
