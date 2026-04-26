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
        },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = false,
    },
    config = function(_, opts)
        local ok = pcall(require, "nvim-treesitter.configs")
        if ok then
            require("nvim-treesitter.configs").setup(opts)
        else
            require("nvim-treesitter").setup(opts)
        end
    end,
}
