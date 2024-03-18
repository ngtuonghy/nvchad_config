local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
-- local servers = { "html", "cssls", "clangd"}

-- auto setup
require("mason-lspconfig").setup_handlers({
	function(server)
		lspconfig[server].setup({})
	end,
})
require("mason-lspconfig").setup({
	ensure_installed = { "html", "cssls", "emmet_language_server", "clangd", "lua_ls", "tsserver" },
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
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
	},
	init_options = {
		--- @type table<string, any> https://docs.emmet.io/customization/preferences/
		preferences = {},
		--- @type "always" | "never" defaults to `"always"`
		showexpandedabbreviation = "always",
		--- @type boolean defaults to `true`
		showabbreviationsuggestions = true,
		--- @type boolean defaults to `false`
		showsuggestionsassnippets = false,
		--- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
		syntaxprofiles = {},
		--- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
		variables = {},
		--- @type string[]
		excludelanguages = {},
	},
})
lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
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
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
