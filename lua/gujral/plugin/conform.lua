local ok, cnf = pcall(require, 'conform')
if not ok then
	vim.notify("conform not found", vim.log.levels.ERROR)
	return
end

cnf.setup(
	{
		formatters_by_ft = {
			astro = { "prettierd", "prettier", stop_after_first = true },
			c = { "clang_format" },
			css = { "prettierd", "prettier", stop_after_first = true },
			cpp = { "clang_format" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			go = { "gofmpt", "goimports" },
			python = { "black", "autoflake", "isort" },
			typescript = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 5000,
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
