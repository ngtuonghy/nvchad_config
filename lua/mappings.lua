require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })

map("i", "jk", "<ESC>")

map({ "n", "t" }, "<A-i>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle Floating term" })
-- dap mapping

map("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint (F9)" })

map("n", "<leader>dB", function()
	require("dap").clear_breakpoints()
end, { desc = "Clear Breakpoints" })

map("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Start/Continue (F5)" })

map("n", "<leader>dC", function()
	vim.ui.input({ prompt = "Condition: " }, function(condition)
		if condition then
			require("dap").set_breakpoint(condition)
		end
	end)
end, { desc = "Conditional Breakpoint (S-F9)" })

map("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "Step Into (F11)" })

map("n", "<leader>do", function()
	require("dap").step_over()
end, { desc = "Step Over (F10)" })

map("n", "<leader>dO", function()
	require("dap").step_out()
end, { desc = "Step Out (S-F11)" })

map("n", "<leader>dq", function()
	require("dap").close()
end, { desc = "Close Session" })

map("n", "<leader>dQ", function()
	require("dap").terminate()
end, { desc = "Terminate Session (S-F5)" })

map("n", "<leader>dp", function()
	require("dap").pause()
end, { desc = "Pause (F6)" })

map("n", "<leader>dr", function()
	require("dap").restart_frame()
end, { desc = "Restart (C-F5)" })

map("n", "<leader>dR", function()
	require("dap").repl.toggle()
end, { desc = "Toggle REPL" })

map("n", "<leader>ds", function()
	require("dap").run_to_cursor()
end, { desc = "Run To Cursor" })

map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debugger: Start" })

map("n", "<F6>", function()
	require("dap").pause()
end, { desc = "Debugger: Pause" })

map("n", "<F9>", function()
	require("dap").toggle_breakpoint()
end, { desc = "Debugger: Toggle Breakpoint" })

map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger: Step Over" })

map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger: Step Into" })

map("n", "<F17>", "<Cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger: Stop" })

map("n", "<F21>", function()
	vim.ui.input({ prompt = "Condition: " }, function(condition)
		if condition then
			require("dap").set_breakpoint(condition)
		end
	end)
end, { desc = "Debugger: Conditional Breakpoint" })

map("n", "<F23>", "<Cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger: Step Out" })

map("n", "<F41>", "<Cmd>lua require'dap'.run_last()<CR>", { desc = "Restart" })

map("n", "<leader>dE", function()
	require("dapui").eval()
end, { desc = "Evaluate Input" })

map("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "Toggle Debugger UI" })

map("n", "<leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "Debugger Hover" })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
