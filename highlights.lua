local M = {}
M.override = {
  Comment = {
    italic = true,
  },
}
M.add = {
  -- HydraHint = { fg = "" },
  -- NOTE: nvim-surrond
  NvimSurroundHighlight = { fg = "black", bg = "yellow" },
  -- NOTE: records
  RecordingSymbol = { fg = "red", bg = "statusline_bg" },
  PlayingSymbol = { fg = "green", bg = "statusline_bg" },
  DelaySymbol = { fg = "blue", bg = "statusline_bg" },

  -- NOTE: aerial
  AerialLine = { fg = "red" },
  -- AerialClassIcon = { fg = "blue", bg = "yellow" },
  -- AerialLineNC = { fg = "blue", bg = "grey" },
  AerialGuide = { bg = "black" },
  AerialNormal = { bg = "black" },
  -- NOTE: flash
  FlashLabel = { fg = "white", bg = "#de0673" },

  -- NOTE: this is Noice
  -- NoiceCmdlineIcon = { fg = "sun" },
  -- NoiceCmdlinePopupTitle = { fg = "orange" },
  -- NoiceCmdlineIconSearch = { fg = "yellow" },
  NoiceCmdlinePopupBorder = { fg = "red" },
  NoiceCmdlineIconLua = { fg = "blue" },
  NoiceMini = { fg = "teal", bg = "black" },

  -- NOTE: this is todo-comment
  TodoBgFIX = { fg = "black", bg = "red" },
  TodoFgFIX = { fg = "red" },
  TodoSignFIX = { fg = "red" },
  TodoBgWARN = { fg = "black", bg = "yellow" },
  TodoFgWARN = { fg = "yellow" },
  TodoSignWARN = { fg = "yellow" },
  TodoBgHACK = { fg = "black", bg = "orange" },
  TodoFgHACK = { fg = "orange" },
  TodoSignHACK = { fg = "orange" },
  TodoBgPERF = { fg = "black", bg = "purple" },
  TodoFgPERF = { fg = "purple" },
  TodoSignPERF = { fg = "purple" },
  TodoBgTEST = { fg = "black", bg = "pink" },
  TodoFgTEST = { fg = "pink" },
  TodoSignTEST = { fg = "pink" },
  TodoBgNOTE = { fg = "black", bg = "green" },
  TodoFgNOTE = { fg = "green" },
  TodoSignNOTE = { fg = "green" },
  TodoBgTODO = { fg = "black", bg = "blue" },
  TodoFgTODO = { fg = "blue" },
  TodoSignTODO = { fg = "blue" },

  -- NOTE: dap
  DapBreakpoint = { fg = "red" },
  DapBreakpointCondition = { fg = "yellow", bg = "one_bg3" },
  DapLogPoint = { fg = "cyan", bg = "one_bg3" },
  DapStopped = { fg = "baby_pink", bg = "one_bg3" },
}

return M

--
-- white = "#26292f",
-- darker_black = "#f3f3f3",
-- black = "#fafafa", --  nvim bg
-- black2 = "#efefef",
-- one_bg = "#ebebeb",
-- one_bg2 = "#e1e1e1", -- Highlight of context
-- one_bg3 = "#d7d7d7",
-- grey = "#cdcdcd",
-- grey_fg = "#b9b9b9",
-- grey_fg2 = "#acacac", -- Highlight background
-- light_grey = "#a0a0a0", -- Line numbers
-- red = "#E65050",
-- baby_pink = "#ff8282",

-- lightbg = "#cdc6c3",
-- lightbg = "#262d30",
