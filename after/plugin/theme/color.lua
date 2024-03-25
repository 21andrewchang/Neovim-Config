-- Function to set up transparency
vim.cmd("set termguicolors")
vim.api.nvim_set_option("background", "dark")
vim.cmd("colorscheme onehalf-lush-dark")
vim.cmd("highlight VertSplit  ctermbg=none  guibg=none")
vim.cmd("highlight Normal ctermbg=none guibg=none")

vim.cmd("hi! LineNr guibg=none ctermbg=none")
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
