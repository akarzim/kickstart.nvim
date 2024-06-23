-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keybinds to toggle options.
vim.keymap.set('n', '<leader>t/', ':setlocal hlsearch!<CR>', { desc = '[T]oggle [h]ighlight search' })
vim.keymap.set('n', '<leader>te', ':setlocal list! list?<CR>', { desc = '[T]oggle invisibl[e] characters' })
vim.keymap.set('n', '<leader>tn', ':setlocal number!<CR>', { desc = '[T]oggle line [n]umbers' })
vim.keymap.set('n', '<leader>tN', ':setlocal relativenumber<CR>', { desc = '[T]oggle line relative[n]umbers' })
vim.keymap.set('n', '<leader>tp', ':setlocal paste!<CR>', { desc = '[T]oggle to [P]aste mode' })
vim.keymap.set('n', '<leader>ts', ':setlocal spell! spell?<CR>', { desc = '[T]oggle [s]pelling' })
vim.keymap.set('n', '<leader>tf', ':setlocal foldenable!<CR>', { desc = '[T]oggle [f]olding' })
vim.keymap.set('n', '<leader>tc', ':setlocal cursorcolumn!<CR>', { desc = '[T]oggle [c]ursor column highlight' })
vim.keymap.set('n', '<leader>tC', ':setlocal cursorline!<CR>', { desc = '[T]oggle [c]ursor line highlight' })
vim.keymap.set('n', '<leader>tw', ':setlocal wrap! wrap?<CR>', { desc = '[T]oggle [w]rapping' })
-- vim.keymap.set('n', '<leader>tu', ':UndotreeToggle <CR>', { desc = '[T]oggle [u]ndo tree' })
-- vim.keymap.set('n', '<leader>tb', ':setlocal background=' .. (if vim.background == 'dark' then 'light<CR>' else 'dark<CR>' end), { desc = '[T]oggle [b]ackground theme' })
-- vim.keymap.set('n', '<leader>tg', ':Grammalect <CR>', { desc = '[T]oggle [G]rammalect' })
-- vim.keymap.set('n', '<leader>tt', ':setlocal winbar=' .. (if vim.winbar == '%f' then '<CR>' else '%f<CR>' end), { desc = '[T]oggle winbar [t]itle display' })

-- store relative line number jumps in jumplist while treating wrapped lines like real lines
-- NOTE: m' stores current position in jumplist NOTE: thanks to osse and bairui in #vim IRC!
vim.keymap.set('n', 'k', ":<C-U>execute 'normal!' (v:count>1 ? \"m'\".v:count.'k' : 'gk')<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'j', ":<C-U>execute 'normal!' (v:count>1 ? \"m'\".v:count.'j' : 'gj')<CR>", { noremap = true, silent = true })

-- apply these tricks to up and down arrow keys
vim.keymap.set('n', '<Up>', 'k')
vim.keymap.set('n', '<Down>', 'j')
