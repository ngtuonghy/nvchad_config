local M = {}
local cmp = require("cmp")
local getCmp = require("configs.cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_map = getCmp.cmp_map
-- M.cmp = {
-- 	-- enabled = function()
-- 	-- 	return vim.g.cmp_enabled
-- 	-- end,
-- 	enabled = true,
-- 	cmp.setup.filetype("TelescopePrompt", {
-- 		enabled = false,
-- 	}),
-- 	---------------------
-- 	vim.api.nvim_set_hl(0, "CmpGhostText", { fg = "#4e5665" }),
-- 	formatting = getCmp.formatting_style,
-- 	mapping = {
-- 		["<C-p>"] = cmp_map(cmp.mapping.select_prev_item(cmp_select)),
-- 		["<C-n>"] = cmp_map(cmp.mapping.select_next_item(cmp_select)),
-- 		["<C-d>"] = cmp_map(cmp.mapping.scroll_docs(-4)),
-- 		["<C-f>"] = cmp_map(cmp.mapping.scroll_docs(4)),
-- 		["<C-Space>"] = cmp_map(getCmp.toggle_complete(), { "i", "c", "s" }),
-- 		["<Tab>"] = cmp.mapping({
-- 			i = getCmp.complete,
-- 			c = getCmp.cmdline_complete,
-- 		}),
-- 		["<CR>"] = cmp.mapping.confirm({
-- 			behavior = cmp.ConfirmBehavior.Replace,
-- 			select = true,
-- 		}),
-- 	},
--
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 		{ name = "copilot", group_index = 2 },
-- 		-- { name = "codeium" },
-- 		{ name = "luasnip" },
-- 		-- { name = "cmp_tabnine" },
-- 		-- { name = "nvim_lsp_signature_help" },
-- 		{ name = "buffer" },
-- 		{ name = "nvim_lua" },
-- 		{ name = "path" },
-- 	},
-- 	--
-- 	matching = {
-- 		disallow_fuzzy_matching = true,
-- 		disallow_fullfuzzy_matching = true,
-- 		disallow_partial_fuzzy_matching = true,
-- 		disallow_partial_matching = false,
-- 		disallow_prefix_unmatching = true,
-- 	},
-- 	sorting = {
-- 		comparators = {
-- 			cmp.config.compare.exact,
-- 			cmp.config.compare.offset,
-- 			cmp.config.compare.recently_used,
-- 		},
-- 	},
-- 	experimental = {
-- 		ghost_text = {
-- 			hl_group = "CmpGhostText",
-- 		},
-- 		native_menu = false,
-- 	},
-- 	window = {
-- 		completion = { scrollbar = true },
-- 	},
-- 	cmp.setup.cmdline("/", {
-- 		sources = {
-- 			{ name = "buffer" },
-- 		},
-- 	}),
-- 	cmp.setup.cmdline(":", {
-- 		formatting = {
-- 			fields = { "abbr", "kind" },
-- 		},
-- 		sources = cmp.config.sources({
-- 			{ name = "cmdline" },
-- 			{ name = "path" },
-- 		}),
-- 	}),
-- }

M.colorizer = {
	filetypes = {
		"*", -- Highlight all files, but customize some others.
		cmp_docs = { always_update = true },
	},
	user_default_options = {
		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	},
}
return M
