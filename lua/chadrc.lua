local M = {}
local highlights = require("highlights")
local function btn(str, hl, func)
	str = "%#" .. hl .. "#" .. str
	return "%@" .. func .. "@" .. str .. "%X"
end
function _G.mode()
	local st_modules = require("nvchad.statusline.default")
	local modes = st_modules.modes
	modes["n"][3] = "  "
	modes["v"][3] = "  "
	modes["i"][3] = " 󰏪 "
	modes["t"][3] = "  "
	local m = vim.api.nvim_get_mode().mode
	return "%#" .. modes[m][2] .. "#" .. (modes[m][3] or "  ") .. modes[m][1] .. " "
end
M.ui = {
	theme = "tokyodark",
	cmp = {
		icons = true,
		lspkind_text = true,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
	},
	statusline = {
		-- order ={"mode"},
		theme = "minimal", --'"default"'|'"vscode"'|'"vscode_colored"'|'"minimal"'
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

	lsp = {
		-- show function signatures i.e args as you type
		signature = {
			disabled = true,
			silent = true, -- silences 'no signature help available' message from appearing
		},
	},
	hl_override = highlights.override,
	hl_add = highlights.add,
}

return M
