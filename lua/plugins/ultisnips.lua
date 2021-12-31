require("cmp_nvim_ultisnips").setup({})
vim.g.UltiSnipsEnableSnipMate = 0
vim.g.UltiSnipsRemoveSelectModeMappings = 0
vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"

vim.api.nvim_exec(
	[[

augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END

]],
	false
)
