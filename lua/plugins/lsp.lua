return function()
	-- local nvim_lsp = require("lspconfig")
	--[[ local opts = { noremap = true, silent = true }

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

	local handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	}

	vim.keymap.set("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.keymap.set("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

	local on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<space>wl",
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
			opts
		)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		client.server_capabilities.documentFormattingProvider = true
	end

	local servers = {
		"sourcekit",
		"cssls",
		"rust_analyzer",
		"tsserver",
		"lua_ls",
		"gopls",
		"bashls",
		"html",
		"pyright",
	}

	vim.lsp.buf.format({ timeout_ms = 2000 })

	for _, lsp in pairs(servers) do
		nvim_lsp[lsp].setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
			on_attach = on_attach,
			handlers = handlers,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end ]]

	-- Setup language servers.
	local lspconfig = require("lspconfig")
	lspconfig.pyright.setup({})
	lspconfig.tsserver.setup({})
	  lspconfig.rust_analyzer.setup({
		-- Server-specific settings. See `:help lspconfig-setup`
		settings = {
			["rust-analyzer"] = {},
		},
	})

	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	})
end
