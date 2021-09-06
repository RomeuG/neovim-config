-- textwidth should be zero
vim.bo.textwidth = 0

-- save file and run make build to compile
vim.api.nvim_set_keymap('', '<F5>', ':w<CR>:!make build<CR>', { noremap = true, silent = false })
