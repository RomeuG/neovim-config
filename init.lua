-- Plugged object
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- theme
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'

-- vim lualine
Plug 'nvim-lualine/lualine.nvim'

-- better comments
Plug 'terrortylor/nvim-comment'

-- git support
Plug 'tpope/vim-fugitive'

-- git gutter
Plug 'airblade/vim-gitgutter'

-- undo tree
Plug 'mbbill/undotree'

-- smooth scrolling
Plug 'psliwka/vim-smoothie'

-- speed motion
Plug 'phaazon/hop.nvim'

-- multiple cursors
Plug 'mg979/vim-visual-multi'

-- fzf
Plug 'ibhagwan/fzf-lua'

-- nvim tree
Plug 'kyazdani42/nvim-tree.lua'

-- treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- hightlight yanked area
Plug 'machakann/vim-highlightedyank'

-- autopairing
Plug 'cohama/lexima.vim'

-- latex
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold'

-- neovim lspconfig
Plug 'neovim/nvim-lspconfig'

-- lsp extensions
Plug 'nvim-lua/lsp_extensions.nvim'

-- lsp signature
Plug 'ray-x/lsp_signature.nvim'

-- nvim-comp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

-- UltiSnips
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- session manager
Plug 'nvim-lua/plenary.nvim'
Plug 'Shatur/neovim-session-manager'

vim.call('plug#end')

--
-- Start other stuff
--

require('initializer')

--
--
--

-- NvimTree object
local NvimTree = require('nvim-tree')

-- Treesitter object
local TreeSitter = require('nvim-treesitter.configs')

-- Fzf object
local Fzf = require('fzf-lua')
local FzfActions = require('fzf-lua.actions')

-- LSP Config object
local LspConfig = require('lspconfig')

-- Cmp object
local Cmp = require('cmp')
-- local Snippy = require("snippy")

--
-- Functions
--
--

function Tdump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. Tdump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- stolen from theprimeagen config (https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/lua/theprimeagen/lsp.lua)
local function config(_config)
    local _capabilities = vim.lsp.protocol.make_client_capabilities()
    _capabilities.textDocument.completion.completionItem.snippetSupport = true

	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(_capabilities),
	}, _config or {})
end

local on_attach = function(client, bufnr)

    -- attach lsp signature
    require('lsp_signature').on_attach({
        bind = true,
        hint_enable = true,
        hint_prefix = "",
        floating_window = false,
        extra_trigger_chars = { "(", "," },
        handler_opts = {
            border = "single",
        },
    })

    local opts = { noremap = true, silent = true }

    -- general mappings
    -- jump to definition
    vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- jump to implementation
    vim.api.nvim_set_keymap('n', '<leader>ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- jump to type definition
    vim.api.nvim_set_keymap('n', '<leader>cy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- jump to references
    vim.api.nvim_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- rename
    vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- documentation
    vim.api.nvim_set_keymap('n', 'K', ':call Show_documentation()<CR>', opts)
    -- code action
    vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    -- line diagnostics
    vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua Show_line_diagnostics()<CR>', opts)

    -- formatting
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    -- range formatting
    if client.resolved_capabilities.document_range_formatting then
        vim.api.nvim_set_keymap('v', '<leader>ff', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
    end

    -- document highlight
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
          hi LspReferenceRead cterm=bold ctermbg=237
          hi LspReferenceText cterm=bold ctermbg=237
          hi LspReferenceWrite cterm=bold ctermbg=237
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]], false)
    end
end

vim.api.nvim_exec([[

" show docs on things with <S-k>
function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction

" scratch function
function CreateScratchBuffer(vertical)
    if a:vertical == 1
        :vnew
    else
        :new
    endif
    :setlocal buftype=nofile
    :setlocal bufhidden=hide
    :setlocal noswapfile
    :set ft=scratch
endfunction

" function to insert time stamp
function! InsertDateStamp()
    let l:date = system('date +\%F')
    let l:oneline_date = split(date, "\n")[0]
    execute "normal! a" . oneline_date . "\<Esc>"
endfunction

]], false)

