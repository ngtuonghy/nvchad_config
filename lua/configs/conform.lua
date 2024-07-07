local options = {

	formatters_by_ft = {
		svelte = { "svelte_fmt" }, -- custom
		lua = { "stylua" },

		-- webdev
		javascript = { "biome" },
		javascriptreact = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },

		css = { "biome" },
		html = { "biome" },
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
