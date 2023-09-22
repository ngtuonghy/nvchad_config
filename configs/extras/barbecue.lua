require("barbecue").setup {
  -- theme = {},
  -- dofile(vim.g.base46_cache .. "barbecue"),
  modifiers = { dirname = ":p:h:t" },
  show_dirname = true,
  show_basename = true,
  context_follow_icon_color = true,
}
--NOTE:
