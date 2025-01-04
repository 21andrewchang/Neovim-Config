-- Function to set up transparency
vim.cmd("set termguicolors")
vim.api.nvim_set_option("background", "dark")
vim.cmd("colorscheme github_dark")
vim.cmd("highlight WinSeparator guifg=#262626")
vim.cmd("highlight Normal ctermbg=none guibg=none")

vim.cmd("hi! LineNr guibg=none ctermbg=none")
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "none" })
vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])

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
