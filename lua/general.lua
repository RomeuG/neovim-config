vim.g.mapleader = ","

-- remove cmdline
-- vim.opt.cmdheight = 0

-- enable mouse
vim.opt.mouse = "a"
-- use system clipboard
vim.opt.clipboard = "unnamedplus"
-- tab
vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- tab key actions
vim.opt.expandtab = false
vim.opt.smarttab = true
-- highlight text during search druing search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
-- TODO
vim.opt.fillchars = "eob: "
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
-- split to the right
vim.opt.splitright = true
-- split below
vim.opt.splitbelow = true
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
-- should be 2 for better performance
vim.opt.re = 2

-- read when file is changed from outside
vim.opt.autoread = true

-- wildcards to ignore
vim.opt.wildignore = vim.opt.wildignore + { "*/target/*", "*/tmp/*", "*.swp", "*.pyc", "__pycache__" }

-- lsp related useful options
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 200
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.signcolumn = "yes"

vim.opt.completeopt = "menuone"

-- edit 1 char after end of line
vim.opt.virtualedit = "onemore"

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
