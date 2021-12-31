local path = require("plenary.path")
require("session_manager").setup({
    sessions_dir = path:new(vim.fn.stdpath("data"), "sessions"),
    path_replacer = "__",
    colon_replacer = "++",
    autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
    autosave_last_session = false,
    autosave_ignore_not_normal = true,
})

