local opt = vim.opt

-- end of buffer char
opt.fillchars = {
	eob = "~"
}
-- line numbers
opt.number = true
opt.relativenumber = true
opt.signcolumn = "number"
-- wrap text disable
opt.wrap = false
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

