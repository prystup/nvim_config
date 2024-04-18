return {
    -- { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {} },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "night",
            transparent = false,
            terminal_colors = false,
            --true
            styles = {
                sidebars = "dark",
                --normal
                floats = "dark",
                --dark
                comments = { italic = true },
                keywords = { italic = true },
                -- functions = { italic = true },
            },
            sidebars = { "packer" },
            -- sidebars = { "qf", "vista_kind", "terminal", "packer" },
            -- packer
            lualine_bold = true,
            -- change colors
            -- on_colors = function(colors)
            --     colors.hint = colors.blue
            --     colors.error = "#ff00ff"
            -- end,
        },
    },
}
