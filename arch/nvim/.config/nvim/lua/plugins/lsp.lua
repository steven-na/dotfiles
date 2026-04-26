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
            -- nvim 0.11+ API: vim.lsp.config / vim.lsp.enable
            -- nvim-lspconfig provides default server configs in its runtime lsp/*.lua files

            local caps = require("blink.cmp").get_lsp_capabilities()

            -- Apply capabilities to all servers
            vim.lsp.config("*", { capabilities = caps })

            -- Server-specific overrides
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace   = { checkThirdParty = false },
                    },
                },
            })

            -- Enable servers (default configs come from nvim-lspconfig runtime)
            vim.lsp.enable({ "clangd", "pyright", "lua_ls", "hls" })

            -- Keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
                    end
                    map("gd",         vim.lsp.buf.definition,    "Goto definition")
                    map("gD",         vim.lsp.buf.declaration,   "Goto declaration")
                    map("gr",         vim.lsp.buf.references,    "Goto references")
                    map("gI",         vim.lsp.buf.implementation,"Goto implementation")
                    map("K",          vim.lsp.buf.hover,         "Hover docs")
                    map("<leader>rn", vim.lsp.buf.rename,        "Rename")
                    map("<leader>ca", vim.lsp.buf.code_action,   "Code action")
                    map("[d",         vim.diagnostic.goto_prev,  "Prev diagnostic")
                    map("]d",         vim.diagnostic.goto_next,  "Next diagnostic")
                    map("<leader>e",  vim.diagnostic.open_float, "Show diagnostic")
                end,
            })

            vim.diagnostic.config({
                virtual_text = false,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.INFO]  = " ",
                        [vim.diagnostic.severity.HINT]  = " ",
                    },
                },
                float  = { border = "single" },
                underline = true,
                update_in_insert = false,
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts  = { notification = { window = { winblend = 0 } } },
    },
}
