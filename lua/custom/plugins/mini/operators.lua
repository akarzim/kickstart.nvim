-- Text edit operators
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-operators.md
--
-- - g= - Evaluate text and replace with output.
-- - gx - Exchange text regions.
-- - gm - Multiply (duplicate) text.
-- - gr - Replace text with register.
-- - gs - Sort text.

return {
  require('mini.operators').setup(),
}
