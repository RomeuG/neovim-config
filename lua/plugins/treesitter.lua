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
		"query",
		"smali",
		"markdown",
		"markdown_inline",
		"vimdoc",
	},
	ignore_install = { "latex" },
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
		disable = function(_, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	autopairs = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<M-]>",
			node_incremental = "<M-]>",
			node_decremental = "<M-[>",
		},
	},
	indent = {
		enable = true,
		disable = {},
	},
	playground = {
		enable = false,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})
