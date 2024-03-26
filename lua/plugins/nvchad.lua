local overrides = require("configs.overrides")
return {
	"NvChad/nvcommunity",
	{ import = "nvcommunity.git.lazygit" },
	{ import = "nvcommunity.git.diffview" },
	{ import = "nvcommunity.editor.rainbowdelimiters" },
	{ import = "nvcommunity.editor.illuminate" },
	{ import = "nvcommunity.editor.rainbowdelimiters" },
	{ import = "nvcommunity.editor.telescope-undo" },
	{ import = "nvcommunity.file-explorer.oil-nvim" },
	{ import = "nvcommunity.diagnostics.trouble" },

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
			-- "hrsh7th/cmp-nvim-lsp-signature-help",
		},
		opts = overrides.cmp,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "windwp/nvim-ts-autotag" },
		opts = overrides.treesitter,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
}
