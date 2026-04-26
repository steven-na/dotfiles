return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",  "TmuxNavigateDown",
        "TmuxNavigateUp",    "TmuxNavigateRight",
    },
    keys = {
        { "<C-Left>",  "<cmd>TmuxNavigateLeft<CR>",  desc = "Pane left",  mode = { "n", "t" } },
        { "<C-Down>",  "<cmd>TmuxNavigateDown<CR>",  desc = "Pane down",  mode = { "n", "t" } },
        { "<C-Up>",    "<cmd>TmuxNavigateUp<CR>",    desc = "Pane up",    mode = { "n", "t" } },
        { "<C-Right>", "<cmd>TmuxNavigateRight<CR>", desc = "Pane right", mode = { "n", "t" } },
    },
    init = function()
        vim.g.tmux_navigator_no_mappings = 1
    end,
}
