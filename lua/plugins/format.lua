return function()
    local function nvim_create_augroups(definitions)
        for group_name, definition in pairs(definitions) do
            vim.api.nvim_command('augroup ' .. group_name)
            vim.api.nvim_command('autocmd!')
            for _, def in ipairs(definition) do
                -- if type(def) == 'table' and type(def[#def]) == 'function' then
                -- 	def[#def] = lua_callback(def[#def])
                -- end
                local command = table.concat(vim.tbl_flatten {'autocmd', def},
                                             ' ')
                vim.api.nvim_command(command)
            end
            vim.api.nvim_command('augroup END')
        end
    end

    local autocmds = {Format = {{"BufWritePost", "*", [[FormatWrite]]}}}

    nvim_create_augroups(autocmds)

    require"format".setup {
        ["*"] = {
            {cmd = {"sed -i '' -E 's/[ '$'\t'']+$//'"}} -- remove trailing whitespace
        },
        vim = {
            {
                cmd = {"lua-format -i"},
                start_pattern = "^lua << EOF$",
                end_pattern = "^EOF$"
            }
        },
        vimwiki = {
            {
                cmd = {"prettier -w --parser babel"},
                start_pattern = "^{{{javascript$",
                end_pattern = "^}}}$"
            }
        },
        lua = {{cmd = {'lua-format -i'}}},
        rust = {{cmd = {'rustfmt'}}},
        python = {{cmd = {'black'}}},
        go = {{cmd = {"gofmt -w", "goimports -w"}, tempfile_postfix = ".tmp"}},
        scss = {
            {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
        },
        html = {
            {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
        },
        typescriptreact = {
            {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
        },
        react = {
            {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
        },
        javascript = {
            {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
        },
        markdown = {
            {cmd = {"prettier -w"}}, {
                cmd = {"black"},
                start_pattern = "^```python$",
                end_pattern = "^```$",
                target = "current"
            }
        }
    }
end
