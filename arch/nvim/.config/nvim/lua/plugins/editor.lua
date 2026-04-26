return {
    -- Motion: s + two chars to jump anywhere
    {
        url = "https://codeberg.org/andyg/leap.nvim",
        keys = {
            { "s", "<Plug>(leap)", mode = { "n", "x", "o" }, desc = "Leap" },
            { "S", "<Plug>(leap-from-window)", mode = { "n", "o" }, desc = "Leap from window" },
        },
    },
    -- Enforce good vim habits
    {
        "m4xshen/hardtime.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            max_count = 4,
            -- Remove arrows from disabled (completely blocked) and add to
            -- restricted (blocked after max_count, same as hjkl)
            disabled_keys = {
                ["<Up>"] = {},
                ["<Down>"] = {},
                ["<Left>"] = {},
                ["<Right>"] = {},
            },
            restricted_keys = {
                ["<Up>"] = { "n", "x" },
                ["<Down>"] = { "n", "x" },
                ["<Left>"] = { "n", "x" },
                ["<Right>"] = { "n", "x" },
            },
        },
    },
    -- Auto-close brackets/quotes
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = { check_ts = true },
    },
    -- Folding powered by treesitter/LSP
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufReadPost",
        keys = {
            {
                "zR",
                function()
                    require("ufo").openAllFolds()
                end,
                desc = "Open all folds",
            },
            {
                "zM",
                function()
                    require("ufo").closeAllFolds()
                end,
                desc = "Close all folds",
            },
        },
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        },
    },
    -- Surround text objects: ys, ds, cs
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },
}
