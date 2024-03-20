local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		bash = { "shfmt" },
		sh = { "shfmt" },
		cpp = { "clang_format" },
		fish = { "fish_indent" },
		lua = { "stylua" },
		go = { "goimports", "gofumpt", "goimports-reviser" },
		javascript = { { "prettier" } },
		typescript = { { "prettier" } },
		javascriptreact = { { "prettier" } },
		typescriptreact = { { "prettier" } },
		vue = { { "prettier" } },
		css = { { "prettier" } },
		scss = { { "prettier" } },
		less = { { "prettier" } },
		html = { { "prettier" } },
		json = { { "prettier" } },
		jsonc = { { "prettier" } },
		yaml = { { "prettier" } },
		markdown = { { "prettier" } },
		["markdown.mdx"] = { { "prettier" } },
		graphql = { { "prettier" } },
		handlebars = { { "prettier" } },
	},
}

require("conform").setup(options)
