-- lua/config/keymaps.lua
-- https://github.com/Cephy314/nvim

-- default options for binds
local opts = { silent = true }

-- helper section to make bindings cleaner
local function map(mode, lhs, rhs, desc)
    local o = opts
    if desc then
        o = vim.tbl_extend('force', opts, { desc = desc })
    end
    vim.keymap.set(mode, lhs, rhs, o)
end

-- Better defaults
-- map({ 'n', 'v' }, '<Space>', '<Nop>')

-- Window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<leader>w|', '<C-w>v', '[W]indow Split [|] Vertical')
map('n', '<leader>w-', '<C-w>h', '[W]indow Split [-] Horizontal')
map('n', '<leadee>wq', '<cmd>close<CR>', '[W]indow [Q]uit')
map('n', '<leader>wo', '<C-w>o', '[W]indow Close [O]ther')

-- Resize splits
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Buffers
map('n', '<S-l>', ':bnext<CR>')
map('n', '<S-h>', ':bprevious<CR>')

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Quick save/quit
map('n', '<leader>w', '<cmd>w<CR>', '[W]rite file')
map('n', '<leader>q', '<cmd>q<CR>', '[Q]uit Neovim')

-- Telescope placeholders (plugins/telescope.lua will define)
map('n', '<leader>sf', function()
    vim.cmd('Telescope find_files')
end, '[S]earch [F]iles')
map('n', '<leader>sg', function()
    vim.cmd('Telescope live_grep')
end, '[S]earch [G]rep')
map('n', '<leader><leader>', function()
    vim.cmd('Telescope buffers')
end)
map('n', '<leader>sh', function()
    vim.cmd('Telescope help_tags')
end, '[S]earch [H]elp')

-- LSP placeholders (bound after lsp attaches)
map('n', 'gd', vim.lsp.buf.definition, '[G]o to [D]efinition')
map('n', 'gr', vim.lsp.buf.references, '[G]o to [R]eferences')
map('n', 'K', vim.lsp.buf.hover, '[K] Hover Documentation')
map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]all [A]ction')
map('n', '<leader>fd', function()
    vim.diagnostic.open_float()
end, '[F]loat [D]iagnostic')

-- Formatting (conform will override to async format)
map({ 'n', 'v' }, '<leader>f', function()
    vim.lsp.buf.format({ async = true })
end, '[F]ormat code')
