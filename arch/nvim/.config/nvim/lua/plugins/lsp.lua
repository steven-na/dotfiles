return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
            },
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            -- Server-specific overrides
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            vim.lsp.config("ols", {
                cmd = { "ols" },
                filetypes = { "odin" },
                root_markers = { "ols.json", ".git" },
                init_options = {
                    odin_command = "odin",
                    checker_args = "-strict-style",
                    collections = {
                        { name = "shared", path = vim.fn.expand("$HOME/code/odin/shared/") },
                    },
                },
            })

            -- Enable servers (default configs come from nvim-lspconfig runtime)
            vim.lsp.enable({ "clangd", "pyright", "lua_ls", "hls", "ols" })

            -- Keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
                    end
                    map("gd", vim.lsp.buf.definition, "Goto definition")
                    map("gD", vim.lsp.buf.declaration, "Goto declaration")
                    map("gr", vim.lsp.buf.references, "Goto references")
                    map("gI", vim.lsp.buf.implementation, "Goto implementation")
                    map("K", vim.lsp.buf.hover, "Hover docs")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
                    map("<leader>e", vim.diagnostic.open_float, "Show diagnostic")
                end,
            })

            vim.diagnostic.config({
                virtual_text = false,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                    },
                },
                float = { border = "single" },
                underline = true,
                update_in_insert = false,
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = { notification = { window = { winblend = 0 } } },
    },
}
