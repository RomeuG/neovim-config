-- background
vim.opt.background = "dark"

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = true,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		functions = {},
		keywords = { "italic" },
		strings = { "bold" },
		variables = {},
		numbers = { "bold" },
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {
		all = {},
		mocha = {
			text = "#ffffff",
			overlay1 = "#f38ba8",
			base = "#11111b",

			surface2 = "#acb0be",
		},
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		treesitter_context = false,
		telescope = false,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

vim.cmd.colorscheme("catppuccin")

-- highlight matching parenthesis with a more visible color
vim.cmd([[highlight MatchParen cterm=bold cterm=underline ctermfg=red guibg=blue guifg=limegreen]])

vim.cmd([[highlight WinSeparator ctermbg=grey guibg=#11111b ctermfg=grey guifg=grey]]);

-- vim.cmd([[hi Delimiter guifg=#ff0000]])
-- highlight vimtex conceal with better colors
-- vim.cmd([[highlight Conceal ctermfg=red guifg=red]])

-- taken from
-- https://github.com/angelofallars/dotfiles/blob/main/nvim/lua/plugins/config/gruvbox_material.lua
-- vim.cmd([[ highlight FloatBorder guibg=NONE ]])
-- vim.cmd([[ highlight NormalFloat guibg=NONE ]])

-- vim.cmd([[highlight CmpCurrentLine guibg=#a9b665 guifg=#282828]])

-- vim.cmd([[highlight! link CmpNormal normal]])
-- vim.cmd([[highlight CmpBorder guifg=#5a524c]])

-- vim.cmd([[highlight CmpDocNormal guibg=#242322]])
-- vim.cmd([[highlight link CmpDocBorder CmpBorder]])

-- vim.cmd([[highlight! link FloatBorder CmpBorder]])

vim.cmd([[highlight VertSplit guifg=#f9e2af]])

-- vim.cmd([[highlight! link NvimTreeFolderIcon green]])
-- vim.cmd([[highlight! link NvimTreeFolderName green]])

-- vim.cmd([[hi link FloatTitle blue]])
