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

-- local clip = "/mnt/c/Windows/System32/clip.exe"
-- if vim.fn.executable(clip) then
-- 	local opts = {
-- 		callback = function()
-- 			if vim.v.event.operator ~= "y" then
-- 				return
-- 			end
-- 			vim.fn.system(clip, vim.fn.getreg(0))
-- 		end,
-- 	}
-- 	opts.group = vim.api.nvim_create_augroup("WSLYank", {})
-- 	autocmd("TextYankPost", { group = opts.group, callback = opts.callback })
-- end

vim.cmd("function! TbSplit(a,b,c,d) \n vs \n endfunction")
-- vim.cmd "function! TbGit(a,b,c,d) \n   LazyGitCurrentFile \n endfunction"
vim.cmd("function! TbRunner(a,b,c,d) \n Runner \n endfunction")
