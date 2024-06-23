-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require 'mini.statusline'

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l %2v'
end

return {
  -- set use_icons to true if you have a Nerd Font
  -- statusline.setup { use_icons = vim.g.have_nerd_font },
  statusline.setup {
    use_icons = true,
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
        local git = MiniStatusline.section_git { trunc_width = 40, icon = '' }
        local diff = MiniStatusline.section_diff { trunc_width = 75, icon = '⮁' }
        local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75, icon = '' }
        local lsp = MiniStatusline.section_lsp { trunc_width = 75, icon = '⧗' }
        local filename = MiniStatusline.section_filename { trunc_width = 140 }
        local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
        local location = MiniStatusline.section_location { trunc_width = 75 }
        local search = MiniStatusline.section_searchcount { trunc_width = 75 }

        return MiniStatusline.combine_groups {
          { hl = mode_hl, strings = { mode } },
          { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineFilename', strings = { filename } },
          '%=', -- End left alignment
          { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location } },
        }
      end,
    },
  },
}
