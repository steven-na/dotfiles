return {
    -- Splash screen / dashboard
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            dashboard = {
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
        },
    },
    -- Undo history tree
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" },
        },
    },
    -- Buffer-based file explorer
    {
        "stevearc/oil.nvim",
        lazy = false,
        keys = {
            { "<leader>e", "<cmd>Oil<CR>", desc = "File explorer" },
            { "-", "<cmd>Oil<CR>", desc = "Open parent dir" },
        },
        opts = {
            default_file_explorer = true,
            view_options = { show_hidden = true },
            constrain_cursor = false,
        },
    },
    {
        "nullromo/go-up.nvim",
        opts = {
            respectScrolloff = true,
            goUpLimit = "center",
            ignoredFiletypes = {
                "oil",
                "snacks_dashboard",
                "lazy",
            },
        }, -- specify options here
        config = function(_, opts)
            local goUp = require("go-up")
            goUp.setup(opts)

            -- Use <C-r> to center
            vim.keymap.set({ "n", "v" }, "<C-r>", function()
                require("go-up").centerScreen()
            end, { desc = "center the screen" })

            vim.o.scrolloff = 0 -- disable native, we handle it entirely
            vim.opt.fillchars:append({ eob = " " })

            local SCROLLOFF = 20 -- your desired value

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
                group = vim.api.nvim_create_augroup("ScrollOffEOF", { clear = true }),
                callback = function()
                    if vim.bo.filetype == "oil" then
                        return
                    end

                    local win_h = vim.api.nvim_win_get_height(0)
                    local off = math.min(SCROLLOFF, math.floor(win_h / 2))
                    local line = vim.fn.line(".")
                    local last = vim.fn.line("$")
                    local winline = vim.fn.winline()

                    -- Near top: scroll into go-up virtual lines (Ctrl-Y)
                    if line <= off then
                        local needed = off - winline + 1
                        if needed > 0 then
                            vim.cmd('execute "normal! ' .. needed .. '\025"')
                            return
                        end
                    end

                    -- Near bottom / EOF: scroll past last line (winrestview)
                    local dist_bot = last - line
                    local rem = vim.fn.line("w$") - vim.fn.line("w0") + 1
                    if dist_bot < off and win_h - rem + dist_bot < off then
                        local view = vim.fn.winsaveview()
                        view.topline = view.topline + off - (win_h - rem + dist_bot)
                        vim.fn.winrestview(view)
                        return
                    end

                    -- Middle: replicate normal scrolloff behavior
                    if winline > win_h - off then
                        -- too close to bottom of window, scroll down (Ctrl-E)
                        vim.cmd('execute "normal! ' .. (winline - (win_h - off)) .. '\005"')
                    elseif winline < off + 1 then
                        -- too close to top of window, scroll up (Ctrl-Y)
                        vim.cmd('execute "normal! ' .. (off + 1 - winline) .. '\025"')
                    end
                end,
            })
        end,
    },
}
