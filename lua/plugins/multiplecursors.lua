-- multiple cursors
vim.api.nvim_exec(
	[[

let g:VM_leader="\\"
let g:VM_default_mappings = 0
" multiple cursors mappings
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<M-j>'
let g:VM_maps['Find Subword Under'] = '<M-j>'

]],
	false
)
