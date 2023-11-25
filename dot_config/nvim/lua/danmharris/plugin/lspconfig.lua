local lspconfig = require("lspconfig")

lspconfig.elixirls.setup({
  cmd = { "elixir-ls" };
})
lspconfig.gopls.setup({})
lspconfig.solargraph.setup({})
