-- spelling
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_gb"
-- spelling fix
vim.api.nvim_buf_set_keymap(0, "i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true, silent = false })

-- textwidth should be zero
vim.bo.textwidth = 0

-- save file and run make build to compile
vim.api.nvim_buf_set_keymap(0, "n", "<F5>", ":w<CR>:!make build<CR>", { noremap = true, silent = false })
vim.api.nvim_buf_set_keymap(0, "n", "<F6>", ":w<CR>:VimtexCompile<CR>", { noremap = true, silent = false })

-- nvim surround
require("nvim-surround").buffer_setup({
	surrounds = {
		-- ["e"] = {
		--   add = function()
		--     local env = require("nvim-surround.config").get_input ("Environment: ")
		--     return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
		--   end,
		-- },
		["Q"] = {
			add = { "``", "''" },
			find = "%b``.-''",
			delete = "^(``)().-('')()$",
		},
		["q"] = {
			add = { "`", "'" },
			find = "`.-'",
			delete = "^(`)().-(')()$",
		},
		["b"] = {
			add = { "\\textbf{", "}" },
			-- add = function()
			--   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
			--     return { { "\\mathbf{" }, { "}" } }
			--   end
			--   return { { "\\textbf{" }, { "}" } }
			-- end,
			find = "\\%a-bf%b{}",
			delete = "^(\\%a-bf{)().-(})()$",
		},
		["i"] = {
			add = { "\\textit{", "}" },
			-- add = function()
			--   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
			--     return { { "\\mathit{" }, { "}" } }
			--   end
			--   return { { "\\textit{" }, { "}" } }
			-- end,
			find = "\\%a-it%b{}",
			delete = "^(\\%a-it{)().-(})()$",
		},
		["s"] = {
			add = { "\\textsc{", "}" },
			find = "\\textsc%b{}",
			delete = "^(\\textsc{)().-(})()$",
		},
		["t"] = {
			add = { "\\texttt{", "}" },
			-- add = function()
			--   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
			--     return { { "\\mathtt{" }, { "}" } }
			--   end
			--   return { { "\\texttt{" }, { "}" } }
			-- end,
			find = "\\%a-tt%b{}",
			delete = "^(\\%a-tt{)().-(})()$",
		},
		["$"] = {
			add = { "$", "$" },
			-- find = "%b$.-$",
			-- delete = "^($)().-($)()$",
		},
	},
})
