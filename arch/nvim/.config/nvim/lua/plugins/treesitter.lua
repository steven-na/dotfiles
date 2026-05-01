return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    tag = "v0.9.3",
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
        require("nvim-treesitter.configs").setup(opts)
    end,
}
