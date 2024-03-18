local dap = require("dap")
local dapui = require("dapui")

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- debug  
--
vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapStopped", { text = "󰁕 ", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
vim.fn.sign_define("DapBreakpointCondition", {
	text = " ",
	texthl = "DapBreakpointCondition",
	linehl = "DapBreakpointCondition",
	numhl = "DapBreakpointCondition",
})
vim.fn.sign_define("DapBreakpointRejected", {
	text = " ",
	texthl = "DapBreakpointRejected",
	linehl = "DapBreakpointRejected",
	numhl = "DapBreakpointRejected",
})
vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" })

require("nvim-dap-virtual-text").setup()
require("mason-nvim-dap").setup({
	ensure_installed = {},
	handlers = {},
})

dapui.setup({
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = " ",
			pause = " ",
			play = " ",
			run_last = " ",
			step_back = " ",
			step_into = " ",
			step_out = " ",
			step_over = " ",
			terminate = " ",
		},
	},
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ Adapters                                                 │
-- ╰──────────────────────────────────────────────────────────╯

-- -- NODE
-- dap.adapters.node2 = {
--   type = "executable",
--   command = "node",
--   args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
-- }
--
-- -- Chrome
-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
-- }
--
-- -- VSCODE JS
-- require("dap-vscode-js").setup({
--   debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
--   debugger_cmd = { "js-debug-adapter" },
--   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
-- })

-- ╭──────────────────────────────────────────────────────────╮
-- │ Configurations                                           │
-- ╰──────────────────────────────────────────────────────────╯
--

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			local getDebug = require("runner-nvchad").runnerdbg()
			if getDebug == false then
				return
			else
				return vim.fn.fnamemodify(vim.fn.expand("%:p"), ":r")
			end
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}
-- -- javascript - typescript
-- dap.adapters["pwa-node"] = {
--   type = "server",
--   host = "127.0.0.1",
--   port = 8123,
--   executable = {
--     command = "js-debug-adapter",
--   },
-- }

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
		},
	}
end
