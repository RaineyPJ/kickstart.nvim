-- render-markdown.nvim
-- Renders Markdown content nicely in the terminal (tables, bold, headings, etc.)
-- Rendered view in normal mode, raw view in insert mode for natural editing.
--
-- See `:help render-markdown`

vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  -- Use consistent, clean defaults for reading experience
  heading = {
    enabled = true,
    icons = { '󰲞 ', '󰲝 ', '󰲠 ', '󰲟 ', '󰲡 ', '󰲜 ' },
    position = 'inline',
    signs = { enabled = false },
    width = 'block',
    left_pad = 1,
    right_pad = 1,
  },
  checkbox = {
    enabled = true,
    ---@type render.md.Checkbox
    custom = {
      ---@type render.md.CheckboxItem
      todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
    },
  },
  code = {
    enabled = true,
    sign = false,
    width = 'block',
    left_pad = 1,
    right_pad = 1,
    border = 'thin',
    position = 'inline',
    language_icon = true,
  },
  bullet = {
    enabled = true,
    ---@type string[]
    icons = { '●', '○', '◆', '◇' },
    left_pad = 0,
    right_pad = 0,
  },
  -- Re-enabled: render-markdown's built-in table rendering
  -- (clean borders, alignment, no cell wrapping — but no conflicts)
  pipe_table = {
    enabled = true,
    preset = 'round',
    alignment_indicator = '━',
    cell = 'padded',
  },
  quote = {
    enabled = true,
    icon = '▋',
    repeat_linebreak = true,
  },
  link = {
    enabled = true,
    -- Show link destination as hover text
    -- Use nerd font icon for links
    icon = '󰌹 ',
    highlight = 'RenderMarkdownLink',
  },
  -- Wrap text nicely in rendered view, raw view for editing
  win_options = {
    conceallevel = { rendered = 2, raw = 0 },
    concealcursor = { rendered = 'n', raw = '' },
    wrap = { rendered = true, raw = false },
    linebreak = { rendered = true, raw = false },
  },
}

-- Toggle rendering on/off
vim.keymap.set('n', '<leader>tr', function()
  require('render-markdown').toggle()
end, { desc = '[T]oggle [R]ender Markdown' })