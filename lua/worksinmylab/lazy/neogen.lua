return {
    "danymat/neogen",
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
            enabled = true,
        })

        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap(
            "n",
            "<leader>df",
            ":lua require('neogen').generate({ type = 'func' })<CR>",
            opts
        )
        vim.api.nvim_set_keymap(
            "n",
            "<Leader>dc",
            ":lua require('neogen').generate({ type = 'class' })<CR>",
            opts
        )
    end,
}
