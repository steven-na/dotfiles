return {
    "echasnovski/mini.base16",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
        local palette_path = vim.fn.expand("~/.cache/wallust/nvim.lua")

        local fallback = {
            base00 = "#1e1e2e",
            base01 = "#181825",
            base02 = "#313244",
            base03 = "#45475a",
            base04 = "#585b70",
            base05 = "#cdd6f4",
            base06 = "#f5c2e7",
            base07 = "#b4befe",
            base08 = "#f38ba8",
            base09 = "#fab387",
            base0A = "#f9e2af",
            base0B = "#a6e3a1",
            base0C = "#94e2d5",
            base0D = "#89b4fa",
            base0E = "#cba6f7",
            base0F = "#f2cdcd",
        }

        local function load_palette()
            local ok, p = pcall(dofile, palette_path)
            return ok and p or fallback
        end

        local transparent_groups = {
            "Normal",
            "NormalNC",
            "NormalFloat",
            "SignColumn",
            "FoldColumn",
            "EndOfBuffer",
            "LineNr",
            "CursorLineNr",
            "CursorLine",
            "StatusLine",
            "StatusLineNC",
            "TabLine",
            "TabLineFill",
            "TabLineSel",
            "VertSplit",
            "WinSeparator",
            "Pmenu",
            "PmenuSbar",
            "PmenuThumb",
            "FloatBorder",
            "FloatTitle",
        }

        local function apply_transparent()
            for _, grp in ipairs(transparent_groups) do
                vim.cmd("hi " .. grp .. " guibg=NONE ctermbg=NONE")
            end
        end

        local function apply(palette)
            require("mini.base16").setup({ palette = palette })
            vim.api.nvim_set_hl(0, "LineNr", { fg = palette.base05 })
            vim.api.nvim_set_hl(0, "LineNrAbove", { fg = palette.base05 })
            vim.api.nvim_set_hl(0, "LineNrBelow", { fg = palette.base05 })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.base03, bold = true })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = palette.base00 })
            vim.api.nvim_set_hl(0, "CursorLineSign", { bg = palette.base00 })
            vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = palette.base08, bg = palette.base00 })
            vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = palette.base0A, bg = palette.base00 })
            vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = palette.base0D, bg = palette.base00 })
            vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = palette.base0C, bg = palette.base00 })
            if vim.g.transparent_bg then
                apply_transparent()
            end
        end

        vim.g.transparent_bg = false
        apply(load_palette())

        -- Watch wallust output file and reload automatically
        local watcher = vim.uv.new_fs_event()
        if watcher then
            watcher:start(
                palette_path,
                {},
                vim.schedule_wrap(function()
                    apply(load_palette())
                end)
            )
        end

        vim.keymap.set("n", "<leader>tt", function()
            vim.g.transparent_bg = not vim.g.transparent_bg
            if vim.g.transparent_bg then
                apply_transparent()
                vim.notify("Background: transparent", vim.log.levels.INFO)
            else
                apply(load_palette())
                vim.notify("Background: colorscheme", vim.log.levels.INFO)
            end
            vim.api.nvim_exec_autocmds("User", { pattern = "TransparentToggle" })
        end, { desc = "Toggle transparent background" })
    end,
}
