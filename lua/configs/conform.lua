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
		typescript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		vue = { { "prettierd", "prettier" } },
		css = { { "prettier" } },
		scss = { { "prettierd", "prettier" } },
		less = { { "prettierd", "prettier" } },
		html = { { "prettier" } },
		json = { { "prettier" } },
		jsonc = { { "prettierd", "prettier" } },
		yaml = { { "prettierd", "prettier" } },
		markdown = { { "prettierd", "prettier" } },
		["markdown.mdx"] = { { "prettierd", "prettier" } },
		graphql = { { "prettierd", "prettier" } },
		handlebars = { { "prettierd", "prettier" } },
	},
}

require("conform").setup(options)
