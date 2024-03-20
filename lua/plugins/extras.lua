return {
	{
		"runner-nvchad",
		dev = { true },
		lazy = false,
		config = function()
			require("runner-nvchad").setup({})
		end,
	},
	{
		"ngtuonghy/live-server-nvim",
		event = "VeryLazy",
		build = ":LiveServerInstall",
		-- "live-server-nvim",
		-- dev = { true },
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
		event = "VeryLazy",
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
	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
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
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
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
}
