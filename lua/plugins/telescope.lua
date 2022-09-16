return function()
	local opts = { noremap = true, silent = true }

	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
				},
			},
		},
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

	vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
	vim.api.nvim_set_keymap(
		"n",
		"gb",
		"<cmd>lua require('telescope.builtin').buffers{ show_all_buffers = true }<cr>",
		opts
	)

	require("telescope").load_extension("file_browser")

	vim.api.nvim_set_keymap("n", "g0", "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
	vim.api.nvim_set_keymap("n", "gp", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", opts)
	vim.api.nvim_set_keymap("n", "gW", "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>", opts)
	vim.api.nvim_set_keymap("n", "<Leader>gc", "<cmd>lua require'telescope.builtin'.git_branches{}<CR>", opts)
	vim.api.nvim_set_keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", opts)
	vim.api.nvim_set_keymap("n", "gI", "<cmd>lua require'telescope.builtin'.lsp_implementations{}<CR>", opts)
	vim.api.nvim_set_keymap("n", "gk", "<cmd>lua require'telescope.builtin'.keymaps{}<CR>", opts)
	vim.api.nvim_set_keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)
	vim.api.nvim_set_keymap("n", "gv", "<cmd>lua require'telescope.builtin'.diagnostics{}<CR>", opts)
end
