local LspConfig = require("lspconfig")

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
		handler_opts = {
			border = "single",
		},
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
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
          hi LspReferenceRead cterm=bold ctermbg=237
          hi LspReferenceText cterm=bold ctermbg=237
          hi LspReferenceWrite cterm=bold ctermbg=237
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]],
			false
		)
	end
end

LspConfig.sumneko_lua.setup(config({
	on_attach = on_attach,
	flags = { debounce_text_changes = 500 },
	settings = {
		Lua = {
			completion = {
				workspaceWord = false,
			},
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}))

-- C/C++
LspConfig.clangd.setup(config({
	on_attach = on_attach,
	flags = { debounce_text_changes = 500 },
}))

-- Python
LspConfig.pyright.setup(config({
	on_attach = on_attach,
	flags = { debounce_text_changes = 500 },
}))

-- Rust
LspConfig.rust_analyzer.setup(config({
	flags = { debounce_text_changes = 500 },
	settings = {
		["rust-analyzer"] = {
			["checkOnSave"] = {
				["enable"] = true,
				["command"] = "clippy",
			},
			["cargo"] = {
				["autoreload"] = true,
			},
		},
	},
	on_attach = on_attach,
}))

-- LaTeX
LspConfig.texlab.setup(config({
	on_attach = on_attach,
	flags = { debounce_text_changes = 500 },
}))

function Show_line_diagnostics()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		},
		source = "if_many",
		prefix = "",
	}
	vim.diagnostic.open_float(nil, opts)
end

vim.api.nvim_exec(
	[[

" Format
" command! Format execute 'lua vim.lsp.buf.formatting()'

" inlay hints
" nnoremap <Leader>T :lua require'lsp_extensions'.inlay_hints()
autocmd InsertEnter *.rs :lua require('lsp_extensions').inlay_hints{ prefix = " » ", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

]],
	false
)
