require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "beancount", "go", "hcl", "lua", "ruby", "vim", "vimdoc", "yaml"
  },
  highlight = {
    enable = true,
  },
})