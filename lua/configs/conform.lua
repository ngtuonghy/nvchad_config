local options = {

	formatters_by_ft = {
		svelte = { "svelte_fmt" }, -- custom
		lua = { "stylua" },
		c = { "clang-format" },
		cpp = { "clang-format" },

		-- webdev
		javascript = { "biome" },
		javascriptreact = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		vue = { "prettier" },

		css = { "biome" },
		html = { "prettier" },
		json = { "biome" },
		jsonc = { "biome" },

		sh = { "shfmt" },
		yaml = { "yamlfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
	},
}

require("conform").setup(options)
