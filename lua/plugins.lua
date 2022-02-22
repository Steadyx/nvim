-- Only required if you have packer in your `opt` pack
vim.cmd([[ packadd packer.nvim ]])
-- Compile when config changes
vim.cmd([[ autocmd BufWritePost plugins.lua PackerCompile ]])

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })
	-- Git integration
	use({ "tpope/vim-fugitive", config = require("plugins.fugitive") })
	-- Auto Formatting
	use({ "jose-elias-alvarez/null-ls.nvim", config = require("plugins.format") })
	-- Colorscheme
	use({
		"marko-cerovac/material.nvim",
		config = require("plugins.colorscheme"),
		as = "colorscheme",
	})
	-- Only highlight current scope when in zen mode
	-- use { "folke/twilight.nvim", config = require 'plugins.twilight' }
	-- Neovim Treesitter syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require("plugins.treesitter"),
		run = ":TSUpdate",
	})
	-- Neovim Language Server config
	use({ "neovim/nvim-lspconfig", config = require("plugins.lsp") })
	-- API atop the native lang server
	use({ "glepnir/lspsaga.nvim", config = require("plugins.lspsaga") })
	-- Gitgutter
	use({ "lewis6991/gitsigns.nvim", config = require("plugins.gitsigns") })
	-- Completion engine
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp", config = require("plugins.completion") })
	-- DevIcons for Telescope
	use({ "kyazdani42/nvim-web-devicons" })
	-- Vim Surround - Surrounding/deleting
	use({ "tpope/vim-surround" })
	-- Emmet
	use({ "mattn/emmet-vim" })
	-- Cheat Sheat
	use({ "RishabhRD/popfix" })
	use({ "RishabhRD/nvim-cheat.sh" })
	-- Snippets from VSCode
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "L3MON4D3/LuaSnip" })
	use({
		"rafamadriz/friendly-snippets",
		config = require("plugins.friendly-snippets"),
	})
	use({ "RishabhRD/nvim-lsputils", config = require("plugins.lsputils") })
	-- Auto comment
	use({ "b3nj5m1n/kommentary" })
	-- Telecope - A powerful/extensible fuzzy file searcher
	-- use { 'nvim-lua/popup.nvim' }
	use({ "nvim-lua/plenary.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = require("plugins.telescope"),
	})
	-- Floatterm - a floating terminal for neovim
	use({ "numtostr/FTerm.nvim", config = require("plugins.floatterm") })
	-- Tree explorer
	use({ "kyazdani42/nvim-tree.lua", config = require("plugins.nvimtree") })
	-- Autopairing
	use({ "windwp/nvim-autopairs", config = require("plugins.autopairs") })
	-- Hop to any character
	use({ "phaazon/hop.nvim", config = require("plugins.hop") })
	-- Minimise screen clutter
	use({ "folke/zen-mode.nvim", config = require("plugins.zenmode") })
	-- Splash screen
	use({ "glepnir/dashboard-nvim", config = require("plugins.dashboard") })
	-- Iconify lsp text
	use({ "onsails/lspkind-nvim", config = require("plugins.lspKind") })
	-- another good git extension
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = require("plugins.neogit"),
	})
	-- Orgmode for vim
	use({
		"vhyrro/neorg",
		config = require("plugins.orgmode"),
		requires = "nvim-lua/plenary.nvim",
	})
	-- Status line helper
	use({
		"hoob3rt/lualine.nvim",
		config = require("plugins.statusline"),
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "ggandor/lightspeed.nvim", config = require("plugins.lightspeed") })
	use({ "puremourning/vimspector", config = require("plugins.vimspector") })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "github/copilot.vim" })
	use({ "norcalli/nvim-colorizer.lua", config = require("plugins.colorizer") })
end)
