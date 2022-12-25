-- vimtex config

vim.g.conceallevel = 1
vim.g.tex_flavor = "latex"

-- conceal
vim.g.tex_conceal = "abdmg"

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
