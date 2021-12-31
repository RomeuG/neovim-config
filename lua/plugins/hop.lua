require("hop").setup()

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2<CR>", opts)
vim.api.nvim_set_keymap("n", "f", "<cmd>HopChar1<CR>", opts)
