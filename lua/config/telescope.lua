require('telescope').setup{  
	defaults = {
		file_ignore_patterns = {
			-- NodeJS folders
			"node_modules",

			-- Flutter project folders
			"linux",
			"macos",
			"windows",
			"android",
			"web",
			"ios",

			-- Git files
			".git",
			".gitignore",
		}
	} 
}
