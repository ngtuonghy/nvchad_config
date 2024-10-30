local builtin = require("statuscol.builtin")
require("statuscol").setup({
	relculright = true,
	bt_ignore = { "nofile", "prompt", "terminal", "packer" },
	ft_ignore = {
		"NvimTree",
		"dashboard",
		"nvcheatsheet",
		"dapui_watches",
		"dap-repl",
		"dapui_console",
		"dapui_stacks",
		"dapui_breakpoints",
		"dapui_scopes",
		"help",
		"vim",
		"alpha",
		"dashboard",
		"neo-tree",
		"Trouble",
		"noice",
		"lazy",
		"toggleterm",
	},
	segments = {
		-- Segment: Add padding
		{
			text = { " " },
		},
		-- Segment: show sign
		{
			sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = false, wrap = true },
			click = "v:lua.ScSa",
		},
		{
			sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, colwidth = 1, auto = false, wrap = true },
			click = "v:lua.ScSa",
		},

		-- Segment: Show line number
		{
			text = { " ", builtin.lnumfunc },
			click = "v:lua.ScLa",
			condition = { true, builtin.not_empty },
		},
		-- Segment: show git
		{
			sign = {
				namespace = { "gitsign.*" },
				maxwidth = 1,
				colwidth = 1,
				auto = false,
				wrap = true,
			},
			click = "v:lua.ScSa",
			condition = { true, builtin.not_empty },
		},
		-- Segment: Add padding
		{
			text = { " " },
		},
		-- Segment: Fold Column
		{ text = { builtin.foldfunc, auto = true }, click = "v:lua.ScFa" },
		-- Segment: Add padding
		{
			text = { " " },
			hl = "Normal",
			condition = { true, builtin.not_empty },
		},
	},
})
