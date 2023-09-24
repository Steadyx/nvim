return function()
	local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
	local configs = require("utils").prerequire("nvim-treesitter.configs")

	if not configs then
		vim.cmd([[echom 'Cannot load nvim-treesitter.configs']])
	end

	parser_configs.norg = {
		install_info = {
			url = "https://github.com/vhyrro/tree-sitter-norg",
			files = { "src/parser.c" },
			branch = "main",
		},
	}

	configs.setup({
		highlight = { enable = true },
		indent = { enble = true },
		refactor = { highlight_definitions = { enable = true } },
		markid = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- colors = {}, -- table of hex strings
			-- termcolors = {} -- table of colour name strings
		},
	})
end
