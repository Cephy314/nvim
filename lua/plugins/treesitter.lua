-- /lua/plugins/treesitter.lua
-- https://github.com/Cephy314/nvim
-- ---------------------------------

return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "lua",
                "luadoc",
                "luap",
                "vim",
                "vimdoc",
                "typescript",
                "tsx",
                "javascript",
                "jsdoc", 
                "json",
                "jsonc",
                "json5",
                "rust",
                "python",
                "bash",
                "html",
                "css",
                "markdown",
                "diff",
                "graphql",
                "yaml",
                "toml",
                "regex",
                "query"
            },
            highlight = { enable = true },
            indent = { enable = true },
        },
       config = function(_,opts)
           require("nvim-treesitter.config").setup(opts)
       end,
   },
   }
