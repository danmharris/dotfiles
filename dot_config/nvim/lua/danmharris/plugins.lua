local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
        opts = {
            flavour = "macchiato",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "beancount",
                "elixir",
                "go",
                "hcl",
                "lua",
                "ruby",
                "vim",
                "vimdoc",
                "yaml",
            },
            highlight = {
                enable = true,
            },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "NvimTreeFindFile",
        keys = {
            { "<C-n>", ":NvimTreeToggle<CR>" },
        },
        opts = {
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        },
    },
    "pearofducks/ansible-vim",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = true,
    },
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufEnter",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.elixirls.setup({
                cmd = { "elixir-ls" },
            })
            lspconfig.gopls.setup({})
            lspconfig.solargraph.setup({})
            lspconfig.ansiblels.setup({})
        end,
    },
    {
        "tpope/vim-fugitive",
        cmd = "Git",
    },
})
