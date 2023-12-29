local M = {}

M.map = function(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command)
end

M.nmap = function(shortcut, command)
  M.map('n', shortcut, command)
end

M.imap = function(shortcut, command)
  M.map('i', shortcut, command)
end

M.vmap = function(shortcut, command)
  M.map('v', shortcut, command)
end

M.tmap = function(shortcut, command)
  M.map('t', shortcut, command)
end

M.create_command = function(name, command)
  vim.api.nvim_create_user_command(name, command, {nargs = '*'})
end

-- taken from
-- https://github.com/RaafatTurki/venom/blob/ba7158bb1fe69ff68a5ee6611b1c99eb15813164/lua/helpers/utils.lua
function M.is_file_huge(file_path)
  local huge_buffer_size = 1000000 -- 1MB
  local ok, stats = pcall(vim.loop.fs_stat, file_path)
  if ok and stats then return stats.size > huge_buffer_size end
end

function M.is_buf_huge(buf)
  return M.is_file_huge(vim.api.nvim_buf_get_name(buf))
end

return M
