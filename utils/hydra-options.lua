local M = {}

M.toggle_diagnostics = function()
  if vim.g.diagnostics_mode == 0 then
    return "[ ]"
  elseif vim.g.diagnostics_mode == 1 then
    return "[1]"
  elseif vim.g.diagnostics_mode == 2 then
    return "[2]"
  else
    return "[3]"
  end
end

M.toggle_ui_notifications = function()
  if vim.g.ui_notifications_enabled then
    return "[x]"
  else
    return "[ ]"
  end
end
function M.toggle_autopairs()
  local ok, autopairs = pcall(require, "nvim-autopairs")
  if ok then
    if autopairs.state.disabled then
      return "[ ]"
    else
      return "[x]"
    end
  end
end
function M.toggle_cmp()
  if vim.g.cmp_enabled then
    -- return "DapBreakpointRejecte"
    return "[x]"
  end
  return "[ ]"
end

--- Toggle auto format
function M.toggle_autoformat()
  if vim.g.autoformat_enabled then
    return "[x]"
  else
    return "[ ]"
  end
end

-- Toggle buffer local auto format
function M.toggle_buffer_autoformat()
  local old_val = vim.b.autoformat_enabled
  if old_val == nil then
    old_val = vim.g.autoformat_enabled
  end
  if old_val then
    return "[x]"
  else
    return "[ ]"
  end
end
--- Toggle signcolumn="auto"|"no"
function M.toggle_signcolumn()
  if vim.o.signcolumn == "no" then
    return "[ ]"
  elseif vim.o.signcolumn == "yes" then
    return "[x]"
  else
    return "[a]"
  end
end

--- Toggle foldcolumn=0|1
function M.toggle_foldcolumn()
  local curr_foldcolumn = vim.wo.foldcolumn
  return "[" .. curr_foldcolumn .. "]"
end

return M
