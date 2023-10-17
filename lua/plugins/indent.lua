-- require("indent_blankline").setup {
--     show_current_context = false,
--     show_current_context_start = false,
--     use_treesitter = false,
--     show_trailing_blankline_indent = false,
-- }

local exclude_ft = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"neo-tree",
	"Trouble",
}

require("ibl").setup({
    -- show_current_context = true,
    -- show_current_context_start = false,
    -- show_end_of_line = false,
	indent = {
		-- -- U+2502 may also be a good choice, it will be on the middle of cursor.
		-- -- U+250A is also a good choice
		char = "▏",
	},
	exclude = {
		filetypes = exclude_ft,
		buftypes = { "terminal", "nofile", "telescope" },
	},
    scope = {
        enabled = true,
        show_start = false,
    }
})

-- vim.g.indentLine_enabled = 1
-- vim.g.indent_blankline_enabled = true
-- vim.g.indent_blankline_show_trailing_blankline_indent = true
-- vim.g.indent_blankline_show_first_indent_level = true
-- vim.g.indent_blankline_use_treesitter = false
-- vim.g.indent_blankline_show_current_context = true
-- vim.g.indent_blankline_char = "▏"
-- vim.g.indent_blankline_buftype_exclude = {
--     "nofile",
--     "terminal",
--     "lsp-installer",
--     "lspinfo",
-- }

-- vim.g.indent_blankline_filetype_exclude = {
--     "help",
--     "startify",
--     "dashboard",
--     "packer",
--     "neogitstatus",
--     "NvimTree",
--     "neo-tree",
--     "Trouble",
-- }

-- vim.g.indent_blankline_context_patterns = {
--     "class",
--     "return",
--     "function",
--     "method",
--     "^if",
--     "^while",
--     "jsx_element",
--     "^for",
--     "^object",
--     "^table",
--     "block",
--     "arguments",
--     "if_statement",
--     "else_clause",
--     "jsx_element",
--     "jsx_self_closing_element",
--     "try_statement",
--     "catch_clause",
--     "import_statement",
--     "operation_type",
-- }

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

-- require("indent_blankline").setup {
--     show_current_context = true,
--     show_current_context_start = false,
--     show_end_of_line = false,
--     space_char_blankline = " ",
--     show_trailing_blankline_indent = false,
-- }
