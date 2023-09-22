local ui = require "custom.utils.ui"
local M = {}
-- In order to disable a default keymap, use
M.disabled = {
  n = {
    --  ["<leader>h"] = "",
    ["<C-a>"] = "",
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    -- ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    -- ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    -- ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
  },
}
M.general = {
  --   ["jk"] = { "<ESC>`^", "escape insert mode", opts = { nowait = true } },
  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<A-k>"] = { "<esc><cmd>m .-2<CR>==gi", "Move up", opts = { silent = true } },
    ["<A-j>"] = { "<esc><cmd>m .+1<CR>==gi", "Move down", opts = { silent = true } },
  },
  v = {
    ["x"] = { '"_x', "not yank x delete" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move up", opts = { silent = true } },
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", "Move down", opts = { silent = true } },
  },
  n = {
    ["<CR>"] = { "<cmd>call append(line('.'),     repeat([''], v:count1))<CR>" },
    ["x"] = { '"_x', "not yank x delete" },
    ["<A-k>"] = { "<esc><cmd>m .-2<CR>==", "Move up", opts = { silent = true } },
    ["<A-j>"] = { "<esc><cmd>m .+1<CR>==", "Move down", opts = { silent = true } },
  },
}

M.Nvimtree = {
  -- plugin = true,
  n = {
    -- toggle
    ["<leader>e"] = { "<cmd>NvimTreeToggle <CR>", "Toggle Neotree" },
    -- focus
    ["<leader>E"] = { "<cmd>NvimTreeFocus<CR>", "Focus Neotree" },
  },
}
M.Dap = {
  --dap = require "dap",
  -- plugin = true,
  n = {
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint (F9)",
    },
    ["<leader>dB"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      "Clear Breakpoints",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Start/Continue (F5)",
    },
    ["<leader>dC"] = {
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then
            require("dap").set_breakpoint(condition)
          end
        end)
      end,
      "Conditional Breakpoint (S-F9)",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into (F11)",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over (F10)",
    },
    ["<leader>dO"] = {
      function()
        require("dap").step_out()
      end,
      "Step Out (S-F11)",
    },
    ["<leader>dq"] = {
      function()
        require("dap").close()
      end,
      "Close Session",
    },
    ["<leader>dQ"] = {
      function()
        require("dap").terminate()
      end,
      "Terminate Session (S-F5)",
    },
    ["<leader>dp"] = {
      function()
        require("dap").pause()
      end,
      "Pause (F6)",
    },
    ["<leader>dr"] = {
      function()
        require("dap").restart_frame()
      end,
      "Restart (C-F5)",
    },
    ["<leader>dR"] = {
      function()
        require("dap").repl.toggle()
      end,
      "Toggle REPL",
    },
    ["<leader>ds"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run To Cursor",
    },
    ---------------------------------------spence
    ["<F5>"] = { "<Cmd>lua require'dap'.continue()<CR>", "Debugger: Start" },
    ["<F6>"] = {
      function()
        require("dap").pause()
      end,
      "Debugger: Pause",
    },
    ["<F9>"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Debugger: Toggle Breakpoint",
    },
    ["<F10>"] = { "<Cmd>lua require'dap'.step_over()<CR>", "Debugger: Step Over" },
    ["<F11>"] = { "<Cmd>lua require'dap'.step_into()<CR>", "Debugger: Step Into" },
    ["<F17>"] = { "<Cmd>lua require'dap'.terminate()<CR>", "Debugger: Stop" }, -- Shift+F5
    ["<F21>"] = { -- Shift+F9
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then
            require("dap").set_breakpoint(condition)
          end
        end)
      end,
      "Debugger: Conditional Breakpoint",
    },

    ["<F23>"] = { "<Cmd>lua require'dap'.step_out()<CR>", "Debugger: Step Out" }, -- Shift+F11
    ["<F41>"] = { "<Cmd>lua require'dap'.run_last()<CR>", "Restart" }, -- Shift+Control+F5
    -------------------dap ui--------------
    ["<leader>dE"] = {
      function()
        require("dapui").eval()
      end,
      "Evaluate Input",
    },
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle Debugger UI",
    },
    ["<leader>dh"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "Debugger Hover",
    },
  },
}

M.Trouble = {
  n = {
    -- Lua
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Trouble toggle" },

    ["<leader>xt"] = { "<cmd>TodoTrouble<cr>", "Trouble todo" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", "Trouble quickfix" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>" },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>" },
    ["<eader>xl"] = { "<cmd>TroubleToggle loclist<cr>" },
    ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>" },
  },
}

