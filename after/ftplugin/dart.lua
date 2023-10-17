vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.api.nvim_buf_set_keymap(0, '', '<F5>', ':w<CR>:FlutterRun<CR>', { noremap = true, silent = false })

