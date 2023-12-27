local plugins = {
    {
        "rmehri01/onenord.nvim",
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim",     config = true },
            { "williamboman/mason-lspconfig" },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            require("config.mason_lspconfig")
            require("config.lspconfig")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            require("config.nvim_cmp")
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            require("config.none_ls")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.telescope")
        end,
    },
    {
        "folke/which-key.nvim",
        opts = {},
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            require("config.harpoon")
        end,
    },
}

return plugins
