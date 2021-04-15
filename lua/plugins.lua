-- Only required if you have packer in your `opt` pack
vim.cmd [[ packadd packer.nvim ]]
-- Compile when config changes
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
 -- Packer can manage itself as an optional plugin
   use { 'wbthomason/packer.nvim', opt = true }
 -- Git integration
  use {
	      'tpope/vim-fugitive',
	       config = require'plugins.fugitive'
      }
 -- Auto Formatting
  use {
      	'lukas-reineke/format.nvim',
	       config = require'plugins.format',
      }
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
  -- use { 'glepnir/lspsaga.nvim' }
 -- Completion engine
  use {
      	'nvim-lua/completion-nvim',
      	 config = require'plugins.completion'
      }
 -- Conquer of Completion, Language Server mainly for ESlint/Explorer
  use {
      	'neoclide/coc.nvim',
	       branch = 'release',
      }
 -- DevIcons for Telescope
  use { 'kyazdani42/nvim-web-devicons' }
 -- Colorscheme
  use {
        'glepnir/zephyr-nvim',
      	 config = require'plugins.colorscheme',
         as = 'colorscheme',
      }
 -- Vim Surround - Surrounding/deleting
  use { 'tpope/vim-surround' }
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
 -- Snippets from VSCode
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/vim-vsnip-integ' }
  use { 'hollowtree/vscode-vue-snippets' }
  use { 'sdras/vue-vscode-snippets' }
  use { 'RishabhRD/nvim-lsputils',
         config  = require'plugins.lsputils',
      }
 -- Auto comment
  use { 'b3nj5m1n/kommentary' }
 -- Telecope - A powerful/extensible fuzzy file searcher
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim',
         config = require'plugins.telescope',
      }
 -- Floatterm - a floating terminal for neovim
  use { 'numtostr/FTerm.nvim',
         config = require'plugins.floatterm',
      }
  use { 'kyazdani42/nvim-tree.lua',
         config = require'plugins.nvimtree',
      }
  use { 'windwp/nvim-autopairs',
        config = require'plugins.autopairs'
      }
end)
