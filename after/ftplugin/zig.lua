-- disable stuff that shouldn't be enabled in the first place.......
vim.g.zig_fmt_parse_errors = 0

-- zig build
vim.api.nvim_buf_set_keymap(0, '', '<F5>', ':w<CR>:!zig build<CR>', { noremap = true, silent = false })
