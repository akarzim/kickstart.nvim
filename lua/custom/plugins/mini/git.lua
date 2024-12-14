local git = require 'mini.git'

-- set mapping for interactive Git history navigation
local rhs = '<Cmd>lua MiniGit.show_at_cursor()<CR>'
vim.keymap.set({ 'n', 'x' }, '<Leader>gs', rhs, { desc = 'Show at cursor' })

-- Set folding in Git related filetypes
local diff_folds = 'foldmethod=expr foldexpr=v:lua.MiniGit.diff_foldexpr() foldlevel=0'
vim.cmd('au FileType git,diff setlocal' .. diff_folds)

return {
  git.setup(),
}
