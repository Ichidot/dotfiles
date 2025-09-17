-- init.lua
require("lazy_setup")

local on, off = true, false

local settings = {
    indent = {
        type = "space",
        width = 4
    },
    number = {
        enabled = on,
        relative = off
    },
    scroll = {
        lines = 9
    }
}

vim.opt.termguicolors = on
vim.opt.expandtab = settings.indent.type == "space"
vim.opt.softtabstop = settings.indent.width
vim.opt.tabstop = settings.indent.width
vim.opt.shiftwidth = settings.indent.width
vim.opt.smartindent = on
vim.opt.scrolloff = settings.scroll.lines
vim.opt.number = settings.number.enabled
vim.opt.relativenumber = settings.number.relative
vim.g.mapleader = " "

require("lazy").setup("plugins")

require("nvim-tree").setup {
    view = {
        width = 30,
        side = "left",
        number = settings.number.enabled,
        relativenumber = settings.number.relative
    }
}

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = on, silent = on })

local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>f", telescope_builtin.find_files, {})

local logo = require("logo")
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = logo

dashboard.section.buttons.val = {
    dashboard.button("f", "find files", ":Telescope find_files<CR>"),
    dashboard.button("s", "settings", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "quit", ":qa!<CR>")
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
    "astro",
    "cssls",
    "html",
    "jsonls",
    "ruff",
    "rust_analyzer",
    "ts_ls",
    "biome"
    },
    handlers = {
        function(server)
            require("lspconfig")[server].setup {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }
    end,
    },
})

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
      },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
})

vim.cmd("colorscheme yorumi")

alpha.setup(dashboard.config)

