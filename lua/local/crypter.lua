local api = vim.api
local fn = vim.fn

local function trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

local function newline_remove(s)
	return (string.gsub(s, "\n", ""))
end

local function encrypt()
	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")

	local line_start = vstart[2]
	local line_end = vend[2]

	local lines = vim.fn.getline(line_start, line_end)

	-- NOTE(romeu): this might work anyways
	local text = table.concat(lines, "\n")
	local password = vim.fn.input("Password: ")
	local password2 = vim.fn.input("Verify password: ")

	if password ~= password2 then
		return
	end

	-- TODO(romeu): this command is deprecated.
	-- try to look for a better alternative
	local command_encrypt = 'echo -n "'
		.. password
		.. '" | openssl aes-256-cbc -a -in <(echo "'
		.. text
		.. '") -pass stdin 2> /dev/null'
	local encrypted_string = vim.fn.system(command_encrypt)
	local encrypted_string2 = string.gmatch(encrypted_string, "[^\r\n]+")

	local replacement_table = {}
	for token in encrypted_string2 do
		table.insert(replacement_table, token)
	end

	local current_buf = api.nvim_get_current_buf()
	api.nvim_buf_set_lines(current_buf, line_start - 1, line_end, false, replacement_table)
end

local function decrypt()
	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")

	local line_start = vstart[2]
	local line_end = vend[2]

	-- NOTE(romeu): this might work anyways
	local lines = vim.fn.getline(line_start, line_end)
	local text = table.concat(lines, "\n")

	local password = vim.fn.input("Password: ")

	-- TODO(romeu): this command is deprecated.
	-- try to look for a better alternative
	local command_decrypt = 'echo -n "'
		.. password
		.. '" | openssl aes-256-cbc -a -d -in <(echo "'
		.. text
		.. '") -pass stdin 2> /dev/null'
	local decrypted_string = fn.system(command_decrypt)
	local decrypted_string2 = string.gmatch(decrypted_string, "[^\r\n]+")

	local replacement_table = {}
	for token in decrypted_string2 do
		table.insert(replacement_table, token)
	end

	local current_buf = api.nvim_get_current_buf()
	api.nvim_buf_set_lines(current_buf, line_start - 1, line_end, false, replacement_table)
end

api.nvim_create_user_command("VisualEncrypt", encrypt, { range = true })
api.nvim_create_user_command("VisualDecrypt", decrypt, { range = true })
