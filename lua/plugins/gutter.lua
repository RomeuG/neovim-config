vim.api.nvim_exec(
	[[

highlight clear SignColumn
let g:gitgutter_set_sign_backgrounds = 1


 highlight GitGutterAdd    guifg=#009900 ctermfg=2
 highlight GitGutterChange guifg=#bbbb00 ctermfg=3
 highlight GitGutterDelete guifg=#ff2222 ctermfg=1

]],
	false
)
