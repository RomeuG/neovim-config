" general

set makeprg=cargo

" Rust documentation checking

function! RustDocs()
    let l:word = expand("<cword>")
    :call RustMan(word)
endfunction

function! RustMan(word)
    let l:command  = ':split | :te rusty-man ' . a:word
    execute command
endfunction

:command! -nargs=1 Rman call RustMan(<f-args>)

" commands
autocmd TermClose term://*:rusty-man* q

" keybindings
nmap <S-l> :call RustDocs()<CR>
map <C-b> :!clear; cargo check<CR>

" abbreviations
abclear
"ia dd #[derive(Debug)]
