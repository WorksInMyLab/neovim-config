return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")
        -- find files
        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        -- find files in current git repo
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        -- find word
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        -- find word
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        -- grep string
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        -- help tags
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end,
}
