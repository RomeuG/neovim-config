-- comment
require("nvim_comment").setup({
	comment_empty = false,
})

-- vim.api.nvim_set_keymap("n", "<M-/>", "<cmd>CommentToggle<CR>", { silent = true, noremap = true })
-- vim.api.nvim_set_keymap("v", "<M-/>", ":<C-u>call CommentOperator(visualmode())<CR>", { silent = true, noremap = true })