M.yanky = {
  n = {
    ["y"] = { "<Plug>(YankyYank)", "Yank text" },
    ["p"] = { "<Plug>(YankyPutAfter)", "Put yanked text after cursor" },
    ["P"] = { "<Plug>(YankyPutBefore)", "Put yanked text before cursor" },
    ["gp"] = { "<Plug>(YankyGPutAfter)", "Put yanked text after selection" },
    ["gP"] = { "<Plug>(YankyGPutBefore)", "Put yanked text before selection" },
    ["[y"] = { "<Plug>(YankyCycleForward)", "Cycle forward through yank history" },
    ["]y"] = { "<Plug>(YankyCycleBackward)", "Cycle backward through yank history" },
    ["]p"] = { "<Plug>(YankyPutIndentAfterLinewise)", "Put indented after cursor (linewise)" },
    ["[p"] = { "<Plug>(YankyPutIndentBeforeLinewise)", "Put indented before cursor (linewise)" },
    ["]P"] = { "<Plug>(YankyPutIndentAfterLinewise)", "Put indented after cursor (linewise)" },
    ["[P"] = { "<Plug>(YankyPutIndentBeforeLinewise)", "Put indented before cursor (linewise)" },
    [">p"] = { "<Plug>(YankyPutIndentAfterShiftRight)", "Put and indent right" },
    ["<p"] = { "<Plug>(YankyPutIndentAfterShiftLeft)", "Put and indent left" },
    [">P"] = { "<Plug>(YankyPutIndentBeforeShiftRight)", "Put before and indent right" },
    ["<P"] = { "<Plug>(YankyPutIndentBeforeShiftLeft)", "Put before and indent left" },
    ["=p"] = { "<Plug>(YankyPutAfterFilter)", "Put after applying a filter" },
    ["=P"] = { "<Plug>(YankyPutBeforeFilter)", "Put before applying a filter" },
  },
  x = {
    ["y"] = { "<Plug>(YankyYank)", "Yank text" },
    ["p"] = { "<Plug>(YankyPutAfter)", "Put yanked text after cursor" },
    ["P"] = { "<Plug>(YankyPutBefore)", "Put yanked text before cursor" },
    ["gp"] = { "<Plug>(YankyGPutAfter)", "Put yanked text after selection" },
    ["gP"] = { "<Plug>(YankyGPutBefore)", "Put yanked text before selection" },
  },
}
--
-- M.runner = {
--   n = {
--     ["<leader>cr"] = { "<cmd>Runnercode<cr>", "Run code" },
--     ["<leader>cm"] = { "<cmd>Runnermakefile<cr>", "Toggle priority run Makefile" },
--   },
--   v = { ["<leader>cf"] = { "<cmd>Runnerfast<cr>", "run fast runner " } },
-- }

M.Telescope = {
  n = {
    ["<leader>ft"] = { "<cmd>TodoTelescope <CR>", "Find todo" },
    ["<leader>fb"] = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", "Find browser" },

    ["<leader>fF"] = {
      function()
        require("telescope.builtin").find_files { hidden = true, no_ignore = true }
      end,
      "Find all files",
    },
    ["<leader>fk"] = {
      function()
        require("telescope.builtin").keymaps()
      end,
      "Find keymaps",
    },
    ["<leader>fh"] = {
      function()
        require("telescope.builtin").help_tags()
      end,
      "Find help",
    },
    ["<leader>fn"] = {
      function()
        require("telescope").extensions.notify.notify()
      end,
      "Find notifications",
    },
    ["<leader>fw"] = {
      function()
        require("telescope.builtin").live_grep()
      end,
      "Find words",
    },
    ["<leader>fW"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
          end,
        }
      end,
      "Find words in all files",
    },
    ["<leader>fo"] = {
      function()
        require("telescope.builtin").oldfiles()
      end,
      "Find history",
    },
    ["<leader>fr"] = { "<cmd>Telescope yank_history<cr>", "Find registers (Yank history)" },
    ["<leader>f<cr>"] = {
      function()
        require("telescope.builtin").resume()
      end,
      "resume previous search",
    },
    ["<leader>f'"] = {
      function()
        require("telescope.builtin").marks()
      end,
      "find marks",
    },
    ["<leader>f/"] = {
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      "find words in current buffer",
    },
    ["<leader>fc"] = {
      function()
        require("telescope.builtin").grep_string()
      end,
      "Find word under cursor",
    },
    ["<leader>fC"] = {
      function()
        require("telescope.builtin").commands()
      end,
      "Find commands",
    },
    ["<leader>fm"] = {
      function()
        require("telescope.builtin").man_pages()
      end,
      "Find man",
    },
  },
}

