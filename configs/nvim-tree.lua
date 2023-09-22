local M = {}

function M.on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- BEGIN_DEFAULT_ON_ATTACH
  api.config.mappings.default_on_attach(bufnr)
  -- END_DEFAULT_ON_ATTACH
  -- NOTE: delete keymaping
  vim.keymap.del("n", "D", { buffer = bufnr })
  vim.keymap.del("n", "d", { buffer = bufnr })
  vim.keymap.del("n", "S", { buffer = bufnr })
  vim.keymap.del("n", "s", { buffer = bufnr })
  -- NOTE: set keymaping
  vim.keymap.set("n", "s", api.tree.search_node, opts "Search")
  vim.keymap.set("n", "d", api.fs.trash, opts "Trash")
  vim.keymap.set("n", "D", api.fs.remove, opts "Delete")
  vim.keymap.set("n", "A", api.tree.expand_all, opts "Expand All")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "C", api.tree.change_root_to_node, opts "CD")
  vim.keymap.set("n", "\\", api.node.open.vertical, opts "Open: Vertical Split")
  vim.keymap.set("n", "|", api.node.open.horizontal, opts "Open: Horizontal Split")
  -- vim.keymap.set("n", "t", findInFolder, opts "find in folder")
end

return M