--
-- Mappings
--

vim.api.nvim_set_keymap('', ';', ':', { noremap = true })

-- open config file
vim.api.nvim_set_keymap('n', '<leader>r', ':e ~/.config/nvim/init.lua<CR>', {})
-- close buffer
vim.api.nvim_set_keymap('n', '<leader>q', ':bd<CR>', {})
-- save
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', {})

-- buffer change
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', {})

-- shift tab should remove 1 tab in insert mode
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-D>', { noremap = true })

-- home behaviour
vim.api.nvim_set_keymap('', '<Home>', '^', {})
vim.api.nvim_set_keymap('i', '<Home>', '<Esc>^i', {})

-- switch between splits using ctrl + shift + {left, right, up, down}
vim.api.nvim_set_keymap('n', '<C-S-Down>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S-Up>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S-Right>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S-Left>', '<C-W><C-H>', { noremap = true })

-- switch between splits (the othe way :-))
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- disable hl with 2 escapes
vim.api.nvim_set_keymap('', '<esc>', '<esc>:noh<CR><esc>', { noremap = true, silent = true })

-- trim white spaces with F2
vim.api.nvim_set_keymap('n', '<F2>', ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>", { noremap = true })

-- fzf
-- show files
vim.api.nvim_set_keymap('n', '<leader>zF', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
-- show buffers
vim.api.nvim_set_keymap('n', '<leader>zb', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
-- show commands
vim.api.nvim_set_keymap('n', '<leader>zc', "<cmd>lua require('fzf-lua').commands()<CR>", {})
-- manpages
vim.api.nvim_set_keymap('n', '<leader>zm', "<cmd>lua require('fzf-lua').man_pages()<CR>", {})
-- execute rg with fzf
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('fzf-lua').grep_project()<CR>", {})

-- show commits
vim.api.nvim_set_keymap('n', '<leader>gc', "<cmd>lua require('fzf-lua').git_commits()<CR>", {})
-- show files under git
vim.api.nvim_set_keymap('n', '<leader>gf', "<cmd>lua require('fzf-lua').git_files()<CR>", {})

-- show mappings
vim.api.nvim_set_keymap('n', '<F1>', "<cmd>lua require('fzf-lua').keymaps()<CR>", {})

-- multiple cursors
vim.api.nvim_exec([[

"" multiple cursors
let g:VM_leader="\\"
let g:VM_default_mappings = 0
" multiple cursors mappings
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<M-j>'
let g:VM_maps['Find Subword Under'] = '<M-j>'

]], false)

--
-- Plugins
--

-- disable netrw
vim.g.loaded_netrw = 0
-- disable sql omni completion
vim.g.omni_sql_no_default_maps = 1
-- disable python
vim.g.loaded_python_provider = 0
-- disable perl
vim.g.loaded_perl_provider = 0
-- disable ruby
vim.g.loaded_ruby_provider = 0
-- define python3 library
vim.g.python3_host_prog = '/usr/bin/python3'

-- fzf
vim.env.FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"
Fzf.setup({
    files = {
        actions = {
            ["ctrl-x"] = FzfActions.file_split,
            ["ctrl-v"] = FzfActions.file_vsplit,
        },
    },
    git = {
        status = {
            actions = {
                ["ctrl-x"] = FzfActions.file_split,
                ["ctrl-v"] = FzfActions.file_vsplit,
            },
        },
    },
    keymap = {
        builtin = {
            ["S-down"] = "preview-page-down",
            ["S-up"] = "preview-page-up",
        },
    },
})

-- highlighted yank
vim.g.highlightedyank_highlight_duration = 1000

-- lexima (TODO: convert to actual lua instead of evaluating vimscript)
-- taken from (https://github.com/ryotatake/dotfiles/blob/de8762028f249f5716df377fb8cb3b9013305c83/.vim/autoload/my_settings/plugins.vim)
vim.api.nvim_exec([[

call lexima#add_rule({'char': '"', 'at': '\%#\w'})
call lexima#add_rule({'char': "'", 'at': '\%#\w'})
call lexima#add_rule({'char': "(", 'at': '\%#\w'})
call lexima#add_rule({'char': "{", 'at': '\%#\w'})
call lexima#add_rule({'char': "[", 'at': '\%#\w'})
call lexima#add_rule({'char': "`", 'at': '\%#\w'})

call lexima#add_rule({'char': '"', 'at': '\w\%#'})

call lexima#add_rule({'char': '"', 'at': '\w\%#"', 'leave': 1})
call lexima#add_rule({'char': "'", 'at': '\w\%#'})
call lexima#add_rule({'char': "'", 'at': '\w\%#''', 'leave': 1})
call lexima#add_rule({'char': "`", 'at': '\w\%#'})
call lexima#add_rule({'char': "`", 'at': '\w\%#`', 'leave': 1})

call lexima#add_rule({'char': '<Space>', 'at': '(\%#)', 'input_after': '<Space>'})
call lexima#add_rule({'char': ')', 'at': '\%# )', 'leave': 2})
call lexima#add_rule({'char': '<BS>', 'at': '( \%# )', 'delete': 1})
call lexima#add_rule({'char': '<Space>', 'at': '{\%#}', 'input_after': '<Space>'})
call lexima#add_rule({'char': '}', 'at': '\%# }', 'leave': 2})
call lexima#add_rule({'char': '<BS>', 'at': '{ \%# }', 'delete': 1})

]], false)

-- nvim tree
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }

vim.g.nvim_tree_icons = {
  git = {
    unstaged = "○",
    staged = "●",
    unmerged = "⊜",
    renamed = "⊙",
    untracked = "⊕",
    deleted = "⊗",
    ignored = "⊘"
  },
  folder = {
    arrow_open = "▾",
    arrow_closed = "▸",
    default = "▸",
    open =  "▾",
    empty = "▸",
    empty_open = "▾",
    symlink = "▸",
    symlink_open = "▾",
  },
  lsp = {
    warning = "⊗",
    error = "⊗",
  }
}

vim.api.nvim_exec(
[[
function! DisableST()
  return " "
endfunction
au BufEnter NvimTree setlocal statusline=%!DisableST()
]]
, false)

NvimTree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    ignore_ft_on_setup = {},
    update_to_buf_dir = {
        enable = false,
        auto_open = false,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
})

-- treesitter
TreeSitter.setup({
    ensure_installed = {"rust", "c", "lua", "python"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<M-]>',
            node_incremental = '<M-]>',
            node_decremental = '<M-[>',
        },
    },
})

