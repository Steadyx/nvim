return function()
    local parser_configs =
        require('nvim-treesitter.parsers').get_parser_configs()
    local configs = require'utils'.prerequire 'nvim-treesitter.configs'

    if not configs then
        vim.cmd [[echom 'Cannot load nvim-treesitter.configs']]
    end

    parser_configs.norg = {
        install_info = {
            url = "https://github.com/vhyrro/tree-sitter-norg",
            files = { "src/parser.c" },
            branch = "main"
        }
    }

    configs.setup {
        ennsure_installed = 'all',
        highlight = { enable = true },
        indent = { enble = true },
        refactor = { highlight_definitions = { enable = true } }
    }
end
