return function()
	require("zen-mode").setup({})

	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<Leader>c", "<cmd>lua require'zen-mode'.toggle({})<cr>", {})
end
