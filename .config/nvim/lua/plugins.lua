-- plugins !!
return {
    "nvim-telescope/telescope.nvim",
    "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    "kyazdani42/blue-moon",
    "mason-org/mason.nvim",
        opts = {}, 
    "stevearc/conform.nvim",
        opts = {
            format_on_save = { lsp_fallback = true },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
    "neovim/nvim-lspconfig",
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/nvim-cmp"
}
