vim.opt.diffopt:append { 'linematch:60' }

local wk = require 'which-key'
wk.add {
  { '<leader>d', group = 'diff' }, -- group
  { '<Leader>do', ':diffoff<CR>', desc = 'diff off' },
  { '<Leader>dd', ':diffupdate<CR>', desc = 'diff update' },
  { '<Leader>dt', ':diffthis<CR>', desc = 'diff this' },
  { '<Leader>dT', ':diffOrig<CR>', desc = 'diff that' },
  { '<Leader>dl', ':diffget //2<Bar>diffupdate<CR>', desc = 'get left' },
  { '<Leader>dr', ':diffget //3<Bar>diffupdate<CR>', desc = 'get right' },
}

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
