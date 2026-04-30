return {
    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            local function make_theme()
                local ok, p = pcall(dofile, vim.fn.expand("~/.cache/wallust/nvim.lua"))
                if not ok then
                    p = {
                        base01 = "#181825",
                        base0D = "#89b4fa",
                        base05 = "#cdd6f4",
                        base04 = "#585b70",
                        base0B = "#a6e3a1",
                        base0E = "#cba6f7",
                        base08 = "#f38ba8",
                        base0A = "#f9e2af",
                    }
                end
                local bg = vim.g.transparent_bg and "NONE" or p.base01
                return {
                    normal = {
                        a = { fg = p.base0D, bg = bg, gui = "bold" },
                        b = { fg = p.base05, bg = bg },
                        c = { fg = p.base04, bg = bg },
                    },
                    insert = { a = { fg = p.base0B, bg = bg, gui = "bold" } },
                    visual = { a = { fg = p.base0E, bg = bg, gui = "bold" } },
                    replace = { a = { fg = p.base08, bg = bg, gui = "bold" } },
                    command = { a = { fg = p.base0A, bg = bg, gui = "bold" } },
                    inactive = {
                        a = { fg = p.base04, bg = bg },
                        b = { fg = p.base04, bg = bg },
                        c = { fg = p.base04, bg = bg },
                    },
                }
            end

            require("lualine").setup({
                options = {
                    theme = make_theme(),
                    globalstatus = true,
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "encoding", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "TransparentToggle",
                callback = function()
                    require("lualine").setup({ options = { theme = make_theme() } })
                end,
            })

            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    require("lualine").setup({ options = { theme = make_theme() } })
                end,
            })
        end,
    },
    --     -- Buffer tabs
    {
        "akinsho/bufferline.nvim",
        version = "*",
        event = "VeryLazy",
        keys = {
            { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
            { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Close others" },
            { "<leader>bc", "<cmd>BufferLinePickClose<CR>", desc = "Close (pick)" },
        },
        opts = {
            options = {
                mode = "buffers",
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "thin",
                always_show_bufferline = false,
                diagnostics = "nvim_lsp",
            },
        },
    },
    -- Git signs in the gutter
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
            },
        },
    },
}
