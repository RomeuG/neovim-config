-- LuaLine object
local LuaLine = require("lualine")

-- foreground colors
local colors = {
	black = "#1d2021",
	white = "#fbf1c7",
	red = "#fb4934",
	green = "#b8bb26",
	blue = "#83a598",
	yellow = "#fabd2f",
	aqua = "#8ec07c",
	purple = "#d3869b",
	gray = "#a89984",
	darkgray = "#3c3836",
	lightgray = "#504945",
	inactivegray = "#7c6f64",
}

LuaLine.setup({
	options = {
		theme = "catppuccin",
		always_divide_middle = true,
		icons_enabled = false,
		disabled_filetypes = { "NvimTree" },
		globalstatus = true,
	},
	sections = {
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.yellow },
					info = { fg = colors.green },
					hint = { fg = colors.blue },
				},
				colored = true,
			},
		},
		lualine_c = {
			"filename",
			{
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				color = { fg = "#ffffff", gui = "bold" },
			},
		},
		lualine_x = { "filetype" },
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				mode = 0,
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})
