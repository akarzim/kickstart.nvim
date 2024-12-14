local top3 = function()
  local label = '∴ Top 3 authors YoY'

  local command = 'git shortlog -ns --since "1 year" | head -n 3'
  local handle = io.popen(command)

  ---@cast handle -nil
  local shortlog = handle:read '*a'
  handle:close()

  return table.concat({ label, shortlog }, '\n')
end

local plugin_actions = {
  { name = 'Kickstart', action = 'e ~/.config/nvim/init.lua', section = 'Plugin actions' },
  { name = 'Lazy', action = 'Lazy', section = 'Plugin actions' },
  { name = 'Mason', action = 'Mason', section = 'Plugin actions' },
  { name = 'Health', action = 'checkhealth', section = 'Plugin actions' },
}

local starter = require 'mini.starter'

vim.keymap.set('n', '_', starter.open)

return {
  starter.setup {
    evaluate_single = true,
    header = top3,
    items = {
      starter.sections.recent_files(5, true),
      starter.sections.recent_files(5, false),
      starter.sections.telescope(),
      plugin_actions,
      starter.sections.builtin_actions(),
    },
    content_hooks = {
      starter.gen_hook.adding_bullet(),
      starter.gen_hook.indexing('all', { 'Builtin actions', 'Plugin actions', 'Telescope' }),
      starter.gen_hook.aligning('center', 'center'),
    },
    query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789',
  },
}
