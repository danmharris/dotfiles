local directions = {'h', 'j', 'k', 'l'}
for _,key in ipairs(directions) do
  vim.keymap.set('n', '<Leader>'..key, ':wincmd '..key..'<CR>')
end