M.git = {
  n = {
    ["<leader>gg"] = { "<cmd>LazyGitCurrentFile <CR>", "Open LazyGit current file" },
    ["<leader>gG"] = { "<cmd>LazyGit<CR>", "Open LazyGit cwd" },
    ["<leader>gc"] = {
      function()
        require("telescope.builtin").git_commits { use_file_path = true }
      end,
      "git commits (repository)",
    },
    ["<leader>gC"] = {
      function()
        require("telescope.builtin").git_bcommits { use_file_path = true }
      end,
      "Git commits (current file)",
    },
    ["<leader>gt"] = {
      function()
        require("telescope.builtin").git_status { use_file_path = true }
      end,
      "git status",
    },
    --GitSigns
    ["]g"] = {
      function()
        require("gitsigns").next_hunk()
      end,
      "Next Git hunk",
    },
    ["[g"] = {
      function()
        require("gitsigns").prev_hunk()
      end,
      "Previous Git hunk",
    },
    ["<leader>gl"] = {
      function()
        require("gitsigns").blame_line()
      end,
      "View Git blame",
    },
    ["<leader>gL"] = {
      function()
        require("gitsigns").blame_line { full = true }
      end,
      "View full Git blame",
    },
    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview Git hunk",
    },
    ["<leader>gh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset Git hunk",
    },
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset Git buffer",
    },
    ["<leader>gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage Git hunk",
    },
    ["<leader>gS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Stage Git buffer",
    },
    ["<leader>gu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Unstage Git hunk",
    },
    ["<leader>gd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "View Git diff",
    },
  },
}
M.lsp = {
  n = {
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>ls"] = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end
      end,
      "Search symbols",
    },
    ["<leader>lS"] = {
      function()
        require("aerial").toggle()
      end,
      "Symbols outline",
    },
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "Hover diagnostics",
    },
    ["<leader>lD"] = {
      function()
        require("telescope.builtin").diagnostics()
      end,
      "Search diagnostics",
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "Previous diagnostic",
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "Next diagnostic",
    },
    ["<leader>li"] = { "<cmd>LspInfo<cr>", "LSP information" },

    ["<leader>lI"] = { "<cmd>NullLsInfo<cr>", "Null-ls information" },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format()
      end,
      "Format buffer",
    },
  },
}
M.folding = {
  -- nvim-ufo
  n = {
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "Open all folds",
    },
    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "Close all folds",
    },
    ["zr"] = {
      function()
        require("ufo").openFoldsExceptKinds()
      end,
      "Fold less",
    },
    ["zm"] = {
      function()
        require("ufo").closeFoldsWith()
      end,
      "Fold more",
    },
    ["zp"] = {
      function()
        require("ufo").peekFoldedLinesUnderCursor()
      end,
      "Peek fold",
    },
  },
}
M.UI_UX = {
  n = {
    ["<leader>uN"] = { ui.toggle_ui_notifications, "Toggle Notifications" },
    ["<leader>un"] = { ui.change_number, "Change line numbering" },
    ["<leader>ua"] = { ui.toggle_autopairs, "Toggle autopairs" },
    ["<leader>uc"] = { ui.toggle_cmp, "Toggle autocompletion" },
    ["<leader>uC"] = { "<cmd>ColorizerToggle<cr>", "Toggle color highlight" },
    ["<leader>ud"] = { ui.toggle_diagnostics, "Toggle diagnostics" },
    ["<leader>uw"] = { ui.toggle_wrap, "Toggle wrap" },
    ["<leader>us"] = { ui.toggle_spell, "Toggle spellcheck" },
    ["<leader>uy"] = { ui.toggle_syntax, "Toggle syntax highlight" },
    ["<leader>ug"] = { ui.toggle_signcolumn, "Toggle signcolumn" },
    ["<leader>uh"] = { ui.toggle_foldcolumn, "Toggle foldcolumn" },
    ["<leader>ul"] = { ui.toggle_statusline, "Toggle statusline" },
    ["<leader>uL"] = { ui.toggle_codelens, "Toggle CodeLens" },
    ["<leader>ut"] = { ui.toggle_tabline, "Toggle tabline" },
    ["<leader>uS"] = { ui.toggle_conceal, "Toggle conceal" },
    ["<leader>uf"] = {
      function()
        ui.toggle_buffer_autoformat()
      end,
      "Toggle autoformatting (buffer)",
    },
    ["<leader>uF"] = {
      function()
        ui.toggle_autoformat()
      end,
      "Toggle autoformatting (global)",
    },
  },
}
M.indent = {
  v = {
    -- Stay in indent mode
    ["<S-Tab>"] = { "<gv", "Unindent line" },
    ["<Tab>"] = { ">gv", "Indent line" },
  },
}
M.smart_splits = {
  n = {
    ["<C-h>"] = {
      function()
        require("smart-splits").move_cursor_left()
      end,
      "Move to left split",
    },
    ["<C-j>"] = {
      function()
        require("smart-splits").move_cursor_down()
      end,
      "Move to below split",
    },
    ["<C-k>"] = {
      function()
        require("smart-splits").move_cursor_up()
      end,
      "Move to above split",
    },
    ["<C-l>"] = {
      function()
        require("smart-splits").move_cursor_right()
      end,
      "Move to right split",
    },
    ["<C-Up>"] = {
      function()
        require("smart-splits").resize_up()
      end,
      "Resize split up",
    },
    ["<C-Down>"] = {
      function()
        require("smart-splits").resize_down()
      end,
      "Resize split down",
    },
    ["<C-Left>"] = {
      function()
        require("smart-splits").resize_left()
      end,
      "Resize split left",
    },
    ["<C-Right>"] = {
      function()
        require("smart-splits").resize_right()
      end,
      "Resize split right",
    },
  },
}

