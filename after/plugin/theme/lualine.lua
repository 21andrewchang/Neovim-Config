local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
  fg       = '#bbc2cf',
  yellow   = '#FFD700',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#80D440',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#4DABF7',
  red      = '#ec5f67',
}

local conditions = {
	buffer_not_empty = function()
		-- return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		always_divide_middle = false,
		component_separators = "",
		globalstatus = true,
		section_separators = "",
		-- disabled_filetypes = { "packer", "NvimTree" },
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = {
				c = { fg = colors.fg, bg = nil },
			},
			inactive = {
				c = { fg = colors.fg, bg = nil },
			},
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	"branch",
	icon = "",
	color = { fg = colors.blue, gui = "bold" },
	padding = { left = 2, right = 1 },
})
ins_left({
	"diff",
	always_visible = true,
	symbols = { added = " ", modified = "󰝤 ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
	padding = { left = 1 },
})
-- ins_left({
-- 	-- mode component
-- 	function()
-- 		return "●"
-- 	end,
-- 	color = function()
-- 		-- auto change color according to neovims mode
-- 		local mode_color = {
-- 			n = colors.red,
-- 			i = colors.green,
-- 			v = colors.blue,
-- 			[""] = colors.blue,
-- 			V = colors.blue,
-- 			c = colors.magenta,
-- 			no = colors.red,
-- 			s = colors.orange,
-- 			S = colors.orange,
-- 			[""] = colors.orange,
-- 			ic = colors.yellow,
-- 			R = colors.violet,
-- 			Rv = colors.violet,
-- 			cv = colors.red,
-- 			ce = colors.red,
-- 			r = colors.cyan,
-- 			rm = colors.cyan,
-- 			["r?"] = colors.cyan,
-- 			["!"] = colors.red,
-- 			t = colors.red,
-- 		}
-- 		return { fg = mode_color[vim.fn.mode()] }
-- 	end,
-- 	padding = { left = 4, right = 1 },
-- })
--
--
-- ins_left({
-- 	function()
-- 		return "%="
-- 	end,
-- })

local function clock()
	local time = tostring(os.date()):sub(12, 16)
	if os.time() % 2 == 1 then
		time = time:gsub(":", " ")
	end -- make the `:` blink
	return time
end

ins_right({
	"diagnostics",
	always_visible = false,
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	diagnostics_color = {
		error = { fg = colors.red },
		warn = { fg = colors.orange },
		info = { fg = colors.blue },
		hint = { fg = colors.magenta },
	},
	padding = { right = 2 },
})

ins_right({
	function()
		return clock()
	end,
	icon = "",
	color = { fg = "NONE", gui = "bold" },
	padding = { right = 0 },
})
-- Now don't forget to initialize lualine
lualine.setup(config)
-- require("lualine").hide()
