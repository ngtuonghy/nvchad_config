local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = ("  %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = false,
}

require("ufo").setup({
	-- close_fold_kinds = { "imports" },
	open_fold_hl_timeout = 400,
	fold_virt_text_handler = handler,
	preview = {
		mappings = {
			scrollB = "<C-b>",
			scrollF = "<C-f>",
			scrollU = "<C-u>",
			scrollD = "<C-d>",
		},
	},
	provider_selector = function(_, filetype, buftype)
		local function handleFallbackException(bufnr, err, providerName)
			if type(err) == "string" and err:match("UfoFallbackException") then
				return require("ufo").getFolds(bufnr, providerName)
			else
				return require("promise").reject(err)
			end
		end

		return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
			or function(bufnr)
				return require("ufo")
					.getFolds(bufnr, "lsp")
					:catch(function(err)
						return handleFallbackException(bufnr, err, "treesitter")
					end)
					:catch(function(err)
						return handleFallbackException(bufnr, err, "indent")
					end)
			end
	end,
})
