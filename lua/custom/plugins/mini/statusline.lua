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

local truncate_git_head = function(head)
  local sep = '-'
  local t = {}

  for str in string.gmatch(head, '[^' .. sep .. ']+') do
    table.insert(t, str)
  end

  if t[1] == head then
    return head
  end

  if t[2] == t[#t] then
    return table.concat(t, sep, 1, 2)
  end

  local last_sep = (t[3] == t[#t] and sep or '…-')
  return t[1] .. sep .. t[2] .. last_sep .. t[#t]
end

---@param args __statusline_args Use `args.icon` to supply your own icon.
---
---@return __statusline_section
local section_git = function(args)
  if MiniStatusline.is_truncated(args.trunc_width) then
    return ''
  end

  local head = vim.b.gitsigns_head
  if head == nil then
    return ''
  end

  local summary = truncate_git_head(head)

  local icon = args.icon or 'Git'
  return icon .. ' ' .. (summary == '' and '-' or summary)
end

return {
  -- set use_icons to true if you have a Nerd Font
  -- statusline.setup { use_icons = vim.g.have_nerd_font },
  statusline.setup {
    use_icons = true,
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
        local git = section_git { trunc_width = 40, icon = '' }
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
