-- NvimTree object
local NvimTree = require("nvim-tree")

NvimTree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	ignore_ft_on_setup = {},
	update_to_buf_dir = {
		enable = false,
		auto_open = false,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
})

vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }

vim.g.nvim_tree_icons = {
	git = {
		unstaged = "○",
		staged = "●",
		unmerged = "⊜",
		renamed = "⊙",
		untracked = "⊕",
		deleted = "⊗",
		ignored = "⊘",
	},
	folder = {
		arrow_open = "▾",
		arrow_closed = "▸",
		default = "▸",
		open = "▾",
		empty = "▸",
		empty_open = "▾",
		symlink = "▸",
		symlink_open = "▾",
	},
	lsp = {
		warning = "⊗",
		error = "⊗",
	},
}

-- remove status line for nvim tree
vim.api.nvim_exec(
	[[
function! DisableST()
  return " "
endfunction
au BufEnter NvimTree setlocal statusline=%!DisableST()
]],
	false
)