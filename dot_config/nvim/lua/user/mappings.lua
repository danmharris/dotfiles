local directions = {'h', 'j', 'k', 'l'}
for _,key in ipairs(directions) do
  vim.keymap.set('n', '<Leader>'..key, ':wincmd '..key..'<CR>')
end

vim.keymap.set('n', '<Leader>bb', ':ls<CR>:buffer ')
vim.keymap.set('n', '<C-l>', ':bn<CR>')
vim.keymap.set('n', '<C-h>', ':bp<CR>')
