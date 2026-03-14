local ok, blk = pcall(require, 'blink.cmp')
if not ok then
	vim.notify("blink.cmp not found", vim.log.levels.ERROR)
	return
end

blk.setup({
	keymap = {
		preset = 'default',
		['<Tab>'] = { 'select_and_accept', 'fallback' },
	},

	appearance = {
		nerd_font_variant = 'mono',
	},

	completion = {
		documentation = {
			window = { border = 'single' },
			auto_show = true,
			auto_show_delay_ms = 500,
		},
		menu = { border = 'single' },
	},

	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},

	fuzzy = {
		implementation = "prefer_rust",
	},
})
