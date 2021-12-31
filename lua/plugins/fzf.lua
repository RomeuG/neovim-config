-- Fzf object
local Fzf = require("fzf-lua")
local FzfActions = require("fzf-lua.actions")

vim.env.FZF_DEFAULT_OPTS = "--layout=reverse --inline-info"
vim.env.FZF_DEFAULT_COMMAND =
	"rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"
Fzf.setup({
	files = {
		actions = {
			["ctrl-x"] = FzfActions.file_split,
			["ctrl-v"] = FzfActions.file_vsplit,
		},
	},
	git = {
		status = {
			actions = {
				["ctrl-x"] = FzfActions.file_split,
				["ctrl-v"] = FzfActions.file_vsplit,
			},
		},
	},
	keymap = {
		builtin = {
			["S-down"] = "preview-page-down",
			["S-up"] = "preview-page-up",
		},
	},
})

-- Commands
-- show files
vim.api.nvim_set_keymap("n", "<leader>zF", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
-- show buffers
vim.api.nvim_set_keymap(
	"n",
	"<leader>zb",
	"<cmd>lua require('fzf-lua').buffers()<CR>",
	{ noremap = true, silent = true }
)
-- show commands
vim.api.nvim_set_keymap("n", "<leader>zc", "<cmd>lua require('fzf-lua').commands()<CR>", {})
-- manpages
vim.api.nvim_set_keymap("n", "<leader>zm", "<cmd>lua require('fzf-lua').man_pages()<CR>", {})
-- execute rg with fzf
vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>lua require('fzf-lua').grep_project()<CR>", {})

-- show commits
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>lua require('fzf-lua').git_commits()<CR>", {})
-- show files under git
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>lua require('fzf-lua').git_files()<CR>", {})

-- show mappings
vim.api.nvim_set_keymap("n", "<F1>", "<cmd>lua require('fzf-lua').keymaps()<CR>", {})

vim.api.nvim_exec(
	[[

command! FzfBuffers execute "lua require('fzf-lua').buffers()"
command! FzfFiles execute "lua require('fzf-lua').files()"
command! FzfOldfiles execute "lua require('fzf-lua').oldfiles()"
command! FzfQuickfix execute "lua require('fzf-lua').quickfix()"
command! FzfLoclist execute "lua require('fzf-lua').loclist()"
command! FzfLines execute "lua require('fzf-lua').lines()"
command! FzfBlines execute "lua require('fzf-lua').blines()"
command! FzfTabs execute "lua require('fzf-lua').tabs()"
command! FzfArgs execute "lua require('fzf-lua').args()"

command! FzfGrep execute "lua require('fzf-lua').grep()"
command! FzfGrepLast execute "lua require('fzf-lua').grep_last()"
command! FzfGrepCword execute "lua require('fzf-lua').grep_cword()"
command! FzfGrepCWORD execute "lua require('fzf-lua').grep_cWORD()"
command! FzfGrepVisual execute "lua require('fzf-lua').grep_visual()"
command! FzfGrepProject execute "lua require('fzf-lua').grep_project()"
command! FzfGrepCurbuf execute "lua require('fzf-lua').grep_curbuf()"
command! FzfGrepLiveCurbuf execute "lua require('fzf-lua').lgrep_curbuf()"
command! FzfGrepLive execute "lua require('fzf-lua').live_grep()"
command! FzfGrepLiveResume execute "lua require('fzf-lua').live_grep_resume()"
command! FzfGrepLiveGlob execute "lua require('fzf-lua').live_grep_glob()"
command! FzfGrepLiveNative execute "lua require('fzf-lua').live_grep_native()"

command! FzfGitFiles execute "lua require('fzf-lua').git_files()"
command! FzfGitStatus execute "lua require('fzf-lua').git_status()"
command! FzfGitCommits execute "lua require('fzf-lua').git_commits()"
command! FzfGitBcommits execute "lua require('fzf-lua').git_bcommits()"
command! FzfGitBranches execute "lua require('fzf-lua').git_branches()"

command! FzfLspReferences execute "lua require('fzf-lua').lsp_references()"
command! FzfLspDefinitions execute "lua require('fzf-lua').lsp_definitions()"
command! FzfLspDeclarations execute "lua require('fzf-lua').lsp_declarations()"
command! FzfLspTypedefs execute "lua require('fzf-lua').lsp_typedefs()"
command! FzfLspImplementations execute "lua require('fzf-lua').lsp_implementations()"
command! FzfLspDocumentSymbols execute "lua require('fzf-lua').lsp_document_symbols()"
command! FzfLspWorkspaceSymbols execute "lua require('fzf-lua').lsp_workspace_symbols()"
command! FzfLspLiveWorkspaceSymbols execute "lua require('fzf-lua').lsp_live_workspace_symbols()"
command! FzfLspCodeActions execute "lua require('fzf-lua').lsp_code_actions()"
command! FzfLspDocumentDiagnostics execute "lua require('fzf-lua').lsp_document_diagnostics()"
command! FzfLspWorkspaceDiagnostics execute "lua require('fzf-lua').lsp_workspace_diagnostics()"

command! FzfMiscResume execute "lua require('fzf-lua').resume()"
command! FzfMiscBuiltin execute "lua require('fzf-lua').builtin()"
command! FzfMiscHelpTags execute "lua require('fzf-lua').help_tags()"
command! FzfMiscManPages execute "lua require('fzf-lua').man_pages()"
command! FzfMiscColorschemes execute "lua require('fzf-lua').colorschemes()"
command! FzfMiscCommands execute "lua require('fzf-lua').commands()"
command! FzfMiscCommandHistory execute "lua require('fzf-lua').command_history()"
command! FzfMiscSearchHistory execute "lua require('fzf-lua').search_history()"
command! FzfMiscMarks execute "lua require('fzf-lua').marks()"
command! FzfMiscJumps execute "lua require('fzf-lua').jumps()"
command! FzfMiscChanges execute "lua require('fzf-lua').changes()"
command! FzfMiscRegisters execute "lua require('fzf-lua').registers()"
command! FzfMiscKeymaps execute "lua require('fzf-lua').keymaps()"
command! FzfMiscSpellSuggest execute "lua require('fzf-lua').spell_suggest()"
command! FzfMiscTags execute "lua require('fzf-lua').tags()"
command! FzfMiscBtags execute "lua require('fzf-lua').btags()"
command! FzfMiscFiletypes execute "lua require('fzf-lua').filetypes()"
command! FzfMiscPackadd execute "lua require('fzf-lua').packadd()"

]],
	false
)
