-- Only required if you have packer in your `opt` pack
vim.cmd [[ packadd packer.nvim ]]
-- Compile when config changes
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }
    -- Git integration
    use { 'tpope/vim-fugitive', config = require 'plugins.fugitive' }
    -- Auto Formatting
    use { 'lukas-reineke/format.nvim', config = require 'plugins.format' }
    -- Quickscope - Fast horizontal movement
    use { 'unblevable/quick-scope', config = require 'plugins.quickscope' }
    -- Colorscheme
    use {
        'glepnir/zephyr-nvim',
        config = require 'plugins.colorscheme',
        as = 'colorscheme'
    }
    use { "folke/twilight.nvim", config = require 'plugins.twilight' }
    -- Neovim Treesitter syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        config = require 'plugins.treesitter',
        run = ':TSUpdate'
    }
    -- Neovim Language Server config
    use { 'neovim/nvim-lspconfig', config = require 'plugins.lsp' }
    -- API atop the native lang server
    use { 'glepnir/lspsaga.nvim', config = require 'plugins.lspsaga' }
    -- Gitgutter
    use { 'lewis6991/gitsigns.nvim', config = require 'plugins.gitsigns' }
    -- Completion engine
    use { 'hrsh7th/nvim-compe', config = require 'plugins.completion' }
    -- DevIcons for Telescope
    use { 'kyazdani42/nvim-web-devicons' }
    -- Vim Surround - Surrounding/deleting
    use { 'tpope/vim-surround' }
    -- Emmet
    use { 'mattn/emmet-vim' }
    -- Cheat Sheat
    use { 'RishabhRD/popfix' }
    use { 'RishabhRD/nvim-cheat.sh' }
    -- Status line helper
    use { 'datwaft/bubbly.nvim', config = require 'plugins.statusline' }
    -- Snippets from VSCode
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/vim-vsnip-integ' }
    use { 'dsznajder/vscode-es7-javascript-react-snippets' }
    use { 'hollowtree/vscode-vue-snippets' }
    use { 'sdras/vue-vscode-snippets' }
    use { 'RishabhRD/nvim-lsputils', config = require 'plugins.lsputils' }
    -- Auto comment
    use { 'b3nj5m1n/kommentary' }
    -- Telecope - A powerful/extensible fuzzy file searcher
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim', branch = 'async_jobs_v2' }
    use {
        'nvim-telescope/telescope.nvim',
        branch = 'async_v2',
        config = require 'plugins.telescope'
    }
    -- Floatterm - a floating terminal for neovim
    use { 'numtostr/FTerm.nvim', config = require 'plugins.floatterm' }
    -- Tree explorer
    use { 'kyazdani42/nvim-tree.lua', config = require 'plugins.nvimtree' }
    -- Autopairing
    use { 'windwp/nvim-autopairs', config = require 'plugins.autopairs' }
    -- Hop to any character
    use { 'phaazon/hop.nvim', config = require 'plugins.hop' }
    -- Minimise screen clutter
    use { 'folke/zen-mode.nvim', config = require 'plugins.zenmode' }
    -- Splash screen
    use { 'glepnir/dashboard-nvim', config = require 'plugins.dashboard' }
    -- Iconify lsp text
    use { 'onsails/lspkind-nvim', config = require 'plugins.lspKind' }
    -- another good git extension
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = require 'plugins.neogit'
    }
    -- Orgmode for vim
    use {
        'vhyrro/neorg',
        config = require 'plugins.orgmode',
        requires = "nvim-lua/plenary.nvim"
    }
end)
