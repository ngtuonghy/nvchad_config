local M = {}
function M.notify(msg, type)
  vim.schedule(function()
    vim.notify(msg, type, { title = "Notifications" })
  end)
end

function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

return M
