-- Align text interactively
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md
--
-- - ga - start align
-- - gA - start align with preview
--
-- Press s to enter split Lua pattern.
-- Press j to choose justification side from available ones ("left", "center", "right", "none").
-- Press m to enter merge delimiter.
-- Press f to enter filter Lua expression to configure which parts will be affected (like "align only first column").
-- Press i to ignore some commonly unwanted split matches.
-- Press p to pair neighboring parts so they be aligned together.
-- Press t to trim whitespace from parts.
-- Press <BS> (backspace) to delete some last pre-step.

return {
  require('mini.align').setup(),
}
