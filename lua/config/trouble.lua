local status_ok, nvim_treesitter = pcall(require, 'trouble')
if not status_ok then
    return
end

require("trouble").setup {
	height=7,
}
