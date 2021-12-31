function Tdump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. Tdump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

vim.api.nvim_exec(
	[[

" show docs on things with <S-k>
function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction

" scratch function
function CreateScratchBuffer(vertical)
    if a:vertical == 1
        :vnew
    else
        :new
    endif
    :setlocal buftype=nofile
    :setlocal bufhidden=hide
    :setlocal noswapfile
    :set ft=scratch
endfunction

" function to insert time stamp
function! InsertDateStamp()
    let l:date = system('date +\%F')
    let l:oneline_date = split(date, "\n")[0]
    execute "normal! a" . oneline_date . "\<Esc>"
endfunction

]],
	false
)
