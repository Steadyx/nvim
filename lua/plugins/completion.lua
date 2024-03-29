return function()
	local cmp = require("cmp")
	local lspkind = require("lspkind")

	vim.opt.completeopt = "menuone,noselect"

	cmp.setup({
		view = {
			entries = "custom",
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		style = {
			winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
		},
		formatting = {
			format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
		},
		window = {
			completion = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				scrollbar = "║",
				autocomplete = {
					require("cmp.types").cmp.TriggerEvent.InsertEnter,
					require("cmp.types").cmp.TriggerEvent.TextChanged,
				},
			},
			documentation = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
				scrollbar = "║",
			},
		},
		mapping = {
			["<PageUp>"] = function()
				for _ = 1, 10 do
					cmp.mapping.select_prev_item()(nil)
				end
			end,
			["<PageDown>"] = function()
				for _ = 1, 10 do
					cmp.mapping.select_next_item()(nil)
				end
			end,
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
		},
		experimental = {
			native_menu = false,
			ghost_text = true,
		},
		sources = {
			{ name = "copilot", group_index = 2 },
			{ name = "nvim_lsp", group_index = 2 },
			{ name = "path", group_index = 2 },
			{ name = "luasnip", group_index = 2 },
			{ name = "buffer", group_index = 5 },
		},
		sorting = {
			comparators = {
				--[[ cmp.config.compare.recently_used,
				cmp.config.compare.offset,
				cmp.config.compare.score,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order, ]]
			},
		},
		preselect = cmp.PreselectMode.Item,
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	--set highlights
	--[[ local highlights = {
		CmpItemKindText = { fg = "LightGrey", bg = "Yellow" },
		CmpItemKindFunction = { fg = "#C586C0" },
		CmpItemKindClass = { fg = "Orange" },
		CmpItemKindKeyword = { fg = "#f90c71" },
		CmpItemKindSnippet = { fg = "#565c64" },
		CmpItemKindConstructor = { fg = "#ae43f0" },
		CmpItemKindVariable = { fg = "#9CDCFE", bg = "NONE" },
		CmpItemKindInterface = { fg = "#f90c71", bg = "#f90c71" },
		CmpItemKindFolder = { fg = "Green" },
		CmpItemKindReference = { fg = "#922b21" },
		CmpItemKindMethod = { fg = "#C586C0" },
		CmpItemMenu = { fg = "Green", bg = "Red" },
		CmpItemAbbr = { fg = "#565c64", bg = "Red" },
		CmpItemAbbrMatch = { fg = "Green", bg = "Red" },
		CmpItemAbbrMatchFuzzy = { fg = "Green", bg = "Red" },
		CmpBorderedWindow_FloatBorder = { fg = "Orange", bg = "Green" },
	}

  vim.chh

	for group, hl in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl)
	end ]]
end
