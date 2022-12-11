--[[---------------------------------------]]--
--      	  treesitter	             --
--              Author: HícaroD              --
--[[---------------------------------------]]--

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

nvim_treesitter.setup {
  ensure_installed = {
    'bash', 'lua', 'python', 'rust', 'dart'
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
}
