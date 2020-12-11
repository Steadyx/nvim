return function()
  local configs  = require'utils'.prerequire'nvim-treesitter.configs'

  if not configs then 
    vim.cmd [[echom 'Cannot load nvim-treesitter.configs']]
  end

  configs.setup {
    ensure_installed = "all",
    highlight = {
      enable = true,
    },
    indent = {
      enble = true
    }, 
    refactor = {
      highlight_definitions = { 
        enable = true 
      },
      highlight_current_scope = { 
        enable = true 
      },
    },
  }
end
