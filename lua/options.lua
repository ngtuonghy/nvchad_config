require("nvchad.options")
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.foldmethod = "indent"
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
