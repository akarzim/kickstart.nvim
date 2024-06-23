-- Highlight todo, notes, etc in comments

return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    keywords = {
      FIX = {
        icon = '🅵', -- icon used for the sign, and in search results
        color = 'error', -- can be a hex color, or a named color (see below)
        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = '🆃', color = 'info' },
      HACK = { icon = '🅷', color = 'warning' },
      WARN = { icon = '🆆', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = '🅿', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      NOTE = { icon = '🅸', color = 'hint', alt = { 'INFO' } },
      TEST = { icon = '🆃', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
    },
  },
  init = function()
    vim.keymap.set('n', ']t', function()
      require('todo-comments').jump_next()
    end, { desc = 'Next todo comment' })

    vim.keymap.set('n', '[t', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment' })

    -- You can also specify a list of valid jump keywords

    vim.keymap.set('n', ']T', function()
      require('todo-comments').jump_next { keywords = { 'ERROR', 'WARNING' } }
    end, { desc = 'Next error/warning todo comment' })

    vim.keymap.set('n', '[T', function()
      require('todo-comments').jump_prev { keywords = { 'ERROR', 'WARNING' } }
    end, { desc = 'Next error/warning todo comment' })
  end,
}
