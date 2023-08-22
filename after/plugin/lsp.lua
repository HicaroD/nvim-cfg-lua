local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

keyset("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
  group = "CocGroup",
  command = "silent call CocActionAsync('highlight')",
  desc = "Highlight symbol under cursor on CursorHold"
})

vim.api.nvim_create_autocmd("FileType", {
  group = "CocGroup",
  pattern = "typescript,json",
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
  group = "CocGroup",
  pattern = "CocJumpPlaceholder",
  command = "call CocActionAsync('showSignatureHelp')",
  desc = "Update signature help on jump placeholder"
})

-- `:OR` command for organizing imports of the current buffer
vim.api.nvim_create_user_command("OI", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Code formatting
require("formatter").setup {
  logging = false,
  filetype = {
    dart = {
      require("formatter.filetypes.dart").dartformat,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    c = {
      require("formatter.filetypes.c").clangformat,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    go = {
      require("formatter.filetypes.go").gofmt,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },
    markdown = {
      require("formatter.filetypes.markdown").prettier,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    java = {
      require("formatter.filetypes.java").clangformat,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]], false)
