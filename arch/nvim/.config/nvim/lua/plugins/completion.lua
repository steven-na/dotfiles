return {
    {
        "saghen/blink.cmp",
        version = "*",
        dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
        opts = {
            keymap = {
                preset = "none",
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide" },
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = { "show", "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-k>"] = { "snippet_forward", "fallback" },
                ["<C-j>"] = { "snippet_backward", "fallback" },
            },
            appearance = { nerd_font_variant = "mono" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            snippets = { preset = "luasnip" },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
                ghost_text = { enabled = false },
                menu = { auto_show = false },
            },
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
    {
        "nullromo/go-up.nvim",
        opts = {}, -- specify options here
        config = function(_, opts)
            local goUp = require("go-up")
            goUp.setup(opts)
        end,
    },
}
