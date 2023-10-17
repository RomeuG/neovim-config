vim.api.nvim_buf_set_keymap(0, '', '<F5>', ':w<CR>:!./compile.sh<CR>', { noremap = true, silent = false })
