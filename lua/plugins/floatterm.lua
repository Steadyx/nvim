return function()
	local Terminal = require("toggleterm.terminal").Terminal
	local current_path = os.getenv("PWD")
	local width = vim.go.columns
	local height = vim.go.lines

	local lazygit = Terminal:new({
		cmd = "lazygit",
		close_on_exit = true,
		dir = "git_dir",
		direction = "float",
		float_opts = {
			border = "double",
			height = height,
			width = width,
		},

		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
	})

	-- npm run dev in terminal
	local dev = Terminal:new({
		cmd = "nvm",
	})

	function _Dev()
		dev:open()
	end

	function _Lazygit_toggle()
		lazygit:toggle()
	end

	vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap(
		"n",
		"<leader>d",
		":TermExec cmd='nvm use 8 && npm run build && nvm use node && exit' direction='float'<CR>",
		{ noremap = true, silent = true }
	)
end
