local base16 = require("base46").get_theme_tb "base_16"
local colors = require("base46").get_theme_tb("base_30")
return {
  BlinkCmpMenuSelection = { link = "PmenuSel", bold = true },
  BlinkCmpMenuBorder = { fg = colors.grey_fg },
  BlinkCmpMenu = { bg = colors.black2 },
  BlinkCmpLabel = { fg = colors.white },
  BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
}
