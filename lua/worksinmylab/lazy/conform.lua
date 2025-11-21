return {
    "stevearc/conform.nvim",

    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                lua = { "stylua" },
            },
            --log_level = vim.log.levels.DEBUG,
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            formatters = {
                ["clang-format"] = {
                    prepend_args = { "--style=file" },
                },
            },
        })

        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({ bufnr = 0 })
        end)
    end,
}
