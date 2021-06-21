return function()
  local configs  = require'utils'.prerequire'nvim-treesitter.configs'

  if not configs then
    vim.cmd [[echom 'Cannot load nvim-treesitter.configs']]
  end

  configs.setup {
    ennsure_installed = 'all',
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    },
    indent = {
      enble = true
    },
    refactor = {
      highlight_definitions = {
        enable = true
      },
    },
  }
end
