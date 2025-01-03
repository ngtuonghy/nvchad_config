local M = {}
local cache_path = vim.g.base46_cache

local integrations = {
  "blink",
  "defaults",
  "lsp",
  "mason",
  "nvimtree",
  "treesitter",
  "telescope",
  "syntax",
  -- "whichkey",
}


M.get_integration = function(name)
  return require("base46.integrations." .. name)
end

-- convert table into string
M.tb_2str = function(tb)
  local result = ""

  for hlgroupName, v in pairs(tb) do
    local hlname = "'" .. hlgroupName .. "',"
    local hlopts = ""

    for optName, optVal in pairs(v) do
      local valueInStr = ((type(optVal)) == "boolean" or type(optVal) == "number") and tostring(optVal)
        or '"' .. optVal .. '"'
      hlopts = hlopts .. optName .. "=" .. valueInStr .. ","
    end

    result = result .. "vim.api.nvim_set_hl(0," .. hlname .. "{" .. hlopts .. "})"
  end

  return result
end

M.get_theme_tb = function(type)
  local name = "tokyonight"
  local present1, default_theme = pcall(require, "base46.themes." .. name)
  if present1 then
    return default_theme[type]
  else
    error "Theme not found"
  end
end

M.str_to_cache = function(filename, str)
  -- Thanks to https://github.com/nullchilly and https://github.com/EdenEast/nightfox.nvim
  -- It helped me understand string.dump stuff
  local lines = "return string.dump(function()" .. str .. "end, true)"
  local file = io.open(cache_path .. filename, "wb")

  if file then
    file:write(load(lines)())
    file:close()
  end
end

M.compile = function()
  if not vim.uv.fs_stat(vim.g.base46_cache) then
    vim.fn.mkdir(cache_path, "p")
  end

  -- M.str_to_cache("term", require "base46.term")
  -- M.str_to_cache("colors", require "base46.color_vars")

  for _, name in ipairs(integrations) do
    local hl_str = M.tb_2str(M.get_integration(name))

    if name == "defaults" then
      hl_str = "vim.o.tgc=true vim.o.bg='" .. M.get_theme_tb "type" .. "' " .. hl_str
    end

    M.str_to_cache(name, hl_str)
  end
end


M.load_all_highlights = function()
  -- require("plenary.reload").reload_module "base46"
  M.compile()

  for _, name in ipairs(integrations) do
    dofile(vim.g.base46_cache .. name)
  end

  -- update blankline
  -- pcall(function()
  --   require("ibl").update()
  -- end)

  -- vim.api.nvim_exec_autocmds("User", { pattern = "NvThemeReload" })
end

-- M.load_all_highlights = function()
--   for _, name in ipairs(integrations) do
--     local highlights = require("base46.integrations." .. name)
--
--     for name, properties in pairs(highlights) do
--       vim.api.nvim_set_hl(0, name, properties)
--     end
--
--     -- dofile(vim.g.base46_cache .. name)
--   end
-- end
--

return M
