local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local function java_keymaps()
  -- Allow yourself to run JdtCompile as a Vim command
  vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
  -- Allow yourself/register to run JdtUpdateConfig as a Vim command
  vim.cmd "command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()"
  -- Allow yourself/register to run JdtBytecode as a Vim command
  vim.cmd "command! -buffer JdtBytecode lua require('jdtls').javap()"
  -- Allow yourself/register to run JdtShell as a Vim command
  vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"

  -- Set a Vim motion to <Space> + <Shift>J + o to organize imports in normal mode
  vim.keymap.set(
    "n",
    "<leader>Jo",
    "<Cmd> lua require('jdtls').organize_imports()<CR>",
    { desc = "[J]ava [O]rganize Imports" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + v to extract the code under the cursor to a variable
  vim.keymap.set(
    "n",
    "<leader>Jv",
    "<Cmd> lua require('jdtls').extract_variable()<CR>",
    { desc = "[J]ava Extract [V]ariable" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + v to extract the code selected in visual mode to a variable
  vim.keymap.set(
    "v",
    "<leader>Jv",
    "<Esc><Cmd> lua require('jdtls').extract_variable(true)<CR>",
    { desc = "[J]ava Extract [V]ariable" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code under the cursor to a static variable
  vim.keymap.set(
    "n",
    "<leader>JC",
    "<Cmd> lua require('jdtls').extract_constant()<CR>",
    { desc = "[J]ava Extract [C]onstant" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code selected in visual mode to a static variable
  vim.keymap.set(
    "v",
    "<leader>JC",
    "<Esc><Cmd> lua require('jdtls').extract_constant(true)<CR>",
    { desc = "[J]ava Extract [C]onstant" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + t to run the test method currently under the cursor
  vim.keymap.set(
    "n",
    "<leader>Jt",
    "<Cmd> lua require('jdtls').test_nearest_method()<CR>",
    { desc = "[J]ava [T]est Method" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + t to run the test method that is currently selected in visual mode
  vim.keymap.set(
    "v",
    "<leader>Jt",
    "<Esc><Cmd> lua require('jdtls').test_nearest_method(true)<CR>",
    { desc = "[J]ava [T]est Method" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + <Shift>T to run an entire test suite (class)
  vim.keymap.set("n", "<leader>JT", "<Cmd> lua require('jdtls').test_class()<CR>", { desc = "[J]ava [T]est Class" })
  -- Set a Vim motion to <Space> + <Shift>J + u to update the project configuration
  vim.keymap.set("n", "<leader>Ju", "<Cmd> JdtUpdateConfig<CR>", { desc = "[J]ava [U]pdate Config" })
end

local on_attach = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
  -- require("jdtls.dap").setup_dap_main_class_configs()
  jdtls.setup_dap { hotcodereplace = "auto" }
  -- require("lazyvim.plugins.lsp.keymaps").on_attach(client, bufnr)
  java_keymaps()
end

local capabilities = require('blink.cmp').get_lsp_capabilities()
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local home = os.getenv "HOME"
-- Declare a directory where you would like to store project information
local workspace_path = home .. "/workspace/"
-- calculate workspace dir
local workspace_dir = workspace_path .. project_name
-- get the mason install path
local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
-- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
local os


if vim.fn.has "macunix" then
  os = "mac"
elseif vim.fn.has "win32" then
  os = "win"
else
  os = "linux"
end

local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    "\n"
  )
)

local config = {
  cmd = {
    -- install_path .. "/bin/jdtls",
    -- "--jvm-arg=-javaagent:" .. install_path .. "/lombok.jar",
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. install_path .. "/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    install_path .. "/config_" .. os,
    "-data",
    workspace_dir,
  },
  settings = {
    java = {
      -- server = { launchMode = 'Hybrid' },
    },
  },
  init_options = {
    bundles = {
      vim.fn.glob(
        mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
        "\n"
      ),
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = vim.fs.dirname(
    vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
  ),
}

--
-- config["on_attach"] = function(client, bufnr)
--         local _, _ = pcall(vim.lsp.codelens.refresh)
--         require("jdtls.dap").setup_dap_main_class_configs()
--         jdtls.setup_dap({ hotcodereplace = "auto" })
--         -- require("user.lsp.handlers").on_attach(client, bufnr)
-- end
--
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    require("jdtls").start_or_attach(config)
  end,
})
