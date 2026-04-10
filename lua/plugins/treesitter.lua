return { -- Highlight, edit, and navigate code

    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',

    main = 'nvim-treesitter', -- Sets main module to use for opts

    branch = 'main',

    opts = {},

    -- enabled = false,

    init = function()
        -- autocmd til at lave highlighting og indenting
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        -- STOPPET FOR NU, det er stress naar den hele tiden ignorer shit og giver warnings.
        -- saa hellere install naar det er noedvendigt
        -- autocmd til at auto install
        -- vim.api.nvim_create_autocmd('FileType', {
        --     callback = function(ev)
        --         local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
        --         if lang then
        --             pcall(function()
        --                 require('nvim-treesitter').install { lang }
        --             end)
        --         end
        --         pcall(vim.treesitter.start)
        --         vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        --     end,
        -- })

        -- Ensure installed erstatning
        local ensureInstalled = {
            -- Languages
            'c',
            'cpp',
            'python',
            'lua',
            'bash',
            'vim',
            'hyprlang',
            'javascript',
            'typescript',
            'c_sharp',
            'rust',
            'go',
            'zig',
            'fish',

            -- Markup
            'html',
            'markdown',
            'markdown_inline',
            'latex',
            'typst',
            'bibtex',
            'css',
            'toml',
            'yaml',

            -- Docs
            'luadoc',
            'vimdoc',

            -- Misc
            'git_config',
            'gitcommit',
            'gitignore',
            'diff',
            'query',
            'desktop',
            'json',
            'make',
            'qmljs',
            'ssh_config',
            'csv',
            'requirements',
            'supercollider',
            'tmux',
            'zathurarc',
        }

        local alreadyInstalled = require('nvim-treesitter.config').get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        require('nvim-treesitter').install(parsersToInstall)
    end,

    priority = 50,
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
