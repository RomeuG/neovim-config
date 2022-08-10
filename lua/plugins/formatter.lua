-- formatter
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Neoformat<CR>', { silent = true, noremap = true })

-- vim.api.nvim_exec(
-- 	[[
-- augroup FORMATTING
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
--   au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
-- augroup END

-- autocmd! FORMATTING BufWritePre *
-- ]],
-- 	false
-- )
