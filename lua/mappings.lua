vim.api.nvim_set_keymap("", ";", ":", { noremap = true })

-- open config file
vim.api.nvim_set_keymap("n", "<leader>r", ":e ~/.config/nvim/init.lua<CR>", {})
-- close buffer
vim.api.nvim_set_keymap("n", "<leader>q", ":bd<CR>", {})
-- save
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>p", "\"_dP", {})

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

-- vertical movement empty lines with C-Up/C-Down
vim.api.nvim_set_keymap("n", "<C-Up>", "<S-{>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Down>", "<S-}>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-Up>", "<esc><S-{>i", {})
vim.api.nvim_set_keymap("i", "<C-Down>", "<esc><S-}>i", {})

-- backspace behaviour in normal mode
-- vim.api.nvim_set_keymap("n", "<BS>", "i<BS><esc>`^", {})

-- deactivate these mappings
vim.api.nvim_set_keymap("", "<S-Up>", "", {})
vim.api.nvim_set_keymap("", "<S-Down>", "", {})

-- diffget
vim.api.nvim_set_keymap("n", "<leader>d1", ":diffget LOCAL<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>d2", ":diffget BASE<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>d3", ":diffget REMOTE<CR>", {})

-- inlay hints
-- vim.api.nvim_set_keymap("n", "<F10>", ":lua vim.lsp.buf.inlay_hint(0)<CR>", {});

-- other useful stuff
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "{", "{zz", opts)
vim.keymap.set("n", "}", "}zz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "G", "Gzz", opts)
vim.keymap.set("n", "gg", "ggzz", opts)
vim.keymap.set("n", "%", "%zz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)
vim.keymap.set("n", "<C-i>", "<C-i>zz", opts)
vim.keymap.set("n", "<C-o>", "<C-o>zz", opts)
