return {
    {
        "github/copilot.vim",
        cmd = "Copilot",
        event = "BufWinEnter",
        init = function()
            vim.g.copilot_no_maps = true
        end,
        config = function()
            -- Block the normal Copilot suggestions
            vim.api.nvim_create_augroup("github_copilot", { clear = true })
            vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
                group = "github_copilot",
                callback = function(args)
                    vim.fn["copilot#On" .. args.event]()
                end,
            })
            vim.fn["copilot#OnFileType"]()
        end,
    },
    {
        "saghen/blink.cmp",
        -- build = "cargo +nightly build --release", -- compile Rust backend locally
        version = "1.*",
        dependencies = { "fang2hou/blink-copilot" },
        opts = function()
            -- Only wire Copilot source if provider is installed to avoid missing-module errors.
            -- local has_copilot = pcall(require, "blink-copilot")
            local default_sources = { "lsp", "path", "buffer", "snippets", "copilot" }
            local providers = {
                copilot = {
                    name = "blink-copilot",
                    module = "blink-copilot",
                    enabled = true,
                    score_offset = 10, -- push Copilot below LSP but above buffer
                    async = true,
                },
            }

            return {
                keymap = {
                    preset = "super-tab", -- enter accepts selection; tab for navigation by default
                },
                cmdline = { enabled = true },
                sources = {
                    default = default_sources,
                    providers = providers,
                },
                fuzzy = {
                    implementation = "prefer_rust_with_warning",
                },
            }
        end,
    },
}
