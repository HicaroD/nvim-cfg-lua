local core_modules = {
	-- Core configuration --
	"core/plugins",
	"core/keymaps",
	"core/options",

	-- Plugins configuration --
	"config/colorscheme",
	"config/lualine",
	"config/nvimtree",
	"config/treesitter",
	"config/completion",
	"config/gitsigns",
	"config/commentary",
}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      return
    end
end
