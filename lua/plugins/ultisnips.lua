require("cmp_nvim_ultisnips").setup({})
vim.g.UltiSnipsEnableSnipMate = 0
vim.g.UltiSnipsRemoveSelectModeMappings = 0

-- the following UltiSnipsExpandTrigger is EXTREMELY SLOW!!!
-- just put some keybind you will never ever use
-- also, never seemed to need this anyways
vim.g.UltiSnipsExpandTrigger = "<C-S-j>"
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
