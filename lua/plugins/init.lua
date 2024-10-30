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
	{ import = "nvcommunity.completion.copilot" },

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
		opts = {
			ensure_installed = {
				"vim",
				"html",
				"css",
				"javascript",
				"json",
				"toml",
				"markdown",
				"c",
				"bash",
				"lua",
				"tsx",
				"typescript",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		},
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				config = function()
					require("nvim-ts-autotag").setup()
				end,
			},
		},
	},

	{
		"stevearc/conform.nvim",
		event = "BufReadPre",
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
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter", "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"pmizio/typescript-tools.nvim",
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {},
	},
	------------------------------------custom plugin----------------------------------------

	{
		"ngtuonghy/runner-nvchad",
		-- "runner-nvchad",
		-- dev = { true },
		lazy = false,
		config = function()
			require("runner-nvchad").setup({})
		end,
	},

	{
		"ngtuonghy/live-server-nvim",
		event = "VeryLazy",
		build = ":LiveServerInstall",
		dev = true,
		-- lazy = false,
		config = function()
			require("live-server-nvim").setup({
				custom = {
					"--port=8080",
					"--no-css-inject",
					-- "--no-browser",
				},
				serverPath = vim.fn.stdpath("data") .. "/live-server/",
				open = "folder", --folder|cwd
			})
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("configs.noice")
		end,
	},

	{
		"mfussenegger/nvim-dap",
		lazy = false,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("configs.dapconfig")
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.todo-comments")
		end,
	},

	{ "mg979/vim-visual-multi", event = "VeryLazy" },

	{ "wakatime/vim-wakatime", lazy = false },

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		"gbprod/yanky.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "kkharji/sqlite.lua" },
		},
		config = function()
			require("yanky").setup({
				highlight = { timer = 100 },
				ring = { storage = "sqlite", history_length = 1000 },
				history_length = 1000,
			})
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},

	{ "stevearc/dressing.nvim", lazy = false, opts = {} },

	{
		"echasnovski/mini.indentscope",
		version = "*", -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			-- symbol = '╎',
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
					"nvcheatsheet",
					"aerial",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"luukvbaal/statuscol.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("configs.nvim-ufo")
			require("configs.statuscol")
		end,
	},

	{
		"OXY2DEV/markview.nvim",
		event = "VeryLazy",
		dependencies = {
			-- You may not need this if you don't lazy load
			-- Or if the parsers are in your $RUNTIMEPATH
			"nvim-treesitter/nvim-treesitter",

			"nvim-tree/nvim-web-devicons",
		},
	},

	-- dim inactive windows
	{
		"andreadev-it/shade.nvim",
		config = function()
			require("shade").setup({
				exclude_filetypes = { "NvimTree" },
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = {
			extensions_list = { "fzf", "terms", "nerdy" },
		},

		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"2kabhishek/nerdy.nvim",
		},
	},
}
