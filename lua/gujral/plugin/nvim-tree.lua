local ok, nvt = pcall(require, 'nvim-tree')
if not ok then
	vim.notify("nvim-tree not found", vim.log.levels.ERROR)
	return
end

-- custom keybindings inside nvim-tree buffer
local function local_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {
		desc = "nvim-tree: " .. desc,
		buffer = bufnr,
		noremap = true,
		silent = true,
		nowait = true
		}
	end

	api.map.on_attach.default(bufnr)

	-- custom keymaps go here
end

-- global buffer custom keybindings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

nvt.setup({
	on_attach = local_on_attach,
})
