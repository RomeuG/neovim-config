-- local path = require("plenary.path")

-- require("session_manager").setup({
--     sessions_dir = path:new(vim.fn.stdpath("data"), "sessions"),
--     path_replacer = "__",
--     colon_replacer = "++",
--     autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
--     autosave_last_session = false,
--     autosave_ignore_not_normal = true,
-- })

-- -- Mappings
-- vim.api.nvim_set_keymap("n", "<F11>", ":SessionManager save_current_session<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<F12>", ":SessionManager load_session<CR>", { noremap = true })

require("auto-session").setup({
	log_level = "error",
	auto_session_enabled = false,
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
	cwd_change_handling = {
		restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
		pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
		post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
			require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
		end,
	},
})
