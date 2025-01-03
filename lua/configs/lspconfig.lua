local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
-- auto setup
require("mason-lspconfig").setup_handlers({
	function(server)
		lspconfig[server].setup({})
	end,
})
require("mason-lspconfig").setup({})
lspconfig.protols.setup({})
--
require("typescript-tools").setup({
	on_attach = on_attach,
	settings = {
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		tsserver_plugins = {
			name = "@vue/typescript-plugin",
		},
	},
})

lspconfig.volar.setup({
	on_attach = on_attach,
	-- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
})

-- local config = {
-- 	settings = {
-- 		filetypes = { "java" },
-- 		java = {},
-- 	},
-- 	cmd = {
-- 		vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"),
-- 	},
-- 	root_dir = vim.fs.dirname(
-- 		vim.fs.find({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }, { upward = true })[1]
-- 	),
-- }
-- require("jdtls").start_or_attach(config)
-- lspconfig.jdtls.setup({})

require("lspconfig").tailwindcss.setup({
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				},
			},
		},
	},
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = { offsetEncoding = "utf-8" },
})
lspconfig.emmet_language_server.setup({
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"pug",
		"typescriptreact",
	},
	-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
	-- **Note:** only the options listed in the table are supported.
	init_options = {
		---@type table<string, string>
		includeLanguages = {},
		--- @type string[]
		excludeLanguages = {},
		--- @type string[]
		extensionsPath = {},
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
		preferences = {},
		--- @type boolean Defaults to `true`
		showAbbreviationSuggestions = true,
		--- @type "always" | "never" Defaults to `"always"`
		showExpandedAbbreviation = "always",
		--- @type boolean Defaults to `false`
		showSuggestionsAsSnippets = false,
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
		syntaxProfiles = {},
		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
		variables = {},
	},
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
-- lspconfig.jdtls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
lspconfig.sqlls.setup({
	capabilities = capabilities,
	filetypes = { "sql" },
	root_dir = function(_)
		return vim.loop.cwd()
	end,
})
lspconfig.cssls.setup({
	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

-- lspconfig.tsserver.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
