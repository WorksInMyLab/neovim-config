return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- list of parser names
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "doxygen",
                    "lua",
                    "meson",
                    "rust",
                    "toml",
                },

                -- install parsers synchronously (only applied to 'ensured_installed')
                sync_install = false,

                -- automagically install missing parsers
                auto_install = false,

                indent = {
                    enable = true,
                },

                highlight = {
                    -- 'false' will disable the whole extension
                    enable = true,
                    disable = function(lang, buf)
                        if lang == "html" then
                            print("disabled")
                            return true
                        end

                        local max_filesize = 100 * 1024 -- 100KB
                        local ok, stats = pcall(
                            vim.loop.fs_stat,
                            vim.api.nvim_buf_get_name(buf)
                        )
                        if ok and stats and stats.size > max_filesize then
                            vim.notify(
                                "File larger than 100KB treesitter disabled for performance",
                                vim.log.levels.WARN,
                                { title = "treesitter" }
                            )
                            return true
                        end
                    end,
                    -- setting this to true will run ':h syntax`'and tree-sitter at the same time.
                    -- set this to 'true' if you depend on "syntax" being enabled (like for indentation).
                    -- using this option may slow down your editor, and you may see some duplicate highlights.
                    -- instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = { "markdown" },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        config = function()
            require("treesitter-context").setup({
                -- enable the plugin
                enable = true,
                -- multi window support
                multiwindow = false,
                -- how many lines the window should span. Values <=0 mean no limit
                max_lines = 0,
                -- minimum editor window height to enable context. Values <= 0 mean no limit.
                min_window_height = 0,
                line_numbers = true,
                -- maximum number of lines to show for a single context
                multiline_threshold = 20,
                -- which context lines to discard if 'max_lines' is exceded. Choices: 'inner', 'outer'
                trim_scope = "outer",
                -- line used to calculate context. Choices: 'cursor', 'topline'
                mode = "cursor",
                -- separator between context and content. Should be a single character string, like '-'.
                separator = nil,
                -- the Z-index of contetxt window
                zindex = 20,
                -- (fun(buf: integer): boolean) return false to disable attaching
                on_attach = nil,
            })
        end,
    },
}
