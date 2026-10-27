local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({
    { src = gh 'bluz71/vim-moonfly-colors',     name = "moonfly" },
    { src = gh 'tpope/vim-surround.git',        name = "surround" },
    { src = gh 'NMAC427/guess-indent.nvim',     name = "guess-indent" },
    -- { src = gh 'wellle/targets.vim.git',        name = "targets" },
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

function run_last_recorded_macro()
  local reg = vim.fn.reg_recorded()
  return reg == '' and '' or ('@' .. reg)
end

mapn('<C-q>', run_last_recorded_macro, { expr = true })
mapn('<Esc>', '<cmd>nohlsearch<CR>')
mapn('d;', '0D')
mapn('y;', '0Y')

mapi('<C-h>', '<Left>')
mapi('<C-l>', '<Right>')
mapi('<C-j>', '<Down>')
mapi('<C-k>', '<Up>')
mapi('<C-y>', '<C-a>')
mapi('<C-a>', '<C-o>I')
mapi('<C-e>', '<C-o>A')

-- Not sure about these
mapi('<M-b>', '<C-Left>')
mapi('<M-B>', '<C-o>B')
mapi('<M-w>', '<C-Right>')
mapi('<M-W>', '<C-o>W')

-- I would rather want these set to ctrl-i and ctrl-m, but the terminal doesn't allow that sadly.
mapi("<M-i>", '<C-o>O')


-- mapv('<C-p>', 'pg;g;P')

vim.o.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣' }

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.hl_op() end,
})
