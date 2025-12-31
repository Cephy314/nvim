-- /lua/plugins/lsp.lua
-- https://github.com/Cephy314/lua

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {globals = {"vim"} },
                workspace = { checkThirdParty = false },
            },
        },
    },
    tsserver = {},
    jsonls = {}
    rust_analyzer = {},
    pyright = {},
    bashls = {},
    html = {},
    cssls = {},
    copilot = {}
}

return {
    { "williamboman/mason.nvim", config = true }
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = { ensure_installed = vim.tbl_keys(servers) },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp } -- for capabilities helper
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            for name, cfg in pairs(servers) do
                lspconfig[name].setup(vim.tbl_deep_extend("force", {
                    capabilities = capabilities,
                    on_attach = function(_, bufnr)
                        local map = function(mode, lhs, rhs)
                            vim.keymap.set(mode, lhs, rhs, {buffer = bufnr, silent = true})
                        end
                        map("n", "gd", vim.lsp.buf.definition)
                        map("n", "gr", vim.lsp.buf.references)
                        map("n", "K", vim.lsp.buf.hover)
                        map("n", "<leader>rn", vim.lsp.buf.rename)
                        map("n", "<leader>ca", vim.lsp.buf.code_action)
                    end,
                }, cfg))
            end
        end,
    },
}
