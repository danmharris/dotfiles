function configure_palenight()
  vim.opt.background = 'dark'
  vim.opt.termguicolors = true
  vim.cmd('colorscheme palenight')
end

function configure_nvim_tree()
  require('nvim-tree').setup({
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  })

  vim.keymap.set('n', '<Leader><Leader>', ':NvimTreeToggle<CR>')
  vim.keymap.set('n', '<Leader><Space>', ':NvimTreeFindFile<CR>')
end

function configure_lualine()
  require('lualine').setup({ theme = 'palenight' })
end

function configure_telescope()
  require ('telescope').setup()
  vim.keymap.set('n', 'ff', ':Telescope find_files<CR>')
  vim.keymap.set('n', 'fg', ':Telescope live_grep<CR>')
  vim.keymap.set('n', 'fb', ':Telescope buffers<CR>')
end

require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use {
    'drewtempelmeyer/palenight.vim',
    config = configure_palenight,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = configure_nvim_tree,
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = configure_lualine,
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = configure_telescope,
  }
end)



