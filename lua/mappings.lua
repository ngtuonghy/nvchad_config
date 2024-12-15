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

map("n", "<C-x>", "<Plug>(VM-Find-Under)")

-- map({ "n", "v", "i", "t" }, "<C-l>", function()
-- 	require("nvchad.term").runner({
-- 		id = "RunAndBuildTerminal",
-- 		pos = "sp",
-- 		cmd = function()
-- 			local file = vim.fn.expand("%")
-- 			local sfile = vim.fn.expand("%:r")
-- 			local ft_cmds = {
-- 				sh = "bash " .. file,
-- 				rust = "cargo " .. file,
-- 				python = "python3 " .. file,
-- 				javascript = "node " .. file,
-- 				go = "go build && go run " .. file,
-- 				c = "g++ " .. file .. " -o " .. sfile .. " && ./" .. sfile,
-- 				cpp = "g++ " .. file .. " -o " .. sfile .. " && ./" .. sfile,
-- 				typescript = "deno compile " .. file .. " && deno run " .. file,
-- 			}
-- 			return ft_cmds[vim.bo.ft]
-- 		end,
-- 	})
-- end, { desc = "Build and Run " })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "Xo", "<CMD>lua require'nvchad.tabufline'.closeOtherBufs()<CR>", { desc = "Close other buffers " })
map("n", "Xa", "<CMD>lua require'nvchad.tabufline'.closeAllBufs()<CR>", { desc = "Close all buffers" })
map(
	"n",
	"Xr",
	"<CMD>lua require'nvchad.tabufline'.closeBufs_at_direction 'right'<CR>",
	{ desc = "Close right buffers" }
)
map({ "n", "v", "i", "t" }, "<M-u>", "<cmd>Runner<CR>", { desc = "Build and Run file" })

--Trouble
map("n", "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>tl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
	require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')

	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true })
end, {})

map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})
