vim.opt.background = "dark"

-- gruvbox-material specific settings

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "original"

vim.g.gruvbox_material_palette = "original"
vim.g.gruvbox_material_statusline_style = "original"

vim.g.gruvbox_material_ui_constrast = "high"

vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1

vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 0

-- theme enable
vim.cmd.syntax = "on"
vim.cmd.colorscheme "gruvbox-material"

-- highlight matching parenthesis with a more visible color
vim.cmd([[highlight MatchParen cterm=bold cterm=underline ctermfg=red guibg=blue guifg=limegreen]])
vim.cmd([[hi Delimiter guifg=#ff0000]])
-- highlight vimtex conceal with better colors
-- vim.cmd([[highlight Conceal ctermfg=red guifg=red]])

-- taken from
-- https://github.com/angelofallars/dotfiles/blob/main/nvim/lua/plugins/config/gruvbox_material.lua
vim.cmd([[ highlight FloatBorder guibg=NONE ]])
vim.cmd([[ highlight NormalFloat guibg=NONE ]])

vim.cmd([[highlight CmpCurrentLine guibg=#a9b665 guifg=#282828]])

vim.cmd([[highlight! link CmpNormal normal]])
vim.cmd([[highlight CmpBorder guifg=#5a524c]])

vim.cmd([[highlight CmpDocNormal guibg=#242322]])
vim.cmd([[highlight link CmpDocBorder CmpBorder]])

vim.cmd([[highlight! link FloatBorder CmpBorder]])

vim.cmd([[highlight VertSplit guifg=#fe8019]])

vim.cmd([[highlight! link NvimTreeFolderIcon green]])
vim.cmd([[highlight! link NvimTreeFolderName green]])

vim.cmd([[hi link FloatTitle blue]])
