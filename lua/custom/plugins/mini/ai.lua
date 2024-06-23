-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [']quote
--  - ci'  - [C]hange [I]nside [']quote
--  - yae  - [Y]ank [A]round [E]ntier buffer

local gen_spec = require('mini.ai').gen_spec

return {
  require('mini.ai').setup {
    custom_textobjects = {
      -- Whole buffer
      e = function()
        local from = { line = 1, col = 1 }
        local to = {
          line = vim.fn.line '$',
          col = math.max(vim.fn.getline('$'):len(), 1),
        }
        return { from = from, to = to }
      end,

      -- Custom definitions (needs treesitter queries with these captures)
      c = gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
      b = gen_spec.treesitter { a = '@block.outer', i = '@block.inner' },
      m = gen_spec.treesitter { a = '@method.outer', i = '@method.inner' },
      M = gen_spec.treesitter { a = '@module.outer', i = '@module.inner' },
      r = gen_spec.treesitter { a = '@regex.outer', i = '@regex.inner' },
    },
    n_lines = 500,
  },
}
