vim.cmd([[
set statusline=\[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \%<%f%m\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]\ %=\ %l\/%L\ %c%V\ %P
]])
