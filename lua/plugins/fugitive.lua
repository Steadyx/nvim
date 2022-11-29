return function()
	local opts = { noremap, silent = true }
	vim.keymap.set("n", "<Leader>gh", ":diffget //3<CR>", opts)
	vim.keymap.set("n", "<Leader>gu", ":diffget //2<CR>", opts)
	vim.keymap.set("n", "gs", ":G<CR>", opts)
end
