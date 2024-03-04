vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
vim.opt.showmode = false
require("fine-cmdline").setup({
	cmdline = {
		enable_keymaps = true,
		smart_history = true,
		prompt = ": ",
	},
	popup = {
		position = {
			row = "50%",
			col = "50%",
		},
		size = {
			width = "40%",
		},
		border = {
			style = "rounded",
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
})
