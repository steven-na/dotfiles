return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        icons    = { mappings = false },
        delay    = 300,
        spec = {
            { "<leader>f",  group = "find" },
            { "<leader>b",  group = "buffer" },
            { "<leader>s",  group = "split" },
            { "<leader>r",  group = "refactor" },
            { "<leader>c",  group = "code" },
            { "<leader>cF", desc  = "Toggle autoformat" },
            { "<leader>cf", desc  = "Format buffer" },
            { "<leader>e",  desc  = "File explorer" },
            { "<leader>u",  desc  = "Undo tree" },
            { "<leader>bp", desc  = "Pick buffer" },
            { "<leader>bo", desc  = "Close others" },
            { "<leader>bc", desc  = "Close (pick)" },
        },
    },
    keys = {
        { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer keymaps" },
    },
}
