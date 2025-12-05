-- file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center buffer when navigating up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- lua
vim.keymap.set("n", "<leader><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- greatest remaps ever according to the Primeagen
-- paste without replacing paste with highlight
vim.keymap.set("x", "<leader>p", '"_dP')
-- mass replace string in file
vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)
-- make file executable
vim.keymap.set("n", "<leader>sx", "<cmd>!chmod +x %<CR>", { silent = true })

vim.api.nvim_create_autocmd("LspAttach", {
    -- use LspAttach autocommand to only map the following keys after the
    -- language server attaches to the current buffer
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- buffer local mappings
        -- see ':help vim.lsp.*' for documentation
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set(
            { "n", "v" },
            "<leader>ca",
            vim.lsp.buf.code_action,
            opts
        )
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        -- open the diagnostic under the cursor in a float window
        vim.keymap.set("n", "<leader>d", function()
            vim.diagnostic.open_float({
                border = "rounded",
            })
        end, opts)
    end,
})
