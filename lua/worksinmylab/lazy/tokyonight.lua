return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "night" },
    config = function()
        require("tokyonight").setup({
            -- four different styles 'moon', 'storm', 'night' and 'day'
            style = "night",
            transparent = "false",
            terminal_colors = "true",
            styles = {
                -- style to be applied to different syntax groups
                -- value is any vald attr-list value for ':help nvim_set_hl'
                comments = { italic = false },
                keywords = { italic = false },
                sidebars = "dark", -- style for sidebars
                floats = "dark", -- style for floating windows
            },
        })
        vim.cmd.colorscheme("tokyonight")
    end,
}
