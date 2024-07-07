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

M.ui = {
	theme = "gatekeeper",
	cmp = {
		icons = true,
		lspkind_text = true,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
	},
	statusline = {
		theme = "default", --'"default"'|'"vscode"'|'"vscode_colored"'|'"minimal"'
		order = orders(),
		modules = {
			custom_mode = function()
				return require("configs.stl").mode()
			end,
		},
	},
	nvdash = {
		load_on_startup = true,
	},
	tabufline = {
		lazyload = false,
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

	-- lsp = { signature = true },
	-- lsp = {
	-- 	-- show function signatures i.e args as you type
	-- 	signature = true,
	-- },

	hl_override = highlights.override,
	hl_add = highlights.add,
}
M.base46 = {
	integrations = {
		"notify",
		"mason",
		"rainbowdelimiters",
	},
}

vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets/vscode"

return M
