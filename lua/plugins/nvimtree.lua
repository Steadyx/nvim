return function()
	local opts = { noremap = true, silent = true }
	require("nvim-tree").setup()
	vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", opts)
end
