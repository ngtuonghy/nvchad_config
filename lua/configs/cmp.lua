local M = {}
local cmp = require("cmp")
local luasnip = require("luasnip")

function M.cmp_map(rhs, modes)
	if modes == nil then
		modes = { "i", "c" }
	else
		if type(modes) ~= "table" then
			modes = { modes }
		end
	end
	return cmp.mapping(rhs, modes)
end
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

function M.toggle_complete()
	return function()
		if cmp.visible() then
			cmp.close()
		else
			cmp.complete()
		end
	end
end

function M.complete(fallback)
	if cmp.visible() then
		cmp.mapping.confirm({ select = true })()
	-- cmp.select_next_item()
	elseif luasnip.expandable() then
		luasnip.expand()
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	elseif check_backspace() then
		fallback()
	else
		fallback()
	end
end
function M.cmdline_complete()
	if cmp.visible() then
		cmp.mapping.confirm({ select = true })()
	else
		cmp.complete()
	end
end

local cmp = require("cmp")

dofile(vim.g.base46_cache .. "cmp")

local cmp_ui = require("nvconfig").ui.cmp
local cmp_style = cmp_ui.style

local field_arrangement = {
	atom = { "kind", "abbr", "menu" },
	atom_colored = { "kind", "abbr", "menu" },
}

M.formatting_style = {
	-- default fields order i.e completion word + item.kind + item.kind icons
	fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

	format = function(_, item)
		local icons = require("nvchad.icons.lspkind")
		local icon = (cmp_ui.icons and icons[item.kind]) or ""

		if cmp_style == "atom" or cmp_style == "atom_colored" then
			icon = " " .. icon .. " "
			item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
			item.kind = icon
		else
			icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
			item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
		end
		local function trim(text)
			local max = 30
			if text and text:len() > max then
				text = text:sub(1, max) .. " 󰝡 "
			end
			return text
		end
		item.abbr = trim(item.abbr)
		item.abbr = item.abbr:match("[^(]+")
		return item
	end,
}
------------------------------
return M
