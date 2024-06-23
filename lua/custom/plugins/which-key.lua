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

    -- Document existing key chains
    require('which-key').register {
      ['gl'] = { name = 'LSP', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]iff', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    }
    -- visual mode
    require('which-key').register({
      ['<leader>h'] = { 'Git [H]unk' },
    }, { mode = 'v' })
  end,
}
