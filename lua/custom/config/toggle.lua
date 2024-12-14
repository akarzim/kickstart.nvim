local wk = require 'which-key'

-- Keybinds to toggle options.
wk.add {
  { '<leader>t', group = 'toggle' }, -- group
  { '<leader>t/', ':setlocal hlsearch!<CR>', desc = '[T]oggle [h]ighlight search' },
  { '<leader>te', ':setlocal list! list?<CR>', desc = '[T]oggle invisibl[e] characters' },
  { '<leader>tn', ':setlocal number!<CR>', desc = '[T]oggle line [n]umbers' },
  { '<leader>tN', ':setlocal relativenumber<CR>', desc = '[T]oggle line relative[n]umbers' },
  { '<leader>tp', ':setlocal paste!<CR>', desc = '[T]oggle to [P]aste mode' },
  { '<leader>ts', ':setlocal spell! spell?<CR>', desc = '[T]oggle [s]pelling' },
  { '<leader>tf', ':setlocal foldenable!<CR>', desc = '[T]oggle [f]olding' },
  { '<leader>tc', ':setlocal cursorcolumn!<CR>', desc = '[T]oggle [c]ursor column highlight' },
  { '<leader>tC', ':setlocal cursorline!<CR>', desc = '[T]oggle [c]ursor line highlight' },
  { '<leader>tw', ':setlocal wrap! wrap?<CR>', desc = '[T]oggle [w]rapping' },
  -- { '<leader>tu', ':UndotreeToggle <CR>', desc = '[T]oggle [u]ndo tree' },
  -- { '<leader>tb', ':setlocal background=' .. (if vim.background == 'dark' then 'light<CR>' else 'dark<CR>' end), desc = '[T]oggle [b]ackground theme' },
  -- { '<leader>tg', ':Grammalect <CR>', desc = '[T]oggle [G]rammalect' },
  -- { '<leader>tt', ':setlocal winbar=' .. (if vim.winbar == '%f' then '<CR>' else '%f<CR>' end), desc = '[T]oggle winbar [t]itle display' },
}
