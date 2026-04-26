return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<CR>",        desc = "Find files" },
        { "<leader>fg", "<cmd>FzfLua live_grep<CR>",    desc = "Live grep" },
        { "<leader>fb", "<cmd>FzfLua buffers<CR>",      desc = "Buffers" },
        { "<leader>fs", "<cmd>FzfLua grep_cword<CR>",   desc = "Grep word under cursor" },
        { "<leader>fr", "<cmd>FzfLua oldfiles<CR>",     desc = "Recent files" },
        { "<leader>fc", "<cmd>FzfLua commands<CR>",     desc = "Commands" },
        { "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Document diagnostics" },
        { "<leader>/",  "<cmd>FzfLua blines<CR>",       desc = "Search current buffer" },
    },
    opts = {
        winopts = {
            height  = 0.6,
            width   = 0.8,
            border  = "single",
            preview = { border = "single" },
        },
        fzf_opts = { ["--cycle"] = true },
    },
}
