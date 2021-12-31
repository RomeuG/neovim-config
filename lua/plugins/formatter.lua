-- formatter
vim.api.nvim_exec([[

let g:vim_filetype_formatter_commands = {
      \ 'lua': 'stylua -',
      \ }

autocmd BufWritePre *.rs,*.c,*.tex,*.py,*.lua FiletypeFormat

]], false)
