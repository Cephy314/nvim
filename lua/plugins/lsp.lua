local servers = {
    "lua_ls",
    "vtsls",
    "biome",
    "rust_analyzer",
    "pyright",
    "bashls",
    "html",
    "copilot",
    "tailwindcss",
    "cssls",
}

return {
    {
        "neovim/nvim-lspconfig",
        opt = {},
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {"mason-org/mason.nvim", "neovim/nvim-lspconfig", "saghen/blink.cmp" },
        opts = {
            ensure_installed = servers,
            automatic_enable = true, -- auto-run vim.lsp.enable() for installed servers
        },
        config = function(_, opts)
            require("mason").setup({})
            require("mason-lspconfig").setup(opts)

            -- shared defaults for all servers
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.lsp.config("*", {
                capabilities = capabilities,
                handlers = {
                    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded "}),
                    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded"})
                },
            })

            -- per-server tweaks
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            -- Keymaps via LspAttach (preferred in 0.11+)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = function(mode, lhs, rhs)
                        vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, silent = true })
                    end
                    map("n", "gd", vim.lsp.buf.definition)
                    map("n", "gr", vim.lsp.buf.references)
                    map("n", "K", vim.lsp.buf.hover)
                    map("n", "<leader>rn", vim.lsp.buf.rename)
                    map("n", "<leader>.", vim.lsp.buf.code_action)
                    map("n", "[d", vim.diagnostic.goto_prev)
                    map("n", "]d", vim.diagnostic.goto_next)
                    map("n", "<leader>fd,", vim.diagnostic.open_float)
                end,
            })
        end,
    },
}
