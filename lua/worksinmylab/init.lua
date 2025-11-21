require("worksinmylab.remap")
require("worksinmylab.lazy_init")
require("worksinmylab.set")

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
