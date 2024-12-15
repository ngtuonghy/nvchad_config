local M = {}
local highlights = require("highlights")
local function btn(str, hl, func)
	str = "%#" .. hl .. "#" .. str
	return "%@" .. func .. "@" .. str .. "%X"
end

local orders = function()
	-- local theme = require("nvconfig").ui.statusline.theme
	-- if theme == "default" or theme == "minimal" then
	-- return { "custom_mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" }
	-- end
	return { "custom_mode", "file", "diagnostics", "git", "%=", "lsp_msg", "%=", "lsp", "cursor", "cwd" }
end

M.base46 = {
	theme = "ayu_dark",
	hl_override = highlights.override,
	hl_add = highlights.add,
}
M.nvdash = {
	load_on_startup = true,
}
M.ui = {
	cmp = {
		icons_left = true, -- only for non-atom styles!
		lspkind_text = false,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			tailwind = false, -- will work for css lsp too
			icon = "󱓻",
		},
	},

	statusline = {
		theme = "minimal", --'"default"'|'"vscode"'|'"vscode_colored"'|'"minimal"'
		-- order = orders(),
		-- modules = {
		-- 	custom_mode = function()
		-- 		return require("configs.stl").mode()
		-- 	end,
		-- },
	},

	tabufline = {
		lazyload = true,
		--  more opts
		order = { "treeOffset", "buffers", "tabs", "runner", "split", "btns" },
		modules = {
			runner = function()
				return btn("  ", "TbTabNewBtn", "TbRunner")
			end,
			split = function()
				return btn("  ", "TbTabNewBtn", "TbSplit")
			end,
		},
	},
}
M.mason = {
	cmd = true,
	pkgs = {
		"emmet-language-server",
		"lua-language-server",
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"prettier",
		"emmet-language-server",
		"json-lsp",
		"jdtls",
		"vue-language-server",
		"tailwindcss-language-server",
		-- "unocss-language-server",
		"biome",
		"shfmt",
		"shellcheck",
		"bash-language-server",
		"clangd",
		"clang-format",
	},
}

vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets/vscode"

return M
