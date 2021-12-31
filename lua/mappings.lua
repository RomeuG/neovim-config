vim.api.nvim_set_keymap("", ";", ":", { noremap = true })

-- open config file
vim.api.nvim_set_keymap("n", "<leader>r", ":e ~/.config/nvim/init.lua<CR>", {})
-- close buffer
vim.api.nvim_set_keymap("n", "<leader>q", ":bd<CR>", {})
-- save
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", {})

-- buffer change
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", {})
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", {})

-- shift tab should remove 1 tab in insert mode
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-D>", { noremap = true })

-- home behaviour
vim.api.nvim_set_keymap("", "<Home>", "^", {})
vim.api.nvim_set_keymap("i", "<Home>", "<Esc>^i", {})

-- switch between splits using ctrl + shift + {left, right, up, down}
vim.api.nvim_set_keymap("n", "<C-S-Down>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-S-Up>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-S-Right>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-S-Left>", "<C-W><C-H>", { noremap = true })

-- switch between splits (the othe way :-))
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- disable hl with 2 escapes
vim.api.nvim_set_keymap("", "<esc>", "<esc>:noh<CR><esc>", { noremap = true, silent = true })

-- trim white spaces with F2
vim.api.nvim_set_keymap("n", "<F2>", ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>", { noremap = true })
