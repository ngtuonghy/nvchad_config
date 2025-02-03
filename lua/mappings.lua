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
map('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize -2' })
map('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize +2' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Vertical Resize -2' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Vertical Resize +2' })

map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- nvimtree
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>")
map("n", "<leader>E", "<cmd> NvimTreeFindFile <CR>")

-- oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

-- git
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

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
