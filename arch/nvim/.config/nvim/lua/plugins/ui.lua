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
                        base0D = "#89b4fa",
                        base05 = "#cdd6f4",
                        base04 = "#585b70",
                        base0B = "#a6e3a1",
                        base0E = "#cba6f7",
                        base08 = "#f38ba8",
                        base0A = "#f9e2af",
                    }
                end
                return {
                    normal = {
                        a = { fg = p.base0D, bg = "NONE", gui = "bold" },
                        b = { fg = p.base05, bg = "NONE" },
                        c = { fg = p.base04, bg = "NONE" },
                    },
                    insert = { a = { fg = p.base0B, bg = "NONE", gui = "bold" } },
                    visual = { a = { fg = p.base0E, bg = "NONE", gui = "bold" } },
                    replace = { a = { fg = p.base08, bg = "NONE", gui = "bold" } },
                    command = { a = { fg = p.base0A, bg = "NONE", gui = "bold" } },
                    inactive = {
                        a = { fg = p.base04, bg = "NONE" },
                        b = { fg = p.base04, bg = "NONE" },
                        c = { fg = p.base04, bg = "NONE" },
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

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
                group = vim.api.nvim_create_augroup("ScrollOffEOF", {}),
                callback = function()
                    local win_h = vim.api.nvim_win_get_height(0)
                    local off = math.min(vim.o.scrolloff, math.floor(win_h / 2))
                    local dist = vim.fn.line("$") - vim.fn.line(".")
                    local rem = vim.fn.line("w$") - vim.fn.line("w0") + 1
                    if dist < off and win_h - rem + dist < off then
                        local view = vim.fn.winsaveview()
                        view.topline = view.topline + off - (win_h - rem + dist)
                        vim.fn.winrestview(view)
                    end
                end,
            })

            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    require("lualine").setup({ options = { theme = make_theme() } })
                    vim.o.laststatus = 0
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
