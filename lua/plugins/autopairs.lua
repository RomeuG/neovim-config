-- auto pairing
local AutoPairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local Cond = require("nvim-autopairs.conds")

AutoPairs.setup({
	check_ts = true,

	enable_afterquote = false,
	enable_check_bracket_lines = true,

	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	disable_in_macro = true,
	disable_in_replace_mode = true,
	enable_moveright = true,
	ignored_next_char = "",
	enable_check_bracket_line = true,

	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Title",
		highlight_grey = "Normal",
	},
})

AutoPairs.add_rules({
	Rule("`", "'", "tex"),
	Rule("$", "$", "tex"),
	Rule(" ", " ")
		:with_pair(function(opts)
			local pair = opts.line:sub(opts.col, opts.col + 1)
			return vim.tbl_contains({ "$$", "()", "{}", "[]" }, pair)
		end)
		:with_move(Cond.none())
		:with_cr(Cond.none())
		:with_del(function(opts)
			local col = vim.api.nvim_win_get_cursor(0)[2]
			local context = opts.line:sub(col - 1, col + 2)
			return vim.tbl_contains({ "$  $", "(  )", "{  }", "[  ]" }, context)
		end),
	Rule("$ ", " ", "tex"):with_pair(Cond.not_after_regex(" ")):with_del(Cond.none()),
	Rule("[ ", " ", "tex"):with_pair(Cond.not_after_regex(" ")):with_del(Cond.none()),
	Rule("{ ", " ", "tex"):with_pair(Cond.not_after_regex(" ")):with_del(Cond.none()),
	Rule("( ", " ", "tex"):with_pair(Cond.not_after_regex(" ")):with_del(Cond.none()),
})
