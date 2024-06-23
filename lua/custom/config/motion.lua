-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- retain relative cursor position when paging
vim.keymap.set('n', '<PageUp>', '<C-U>')
vim.keymap.set('n', '<PageDown>', '<C-D>')

-- switch to adjacent buffer in current window
vim.keymap.set('n', '<C-PageUp>', ':bprev<CR>')
vim.keymap.set('n', '<C-PageDown>', ':bnext<CR>')
