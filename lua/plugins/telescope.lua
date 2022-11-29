return function()
	local opts = { noremap = true, silent = true }

	-- ignore .git and node_modules
	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
				},
			},
		},
		file_ignore_patterns = { "node_modules", ".git", ".lua" },
		pickers = {
			find_files = {
				theme = "dropdown",
			},
			lsp_document_symbols = {
				theme = "dropdown",
			},
			git_branches = {
				theme = "dropdown",
			},
			lsp_references = {
				theme = "dropdown",
				layout_config = {
					width = 0.6,
				},
			},
			live_grep = {
				theme = "dropdown",
			},
			buffers = {
				theme = "dropdown",
				mappings = {
					i = {
						["<C-d>"] = require("telescope.actions").delete_buffer,
					},
					n = {
						["<C-d>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
			diagnositcs = {
				theme = "dropdown",
			},
		},
		extensions = {
			file_browser = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					vertical = { mirror = false },
				},
			},
		},
	})

	vim.keymap.set(
		"n",
		"<c-p>",
		"<cmd>lua require('telescope.builtin').find_files({ file_ignore_patterns = { 'node_modules', '.git' }})<CR>",
		opts
	)
	-- remove a buffer
	vim.keymap.set("n", "gb", "<cmd>lua require('telescope.builtin').buffers{ show_all_buffers = true }<cr>", opts)

	require("telescope").load_extension("file_browser")

	vim.keymap.set("n", "g0", "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
	vim.keymap.set("n", "gp", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", opts)
	vim.keymap.set("n", "gP", "<cmd>lua require'telescope.builtin'.grep_string{}<CR>", opts)
	vim.keymap.set("n", "gW", "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>", opts)
	vim.keymap.set("n", "<Leader>gc", "<cmd>lua require'telescope.builtin'.git_branches{}<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", opts)
	vim.keymap.set("n", "gI", "<cmd>lua require'telescope.builtin'.lsp_implementations{}<CR>", opts)
	vim.keymap.set("n", "gk", "<cmd>lua require'telescope.builtin'.keymaps{}<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)
	vim.keymap.set("n", "gv", "<cmd>lua require'telescope.builtin'.diagnostics{}<CR>", opts)
end
