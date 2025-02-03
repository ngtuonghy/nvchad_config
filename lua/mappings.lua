local map = vim.keymap.set
-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize -2" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize +2" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Vertical Resize -2" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Vertical Resize +2" })

map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- nvimtree
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>")
map("n", "<leader>E", "<cmd> NvimTreeFindFile <CR>")
map("n", "<leader>n", function () Snacks.explorer() end,{ desc = "Explorer" })

-- oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- find
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
map("n", "<leader>fw", function() Snacks.picker.grep() end, { desc = "Find Grep" })
map("n", "<leader>fo", function() Snacks.picker.recent() end, { desc = "Recent" })

-- git
map("n", "<leader>gc", function() Snacks.picker.git_log() end, { desc = "Git Log" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map("n", "<leader>gf", function() Snacks.lazygit.log_file() end,{ desc = "Lazygit Current File History" })
map("n", "<leader>gb", function() Snacks.git.blame_line() end,{ desc = "Git Blame Line" })

-- Grep
map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

-- search
map("n", "<leader>s\"", function() Snacks.picker.registers() end, { desc = "Registers" })
map("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
map("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
map("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
map("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
map("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
map("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
map("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
map("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
map("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
map("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
map("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
-- map("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
map("n", "<leader>qp", function() Snacks.picker.projects() end, { desc = "Projects" })

-- LSP
map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
map("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })

-- tabufline
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>bc", function()
  require("nvchad.tabufline").closeAllBufs(false) -- excludes current buf
end, { desc = "Close all buffers except the current" })

map("n", "<leader>bx", function()
  require("nvchad.tabufline").close_buffer() -- excludes current buf
end, { desc = "Close buffer" })

map("n", "<leader>bC", function()
  require("nvchad.tabufline").closeAllBufs(true) -- excludes current buf
end, { desc = "Close all buffers" })

map("n", "<leader>bl", function()
  require("nvchad.tabufline").closeBufs_at_direction "left" -- or right
end, { desc = "Close all buffers to the left of the current" })

map("n", "<leader>br", function()
  require("nvchad.tabufline").closeBufs_at_direction "right" -- or right
end, { desc = "Close all buffers to the right of the current" })

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- format
map("n", "<leader>cf", function()
  require("conform").format()
end, { desc = "format code" })

map("n", "<leader>ut", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- dap
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

map("n", "<C-t>", function()
  require("menu").open "default"
end, {})

map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
