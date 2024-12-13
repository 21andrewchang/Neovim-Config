local neocol = require("NeoColumn")
local config = {
	fg_color = "#FFFFFF",
	bg_color = "#DC686B",
	NeoColumn = "80",
	always_on = true,
	custom_NeoColumn = {},
	excluded_ft = { "text", "markdown" },
}

neocol.setup(config)
