return function()
	require("null-ls").setup({
		sources = {
			require("null-ls").builtins.formatting.stylua,
			require("null-ls").builtins.formatting.prettier,
			require("null-ls").builtins.diagnostics.eslint,
		},
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
			end
		end,
	})
end
