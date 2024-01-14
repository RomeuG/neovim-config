-- define config directory
local home = vim.env.HOME
local config = home .. "/.config/nvim"

-- globals
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- remove cmdline
-- vim.opt.cmdheight = 0

-- enable mouse
vim.opt.mouse = "a"
-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = false
vim.opt.expandtab = true
vim.opt.smarttab = true

-- highlight text during search druing search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- fillchars ?????????
-- vim.opt.fillchars = "eob: "
vim.opt.fillchars = {
	diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
	eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
	fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
	vert = "┃", -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
}

-- wrap long lines set by tw
vim.opt.wrap = false
vim.opt.breakindent = false
-- autoindent
vim.opt.autoindent = true
vim.opt.smartindent = true
-- text encoding
vim.opt.encoding = "utf-8"
-- enable numbers
vim.opt.number = false
-- tab title = file name
vim.opt.title = true
-- dont display last command
vim.opt.showcmd = false
-- for indentation plugin
vim.opt.conceallevel = 2
-- conceal cursor
vim.opt.concealcursor = "nc"

-- split right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- enable emojis
vim.opt.emoji = true
-- set history limit to 1000 line
vim.opt.history = 1000
-- mindful and sensible backspace
vim.opt.backspace = "indent,eol,start"
-- persistent undo
vim.opt.undofile = true
-- undo temporary directory
vim.opt.undodir = "/tmp"
-- views
vim.opt.viewdir = config .. "/view"
vim.opt.viewoptions = "cursor,folds"
-- visual feedback while substituting
vim.opt.inccommand = "nosplit"
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
-- colorcolumn
vim.opt.colorcolumn = "80"
-- time for mapped sequence
vim.opt.timeoutlen = 500

vim.opt.termguicolors = true
vim.opt.guicursor = ""

-- no annoyances
vim.opt.belloff = "all"
vim.opt.errorbells = false
vim.opt.visualbell = false

-- performance tweaks
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.scrolljump = 5
vim.opt.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.synmaxcol = 180
vim.opt.sidescroll = 0
vim.opt.sidescrolloff = 3

-- should be 2 for better performance
vim.opt.re = 2

-- show whitespace and other stuff
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", extends = "❯", precedes = "❮", nbsp = "±", trail = "·" }

-- read when file is changed from outside
vim.opt.autoread = true

-- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
vim.opt.whichwrap = "b,h,l,s,<,>,[,],~"

-- wildcards to ignore
vim.opt.wildmenu = true -- show options as list when switching buffers etc
vim.opt.wildmode = "longest:full,full" -- shell-like autocomplete to unambiguous portion
vim.opt.wildignore = vim.opt.wildignore
	+ {
		"*/target/*",
		"*/tmp/*",
		"*.swp",
		"*.pyc",
		"__pycache__",
		"*.o",
		"*.rej",
		"*.so",
	}

-- swap files
vim.opt.directory = config .. "/nvim/swap//"
vim.opt.directory = vim.opt.directory + "."

-- backup stuff
vim.opt.backup = false
vim.opt.backupcopy = "yes"
vim.opt.backupdir = config .. "/backup//"
vim.opt.backupdir = vim.opt.backupdir + "."
vim.opt.backupskip = vim.opt.backupskip + "*.re,*.rei"
vim.opt.writebackup = false

-- lsp related useful options
vim.opt.hidden = true
vim.opt.updatetime = 200
vim.opt.signcolumn = "yes"

-- messages
vim.opt.shortmess = vim.opt.shortmess + "A" -- ignore annoying swapfile messages
vim.opt.shortmess = vim.opt.shortmess + "I" -- no splash screen
vim.opt.shortmess = vim.opt.shortmess + "O" -- file-read message overwrites previous
vim.opt.shortmess = vim.opt.shortmess + "T" -- truncate non-file messages in middle
vim.opt.shortmess = vim.opt.shortmess + "W" -- don't echo "[w]"/"[written]" when writing
vim.opt.shortmess = vim.opt.shortmess + "a" -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.opt.shortmess = vim.opt.shortmess + "c" -- completion messages
vim.opt.shortmess = vim.opt.shortmess + "o" -- overwrite file-written messages
vim.opt.shortmess = vim.opt.shortmess + "t" -- truncate file messages at start

-- completeopt for nvim-cmp
vim.opt.completeopt = "menu"
vim.opt.completeopt = vim.opt.completeopt + "menuone"
vim.opt.completeopt = vim.opt.completeopt + "noselect"

-- edit 1 char after end of line
vim.opt.virtualedit = "onemore"

-- diff stuff
vim.opt.diffopt = vim.opt.diffopt + "foldcolumn:0"

-- fold settings - requires treesitter!
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10
vim.foldenable = false

-- disable some builtin stuff
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
