return function()
	require("urlview").setup({
		default_picker = "telescope",
	})
	vim.api.nvim_set_keymap("n", "gl", "<cmd>Telescope urlview<cr>", { noremap = true, silent = true })
	require("telescope").load_extension("urlview")
end