-- init Cmp
-- Snippy.setup({
--     mappings = {
--         is = {
--             ["<Tab>"] = "expand_or_advance",
--             ["<S-Tab>"] = "previous",
--         },
--         nx = {
--             ["<leader>x"] = "cut_text",
--         },
--     },
-- })

local has_words_before = function(char)
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    if not char then
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    else
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col) == char
    end
end

local feedkey = function(key, mode)
    mode = mode or "n"
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

function Show_line_diagnostics()
    local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = {
            { "┌", "FloatBorder" },
            { "─", "FloatBorder" },
            { "┐", "FloatBorder" },
            { "│", "FloatBorder" },
            { "┘", "FloatBorder" },
            { "─", "FloatBorder" },
            { "└", "FloatBorder" },
            { "│", "FloatBorder" },
        },
        source = "if_many",
        prefix = "",
    }
    vim.diagnostic.open_float(nil, opts)
end

require("cmp_nvim_ultisnips").setup{}
vim.g.UltiSnipsEnableSnipMate = 0
vim.g.UltiSnipsRemoveSelectModeMappings = 0
vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"

Cmp.setup({
	snippet = {
		expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
        ['<C-d>'] = Cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = Cmp.mapping.scroll_docs(4),
        -- ['<Tab>'] = Cmp.mapping(Cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = Cmp.mapping(Cmp.mapping.select_prev_item(), { 'i', 's' }),
		['<C-Space>'] = Cmp.mapping(Cmp.mapping.complete(), { 'i', 'c' }),
		['<CR>'] = Cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = Cmp.mapping(function(fallback)
            if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
                feedkey("<C-R>=UltiSnips#ExpandSnippet()<CR>")
            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                feedkey("<ESC>:call UltiSnips#JumpForwards()<CR>")
            elseif has_words_before() then
                Cmp.confirm({ select = false })
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<C-e>"] = Cmp.mapping(function(fallback)
            if
                vim.fn.complete_info()["selected"] == -1
                and vim.fn["UltiSnips#CanExpandSnippet"]() ~= 1
                and has_words_before()
                and Cmp.visible()
            then
                if not has_words_before(".") then
                    Cmp.confirm({ select = true })
                else
                    fallback()
                end
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
	},
    completion = {
        keyword_length = 2
    },
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    experimental = {
        native_menu = false,
        ghost_text = false,
    },
	sources = Cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' },
		{ name = 'path' },
	})
})

