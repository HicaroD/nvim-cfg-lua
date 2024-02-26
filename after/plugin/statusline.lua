local utils = require("hicaro.utils")

local ok = utils.prequire("lualine")
if not ok then
  print("Unable to import lualine module")
  return
end

local lualine = require("lualine")
lualine.setup({
  options = {
    component_separators = "┃",
    section_separators = "",
  },
  sections = {
    lualine_a = {
      {
        "filename",
        file_status = true,
        path = 1,
      },
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_workspace_diagnostic", "coc" },
        update_in_insert = false,
      },
    },
  },
})

-- NATIVE STATUSLINE
-- vim.cmd([[
-- let g:currentmode={
--        \ 'n'  : 'NORMAL',
--        \ 'v'  : 'VISUAL',
--        \ 'V'  : 'V-LINE',
--        \ "\<C-V>" : 'V-BLOCK',
--        \ 'i'  : 'INSERT',
--        \ 'R'  : 'R',
--        \ 'Rv' : 'V-REPLACE',
--        \ 'c'  : 'COMMAND',
--        \ 's'  : 'S',
--        \}
--
-- set statusline=
-- " Show current mode
-- set statusline+=[%{g:currentmode[mode()]}]
-- " show full file path
-- set statusline+=\ [%{expand('%:~:.')}]
-- " show modified
-- set statusline+=\ %m
-- " show read-only
-- set statusline+=\ %r
-- " show current branch
-- set statusline+=%{b:gitbranch}
-- " show coc status
-- autocmd User CocStatusChange redrawstatus
-- set statusline+=%{coc#status()}
-- " align next items to the right
-- set statusline+=%=
-- " show current line number
-- set statusline+=\ [%l:%c]
-- " show file format
-- set statusline+=\ %-7([%{&fileformat}]%)
-- " show file extension
-- set statusline+=[%{&filetype!=#''?&filetype.'\':'none\ '}]
-- " show cursor percentage
-- set statusline+=\ [%2p%%]
--
-- function! StatuslineGitBranch()
--   let b:gitbranch=""
--   if &modifiable
--     try
--       let l:dir=expand('%:p:h')
--       let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
--       if !v:shell_error
--         let b:gitbranch="[".substitute(l:gitrevparse, '\n', '', 'g')."] "
--       endif
--     catch
--     endtry
--   endif
-- endfunction
--
-- augroup GetGitBranch
--   autocmd!
--   autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
-- augroup END
-- ]])
