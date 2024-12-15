-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- Example usage
-- - `saiw)` - add (`sa`) for inner word (`iw`) parenthesis (`)`).
-- - `saiw?[[<CR>]]<CR>` - add (`sa`) for inner word (`iw`) interactive
--   surrounding (`?`): `[[` for left and `]]` for right.
-- - `2sdf` - delete (`sd`) second (`2`) surrounding function call (`f`).
-- - `sr)tdiv<CR>` - replace (`sr`) surrounding parenthesis (`)`) with tag
--   (`t`) with identifier 'div' (`div<CR>` in command line prompt).
-- - `srTTdiv<CR>` - replace (`sr`) surrounding tag name (`T`) with tag
--   name (`T`) with identifier 'div' (`div<CR>` in command line prompt).
-- - `sff` - find right (`sf`) part of surrounding function call (`f`).
-- - `sh}` - highlight (`sh`) for a brief period of time surrounding curly
--   brackets (`}`).
--
-- Extended mappings (temporary force "prev"/"next" search methods):
-- - `sdnf` - delete (`sd`) next (`n`) function call (`f`).
-- - `srlf(` - replace (`sr`) last (`l`) function call (`f`) with padded
--   bracket (`(`).
-- - `2sfnt` - find (`sf`) second (`2`) next (`n`) tag (`t`).
-- - `2shl}` - highlight (`sh`) last (`l`) second (`2`) curly bracket (`}`).

vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

return {
  require('mini.surround').setup {
    search_method = 'cover_or_next',

    custom_surroundings = {
      T = {
        input = { '<(%w+)[^<>]->.-</%1>', '^<()%w+().*</()%w+()>$' },
        output = function()
          local tag_name = MiniSurround.user_input 'Tag name'
          if tag_name == nil then
            return nil
          end
          return { left = tag_name, right = tag_name }
        end,
      },
    },
  },
}
