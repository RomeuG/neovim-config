filetype plugin on

" ============= Vim-Plug ============== "{{{

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))

"}}}

" ================= UI ============================== "{{{
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'                          " airline status bar

"}}}

" ================= Functionalities ================= "{{{

Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more

Plug 'junegunn/fzf'                                     " fzf itself
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration

Plug 'rust-lang/rust.vim'                               " better rust integration

Plug 'tpope/vim-commentary'                             " better commenting

Plug 'tpope/vim-fugitive'                               " git support
Plug 'airblade/vim-gitgutter'                           " git gutter

Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plug 'tpope/vim-eunuch'                                 " run common Unix commands inside Vim
Plug 'jiangmiao/auto-pairs'                             " autopairs (verify vim-closer)
Plug 'machakann/vim-highlightedyank'                    " highlight yanked area
Plug 'AndrewRadev/splitjoin.vim'                        " Split/Join oneliners into multiline
Plug 'easymotion/vim-easymotion'                        " Easy motion
Plug 'terryma/vim-expand-region'                        " Expand regions increasingly

Plug 'mg979/vim-visual-multi', {'branch': 'master'}     " multiple cursors
Plug 't9md/vim-choosewin'                               " window pick

call plug#end()

"}}}

" ==================== general config ======================== "{{{

set t_Co=256
"set termguicolors                                       " Opaque Background
set mouse=a                                             " enable mouse scrolling
set clipboard+=unnamedplus                              " use system clipboard by default
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent     " tab width
set expandtab smarttab                                  " tab key actions
set incsearch ignorecase smartcase hlsearch             " highlight text while searching
" set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
set wrap breakindent                                    " wrap long lines to the width set by tw
set encoding=utf-8                                      " text encoding
set number                                              " enable numbers on the left
set title                                               " tab title as file name
set noshowcmd                                           " to get rid of display of last command
set conceallevel=2                                      " set this so we wont break indentation plugin
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom
set tw=90                                               " auto wrap lines that are longer than that
set emoji                                               " enable emojis
set history=1000                                        " history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set foldlevel=0                                         " open all folds by default
set inccommand=nosplit                                  " visual feedback while substituting
set showtabline=2                                       " always show tabline
set grepprg=rg\ --vimgrep                               " use rg as default grepper
set ruler                                               " current position
set magic                                               " magic on for regex
set showmatch                                           " show matching brackets
set ffs=unix,dos,mac                                    " unix as standard file type

" no annoyances
set noerrorbells
set novisualbell

" performance tweaks
set cursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

" others
set autoread " read when file is changed from outside

" wildcards
set wildignore+=*/target/*,*/tmp/*,*.swp,*.pyc,*__pycache__/*

" Themeing
set background=dark

" gruvbox material
let g:gruvbox_material_background='hard'
let g:gruvbox_material_enable_italic=1

syntax enable
colorscheme gruvbox-material

" highlight matching parenthesis
hi MatchParen cterm=bold cterm=underline ctermfg=blue

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"}}}

" ======================== Plugin Configurations ======================== "{{{

" Airline

" let g:airline_theme='material'
let g:airline_skip_empty_sections = 1
"let g:airline_section_warning = ''
"let g:airline_section_x=''
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2   " show tabline only if there is more than 1 buffer
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
let airline#extensions#coc#error_symbol = 'x:'
let airline#extensions#coc#warning_symbol = '!:'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.branch = '⽀'
let g:airline_symbols.dirty= ' ♯'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '♩'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

"" built in plugins
let loaded_netrw = 0                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = expand('/usr/bin/python3')

"" coc

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-lists',
            \'coc-clangd',
            \'coc-highlight',
            \]

"" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"

" highlight yanked area
let g:highlightedyank_highlight_duration = 1000

"}}}

" ======================== Commands ============================= "{{{

au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold
au FocusGained,BufEnter * checktime                     " when to check if file has been changed from outside

" Term BufEnter
autocmd TermOpen * startinsert

" coc completion popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" fzf if passed argument is a folder
augroup folderarg
    " change working directory to passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

    " start fzf on passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'Files ' fnameescape(argv()[0]) | endif
augroup END

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" format with available file format formatter
command! -nargs=0 Format :call CocAction('format')

" organize imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" scratch buffer commands
command! Scratch call CreateScratchBuffer(1)
command! Scratchh call CreateScratchBuffer(0)

" timestamp
command! TimeStamp call InsertDateStamp()

"}}}

" ================== Custom Functions ===================== "{{{

" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" check if last inserted char is a backspace (used by coc pmenu)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
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

function! InsertDateStamp()
    let l:date = system('date +\%F')
    let l:oneline_date = split(date, "\n")[0]
    execute "normal! a" . oneline_date . "\<Esc>"
endfunction

"}}}

" ======================== Custom Mappings ====================== "{{{

"" main customs

"" multiple cursors
let g:VM_leader="\\"
let g:VM_default_mappings = 0

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<M-j>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<M-j>'           " replace visual C-n

"" the essentials
let mapleader=","

nnoremap ; :

nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
map <leader>s :Format<CR>

" buffer change
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" home behavior
map <Home> ^
imap <Home> <Esc>^i

" use a different register for delete and paste
" nnoremap d "_d
" vnoremap d "_d
" vnoremap p "_dP
" nnoremap x "_x

" " switch between splits using ctrl + shift + {left,right,up,down}
noremap <C-S-Down> <C-W><C-J>
nnoremap <C-S-Up> <C-W><C-K>
nnoremap <C-S-Right> <C-W><C-L>
nnoremap <C-S-Left> <C-W><C-H>

nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

" trim white spaces
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" comments
map <silent><nowait> <space>cl gc

"" FZF
nnoremap <silent> <leader>zf :Files<CR>
nmap <leader>zb :Buffers<CR>
nmap <leader>zc :Commands<CR>
nmap <leader>/ :Rg<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>sh :History/<CR>

" show mapping on all modes with F1
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

" multi cursor shortcuts
nmap <silent> <C-a> <Plug>(coc-cursors-word)
xmap <silent> <C-a> <Plug>(coc-cursors-range)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" other stuff
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>o :OR <CR>

" jump stuff
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cy <Plug>(coc-type-definition)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>cr <Plug>(coc-references)

" Choosewin
nmap - <Plug>(choosewin)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>a <Plug>(coc-codeaction-line)
xmap <leader>a <Plug>(coc-codeaction-selected)

" Show all diagnostics.
nnoremap <silent><nowait> <space>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

"}}}
