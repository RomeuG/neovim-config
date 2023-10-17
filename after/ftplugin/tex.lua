-- textwidth should be zero
vim.bo.textwidth = 0

-- save file and run make build to compile
vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', ':w<CR>:!make build<CR>', { noremap = true, silent = false })
vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', ':w<CR>:VimtexCompile<CR>', { noremap = true, silent = false })
-- vim.api.nvim_set_keymap('n', '<F7>', ':w<CR>:TexlabBuild<CR>', { noremap = true, silent = false })
