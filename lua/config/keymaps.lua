-- lua/config/keymaps.lua
-- https://github.com/Cephy314/nvim

local map = vim.keymap.set
local opts = { silent = true }

-- Better defaults
map({ "n", "v" }, "<Space>", "<Nop>", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Quick save/quit
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>q", "<cmd>q<CR>", opts)

-- Telescope placeholders (plugins/telescope.lua will define)
map("n", "<leader>ff", function() vim.cmd("Telescope find_files") end, opts)
map("n", "<leader>fg", function() vim.cmd("Telescope live_grep") end, opts)
map("n", "<leader>fb", function() vim.cmd("Telescope buffers") end, opts)
map("n", "<leader>fh", function() vim.cmd("Telescope help_tags") end, opts)

-- LSP placeholders (bound after lsp attaches)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>fd", function() vim.diagnostic.open_float() end, opts)

-- Formatting (conform will override to async format)
map({ "n", "v" }, "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
