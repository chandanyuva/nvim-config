-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness define a variable opts to use everyware
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
-- vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>bx', ':bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>sV', '<C-w>v', opts)     -- split window vertically
vim.keymap.set('n', '<leader>sH', '<C-w>s', opts)     -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>wx', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-Up>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':wincmd l<CR>', opts)

-- Resize with arrows
vim.keymap.set('n', '<S-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<S-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<S-Right>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<S-Left>', ':vertical resize +2<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting [default it replaces last yanked with current selected during put]
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- NOTE: custom

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set height on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', 'Esc', '<cmd>nohlsearch<CR>')

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { trail = '·', nbsp = '␣' } -- tab = '» '
