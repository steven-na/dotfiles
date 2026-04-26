return {
    {
        "saghen/blink.cmp",
        version = "*",
        dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
        opts = {
            keymap = {
                preset = "none",
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"]     = { "hide" },
                ["<CR>"]      = { "accept", "fallback" },
                ["<Tab>"]     = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"]   = { "select_prev", "snippet_backward", "fallback" },
                ["<C-b>"]     = { "scroll_documentation_up", "fallback" },
                ["<C-f>"]     = { "scroll_documentation_down", "fallback" },
                ["<C-n>"]     = { "select_next", "fallback" },
                ["<C-p>"]     = { "select_prev", "fallback" },
            },
            appearance = { nerd_font_variant = "mono" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            snippets = { preset = "luasnip" },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
                ghost_text     = { enabled = true },
                menu           = { border = "single" },
            },
            signature = { enabled = true, window = { border = "single" } },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
