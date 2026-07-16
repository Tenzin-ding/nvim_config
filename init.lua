local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({
    { src = gh 'bluz71/vim-moonfly-colors',     name = "moonfly" },
    { src = gh 'tpope/vim-surround.git',        name = "surround" },
    { src = gh 'NMAC427/guess-indent.nvim',     name = "guess-indent" },
    { src = gh 'wellle/targets.vim.git',        name = "targets" },
    { src = gh 'tpope/vim-repeat.git',          name = "vim-repeat" },
})
require('guess-indent').setup {}
vim.cmd [[colorscheme moonfly]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.relativenumber = true
vim.o.number = true
vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = false
vim.o.cursorline = true
vim.o.scrolloff = 1

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', 'd;', '0D')
vim.keymap.set('n', 'y;', '0Y')

vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move cursor left in insert mode' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move cursor right in insert mode' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move cursor down in insert mode' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move cursor up in insert mode' })
-- I would rather want these set to ctrl-i and ctrl-m, but the terminal doesn't allow that sadly.
vim.keymap.set('i', '<C-q>', '<C-o>o', { desc = 'Same as enter, but does not split the line.' })
vim.keymap.set('i', '<C-b>', '<C-o>O', { desc = 'Same as crtl-m, but goes upwards.' })

vim.o.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣' }

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
