-- Treesitter object
local TreeSitter = require("nvim-treesitter.configs")

-- treesitter
TreeSitter.setup({
	ensure_installed = {
		"rust",
		"c",
		"cpp",
		"lua",
		"python",
		"dart",
		"css",
		"html",
		"javascript",
		"typescript",
		"tsx",
		"java",
		"kotlin",
		"zig",
		"bash",
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<M-]>",
			node_incremental = "<M-]>",
			node_decremental = "<M-[>",
		},
	},
})
