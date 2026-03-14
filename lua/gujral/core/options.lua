local opt = vim.opt

-- end of buffer char
opt.fillchars = {
	eob = "~"
}
-- line numbers
opt.number = true
opt.relativenumber = true
opt.signcolumn = "auto"
-- soft wrap text
opt.wrap = true
opt.linebreak = true
opt.textwidth = 0
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
