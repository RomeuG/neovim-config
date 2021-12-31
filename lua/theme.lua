-- theme
vim.opt.background = "dark"

vim.g.gruvbox_italic = 1
vim.g.gruvbox_italicize_strings = 0
vim.g.gruvbox_contrast_dark = "hard"

-- theme enable
vim.cmd([[syntax on]])
-- vim.cmd[[colorscheme gruvbox-material]]
vim.cmd([[colorscheme gruvbox]])

-- highlight matching parenthesis with a more visible color
vim.cmd([[highlight MatchParen cterm=bold cterm=underline ctermfg=blue]])
-- highlight vimtex conceal with better colors
vim.cmd([[highlight Conceal ctermfg=red]])
