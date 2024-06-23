-- You can easily change to a different colorscheme.

return {
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = true,
  init = function()
    require('gruvbox').setup {
      italic = {
        strings = false,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
    }

    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'gruvbox'

    -- You can configure highlights by doing something like:
    vim.api.nvim_set_hl(0, 'NonText', { link = 'GruvboxPurple' })
    vim.api.nvim_set_hl(0, 'SpecialKey', { link = 'GruvboxPurple' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'GruvboxYellow' })
  end,
  opts = ...,
}
