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

function mapn(key, command, other)
    vim.keymap.set('n', key, command, other)
end
function mapi(key, command, other)
    vim.keymap.set('i', key, command, other)
end
function mapv(key, command, other)
    vim.keymap.set('v', key, command, other)
end

mapn('<Esc>', '<cmd>nohlsearch<CR>')
mapn('d;', '0D')
mapn('y;', '0Y')

mapi('<C-h>', '<Left>', { desc = 'Move cursor left in insert mode' })
mapi('<C-l>', '<Right>', { desc = 'Move cursor right in insert mode' })
mapi('<C-j>', '<Down>', { desc = 'Move cursor down in insert mode' })
mapi('<C-k>', '<Up>', { desc = 'Move cursor up in insert mode' })

-- Not sure about these
mapi('<M-b>', '<C-Left>')
mapi('<M-B>', '<C-o>B')
mapi('<M-w>', '<C-Right>')
mapi('<M-W>', '<C-o>W')

-- I would rather want these set to ctrl-i and ctrl-m, but the terminal doesn't allow that sadly.
mapi('<M-CR>', '<C-o>o', { desc = 'Same as enter, but does not split the line.' })
mapi("<M-'>", '<C-o>O', { desc = 'Same as crtl-m, but goes upwards.' })

-- mapv('<C-p>', 'pg;g;P')

vim.o.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣' }

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.hl_op() end,
})
