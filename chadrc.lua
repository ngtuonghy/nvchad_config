local M = {}
local highlights = require "custom.highlights"
local statusline = require "custom.configs.statusline"
local tabufline = require "custom.configs.tabufline"

M.ui = {
  extended_integrations = {
    "notify",
    "dap",
    "rainbowdelimiters",
    "trouble",
  },
  statusline = {
    theme = "default", -- default/round/block/arrow (separators work only for "default" statusline theme;
    overriden_modules = function(modules)
      modules[1] = statusline.mode()
      table.insert(
        modules,
        6,
        (function()
          return statusline.record()
        end)()
      )
    end,
  },

  theme = "gatekeeper",
  theme_toggle = { "gatekeeper", "gatekeeper" },
  cheatsheet = { theme = "grid" }, -- simple/grid
  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󱂬  Session", "Spc s l", "Session last" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cmp = {
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  hl_override = highlights.override,
  hl_add = highlights.add,

  tabufline = {
    show_numbers = true,
    enabled = true,
    lazyload = true,
    overriden_modules = function(modules)
      modules[4] = "%#TblineTabNewBtn#" .. "%@TbRun@  %X"
      modules[5] = tabufline.git()
      modules[6] = "%#TblineTabNewBtn#" .. "%@TbSplit@  %X"
      modules[7] = "%@TbToggle_theme@%#TbLineThemeToggleBtn#" .. vim.g.toggle_theme_icon .. "%X"
      modules[8] = "%@TbCloseAllBufs@%#TbLineCloseAllBufsBtn#" .. " 󰅖 " .. "%X"
    end,
  },
  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = true,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
M.autocmds = require "custom.autocmds"
M.OPTIONS = require "custom.options"
M.UI = require "custom.utils.ui"

return M
