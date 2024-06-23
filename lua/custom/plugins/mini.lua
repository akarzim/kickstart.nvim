-- Collection of various small independent plugins/modules

return {
  'echasnovski/mini.nvim',
  config = function()
    require 'custom.plugins.mini.ai'
    require 'custom.plugins.mini.align'
    require 'custom.plugins.mini.comment'
    require 'custom.plugins.mini.operators'
    require 'custom.plugins.mini.splitjoin'
    require 'custom.plugins.mini.starter'
    require 'custom.plugins.mini.statusline'
    require 'custom.plugins.mini.surround'
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
