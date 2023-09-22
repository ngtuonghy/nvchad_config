local M = {}
local function has_git_directory()
  local git_dir = vim.fn.finddir(".git", ";")
  return git_dir ~= ""
end

function M.git()
  if has_git_directory() then
    return "%#TblineTabNewBtn#" .. "%@TbGit@  %X"
  end
  return ""
end

return M
