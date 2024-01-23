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

return utils
