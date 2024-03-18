return {
	{
		-- dir = "~/project/plugins/neovim/runner-nvchad",
		"runner-nvchad",
		dev = { true },
		lazy = false,
		config = function()
			require("runner-nvchad").setup({})
		end,
	},
	{
		-- dir = "~/project/plugins/neovim/runner-nvchad",
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
		},
		config = function()
			-- dofile(vim.g.base46_cache .. "dap")
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
	"gbprod/yanky.nvim",
	dependencies = {
		{ "kkharji/sqlite.lua" },
	},
	opts = {
		ring = { storage = "sqlite" },
	},
}
