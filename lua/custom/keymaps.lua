-- [[ Custom Keymaps ]]
-- Personal keymaps kept separate from the upstream kickstart sections.
-- Loaded at the end of Section 9 in init.lua.

-- Quick quit and window management
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>o', ':only<CR>')

-- Insert mode escape
vim.keymap.set('i', 'jk', '<ESC>')

-- Save shortcuts
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<C-a>', ':wall<CR>')

-- Use visual mode selection to search
vim.keymap.set('v', '<Leader>/', 'y/<C-R>"<CR>')

-- Stamp: paste over the current word without clobbering the " register
-- (so the same thing can be stamped multiple times)
vim.keymap.set('n', 'S', '"_ciw<C-R>"<esc>')

-- Highlight word under cursor and stay in place
vim.keymap.set('n', '#', '*N')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>c', vim.diagnostic.setloclist, { desc = 'Open diagnostic [C]quickfix list' })
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>vt', function()
  local new_config = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config { virtual_text = new_config }
end, { desc = 'Toggle diagnostic [V]irtual_[T]ext' })

-- Terminal
vim.keymap.set('n', '<leader>t', ':e term://C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe<CR>')
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Telescope: f-prefix keymaps (personal preference alongside the upstream s-prefix ones)
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind in [G]it files' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fr', builtin.live_grep, { desc = '[F]ind by g[R]ep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind recent files' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommands' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fl', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[F]uzzy search current buffer [L]ocally' })
vim.keymap.set('n', '<leader>f/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[F]ind [/] in Open Files' })
vim.keymap.set('n', '<leader>fn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = '[F]ind [N]eovim files' })

-- LSP: additional keymaps set on buffer attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'grh', vim.lsp.buf.hover, { buffer = event.buf, desc = 'LSP: [H]over' })
  end,
})
