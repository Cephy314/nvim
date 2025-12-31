-- colorscheme.lua
-- https://github.com/Cephy314/nvim
-- ----------------------------------

return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_materiial_foreground = "original"
            vim.g.gruvbox_material_enable_bold = true
            vim.g.gruvbox_material_enable_italic = true
        end,
        config = function()
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
