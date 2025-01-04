require("21andrewch.remap")
require("21andrewch.set")

-- gets rid of the background color of the top bar for both focused + unfocused
vim.cmd([[
    highlight TabLine guibg=NONE
    highlight TabLineFill guibg=NONE
    highlight TabLineSel guibg=NONE
    highlight WinBar guibg=NONE
    highlight WinBarNC guibg=NONE
    highlight Normal guibg=NONE
    highlight NormalNC guibg=NONE
]])
