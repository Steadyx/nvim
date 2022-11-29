return function()
	require("urlview").setup({
		default_picker = "native",
		unique = false,
	})

	vim.keymap.set("n", "<leader>u", "<Cmd>UrlView<CR>", { desc = "view buffer URLs" })
end
