local Telescope = require("telescope")
local TelescopeConfig = require("telescope.config")
local TelescopeBuiltin = require("telescope.builtin")
local TelescopeActions = require("telescope.actions")
local TelescopeThemes = require("telescope.themes")
local TelescopePreviewers = require("telescope.previewers")

-- files to be excluded from preview highlight
local hl_excluded_files = { ".*%.csv" }

-- functions
local bad_files = function(filepath)
	for _, v in ipairs(hl_excluded_files) do
		if filepath:match(v) then
			return false
		end
	end

	return true
end

local new_maker = function(filepath, bufnr, opts)
	opts = opts or {}
	if opts.use_ft_detect == nil then
		opts.use_ft_detect = true
	end
	opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
	TelescopePreviewers.buffer_previewer_maker(filepath, bufnr, opts)
end

local fn_project_files = function()
	local opts = {
		prompt_title = false,
		results_title = false,
		preview_title = false,
	}

	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		TelescopeBuiltin.git_files(opts)
	else
		TelescopeBuiltin.find_files(opts)
	end
end

-- config
local vimgrep_arguments = { unpack(TelescopeConfig.values.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--trim")
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.cache/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.github/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!resources/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!lib/*")

Telescope.setup({
	defaults = {
		prompt_prefix = "❯ ",
		selection_caret = "➜ ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		prompt_title = false,
		results_title = false,
		preview_title = false,
		winblend = 10,
		layout_config = {
			vertical = { mirror = false },
			horizontal = { mirror = false, prompt_position = "top", preview_width = 0.5 },
		},
		buffer_previewer_maker = new_maker,
		vimgrep_arguments = vimgrep_arguments,
		mappings = {
			i = {
				["<esc>"] = TelescopeActions.close,
				["<PageUp>"] = TelescopeActions.preview_scrolling_up,
				["<PageDown>"] = TelescopeActions.preview_scrolling_down,
			},
			n = {
				["<PageUp>"] = TelescopeActions.preview_scrolling_up,
				["<PageDown>"] = TelescopeActions.preview_scrolling_down,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*", "--glob", "!.cache/*", "--glob", "!.github/*", "--glob", "!resources/*", "--glob", "!lib/*" },
			prompt_title = false,
			results_title = false,
			preview_title = false,
		},
		buffers = { prompt_title = false, results_title = false, preview_title = false },
		commands = { prompt_title = false, results_title = false, preview_title = false },
		man_pages = { prompt_title = false, results_title = false, preview_title = false },
		git_commits = { prompt_title = false, results_title = false, preview_title = false },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "ignore_case",
		},
		ultisnips = {
			ultisnips = {
				theme = "ivy",
			},
		},
	},
})

-- extensions
Telescope.load_extension("fzf")
Telescope.load_extension("ultisnips")
Telescope.load_extension("session-lens")

-- show files
vim.keymap.set("n", "<leader>zF", TelescopeBuiltin.find_files, {})
-- show buffers
vim.keymap.set("n", "<leader>zb", TelescopeBuiltin.buffers, {})
-- show commands
vim.keymap.set("n", "<leader>zc", TelescopeBuiltin.commands, {})
-- manpages
vim.keymap.set("n", "<leader>zm", TelescopeBuiltin.man_pages, {})
-- ripgrep
vim.api.nvim_set_keymap("n", "<leader>/", "<Cmd>Telescope grep_string search=<CR>", {})

-- show commits
vim.keymap.set("n", "<leader>gc", TelescopeBuiltin.git_commits, {})
-- show git only files
vim.keymap.set("n", "<leader>gf", fn_project_files, {})

-- show mappings
vim.keymap.set("n", "<F1>", TelescopeBuiltin.keymaps, {})

-- show sessions
vim.keymap.set("n", "<F12>", function()
	vim.cmd(":Telescope session-lens search_session")
end, {})

-- commands
vim.api.nvim_create_user_command("TeleSnippets", function()
	vim.cmd(":lua require'telescope'.extensions.ultisnips.ultisnips(require('telescope.themes').get_ivy({}))")
end, {})

-- more keymaps in `lsp.lua`
