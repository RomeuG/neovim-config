-- Plugged object
local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")

-- Speedup nvim
Plug("lewis6991/impatient.nvim")

-- theme
-- Plug("rktjmp/lush.nvim")
Plug("sainnhe/gruvbox-material")
Plug("catppuccin/nvim")

-- utils
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")

-- vim lualine
Plug("nvim-lualine/lualine.nvim")

-- better comments
Plug("terrortylor/nvim-comment")

-- git support
Plug("tpope/vim-fugitive")

-- git nice stuff
Plug("lewis6991/gitsigns.nvim")

-- github support
Plug("pwntester/octo.nvim")
Plug("nvim-tree/nvim-web-devicons")

-- undo tree
Plug("mbbill/undotree")

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
Plug("nvim-treesitter/playground")

-- treesitter tags auto-pair
Plug("windwp/nvim-ts-autotag")

-- autopairing
Plug("windwp/nvim-autopairs")

-- latex
Plug("lervag/vimtex")
Plug("matze/vim-tex-fold")

-- neovim lspconfig
Plug("neovim/nvim-lspconfig")

-- lsp signature
Plug("ray-x/lsp_signature.nvim")

-- nvim-comp
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/nvim-cmp")

-- dart lsp
Plug("akinsho/flutter-tools.nvim")

-- rust tools
Plug("simrat39/rust-tools.nvim")
-- Plug("kdarkhan/rust-tools.nvim")

-- formatter
Plug("sbdchd/neoformat")

-- UltiSnips
Plug("SirVer/ultisnips")
Plug("quangnguyen30192/cmp-nvim-ultisnips")

-- which-key
Plug("folke/which-key.nvim")

-- session manager
Plug("rmagatti/auto-session")

-- choosewin
Plug("t9md/vim-choosewin")

-- indent lines
Plug("lukas-reineke/indent-blankline.nvim")

-- distraction free editing
Plug("junegunn/goyo.vim")

-- Rust
Plug("rust-lang/rust.vim")

-- EditorConfig
Plug("editorconfig/editorconfig-vim")

-- orgmode
Plug("nvim-orgmode/orgmode")

-- vim surround
Plug("tpope/vim-surround")

-- guess indentation
Plug("NMAC427/guess-indent.nvim")

-- todo comments
Plug("folke/todo-comments.nvim")

-- fold
Plug("anuvyklack/pretty-fold.nvim")

vim.call("plug#end")

-- gotta go fast
require("impatient").enable_profile()

-- initialize rest
require("initializer")

vim.api.nvim_exec(
	[[
    set guifont=Sarasa\ Mono\ SC\ Nerd:h14

    let g:neovide_refresh_rate=60
    let g:neovide_transparency=1.0

    let g:neovide_no_idle=v:false
    let g:neovide_fullscreen=v:false

    let g:neovide_cursor_animation_length=0.10
    let g:neovide_cursor_trail_length=0.5

    let g:neovide_cursor_antialiasing=v:true

    let g:neovide_cursor_vfx_mode = "ripple"
    let g:neovide_cursor_vfx_opacity=200.0
    let g:neovide_cursor_vfx_particle_lifetime=1.2
    let g:neovide_cursor_vfx_particle_density=7.0
    let g:neovide_cursor_vfx_particle_speed=10.0
    let g:neovide_cursor_vfx_particle_phase=1.5
	let g:neovide_cursor_vfx_particle_curl=1.0
]],
	false
)
