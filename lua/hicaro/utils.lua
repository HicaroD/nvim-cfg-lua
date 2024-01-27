local utils = {}

-- Nice variable to simplify the method for adding a new keybinding
utils.keyset = vim.keymap.set

-- Handy method for getting a module and catch errors during it
function utils.prequire(m)
  local ok, err = pcall(require, m)
  if not ok then
    return nil, err
  end
  return err
end

function utils.close_tree_if_open()
  local tree = require("nvim-tree.view")
  if tree.is_visible() then
    tree.close()
  end
end

return utils
