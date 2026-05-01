return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = {
            "c",
            "cpp",
            "python",
            "lua",
            "haskell",
            "vim",
            "vimdoc",
            "query",
            "bash",
            "markdown",
            "markdown_inline",
            "json",
            "toml",
            "yaml",
            "odin",
        },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = false,
    },
    config = function(_, opts)
        -- new API, configs module is gone
        require("nvim-treesitter").setup(opts)
    end,
}
