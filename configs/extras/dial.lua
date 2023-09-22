local augend = require "dial.augend"
require("dial.config").augends:register_group {
  -- default augends used when no group name is specified
  default = {
    augend.constant.new { elements = { "on", "off" } },
    augend.constant.new { elements = { "up", "down" } },
    augend.constant.new { elements = { "left", "right" } },
    augend.constant.new {
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    },
    augend.constant.new {
      elements = { "and", "or" },
      word = false, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
      cyclic = true, -- "or" is incremented into "and".
    },
    augend.constant.new {
      elements = { "==", "!=" },
      word = false, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
      cyclic = true, -- "or" is incremented into "and".
    },
    augend.constant.alias.bool, -- boolean value (true <-> false)
    augend.integer.alias.decimal, -- nonnegative decimal number
    augend.integer.alias.hex, -- nonnegative hex number
    augend.integer.alias.binary,
    -- date (2006/11/03, etc.)
    augend.date.new {
      pattern = "%Y/%m/%d",
      default_kind = "day",
    },
    -- date (02/19/2027, etc.)
    augend.date.new {
      pattern = "%m/%d/%Y",
      default_kind = "day",
    },
  },
}
require("dial.config").augends:on_filetype {
  javascript = {
    augend.constant.new { elements = { "let", "var" } },
  },
  markdown = {
    augend.misc.alias.markdown_header,
  },
}
