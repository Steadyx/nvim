-- Only required if you have packer in your `opt` pack
vim.cmd [[ packadd packer.nvim ]]

-- Compile when config changes
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }
 -- Quickscope - Fast horizontal movement
  use { 
	'unblevable/quick-scope',
	 config = require'plugins.quickscope',
      }
  -- Neovim Treesitter syntax highlighting
  use { 
        'nvim-treesitter/nvim-treesitter', 
	 config = require'plugins.treesitter',
	 run = ':TSUpdate', 
      }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
 -- Neovim Language Server config
  use { 
	'neovim/nvim-lspconfig', 
	 config = require'plugins.lsp',
      }
 -- Completion engine
  use { 
	'nvim-lua/completion-nvim', 
     	config = require'plugins.completion'
      }
 -- Conquer of Completion, Language Server mainly for ESlint/Explorer
  use { 
	'neoclide/coc.nvim',
	 branch = 'release',
	 config = require'plugins.coc'
      }
 -- Telecope - A powerful/extensible fuzzy file searcher
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 
	'nvim-telescope/telescope.nvim', 
	 config = require'plugins.telescope',
      }
 -- Allow vim config through lua
  use { 'svermeulen/vimpeccable' }
 -- DevIcons for Telescope
  use { 'kyazdani42/nvim-web-devicons' }
  -- Colorscheme
  use { 
        'christianchiarulli/nvcode-color-schemes.vim', 
	 config = require'plugins.colorscheme',
         as = 'colorscheme', 
  -- Vim Surround - Surrounding/deleting
  use { 'tpope/vim-surround' }
      }
  -- Emmet
  use { 'mattn/emmet-vim' }
  -- Cheat Sheat
  use { 'RishabhRD/popfix' }
  use {
        'RishabhRD/nvim-cheat.sh',
      }
  -- Status line helper
  use {
        'glepnir/galaxyline.nvim',
         branch = 'main',
         -- your statusline
	 config = require'plugins.statusline',
         -- some optional icons
         requires = {'kyazdani42/nvim-web-devicons', opt = true}
      }
end)
