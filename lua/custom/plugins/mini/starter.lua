local top3 = function()
  local label = '∴ Top 3 authors YoY'

  local command = 'git shortlog -ns --since "1 year" | head -n 3'
  local handle = io.popen(command)
  local shortlog = handle:read '*a' or 'not a git directory'
  handle:close()

  return table.concat({ label, shortlog }, '\n')
end

local starter = require 'mini.starter'

vim.keymap.set('n', '_', starter.open)

return {
  starter.setup {
    evaluate_single = true,
    header = top3,
    items = {
      starter.sections.recent_files(8, true),
      starter.sections.recent_files(8, false),
      starter.sections.telescope(),
      starter.sections.builtin_actions(),
    },
    content_hooks = {
      starter.gen_hook.adding_bullet(),
      starter.gen_hook.indexing('all', { 'Builtin actions', 'Telescope' }),
      starter.gen_hook.aligning('center', 'center'),
    },
    query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789',
  },
}
