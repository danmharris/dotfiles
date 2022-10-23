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
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<C-p>', function() builtin.find_files() end)
  vim.keymap.set('n', '<C-f>', function() builtin.live_grep() end)
  vim.keymap.set('n', '<Leader>bf', function() builtin.buffers() end)
  vim.keymap.set('n', '<Leader>bb', ':ls<CR>:buffer ')

  vim.keymap.set('n', '<Leader>gl', function() builtin.git_bcommits() end)
  vim.keymap.set('n', '<Leader>gs', function() builtin.git_status() end)
end

function configure_cmp()
  local cmp = require('cmp')

  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    })
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local servers = { 'tsserver' }
  for _,server in ipairs(servers) do
    require('lspconfig')[server].setup {
      capabilities = capabilities,
    }
  end
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

  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use {
    'hrsh7th/nvim-cmp',
    config = configure_cmp,
  }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
end)



