local Cmp = require("cmp")

local kind_icons = {
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = "了 ",
	EnumMember = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = " ",
	Interface = "ﰮ ",
	Keyword = " ",
	Method = "ƒ ",
	Module = " ",
	Property = " ",
	Snippet = "﬌ ",
	Struct = " ",
	Text = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
}

local feedkey = function(key, mode)
	mode = mode or "n"
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local has_words_before = function(char)
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	if not char then
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	else
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col) == char
	end
end

Cmp.setup({
	-- definition of conditions of when it should be enabled/disable
	enabled = function()
		-- disable completion in comment
		local context = require("cmp.config.context")
		-- keep command mode completion enable when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	-- snippets
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	cmdline = Cmp.mapping.preset.insert({}),
	mapping = Cmp.mapping.preset.insert({
		["<C-d>"] = Cmp.mapping.scroll_docs(-4),
		["<C-f>"] = Cmp.mapping.scroll_docs(4),
		-- ['<Tab>'] = Cmp.mapping(Cmp.mapping.select_next_item(), { 'i', 's' }),
		["<S-Tab>"] = Cmp.mapping(Cmp.mapping.select_prev_item(), { "i", "s" }),
		["<C-Space>"] = Cmp.mapping(Cmp.mapping.complete(), { "i", "c" }),
		["<CR>"] = Cmp.mapping.confirm({ select = false }),
		["<Tab>"] = Cmp.mapping(function(fallback)
			if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
				feedkey("<C-R>=UltiSnips#ExpandSnippet()<CR>")
			elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
				feedkey("<ESC>:call UltiSnips#JumpForwards()<CR>")
			elseif has_words_before() then
				Cmp.confirm({ select = false })
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-e>"] = Cmp.mapping(function(fallback)
			if
				vim.fn.complete_info()["selected"] == -1
				and vim.fn["UltiSnips#CanExpandSnippet"]() ~= 1
				and has_words_before()
				and Cmp.visible()
			then
				if not has_words_before(".") then
					Cmp.confirm({ select = true })
				else
					fallback()
				end
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
	view = {
		entries = {
			name = "custom",
			selection_order = "near_cursor",
		},
	},
	completion = {
		keyword_length = 2,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "FloatBorder:NormalFloat",
		},
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
		},
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
	sources = Cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "path" },
	}),
})
