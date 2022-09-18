require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'drewtempelmeyer/palenight.vim' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }

  use { 'nvim-lualine/lualine.nvim' }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
end)

vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd('colorscheme palenight')

require('nvim-tree').setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
vim.keymap.set('n', '<Leader><Leader>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader><Space>', ':NvimTreeFindFile<CR>')

require('lualine').setup({ theme = 'palenight' })

require ('telescope').setup()
vim.keymap.set('n', 'ff', ':Telescope find_files<CR>')
vim.keymap.set('n', 'fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', 'fb', ':Telescope buffers<CR>')
