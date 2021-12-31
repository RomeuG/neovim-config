-- lualine
local M = {}

-- LuaLine object
local LuaLine = require('lualine')

-- theme
M.theme = function()
    local colors = {
      black        = '#1d2021',
      white        = '#fbf1c7',
      red          = '#cc241d',
      green        = '#98971a',
      blue         = '#458588',
      yellow       = '#d79921',
      gray         = '#a89984',
      darkgray     = '#3c3836',
      lightgray    = '#504945',
      inactivegray = '#7c6f64',
    }

    return {
      normal = {
        a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.lightgray, fg = colors.white },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.inactivegray, fg = colors.black },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.inactivegray, fg = colors.black },
      },
      inactive = {
        a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
        b = { bg = colors.darkgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
    }
end

LuaLine.setup({
    options = {
        always_divide_middle = false,
        icons_enabled = false,
        theme = M.theme(),
    },
    sections = {
        lualine_b = { 'branch', 'diff',
            {
                'diagnostics',
                colored = true,
            },
        },
        lualine_c = {'filename', {
            function()
                return '%='
            end,
            component_separators = {left = '', right = ''},
        }, {
            function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
            end,
            color = { fg = '#ffffff', gui = 'bold' },
            component_separators = {left = '', right = ''},
        }},
        lualine_x = { 'filetype' },
    },
    tabline = {
        lualine_a = { { 'buffers', section_separators = {left = '', right = ''}, mode = 0 }, },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
})
