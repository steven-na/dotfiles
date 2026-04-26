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
		},
	},
}
