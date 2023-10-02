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
}, { prefix = "<leader>" })
