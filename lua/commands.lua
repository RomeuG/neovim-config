--
-- autocommands
--

local U = require("utils")

-- Highlight on yank
vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "TermCursor", timeout = "400" })
	end,
})

-- help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- when to check if the file has been changed in another program
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = "*",
	command = "checktime",
})

-- insert mode when it enters terminal
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	command = [[
     if line("'\"") > 0 && line("'\"") <= line("$")
         exe "normal! g`\""
     endif
    ]],
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- nasm
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.S", "*.s", "*.asm", "*.inc" },
	command = "set filetype=asm syntax=nasm commentstring=;\\%s",
})

-- remove trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- do not autocoment on newlines
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- exit quickfix window on enter keypress
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	command = "nnoremap <buffer> <CR> <CR>:cclose<CR>",
})

-- save folds
vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost" }, {
	callback = function(ev)
		if not U.is_buf_huge(ev.buf) then
			vim.cmd([[silent! mkview]])
		end
	end,
})

-- load folds
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function(ev)
		if not U.is_buf_huge(ev.buf) then
			vim.cmd([[silent! loadview]])
		end
	end,
})

--
-- user commands
--

vim.api.nvim_create_user_command("Scratch", function()
	vim.cmd("call CreateScratchBuffer(1)")
end, {})

vim.api.nvim_create_user_command("Scratchh", function()
	vim.cmd("call CreateScratchBuffer(0)")
end, {})

vim.api.nvim_create_user_command("TimeStamp", function()
	vim.cmd("call InsertDateStamp()")
end, {})

-- selected text encryption/decryption
vim.api.nvim_create_user_command("GpgEncrypt", "'<,'>!gpg --encrypt -r \"Romeu Gomes\" | xxd -p", { range = true })
vim.api.nvim_create_user_command(
	"GpgDecrypt",
	"'<,'>!xxd -r -p | gpg --quiet --decrypt -r \"Romeu Gomes\" -",
	{ range = true }
)
