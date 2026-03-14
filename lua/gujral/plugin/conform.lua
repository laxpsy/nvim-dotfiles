local ok, cnf = pcall(require, 'conform')
if not ok then
	vim.notify("conform not found", vim.log.levels.ERROR)
	return
end

cnf.setup(
	{
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gofmpt", "goimports" },
		python = { "brunette", "autoflake", "reorder-python-imports" },
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	}
)

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
