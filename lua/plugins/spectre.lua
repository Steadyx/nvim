return function()
	vim.cmd([[nnoremap <leader>S <cmd>lua require('spectre').open()<CR>]])
	require("spectre").setup()
end
