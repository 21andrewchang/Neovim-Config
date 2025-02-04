local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	-- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>Rn", "<cmd>Lspsaga rename ++project<CR>") -- rename multiple files
	keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	-- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	-- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "<leader>D", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>DD", "<cmd>Lspsaga hover_doc ++keep<CR>", opts) -- keep documentation up
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = "", Warn = "", Hint = "", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local servers = {
	"solargraph",
	"pyright",
	"arduino_language_server",
	"jdtls",
	"tailwindcss",
	"cssls",
	"ts_ls",
	"svelte",
	"prismals",
	"clangd",
	"html",
}

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		-- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end
