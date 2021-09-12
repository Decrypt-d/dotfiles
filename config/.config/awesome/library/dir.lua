return {
    -- Returns a table containing all file paths in a directory
    get_dir_contents = function(dir)
	    -- Command to give list of files in directory
	    local dir_explore = 'find ' .. dir .. ' -printf "%f\\n" -maxdepth 1'
	    local lines = io.popen(dir_explore):lines() --Done synchronously because we literally can't continue without files
	    local files = {}
	    for line in lines do
	    	table.insert(files, line)
	    end
	    return files
    end,
    -- Returns a table of all the files that were one of the valid file formats
    filter_files_by_format = function(files, valid_file_formats)
    	local valid_files = {}
    	for _, file in ipairs(files) do
    		for _, format in ipairs(valid_file_formats) do
    			if string.match(file, ".+%." .. format) ~= nil then
    				table.insert(valid_files, file)
    				break --No need to check other formats
    			end
    		end
    	end
    
    	return valid_files
    end
}