-- Language Servers
-- Lua
LspConfig.sumneko_lua.setup(config({
    on_attach = on_attach,
    flags = { debounce_text_changes = 500 },
	settings = {
		Lua = {
            completion = {
                workspaceWord = false,
            },
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
            telemetry = {
                enable = false,
            },
		},
	},
}))

-- C/C++
LspConfig.clangd.setup(config({
    on_attach = on_attach,
    flags = { debounce_text_changes = 500 },
}))

-- Python
LspConfig.pyright.setup(config({
    on_attach = on_attach,
    flags = { debounce_text_changes = 500 },
}))

-- Rust
LspConfig.rust_analyzer.setup(config({
    flags = { debounce_text_changes = 500 },
    settings = {
        ["rust-analyzer"] = {
            ["checkOnSave"] = {
                ["enable"] = true,
                ["command"] = "clippy",
            },
            ["cargo"] = {
                ["autoreload"] = true,
            },
        },
    },
    on_attach = on_attach,
}))

-- LaTeX
LspConfig.texlab.setup(config({
    on_attach = on_attach,
    flags = { debounce_text_changes = 500 },
}))

--
-- Commands
--

vim.api.nvim_exec([[
" define types to syntax highlighting
" nasm
autocmd BufNewFile,BufRead *.S,*.s,*.asm,*.inc set filetype=asm syntax=nasm commentstring=;\%s

" don't auto comment on newlines
au BufEnter * set fo-=c fo-=r fo-=o

" help in vertical split
au FileType help wincmd L

" Format
command! Format execute 'lua vim.lsp.buf.formatting()'

augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END

" remove trailing whitespaces
au BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.rs,*.c,*.tex Format

" inlay hints
" nnoremap <Leader>T :lua require'lsp_extensions'.inlay_hints()
autocmd InsertEnter *.rs :lua require('lsp_extensions').inlay_hints{ prefix = " » ", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" when to check if the file has been changed in another program
au FocusGained,BufEnter * checktime

" Insert mode when it enters terminal
autocmd TermOpen * startinsert

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" scratch buffer commands
command! Scratch call CreateScratchBuffer(1)
command! Scratchh call CreateScratchBuffer(0)

" timestamp
command! TimeStamp call InsertDateStamp()

" FZF
command! FzfBuffers execute "lua require('fzf-lua').buffers()"
command! FzfFiles execute "lua require('fzf-lua').files()"
command! FzfOldfiles execute "lua require('fzf-lua').oldfiles()"
command! FzfQuickfix execute "lua require('fzf-lua').quickfix()"
command! FzfLoclist execute "lua require('fzf-lua').loclist()"
command! FzfLines execute "lua require('fzf-lua').lines()"
command! FzfBlines execute "lua require('fzf-lua').blines()"
command! FzfTabs execute "lua require('fzf-lua').tabs()"
command! FzfArgs execute "lua require('fzf-lua').args()"

command! FzfGrep execute "lua require('fzf-lua').grep()"
command! FzfGrepLast execute "lua require('fzf-lua').grep_last()"
command! FzfGrepCword execute "lua require('fzf-lua').grep_cword()"
command! FzfGrepCWORD execute "lua require('fzf-lua').grep_cWORD()"
command! FzfGrepVisual execute "lua require('fzf-lua').grep_visual()"
command! FzfGrepProject execute "lua require('fzf-lua').grep_project()"
command! FzfGrepCurbuf execute "lua require('fzf-lua').grep_curbuf()"
command! FzfGrepLiveCurbuf execute "lua require('fzf-lua').lgrep_curbuf()"
command! FzfGrepLive execute "lua require('fzf-lua').live_grep()"
command! FzfGrepLiveResume execute "lua require('fzf-lua').live_grep_resume()"
command! FzfGrepLiveGlob execute "lua require('fzf-lua').live_grep_glob()"
command! FzfGrepLiveNative execute "lua require('fzf-lua').live_grep_native()"

command! FzfGitFiles execute "lua require('fzf-lua').git_files()"
command! FzfGitStatus execute "lua require('fzf-lua').git_status()"
command! FzfGitCommits execute "lua require('fzf-lua').git_commits()"
command! FzfGitBcommits execute "lua require('fzf-lua').git_bcommits()"
command! FzfGitBranches execute "lua require('fzf-lua').git_branches()"

command! FzfLspReferences execute "lua require('fzf-lua').lsp_references()"
command! FzfLspDefinitions execute "lua require('fzf-lua').lsp_definitions()"
command! FzfLspDeclarations execute "lua require('fzf-lua').lsp_declarations()"
command! FzfLspTypedefs execute "lua require('fzf-lua').lsp_typedefs()"
command! FzfLspImplementations execute "lua require('fzf-lua').lsp_implementations()"
command! FzfLspDocumentSymbols execute "lua require('fzf-lua').lsp_document_symbols()"
command! FzfLspWorkspaceSymbols execute "lua require('fzf-lua').lsp_workspace_symbols()"
command! FzfLspLiveWorkspaceSymbols execute "lua require('fzf-lua').lsp_live_workspace_symbols()"
command! FzfLspCodeActions execute "lua require('fzf-lua').lsp_code_actions()"
command! FzfLspDocumentDiagnostics execute "lua require('fzf-lua').lsp_document_diagnostics()"
command! FzfLspWorkspaceDiagnostics execute "lua require('fzf-lua').lsp_workspace_diagnostics()"

command! FzfMiscResume execute "lua require('fzf-lua').resume()"
command! FzfMiscBuiltin execute "lua require('fzf-lua').builtin()"
command! FzfMiscHelpTags execute "lua require('fzf-lua').help_tags()"
command! FzfMiscManPages execute "lua require('fzf-lua').man_pages()"
command! FzfMiscColorschemes execute "lua require('fzf-lua').colorschemes()"
command! FzfMiscCommands execute "lua require('fzf-lua').commands()"
command! FzfMiscCommandHistory execute "lua require('fzf-lua').command_history()"
command! FzfMiscSearchHistory execute "lua require('fzf-lua').search_history()"
command! FzfMiscMarks execute "lua require('fzf-lua').marks()"
command! FzfMiscJumps execute "lua require('fzf-lua').jumps()"
command! FzfMiscChanges execute "lua require('fzf-lua').changes()"
command! FzfMiscRegisters execute "lua require('fzf-lua').registers()"
command! FzfMiscKeymaps execute "lua require('fzf-lua').keymaps()"
command! FzfMiscSpellSuggest execute "lua require('fzf-lua').spell_suggest()"
command! FzfMiscTags execute "lua require('fzf-lua').tags()"
command! FzfMiscBtags execute "lua require('fzf-lua').btags()"
command! FzfMiscFiletypes execute "lua require('fzf-lua').filetypes()"
command! FzfMiscPackadd execute "lua require('fzf-lua').packadd()"

]], false)

-- local servers = {"rust_analyzer"}
-- for _, lsp in ipairs(servers) do
--     require('lspconfig')[lsp].setup { on_attach = on_attach }
-- end
