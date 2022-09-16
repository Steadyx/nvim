return function()
	vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<space>fd", ":Telescope folder_browser<CR>", { noremap = true })
end
