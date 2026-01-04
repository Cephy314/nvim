-- Leaders Early
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Core settings & keymaps
require('config.options')
require('config.keymaps')

-- Bootstrap lazy.nvim (0.12 uses vim.uv)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- Load plugins (each spec lives in lua/plugins/)
require('lazy').setup({ import = 'plugins' }, {
    install = { colorscheme = { 'gruvbox-material' } },
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                'matchparen',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})

-- Autocmds that may depend on plugins
require('config.autocmds')
