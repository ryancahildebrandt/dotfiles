return {
	{ "ellisonleao/gruvbox.nvim" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	-- add more treesitter parsers
	-- {
	--   "nvim-treesitter/nvim-treesitter",
	--   opts = {
	--     ensure_installed = {
	--       "bash",
	--       "html",
	--       "javascript",
	--       "json",
	--       "lua",
	--       "markdown",
	--       "markdown_inline",
	--       "python",
	--       "query",
	--       "regex",
	--       -- "tsx",
	--       -- "typescript",
	--       -- "vim",
	--       "yaml",
	--     },
	--   },
	-- },

	-- -- use mini.starter instead of alpha
	-- -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

	-- -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
	-- { import = "lazyvim.plugins.extras.lang.json" },
}
