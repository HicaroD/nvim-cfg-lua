--[[----------------------------------------]--
--                Lualine            	     --
--    	      Author: HícaroD    	     --
--[[---------------------------------------]]--

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local theme = 'vscode'
require('lualine').setup({
    options = {
        theme = theme,
    },
})
