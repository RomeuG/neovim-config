local LspConfig = require("lspconfig")

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local function fzf_goto_definition()
	local log = require("vim.lsp.log")

	local handler = function(_, result, ctx)
		if result == nil or vim.tbl_isempty(result) then
			local _ = log.info() and log.info(ctx.method, "No location found")
			return nil
		end

		require("fzf-lua").lsp_definitions({ sync = true })
	end

	return handler
end

local function fzf_goto_references()
	local log = require("vim.lsp.log")

	local handler = function(_, result, ctx)
		if result == nil or vim.tbl_isempty(result) then
			local _ = log.info() and log.info(ctx.method, "No location found")
			return nil
		end

		require("fzf-lua").lsp_references({ sync = true })
	end

	return handler
end

-- setup handlers with border
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	["textDocument/definition"] = fzf_goto_definition(),
	["textDocument/references"] = fzf_goto_references(),
}

-- floating windows with SANE BACKGROUND color
vim.cmd([[highlight NormalFloat ctermbg=black]])

-- OPTIONAL: LSP settings (for overriding per client)
vim.cmd([[highlight FloatBorder ctermfg=white]])

local function config(_config)
	local _capabilities = vim.lsp.protocol.make_client_capabilities()
	_capabilities.textDocument.completion.completionItem.snippetSupport = true

	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(_capabilities),
	}, _config or {})
end

local on_attach = function(client, bufnr)
	-- attach lsp signature
	require("lsp_signature").on_attach({
		bind = true,
		hint_enable = true,
		hint_prefix = "",
		floating_window = false,
		extra_trigger_chars = { "(", "," },
		handler_opts = { border = "single" },
	})

	local opts = { noremap = true, silent = true }

	-- general mappings
	-- jump to definition
	vim.api.nvim_set_keymap("n", "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- jump to implementation
	vim.api.nvim_set_keymap("n", "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- jump to type definition
	vim.api.nvim_set_keymap("n", "<leader>cy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- jump to references
	vim.api.nvim_set_keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- rename
	vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- documentation
	vim.api.nvim_set_keymap("n", "K", ":call Show_documentation()<CR>", opts)
	-- code action
	vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	-- line diagnostics
	vim.api.nvim_set_keymap("n", "gd", "<cmd>lua Show_line_diagnostics()<CR>", opts)

	-- formatting
	-- if client.resolved_capabilities.document_formatting then
	--     vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	-- end

	-- range formatting
	-- if client.resolved_capabilities.document_range_formatting then
	--     vim.api.nvim_set_keymap('v', '<leader>ff', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
	-- end

	-- document highlight
	if client.server_capabilities.documentHighlightProvider then
		vim.cmd([[
            hi! LspReferenceRead cterm=bold ctermbg=237
            hi! LspReferenceText cterm=bold ctermbg=237
            hi! LspReferenceWrite cterm=bold ctermbg=237
        ]])

		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})

		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})

		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

-- Diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = "x",
		source = "always",
	},
})

-- Lua
LspConfig.sumneko_lua.setup(config({
	on_attach = on_attach,
	handlers = handlers,
	flags = { debounce_text_changes = 500 },
	settings = {
		Lua = {
			completion = { workspaceWord = false },
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			telemetry = { enable = false },
		},
	},
}))

-- C/C++
LspConfig.clangd.setup(config({
	on_attach = on_attach,
	handlers = handlers,
	flags = { debounce_text_changes = 500 },
}))

-- Python
LspConfig.pyright.setup(config({
	on_attach = on_attach,
	handlers = handlers,
	flags = { debounce_text_changes = 500 },
}))

-- Rust
-- Rust LSP
-- LspConfig.rust_analyzer.setup(config({
-- 	flags = { debounce_text_changes = 500 },
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			["checkOnSave"] = { ["enable"] = true, ["command"] = "clippy" },
-- 			["cargo"] = { ["autoreload"] = true },
-- 		},
-- 	},
-- 	on_attach = on_attach,
-- 	handlers = handlers,
-- }))
-- Rust Tools
require("rust-tools").setup({
	server = config({
		on_attach = on_attach,
		handlers = handlers,
	}),
})

-- LaTeX
LspConfig.texlab.setup(config({
	on_attach = on_attach,
	handlers = handlers,
	flags = { debounce_text_changes = 500 },
}))

function Show_line_diagnostics()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = border,
		source = "if_many",
		prefix = "",
	}
	vim.diagnostic.open_float(nil, opts)
end
