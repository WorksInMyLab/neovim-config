require("worksinmylab.set")
require("worksinmylab.lazy_init")
require("worksinmylab.remap")

local autocmd = vim.api.nvim_create_autocmd

-- trigger format on save
autocmd("BufWritePre", {
    desc = "Format on save",
    group = vim.api.nvim_create_augroup(
        "worksinmylab-format-save",
        { clear = true }
    ),
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- highlight when yank
autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup(
        "worksinmylab-highlight-yank",
        { clear = true }
    ),
    callback = function()
        vim.highlight.on_yank()
    end,
})
