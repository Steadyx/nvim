-- Only required if you have packer in your `opt` pack
vim.cmd([[ packadd packer.nvim ]])
-- Compile when config changes
vim.cmd([[ autocmd BufWritePost plugins.lua PackerCompile ]])

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })
	-- lsp stuff
	use({ "williamboman/mason.nvim", config = require("plugins.mason") })
	-- Git integration
	use({ "tpope/vim-fugitive", config = require("plugins.fugitive") })
	-- Auto Formatting
	use({ "jose-elias-alvarez/null-ls.nvim", config = require("plugins.format") })
	-- Colorscheme
	use({
		"catppuccin/nvim",
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
	use({ "lewis6991/gitsigns.nvim" })
	-- Completion engine
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp", config = require("plugins.completion") })
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
	-- FZF Native - faster sorting algorithm for telescope
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({ "nvim-telescope/telescope-file-browser.nvim", config = require("plugins.telescope-file-browser") })
	-- Floatterm - a floating terminal for neovim
	use({ "akinsho/toggleterm.nvim", config = require("plugins.floatterm") })
	-- Tree explorer
	use({ "kyazdani42/nvim-tree.lua", config = require("plugins.nvimtree") })
	-- Autopairing
	use({ "windwp/nvim-autopairs", config = require("plugins.autopairs") })
	-- Minimise screen clutter
	-- use({ "folke/zen-mode.nvim", config = require("plugins.zenmode") })
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
	use({ "hiphish/rainbow-delimiters.nvim" })
	-- Highlight colors in hex and rgb
	use({ "norcalli/nvim-colorizer.lua", config = require("plugins.colorizer") })
	-- A powerful diff tool
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	-- Follow urls without using the mouse
	use({ "axieax/urlview.nvim", config = require("plugins.urlview") })
	-- Code generation with deep learning
	-- use({ "github/copilot.vim", config = require("plugins.copilot") })
	-- Display line indentation
	use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.indentline") })
	--- orgmode for neovim
	-- use({ "nvim-neorg/neorg", config = require("plugins.neorg"), requires = "nvim-lua/plenary.nvim" })
	-- use({ "David-Kunz/markid" })
	use({
		"cbochs/portal.nvim",
		requires = {
			"cbochs/grapple.nvim",
			"ThePrimeagen/harpoon",
		},
	})
	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup()
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
	})
	use({
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			vim.cmd([[
    hi BqfPreviewBorder guifg=#50a14f ctermfg=71
    hi link BqfPreviewRange Search
    ]])

			require("bqf").setup({
				auto_enable = true,
				auto_resize_height = true, -- highly recommended enable
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
					show_title = false,
					should_preview_cb = function(bufnr, qwinid)
						local ret = true
						local bufname = vim.api.nvim_buf_get_name(bufnr)
						local fsize = vim.fn.getfsize(bufname)
						if fsize > 100 * 1024 then
							-- skip file size greater than 100k
							ret = false
						elseif bufname:match("^fugitive://") then
							-- skip fugitive buffer
							ret = false
						end
						return ret
					end,
				},
				-- make `drop` and `tab drop` to become preferred
				func_map = {
					drop = "o",
					openc = "O",
					split = "<C-s>",
					tabdrop = "<C-t>",
					tabc = "",
					ptogglemode = "z,",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	})
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	-- optional
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	-- 	use({
	-- 		"nvim-neotest/neotest",
	-- 		requires = {
	-- 			"nvim-lua/plenary.nvim",
	-- 			"nvim-treesitter/nvim-treesitter",
	-- 			"antoinemadec/FixCursorHold.nvim",
	--       'haydenmeade/neotest-jest',
	-- 		},
	--   config = require("plugins.tests"),
	-- 	})
end)
