return function()
	vim.schedule(function()
		vim.api.nvim_set_var("copilot_filetypes", { yaml = true })
		print(vim.inspect(vim.api.nvim_get_var("copilot_filetypes")))
	end)
end
