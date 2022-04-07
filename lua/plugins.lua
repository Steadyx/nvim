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
		"rebelot/kanagawa.nvim",
		config = require("plugins.colorscheme"),
		as = "colorscheme",
	})
	-- Neovim Treesitter syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require("plugins.treesitter"),
		run = ":TSUpdate",
	})
	-- Neovim Language Server config
	use({ "neovim/nvim-lspconfig", config = require("plugins.lsp") })
	-- Gitgutter
	use({ "lewis6991/gitsigns.nvim", config = require("plugins.gitsigns") })
	-- Completion engine
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp", branch = "dev", config = require("plugins.completion") })
	use({ "saadparwaiz1/cmp_luasnip" })
	-- Snippets from VSCode
	use({ "L3MON4D3/LuaSnip" })
	use({
		"rafamadriz/friendly-snippets",
		config = require("plugins.friendly-snippets"),
	})
	-- DevIcons for Telescope
	use({ "kyazdani42/nvim-web-devicons" })
	-- Vim Surround - Surrounding/deleting
	use({ "tpope/vim-surround" })
	-- Emmet
	use({ "mattn/emmet-vim" })
	-- Cheat Sheat
	use({ "RishabhRD/popfix" })
	use({ "RishabhRD/nvim-cheat.sh" })
	-- LSP configuration
	use({ "RishabhRD/nvim-lsputils", config = require("plugins.lsputils") })
	-- Auto comment
	use({ "b3nj5m1n/kommentary" })
	-- Telecope - A powerful/extensible fuzzy file searcher
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
	-- Status line helper
	use({
		"hoob3rt/lualine.nvim",
		config = require("plugins.statusline"),
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "ggandor/lightspeed.nvim", config = require("plugins.lightspeed") })
	-- Highlight matching parenthesis and brackets
	use({ "p00f/nvim-ts-rainbow" })
	-- Highlight colors in hex and rgb
	use({ "norcalli/nvim-colorizer.lua", config = require("plugins.colorizer") })
	-- A powerful diff tool
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	-- Follow urls without using the mouse
	use({ "axieax/urlview.nvim", config = require("plugins.urlview") })
	-- Code generation with deep learning
	use({ "github/copilot.vim" })
end)
