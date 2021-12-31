-- commands
vim.api.nvim_exec(
	[[

" help in vertical split
au FileType help wincmd L

" nasm
autocmd BufNewFile,BufRead *.S,*.s,*.asm,*.inc set filetype=asm syntax=nasm commentstring=;\%s

" remove trailing whitespaces
au BufWritePre * :%s/\s\+$//e

" don't auto comment on newlines
au BufEnter * set fo-=c fo-=r fo-=o

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

]],
	false
)
