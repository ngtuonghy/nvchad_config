local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if
			line > 1
			and line <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
		then
			vim.cmd('normal! g`"')
		end
	end,
})

vim.cmd("function! TbSplit(a,b,c,d) \n vs \n endfunction")
-- vim.cmd "function! TbGit(a,b,c,d) \n   LazyGitCurrentFile \n endfunction"
vim.cmd("function! TbRunner(a,b,c,d) \n Runner \n endfunction")
