-- lexima (TODO: convert to actual lua instead of evaluating vimscript)
-- taken from (https://github.com/ryotatake/dotfiles/blob/de8762028f249f5716df377fb8cb3b9013305c83/.vim/autoload/my_settings/plugins.vim)
vim.api.nvim_exec(
	[[

call lexima#add_rule({'char': '"', 'at': '\%#\w'})
call lexima#add_rule({'char': "'", 'at': '\%#\w'})
call lexima#add_rule({'char': "(", 'at': '\%#\w'})
call lexima#add_rule({'char': "{", 'at': '\%#\w'})
call lexima#add_rule({'char': "[", 'at': '\%#\w'})
call lexima#add_rule({'char': "`", 'at': '\%#\w'})

call lexima#add_rule({'char': '"', 'at': '\w\%#'})

call lexima#add_rule({'char': '"', 'at': '\w\%#"', 'leave': 1})
call lexima#add_rule({'char': "'", 'at': '\w\%#'})
call lexima#add_rule({'char': "'", 'at': '\w\%#''', 'leave': 1})
call lexima#add_rule({'char': "`", 'at': '\w\%#'})
call lexima#add_rule({'char': "`", 'at': '\w\%#`', 'leave': 1})

call lexima#add_rule({'char': '<Space>', 'at': '(\%#)', 'input_after': '<Space>'})
call lexima#add_rule({'char': ')', 'at': '\%# )', 'leave': 2})
call lexima#add_rule({'char': '<BS>', 'at': '( \%# )', 'delete': 1})
call lexima#add_rule({'char': '<Space>', 'at': '{\%#}', 'input_after': '<Space>'})
call lexima#add_rule({'char': '}', 'at': '\%# }', 'leave': 2})
call lexima#add_rule({'char': '<BS>', 'at': '{ \%# }', 'delete': 1})

]],
	false
)
