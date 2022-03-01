-- Plugged object
local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")

-- theme
Plug("rktjmp/lush.nvim")
Plug("ellisonleao/gruvbox.nvim")

-- vim lualine
Plug("nvim-lualine/lualine.nvim")

-- better comments
Plug("terrortylor/nvim-comment")

-- git support
Plug("tpope/vim-fugitive")

-- git gutter
Plug("airblade/vim-gitgutter")

-- undo tree
Plug("mbbill/undotree")

-- smooth scrolling
Plug("psliwka/vim-smoothie")

-- speed motion
Plug("phaazon/hop.nvim")

-- multiple cursors
Plug("mg979/vim-visual-multi")

-- fzf
Plug("ibhagwan/fzf-lua")

-- nvim tree
Plug("kyazdani42/nvim-tree.lua")

-- treesitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- hightlight yanked area
Plug("machakann/vim-highlightedyank")

-- autopairing
Plug("cohama/lexima.vim")

-- latex
Plug("lervag/vimtex")
Plug("matze/vim-tex-fold")

-- neovim lspconfig
Plug("neovim/nvim-lspconfig")

-- lsp extensions
Plug("nvim-lua/lsp_extensions.nvim")

-- lsp signature
Plug("ray-x/lsp_signature.nvim")

-- nvim-comp
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/nvim-cmp")

-- formatter
Plug("sbdchd/neoformat")

-- UltiSnips
Plug("SirVer/ultisnips")
Plug("quangnguyen30192/cmp-nvim-ultisnips")

-- session manager
Plug("nvim-lua/plenary.nvim")
Plug("Shatur/neovim-session-manager")

-- choosewin
Plug("t9md/vim-choosewin")

-- indent lines
Plug("lukas-reineke/indent-blankline.nvim")

vim.call("plug#end")

require("initializer")
