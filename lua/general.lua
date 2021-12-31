vim.g.mapleader = ','

-- enable mouse
vim.opt.mouse = 'a'
-- use system clipboard
vim.opt.clipboard = 'unnamedplus'
-- tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- tab key actions
vim.opt.expandtab = true
vim.opt.smarttab = true
-- highlight text during search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
-- TODO
vim.opt.fillchars = "eob: "
-- wrap long lines set by tw
vim.opt.wrap = true
vim.opt.breakindent = true
-- text encoding
vim.opt.encoding = 'utf-8'
-- enable numbers
vim.opt.number = true
-- tab title = file name
vim.opt.title = true
-- dont display last command
vim.opt.showcmd = false
-- for indentation plugin
vim.opt.conceallevel = 2
-- split to the right
vim.opt.splitright = true
-- split below
vim.opt.splitbelow = true
-- auto wrap lines after 90 chars
vim.opt.tw = 90
-- enable emojis
vim.opt.emoji = true
-- set history limit to 1000 line
vim.opt.history = 1000
-- mindful and sensible backspace
vim.opt.backspace = [[indent,eol,start]]
-- persistent undo
vim.opt.undofile = true
-- undo temporary directory
vim.opt.undodir = "/tmp"
-- open all folds by default
vim.opt.foldlevel = 0
-- visual feedback while substituting
vim.opt.inccommand = 'nosplit'
-- always show tabline
vim.opt.showtabline = 1
-- use rg as grep
vim.opt.grepprg = "rg --vimgrep"
-- show current position
vim.opt.ruler = true
-- magic on for regex
vim.opt.magic = true
-- show matching brackets, parenthesis and others
vim.opt.showmatch = true
-- unix as standard file type
vim.opt.ffs = [[unix,dos,mac]]

vim.opt.termguicolors = true

-- no annoyances
vim.opt.errorbells = false
vim.opt.visualbell = false

-- performance tweaks
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.scrolljump = 5
vim.opt.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.synmaxcol = 180
vim.opt.re = 1

-- read when file is changed from outside
vim.opt.autoread = true

-- wildcards to ignore
vim.opt.wildignore = vim.opt.wildignore +  {'*/target/*', '*/tmp/*', '*.swp', '*.pyc', '__pycache__'}

-- lsp related useful options
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.signcolumn = 'yes'

