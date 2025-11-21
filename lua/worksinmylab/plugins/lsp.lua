return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim", -- code formatting
        "mason-org/mason.nvim", -- package tool for LSPs, formatters and linters
        "mason-org/mason-lspconfig.nvim", -- bridge between mason and lspconfig
        "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in language server client
        "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
        "hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths
        "hrsh7th/cmp-cmdline", -- nvim-cmp source for vim's cmdline
        "hrsh7th/nvim-cmp", -- completion engine plugin
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- luasnip completion source for nvim-cmp
    },
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            },
        },
    },
    config = function(_, opts)
        require("conform").setup({
            formatters_by_ft = {},
        })
        local cmp = require("cmp")

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
            },
        })

        for server, config in pairs(opts.servers) do
            vim.lsp.config(server, config)
        end

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- for `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- for luasnip users.
            }, {
                { name = "buffer" },
            }),
        })

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
        })
    end,
}
