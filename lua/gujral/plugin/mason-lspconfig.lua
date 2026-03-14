local ok, msnlsp = pcall(require, 'mason-lspconfig')
if not ok then
	vim.notify("mason-lspconfig not found", vim.log.levels.ERROR)
	return
end

msnlsp.setup()
