local wk = require("which-key")
local builtin = require("telescope.builtin")
wk.register({
  f = {
    name = "find",
    c = { ":NvimTreeFindFile<CR>", "Find current file" },
    f = { builtin.find_files, "Find files" },
    g = { builtin.live_grep, "Grep" },
    b = { builtin.buffers, "Find buffers" },
  },
  g = {
    name = "goto",
    D = { function() vim.lsp.buf.declaration() end, "Go to declaration" },
    d = { function() vim.lsp.buf.definition() end, "Go to definition" },
    h = { function() vim.lsp.buf.hover() end, "Hover" },
    i = { function() vim.lsp.buf.implementation() end, "Go to implementation" },
  },
  v = {
    name = "vcs",
    s = { ":Git<CR>", "Git status" },
    d = { ":Git diff<CR>", "Git diff" },
    c = { ":Git commit<CR>", "Git commit" },
    p = { ":Git pull<CR>", "Git pull" },
  },
}, { prefix = "<leader>" })
