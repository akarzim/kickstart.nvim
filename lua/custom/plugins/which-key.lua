-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

-- Useful plugin to show you pending keybinds.
-- https://github.com/folke/which-key

return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 36,
        },
      },
    }
  end,

  keys = {
    -- Document existing key chains
    { '<leader>b', group = '[D]ocument' },
    { '<leader>c', group = '[C]ode' },
    { '<leader>d', group = '[D]iff' },
    { '<leader>h', group = 'Git [H]unk' },
    { '<leader>l', group = '[L]SP' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>s', group = '[S]earch' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>w', group = '[W]orkspace' },
    { 'gl', group = 'LSP' },
    -- visual mode
    { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
  },
  expand = 1, -- expand groups when <= n mappings
  icons = {
    -- used by key format
    keys = {
      Up = '↑',
      Down = '↓',
      Left = '←',
      Right = '→',
      C = 'Ⓒ',
      M = 'Ⓜ',
      D = 'Ⓓ',
      S = 'Ⓢ',
      CR = '␍',
      Esc = '␛',
      ScrollWheelDown = '⍗',
      ScrollWheelUp = '⍐',
      NL = '␤',
      BS = '␈',
      Space = '␠',
      Tab = '↹',
      F1 = '①',
      F2 = '②',
      F3 = '③',
      F4 = '④',
      F5 = '⑤',
      F6 = '⑥',
      F7 = '⑦',
      F8 = '⑧',
      F9 = '⑨',
      F10 = '⑩',
      F11 = '⑪',
      F12 = '⑫',
    },
  },
}
