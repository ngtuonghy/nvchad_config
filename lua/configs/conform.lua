local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang_format" },
		markdown = { "markdownlint" },
	},
}

require("conform").setup(options)
