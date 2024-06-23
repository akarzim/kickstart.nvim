vim.opt.diffopt:append { 'linematch:60' }

vim.keymap.set('n', '<Leader>do', ':diffoff<CR>', { desc = 'off' })
vim.keymap.set('n', '<Leader>dd', ':diffupdate<CR>', { desc = 'update' })
vim.keymap.set('n', '<Leader>dt', ':diffthis<CR>', { desc = 'this' })
vim.keymap.set('n', '<Leader>dT', ':diffOrig<CR>', { desc = 'that' })
vim.keymap.set('n', '<Leader>dl', ':diffget //2<Bar>diffupdate<CR>', { desc = 'get left' })
vim.keymap.set('n', '<Leader>dr', ':diffget //3<Bar>diffupdate<CR>', { desc = 'get right' })

-- allows you to 'do undo', or in other words 'undo a change in the opposite window'
--
-- vim.keymap.set('n', 'du', function()
--   if vim.wo.diff then
--     vim.cmd [[
--       wincmd w
--       undo
--       wincmd w
--       diffupdate
--     ]]
--   end
-- end, { desc = 'undo' })
