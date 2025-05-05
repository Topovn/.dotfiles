return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform"
    }, -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function() require "configs.lspconfig" end
    }, {import = "nvchad.blink.lazyspec"}, {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons' -- optional
        }
    }, {
        "nvim-treesitter/nvim-treesitter",
        opts = {ensure_installed = {"vim", "lua", "vimdoc", "html", "css"}}
    }, {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }
}
