local neocol = require("NeoColumn")
local config = {
	fg_color = "#FF7B72",
	bg_color = "#182024",
	NeoColumn = "80",
	-- always_on = true,
	custom_NeoColumn = {},
	excluded_ft = { "text", "markdown" },
}
neocol.setup(config)
