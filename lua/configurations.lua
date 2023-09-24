vim.o.completeopt = "menuone,noselect"
-- Set leader as space
local opts = { noremap = true, silent = true }
-- Remap Leader to Space
vim.g.mapleader = " "
-- Save with <Leader> w
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
-- Quit everything with <Leader> x
vim.keymap.set("n", "<Leader>x", ":qa!<CR>", opts)
-- Quit without saving  <Leader> q
vim.keymap.set("n", "<Leader>z", ":q!<CR>", opts)
-- create a keymap for cdo quickfix, open floating window to rename
vim.keymap.set("n", "<Leader>rr", ":cdo s//", opts)
-- cfdo up to update files
vim.keymap.set("n", "<Leader>uu", ":cfdo up<CR>", opts)
-- open quickfix list
vim.keymap.set("n", "<Leader>qo", ":copen<CR>", opts)

vim.o.stl = " "
vim.o.wbr = vim.o.stl

vim.cmd([[ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" ]])
vim.cmd([[ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" ]])
vim.cmd([[ set number relativenumber ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set tabstop=2 ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ set wrap ]])
vim.cmd([[ set linebreak ]])

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd([[ call system('kitty @ set-spacing padding=0 &') ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd([[ call system('kitty @ set-spacing padding=10 &') ]])
	end,
})

function _G.clear_macro(register)
	vim.fn.setreg(register, "")
end
-- Define a <plug> keymap that calls the clear_macro function with the next character
vim.keymap.set("n", "<plug>(clear_macro)", function()
	-- Use nvim_echo to print to the command line
	vim.api.nvim_echo({ { "clearing macro ", "Normal" }, { vim.v.char, "String" } }, true, {})
	return "<cmd>lua clear_macro('" .. vim.v.char .. "')<cr>"
end, { expr = true, noremap = true })

-- Define a normal keymap that waits for another character and triggers the <plug> keymap
vim.keymap.set("n", "<leader>d", "<plug>(clear_macro)", { noremap = true })

vim.o.termguicolors = true

vim.keymap.set("i", "jj", "<Esc>", opts)
