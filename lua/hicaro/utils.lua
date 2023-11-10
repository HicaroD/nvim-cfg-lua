local utils = {}

-- Nice variable to simply the method for adding a new keybinding
utils.keyset = vim.keymap.set

-- Handy method for getting a module and catch errors during it
function utils.prequire(m)
  local ok, err = pcall(require, m)
  if not ok then
    return nil, err
  end
  return err
end

function get_number_of_diagnostic_from_all_buffers(severity)
  local diags = vim.diagnostic.get(nil, { severity = severity })
  local counter = 0
  for _, __ in pairs(diags) do
    counter = counter + 1
  end
  return counter
end

function utils.get_diags_numbers()
  local errors = utils.get_number_of_diagnostic_from_all_buffers(vim.diagnostic.severity.ERROR)
  local warnings = utils.get_number_of_diagnostic_from_all_buffers(vim.diagnostic.severity.WARN)
  local infos = utils.get_number_of_diagnostic_from_all_buffers(vim.diagnostic.severity.INFO)
  local hints = utils.get_number_of_diagnostic_from_all_buffers(vim.diagnostic.severity.HINT)
  return { E = errors, W = warnings, I = infos, H = hints }
end

return utils
