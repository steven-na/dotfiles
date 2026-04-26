return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd   = { "ConformInfo", "FormatToggle" },
    keys  = {
        {
            "<leader>cF",
            function()
                vim.g.format_on_save = not vim.g.format_on_save
                vim.notify(
                    "Format on save: " .. (vim.g.format_on_save and "enabled" or "disabled"),
                    vim.log.levels.INFO,
                    { title = "conform" }
                )
            end,
            desc = "Toggle autoformat",
        },
        {
            "<leader>cf",
            function() require("conform").format({ async = true, lsp_fallback = true }) end,
            desc = "Format buffer",
        },
    },
    config = function()
        vim.g.format_on_save = true

        require("conform").setup({
            formatters_by_ft = {
                c      = { "clang_format" },
                cpp    = { "clang_format" },
                python = { "isort", "black" },
                lua    = { "stylua" },
                haskell = { "ormolu" },
            },
            format_on_save = function(bufnr)
                if not vim.g.format_on_save then return end
                if vim.g.disable_autoformat_buf and vim.g.disable_autoformat_buf[bufnr] then return end
                return { timeout_ms = 500, lsp_fallback = true }
            end,
        })

        vim.api.nvim_create_user_command("FormatToggle", function()
            vim.g.format_on_save = not vim.g.format_on_save
            vim.notify("Format on save: " .. (vim.g.format_on_save and "on" or "off"))
        end, {})
    end,
}
