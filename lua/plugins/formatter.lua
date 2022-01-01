-- formatter
-- vim.api.nvim_exec(
-- 	[[

-- let g:vim_filetype_formatter_commands = {
--       \ 'lua': 'stylua -',
--       \ }

-- augroup FORMATTING
--     autocmd BufWritePre *.rs,*.c,*.tex,*.py,*.lua FiletypeFormat
-- augroup END

-- " autocmd! FORMATTING BufWritePre *

-- ]],
-- 	false
-- )

vim.api.nvim_exec(
	[[
augroup FORMATTING
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" autocmd! FORMATTING BufWritePre *
]],
	false
)
