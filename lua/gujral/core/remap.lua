-- general vim keymaps

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pp", "<cmd>PackerSync<CR>")

-- scroll with centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search with centering
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- system clipboard
vim.keymap.set("n", "<leader>yl", "V\"+y")
vim.keymap.set("n", "<leader>pl", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>ly", '"+y')
