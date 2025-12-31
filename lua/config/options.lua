-- lua/config/options.lua
-- https://www.github.com/Cephy314/nvim

-- Basic editing
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "100"
vim.opt.list = true
vim.opt.listchars = { tab = "󰌒 ", trail = "·", nbsp = "␣", eol = "↴"}

-- Splits & UI
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 3
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"
vim.opt.shortmess:append("I") -- no intro message

-- Tabs/indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.hlsearch = true

-- Undo/backup
vim.opt.undofile = true

-- Clipboard (scheduled so provider loads)
vim.schedule(function()
vim.opt.clipboard:append("unnamedplus")
end)

-- Diagnostics (works with 0.12)
vim.diagnostic.config({
signs = {
  text = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN]  = " ",
    [vim.diagnostic.severity.INFO]  = " ",
    [vim.diagnostic.severity.HINT]  = " ",
  },
},
virtual_text = true,
})
