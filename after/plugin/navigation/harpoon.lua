local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
	ui.nav_file(4)
end)
--vim.keymap.set("n", "<F5>", function()
--	ui.nav_file(5)
--end)
--vim.keymap.set("n", "<F1>", function()
--	ui.nav_file(6)
--end)
--vim.keymap.set("n", "<F7>", function()
--	ui.nav_file(7)
--end)
--vim.keymap.set("n", "<F8>", function()
--	ui.nav_file(8)
--end)
--vim.keymap.set("n", "<F9>", function()
--	ui.nav_file(9)
--end)
--vim.keymap.set("n", "<F10>", function()
--	ui.nav_file(10)
--end)

require("harpoon").setup({
	global_settings = {
		-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
		save_on_toggle = false,
		-- saves the harpoon file upon every change. disabling is unrecommended.
		save_on_change = true,
		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = false,
		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
		tmux_autoclose_windows = false,
		-- filetypes that you want to prevent from adding to the harpoon list menu.
		excluded_filetypes = { "harpoon" },
		-- set marks specific to each git branch inside git repository
		mark_branch = false,
	},
})