M.Plugin_Manager = {
  n = {
    ["<leader>pm"] = { "<cmd>Mason<cr>", "Mason Installer" },
    ["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", "Mason Update" },
    ["<leader>pi"] = {
      function()
        require("lazy").install()
      end,
      "Plugins Install",
    },
    ["<leader>ps"] = {
      function()
        require("lazy").home()
      end,
      "Plugins Status",
    },
    ["<leader>pS"] = {
      function()
        require("lazy").sync()
      end,
      "Plugins Sync",
    },
    ["<leader>pu"] = {
      function()
        require("lazy").check()
      end,
      "Plugins Check Updates",
    },
    ["<leader>pU"] = {
      function()
        require("lazy").update()
      end,
      "Plugins Update",
    },
  },
}
M.tabufline = {
  n = {
    ["<leader>bC"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close all buffers",
    },
    ["<leader>bc"] = {
      function()
        require("nvchad.tabufline").closeOtherBufs()
      end,
      "Close all buffers except current",
    }, -- move buffer right
    ["<leader>br"] = {
      function()
        require("nvchad.tabufline").closeBufs_at_direction "right"
      end,
      "Close all buffers to the right",
    },
    ["<leader>bl"] = {
      function()
        require("nvchad.tabufline").closeBufs_at_direction "left"
      end,
      "Close all buffers to the left",
    },
    ["<b"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Move buffer tab right",
    },
    -- move buffer left
    [">b"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Move buffer tab left",
    },
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}
M.session = {
  -- automated session management.
  n = {
    ["<leader>sl"] = { "<cmd>SessionManager! load_last_session<cr>", "Load last session" },
    ["<leader>ss"] = { "<cmd>SessionManager! save_current_session<cr>", "Save this session" },
    ["<leader>sd"] = { "<cmd>SessionManager! delete_session<cr>", "Delete session" },
    ["<leader>sf"] = { "<cmd>SessionManager! load_session<cr>", "Search sessions" },
    ["<leader>s."] = { "<cmd>SessionManager! load_current_dir_session<cr>", "Load current directory session" },
  },
}
M.oil = {
  n = {
    ["-"] = {
      function()
        require("oil").open()
      end,
      "Open parent directory",
    },
  },
}
M.spectre = {
  n = {
    ["<leader>rS"] = {
      function()
        require("spectre").toggle()
      end,
      "Toggle Spectre",
    },
    ["<leader>rW"] = {
      function()
        require("spectre").open_visual()
      end,
      "Search current word",
    },
    ["<leader>rw"] = {
      function()
        require("spectre").open_file_search()
      end,
      "Search on current file",
    },
  },
  v = {
    ["<leader>rw"] = {
      function()
        require("spectre").open_visual()
      end,
      "Search current word",
    },
  },
}
M.dial = {
  n = {
    ["<C-a>"] = {
      function()
        require("dial.map").manipulate("increment", "normal")
      end,
      "up",
    },
    ["<C-x>"] = {
      function()
        require("dial.map").manipulate("decrement", "normal")
      end,
      "down",
    },
  },
  v = {
    ["<C-a>"] = {
      function()
        require("dial.map").manipulate("increment", "visual")
      end,
      "up",
    },
    ["<C-x>"] = {
      function()
        require("dial.map").manipulate("decrement", "visual")
      end,
      "down",
    },
  },
}
return M
