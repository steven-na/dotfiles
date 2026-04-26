return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
        require("lint").linters_by_ft = {
            c   = { "cppcheck" },
            cpp = { "cppcheck" },
            python = { "ruff" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
