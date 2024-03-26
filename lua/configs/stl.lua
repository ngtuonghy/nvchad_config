local config = require("nvconfig").ui.statusline
local sep_style = config.separator_style
local utils = require("nvchad.stl.utils")
local function default()
	local default_sep_icons = {
		default = { left = "", right = "" },
		round = { left = "", right = "" },
		block = { left = "█", right = "█" },
		arrow = { left = "", right = "" },
	}

	local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

	local sep_l = separators["left"]
	local sep_r = separators["right"]

	if not utils.is_activewin() then
		return ""
	end

	local modes = utils.modes
	local m = vim.api.nvim_get_mode().mode
	local icon = ""
	if m == "n" then
		icon = ""
	elseif m == "v" then
		icon = ""
	elseif m == "i" then
		icon = "󰏪"
	elseif m == "t" then
		icon = ""
	end
	-- print(require("nvconfig").ui.statusline.theme)
	local current_mode = "%#St_" .. modes[m][2] .. "Mode# " .. icon .. " " .. modes[m][1]
	local mode_sep1 = "%#St_" .. modes[m][2] .. "ModeSep#" .. sep_r
	return current_mode .. mode_sep1 .. "%#ST_EmptySpace#" .. sep_r
end

local function minimal()
	sep_style = (sep_style ~= "round" and sep_style ~= "block") and "block" or sep_style
	local default_sep_icons = {
		round = { left = "", right = "" },
		block = { left = "█", right = "█" },
	}

	local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

	local sep_l = separators["left"]
	local sep_r = "%#St_sep_r#" .. separators["right"] .. " %#ST_EmptySpace#"

	local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
		return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
	end

	local is_activewin = utils.is_activewin

	if not is_activewin() then
		return ""
	end

	local modes = utils.modes
	local m = vim.api.nvim_get_mode().mode
	local icon = ""
	if m == "n" then
		icon = ""
	elseif m == "v" then
		icon = ""
	elseif m == "i" then
		icon = "󰏪"
	elseif m == "t" then
		icon = ""
	end
	return gen_block(
		icon,
		modes[m][1],
		"%#St_" .. modes[m][2] .. "ModeSep#",
		"%#St_" .. modes[m][2] .. "Mode#",
		"%#St_" .. modes[m][2] .. "ModeText#"
	)
end

local function vscode()
	if not utils.is_activewin() then
		return ""
	end
	local modes = utils.modes
	local m = vim.api.nvim_get_mode().mode
	local icon = ""
	if m == "n" then
		icon = ""
	elseif m == "v" then
		icon = ""
	elseif m == "i" then
		icon = "󰏪"
	elseif m == "t" then
		icon = ""
	end
	return "%#St_Mode# " .. icon .. " " .. modes[m][1] .. " "
end
local function vscode_colored()
	if not utils.is_activewin() then
		return ""
	end
	local modes = utils.modes
	local m = vim.api.nvim_get_mode().mode
	local icon = ""
	if m == "n" then
		icon = ""
	elseif m == "v" then
		icon = ""
	elseif m == "i" then
		icon = "󰏪"
	elseif m == "t" then
		icon = ""
	end
	return "%#St_" .. modes[m][2] .. "mode# " .. icon .. " " .. modes[m][2] .. " "
end
local M = {}
M.mode = function()
	local theme = require("nvconfig").ui.statusline.theme
	if theme == "default" then
		return default()
	elseif theme == "minimal" then
		return minimal()
	elseif theme == "vscode" then
		return vscode()
	elseif theme == "vscode_colored" then
		return vscode_colored()
	end
end

return M
