--local status = require "recorder"
local M = {}
function M.mode()
  local st_modules = require "nvchad.statusline.default"
  local modes = st_modules.modes
  modes["n"][3] = "  "
  modes["v"][3] = "  "
  modes["i"][3] = " 󰏪 "
  modes["t"][3] = "  "
  local m = vim.api.nvim_get_mode().mode
  return "%#" .. modes[m][2] .. "#" .. (modes[m][3] or "  ") .. modes[m][1] .. " "
end

function M.record()
  local state = require "NeoComposer.state"
  local status = ""
  local delay_enabled = state.get_delay()

  if state.get_recording() then
    status = "%#RecordingSymbol# %* REC"
  elseif state.get_playing() then
    status = "%#PlayingSymbol# %* PLAY"
  end

  if delay_enabled then
    status = (status == "" and "" or (status .. " ")) .. "%#DelaySymbol#󰔛 %* DELAY"
  end

  return status
end
return M
