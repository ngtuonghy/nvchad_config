require("todo-comments").setup({
	keywords = {
		FIX = { icon = " ", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
		TODO = { icon = " " },
		HACK = { icon = " " },
		WARN = { icon = " ", alt = { "WARNING", "XXX" } },
		PERF = { icon = "󰅒 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", alt = { "INFO", "COMMENT" } },
		TEST = { icon = "󰙨 ", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	gui_style = {
		fg = "BOLD", -- The gui style to use for the fg highlight group.
		bg = "BOLD", -- The gui style to use for the bg highlight group.
	},
})
-- require("todo-comments").setup {
--   keywords = {
-- FIX = { icon = " ", color = "#DC2626", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
--     TODO = { icon = " ", color = "#2563EB" },
--     HACK = { icon = " ", color = "#ffa500" }
--     WARN = { icon = " ", color = "#ffff00", alt = { "WARNING", "XXX" } },
--     PERF = { icon = "󰅒 ", color = "#7C3AED", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
--     NOTE = { icon = " ", color = "#10B981", alt = { "INFO", "COMMENT" } },
--     TEST = { icon = "󰙨 ", color = "#FF00FF", alt = { "TESTING", "PASSED", "FAILED" } },

--FIX: fix some thing us
--BUG:
--TODO:
--HACK: hacker is that
--WARN:  bla..bla
--PERF:
--NOTE:
--TEST: what is that
--PASSED: test
--[X] test
--COMMENT:
