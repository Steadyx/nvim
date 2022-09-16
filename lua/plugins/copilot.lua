return function()
	vim.schedule(function()
		vim.api.nvim_set_var("copilot_filetypes", { yaml = true, hbs = true })
	end)
end
