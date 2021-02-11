return function() 
 local saga = require 'lspsaga'
 local opts = { noremap=true, silent=true }
 local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

 buf_set_keymap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
 buf_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)

 saga.init_lsp_saga()
end
