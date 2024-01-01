-- vimtex config

vim.g.conceallevel = 0
vim.g.tex_flavor = "latex"

-- conceal
-- vim.g.tex_conceal = "abdmg"
vim.g.tex_conceal = ""
vim.g.vimtex_syntax_conceal = {
	accents = 0,
	ligatures = 0,
	cites = 0,
	fancy = 0,
	spacing = 0, -- default: 1
	greek = 0,
	math_bounds = 0,
	math_delimiters = 0,
	math_fracs = 0,
	math_super_sub = 0,
	math_symbols = 0,
	sections = 0,
	styles = 0,
}

vim.g.vimtex_view_method = "general"

-- do not auto open quickfix on compile errors
vim.g.vimtex_quickfix_mode = 0
-- disable quickfix autoopen
vim.g.vimtex_quickfix_ignore_mode = 0

-- compiler engine
vim.g.vimtex_compiler_engine = "luatex"

vim.g.vimtex_compiler_latexmk = {
	executable = "latexmk",
	options = {
		"-verbose",
		"-shell-escape",
		"-file-line-error",
		"-synctex=1",
		"-interaction=nonstopmode",
	},
}

-- disable default mappings
vim.g.vimtex_mappings_enabled = 0

vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_fold_manual = 1
vim.g.vimtex_fold_types = {
	cmd_addplot = {
		cmds = { "addplot[+3]?" },
	},
	cmd_multi = {
		cmds = {
			"%(re)?new%(command|environment)",
			"providecommand",
			"presetkeys",
			"Declare%(Multi|Auto)?CiteCommand",
			"Declare%(Index)?%(Field|List|Name)%(Format|Alias)",
		},
	},
	cmd_single = {
		cmds = { "hypersetup", "tikzset", "pgfplotstableread", "lstset" },
	},
	cmd_single_opt = {
		cmds = { "usepackage", "includepdf" },
	},
	comments = {
		enabled = 0,
	},
	env_options = vim.empty_dict(),
	envs = {
		blacklist = {},
		whitelist = { "figure", "frame", "table", "example", "answer" },
	},
	items = {
		enabled = 0,
	},
	markers = vim.empty_dict(),
	preamble = {
		enabled = 0,
	},
	sections = {
		parse_levels = 0,
		parts = { "appendix", "frontmatter", "mainmatter", "backmatter" },
		sections = {
			"%(add)?part",
			"%(chapter|addchap)",
			"%(section|section\\*)",
			"%(subsection|subsection\\*)",
			"%(subsubsection|subsubsection\\*)",
			"paragraph",
		},
	},
}

-- ignore these logs
vim.g.vimtex_log_ignore = {
	"Underfull",
	"Overfull",
	"specifier changed to",
	"Token not allowed in a PDF string",
}
