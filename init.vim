filetype plugin on

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))


" theme
Plug 'sainnhe/gruvbox-material'
" airline status bar
Plug 'vim-airline/vim-airline'
" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fzf itself
Plug 'junegunn/fzf'
" fuzzy search integration with fzf
Plug 'junegunn/fzf.vim'
" better rust integration
Plug 'rust-lang/rust.vim'
" better comments
Plug 'tpope/vim-commentary'
" git support
Plug 'tpope/vim-fugitive'
" git gutter
Plug 'airblade/vim-gitgutter'
" smooth scrolling
Plug 'psliwka/vim-smoothie'
" run common unix command in Vim
Plug 'tpope/vim-eunuch'
" surround
Plug 'tpope/vim-surround'
" autopairing
Plug 'jiangmiao/auto-pairs'
" highlight yanked area
Plug 'machakann/vim-highlightedyank'
" split and join oneliners into multiline
Plug 'AndrewRadev/splitjoin.vim'
" easier motion
Plug 'easymotion/vim-easymotion'
" expand regions increasingly
Plug 'terryma/vim-expand-region'
" multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" window chooser
Plug 't9md/vim-choosewin'

call plug#end()


" terminal 256 colors
set t_Co=256
" enable mouse
set mouse=a
" use system clipboard
set clipboard+=unnamedplus
" tabs
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent
" tab key actions
set expandtab smarttab
" highlight text during search
set incsearch ignorecase smartcase hlsearch
" TODO
set fillchars+=vert:\▏
" wrap long lines set by tw
set wrap breakindent
" text encoding
set encoding=utf-8
" enable numbers
set number
" tab title = file name
set title
" don't display last command
set noshowcmd
" for indentation plugin
set conceallevel=2
" split to the right
set splitright
" split below
set splitbelow
" auto wrap lines after 90 chars
set tw=90
" enables emojis :-)
set emoji
" set history limit to 1000 lines
set history=1000
" mindful and sensible backspace
set backspace=indent,eol,start
" persistent undo
set undofile
" undo temporary directory
set undodir=/tmp
" open all folds by default
set foldlevel=0
" visual feedback while substituting
set inccommand=nosplit
" TODO always show tabline
set showtabline=2
" use rg as grep
set grepprg=rg\ --vimgrep
" show current position
set ruler
" magic on for regex
set magic
" show matching brackets, parenthesis, etc
set showmatch
" unix as standard file type
set ffs=unix,dos,mac

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

" read when file is changed from outside
set autoread

" wildcards to ignore
set wildignore+=*/target/*,*/tmp/*,*.swp,*.pyc,*__pycache__/*

" theme
set background=dark

" gruvbox material settings
let g:gruvbox_material_background='hard'
let g:gruvbox_material_enable_italic=1

" theme enable
syntax enable
colorscheme gruvbox-material

" highlight matching parenthesis with a more visible color
hi MatchParen cterm=bold cterm=underline ctermfg=blue

" italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"
" --- Plugins ---
"

"" built in plugins
" disable netrw
let loaded_netrw = 0
" disable sql omni completion
let g:omni_sql_no_default_maps = 1
" disable python
let g:loaded_python_provider = 0
" disable perl
let g:loaded_perl_provider = 0
" disable ruby
let g:loaded_ruby_provider = 0
" define python3 binary
let g:python3_host_prog = expand('/usr/bin/python3')


"" Airline
" do not render empty sections
let g:airline_skip_empty_sections = 1
" file encoding skip expected string
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" enable tabline only if there is more than 1 buffer
let g:airline#extensions#tabline#buffer_min_count = 2
" show only the filename in the tabline tabs
let g:airline#extensions#tabline#fnamemod = ':t'
" error symbol for coc
let airline#extensions#coc#error_symbol = 'e:'
" warning symbol for coc
let airline#extensions#coc#warning_symbol = 'w:'
" initialize airline symbols if not defined
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" airline plaintext/unicode symbols
let g:airline_symbols.branch = '⽀'
let g:airline_symbols.dirty= ' ♯'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '♩'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

"" coc
" navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
" list of the extensions to make sure are always installed
let g:coc_global_extensions = ['coc-lists', 'coc-clangd', 'coc-highlight', 'coc-pyright',]

"" fzf
" fzf actions
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'}
" fzf layout
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
" fzf tag command (if available)
let g:fzf_tags_command = 'ctags -R'
" define fzf environment variables
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"

"" highlightyank
" highlight yanked area duration (1 second)
let g:highlightedyank_highlight_duration = 1000

"
" --- Commands --
"

" define types to syntax highlighting
" nasm
autocmd BufNewFile,BufRead *.S,*.s,*.asm,*.inc set syntax=nasm

" don't auto comment on newlines
au BufEnter * set fo-=c fo-=r fo-=o
" help in vertical split
au FileType help wincmd L
" remove trailing whitespaces
au BufWritePre * :%s/\s\+$//e
" highlight match on cursor hold (coc)
au CursorHold * silent call CocActionAsync('highlight')
" when to check if the file has been changed in another program
au FocusGained,BufEnter * checktime

" Insert mode when it enters terminal
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

"
" --- Functions ---
"

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

" show docs on things with <S-k>
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

" function to insert time stamp
function! InsertDateStamp()
    let l:date = system('date +\%F')
    let l:oneline_date = split(date, "\n")[0]
    execute "normal! a" . oneline_date . "\<Esc>"
endfunction

"
" --- Mappings ---
"

"" the essentials
" leader
let mapleader=","

nnoremap ; :

" open config file
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
" close buffer
nmap <leader>q :bd<CR>
" save
nmap <leader>w :w<CR>
" format (if available)
map <leader>s :Format<CR>

" buffer change
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" shift tab should remove 1 tab in insert mode
inoremap <S-Tab> <C-D>

" home behavior
map <Home> ^
imap <Home> <Esc>^i

" switch between splits using ctrl + shift + {left,right,up,down}
noremap <C-S-Down> <C-W><C-J>
nnoremap <C-S-Up> <C-W><C-K>
nnoremap <C-S-Right> <C-W><C-L>
nnoremap <C-S-Left> <C-W><C-H>
" switch between splits
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

" trim white spaces with F2
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" comments
map <silent><nowait> <space>cl gc

"" fzf
" show files
nnoremap <silent> <leader>zf :Files<CR>
" show buffers
nmap <leader>zb :Buffers<CR>
" show commands
nmap <leader>zc :Commands<CR>
" execute rg with fzf
nmap <leader>/ :Rg<CR>
" show commits
nmap <leader>gc :Commits<CR>
" show files under git
nmap <leader>gs :GFiles?<CR>
" show history
nmap <leader>sh :History/<CR>

" show mapping on all modes with F1
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

"" multiple cursors
let g:VM_leader="\\"
let g:VM_default_mappings = 0
" multiple cursors mappings
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<M-j>'
let g:VM_maps['Find Subword Under'] = '<M-j>'

" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc rename
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>o :OR <CR>

" coc jump to definition
nmap <leader>cd <Plug>(coc-definition)
" coc jump to type definition
nmap <leader>cy <Plug>(coc-type-definition)
" coc jump to implementation
nmap <leader>ci <Plug>(coc-implementation)
" coc jump to references (1 or multiple)
nmap <leader>cr <Plug>(coc-references)

" choosewin
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

