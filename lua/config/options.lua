-- lua/config/options.lua
-- https://www.github.com/Cephy314/nvim

local o = vim.opt

-- Basic editing
o.termguicolors = true -- 24bit Colors
o.number = true -- Line Numbers
o.relativenumber = true -- Relative line numbers
o.signcolumn = "yes" -- Sign column
o.cursorline = true -- highlight cursor line
o.wrap = false -- Wordwrap
o.scrolloff = 10 -- Min lines above/below cursor
o.sidescrolloff = 8 -- Min cols left/right of cursor
o.colorcolumn = "100" -- Ruler at 100 chars
o.list = true -- Show whitespace characters
o.listchars = { tab = "󰌒 ", trail = "·", nbsp = "␣" } -- Show hidden characters
o.showmatch = true -- Highlight matching brackets
o.matchtime = 2 -- Delay for showmatch
o.cmdheight = 1 -- Command line height
o.showmode = false -- Don't show mode since we have a statusline
o.pumheight = 10 -- Popup menu height
o.pumblend = 10 -- Popup menu transparency
o.winblend = 0 -- Window transparency
o.completeopt = { "menu", "menuone", "noselect" } -- Completion options
o.confirm = true -- Confirm to save changes before exiting
o.synmaxcol = 300 -- Max column for syntax highlight
o.ruler = false -- Don't show the ruler
o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
o.winminwidth = 5 -- Minimum window width

-- Splits & UI
o.splitbelow = true     -- Horizontal splits below
o.splitright = true     -- Vertical splits right
o.laststatus = 3        -- Global statusline
o.winborder = "rounded" -- Rounded window borders
o.pumborder = "rounded" -- Rounded popup borders
o.shortmess:append("I") -- no intro message

-- Tabs/indent
o.expandtab = true   -- Use spaces instead of tabs
o.shiftwidth = 4     -- Indent size
o.softtabstop = -1   -- Use shiftwidth for tabs
o.tabstop = 4        -- Tab size
o.smartindent = true -- Smart indenting
o.breakindent = true -- Wrapped lines indent
o.autoindent = true  -- Auto indent

-- Search
o.ignorecase = true    -- Case insensitive search
o.smartcase = true     -- Smart case search
o.inccommand = "split" -- Incremental command preview
o.hlsearch = true      -- Highlight search results

-- File handling
o.backup = false                            -- No backup files
o.writebackup = false                       -- No backup files
o.swapfile = false                          -- No swap files
o.undofile = true
o.undolevels = 10000                        -- More undolevels
o.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
o.updatetime = 300                          -- Faster completion
o.timeoutlen = 0                            -- Faster key timeout
o.autoread = true                           -- Auto read files changed outside of nvim
o.autowrite = true                          -- Auto write files when leaving a buffer

-- Behavior
o.hidden = true
o.errorbells = false                                  -- No error bells
o.backspace = "indent,eol,start"                      -- Better backspace
o.autochdir = false                                   -- Don't auto change directory
o.iskeyword:append("-")                               -- Treat dash-separated words as a single word
o.path:append("**")                                   -- Recursive path searching
o.selection = "exclusive"                             -- Better visual selection
o.mouse = "a"                                         -- Enable mouse support
o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
o.modifiable = true                                   -- Allow buffer modification
o.encoding = "utf-8"                                  -- File encoding

-- Folding settings
o.smoothscroll = true
vim.wo.foldmethod = "expr"
o.foldlevel = 90             -- start with all folds open
o.formatoptions = "jcroqlnt" -- better formatting options
o.grepformat = "%f:%l:%c:%m" -- better grep format
o.grepprg = 'rg --vimgrep'   -- Use ripgrep for grep

-- Command line completion
o.wildmenu = true
o.wildmode = "longest:full,full"
o.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Create undo directory if it doesnt exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

vim.g.autoformat = true
vim.g.trouble_lualine = true

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

vim.filetype.add({
    extension = {
        env = "dotenv",
    },
    filename = {
        [".env"] = "dotenv",
        ["env"] = "dotenv",
    },
    pattern = {
        ["[jt]sconfig.*.json"] = "jsonc",
        ["%.env%.[%w_.-]+"] = "dotenv",
    },
})
