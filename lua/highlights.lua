local M = {}
M.override = {
	Comment = {
		italic = true,
	},
	Boolean = { italic = true },
	Conditional = { italic = true, bold = true },
	Repeat = { italic = true },
	["@keyword.return"] = { italic = true },
	["@keyword.operator"] = { italic = true },
	["@keyword.function"] = { italic = true },
	["@exception"] = { italic = true },
	["@include"] = { italic = true },
	["@repeat"] = { italic = true },
}
M.add = {
	-- HydraHint = { fg = "" },
	-- NOTE: nvim-surrond
	NvimSurroundHighlight = { fg = "black", bg = "yellow" },
	-- -- NOTE: records
	-- RecordingSymbol = { fg = "red", bg = "statusline_bg" },
	-- PlayingSymbol = { fg = "green", bg = "statusline_bg" },
	-- DelaySymbol = { fg = "blue", bg = "statusline_bg" },
	--
	-- -- NOTE: aerial
	-- AerialLine = { fg = "red" },
	-- -- AerialClassIcon = { fg = "blue", bg = "yellow" },
	-- -- AerialLineNC = { fg = "blue", bg = "grey" },
	-- AerialGuide = { bg = "black" },
	-- AerialNormal = { bg = "black" },
	-- -- NOTE: flash
	-- FlashLabel = { fg = "white", bg = "#de0673" },
	--
	-- -- NOTE: this is Noice
	-- -- NoiceCmdlineIcon = { fg = "sun" },
	-- -- NoiceCmdlinePopupTitle = { fg = "orange" },
	-- -- NoiceCmdlineIconSearch = { fg = "yellow" },
	-- NoiceCmdlinePopupBorder = { fg = "red" },
	-- NoiceCmdlineIconLua = { fg = "blue" },
	-- NoiceMini = { fg = "teal", bg = "black" },
	--
	-- -- NOTE: this is todo-comment
	-- TodoBgFIX = { fg = "black", bg = "red" },
	-- TodoFgFIX = { fg = "red" },
	-- TodoSignFIX = { fg = "red" },
	-- TodoBgWARN = { fg = "black", bg = "yellow" },
	-- TodoFgWARN = { fg = "yellow" },
	-- TodoSignWARN = { fg = "yellow" },
	-- TodoBgHACK = { fg = "black", bg = "orange" },
	-- TodoFgHACK = { fg = "orange" },
	-- TodoSignHACK = { fg = "orange" },
	-- TodoBgPERF = { fg = "black", bg = "purple" },
	-- TodoFgPERF = { fg = "purple" },
	-- TodoSignPERF = { fg = "purple" },
	-- TodoBgTEST = { fg = "black", bg = "pink" },
	-- TodoFgTEST = { fg = "pink" },
	-- TodoSignTEST = { fg = "pink" },
	-- TodoBgNOTE = { fg = "black", bg = "green" },
	-- TodoFgNOTE = { fg = "green" },
	-- TodoSignNOTE = { fg = "green" },
	-- TodoBgTODO = { fg = "black", bg = "blue" },
	-- TodoFgTODO = { fg = "blue" },
	-- TodoSignTODO = { fg = "blue" },
	--
	-- -- NOTE: dap
	-- DapBreakpoint = { fg = "red" },
	-- DapBreakpointCondition = { fg = "yellow", bg = "one_bg3" },
	-- DapLogPoint = { fg = "cyan", bg = "one_bg3" },
	-- DapStopped = { fg = "baby_pink", bg = "one_bg3" },
	--
	VM_Insert = { fg = "black", bg = "yellow" },
	FoldColumn = {
		bg = "black",
	},
}

return M
