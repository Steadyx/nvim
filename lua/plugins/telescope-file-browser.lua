return function()
	vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
	vim.keymap.set("n", "<space>fd", ":Telescope folder_browser<CR>", { noremap = true })
end
