local ok, tnd = pcall(require, 'tiny-inline-diagnostic')
if not ok then
	vim.notify("tiny-inline-diagnostic not found", vim.log.levels.ERROR)
	return
end

tnd.setup({
	preset = "ghost",
	transparent_cursorline = true,
	hi = {
		error = "DiagnosticError",     -- Highlight for error diagnostics
		warn = "DiagnosticWarn",       -- Highlight for warning diagnostics
		info = "DiagnosticInfo",       -- Highlight for info diagnostics
		hint = "DiagnosticHint",       -- Highlight for hint diagnostics
		arrow = "NonText",             -- Highlight for the arrow pointing to diagnostic
		background = "NonText",        -- Background highlight for diagnostics
		mixing_color = "Normal",       -- Color to blend background with (or "None")
    },
}) 

vim.keymap.set("n", "<leader>dt", "<cmd>TinyInlineDiag toggle<cr>", { desc = "Toggle diagnostics" })
vim.keymap.set("n", "<leader>dc", "<cmd>TinyInlineDiag toggle_cursor_only<cr>", { desc = "Toggle cursor-only diagnostics" })
